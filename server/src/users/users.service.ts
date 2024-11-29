import {
  BadRequestException,
  ConflictException,
  Injectable,
} from '@nestjs/common'
import { InjectRepository } from '@nestjs/typeorm'
import { Request } from 'express'
import { HashingServiceProtocol } from 'src/auth/hashing/hashing.service'
import { REQUEST_TOKEN_PAYLOAD } from 'src/common/constants'
import { Repository } from 'typeorm'
import { CreateUserDto } from './dto/create-user.dto'
import { UpdateUserDto } from './dto/update-user.dto'
import { User } from './entities/user.entity'

@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(User)
    private readonly userRepository: Repository<User>,
    private readonly hashingService: HashingServiceProtocol,
  ) {}

  private async saveUser(user: User): Promise<User> {
    try {
      return await this.userRepository.save(user)
    } catch (error) {
      if (error.code === '23505') {
        throw new ConflictException()
      }

      throw new BadRequestException()
    }
  }

  async create(createUserDto: CreateUserDto): Promise<User> {
    const passwordHash = await this.hashingService.hash(createUserDto.password)

    const userData = {
      name: createUserDto.name,
      email: createUserDto.email,
      password: passwordHash,
    }

    const user = this.userRepository.create(userData)
    if (!user) throw new BadRequestException()
    return await this.saveUser(user)
  }

  async update(request: Request, updateUserDto: UpdateUserDto): Promise<User> {
    const user = this.retrieveFromRequest(request)
    if (updateUserDto.password) {
      const newPassword = await this.hashingService.hash(updateUserDto.password)
      user.password = newPassword
    }
    user.email = updateUserDto.email ?? user.email
    user.name = updateUserDto.name ?? user.name

    return await this.saveUser(user)
  }

  async remove(request: Request): Promise<User> {
    const user = this.retrieveFromRequest(request)
    return await this.userRepository.remove(user)
  }

  retrieveFromRequest(request: Request): User {
    const { user }: { user: User } = request[REQUEST_TOKEN_PAYLOAD]
    return user
  }
}
