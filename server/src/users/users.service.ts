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

  private async saveUser(user: User) {
    try {
      return await this.userRepository.save(user)
    } catch (error) {
      if (error.code === '23505') {
        throw new ConflictException('Email is already registered')
      }

      throw error
    }
  }

  async create(createUserDto: CreateUserDto) {
    const passwordHash = await this.hashingService.hash(createUserDto.password)

    const userData = {
      name: createUserDto.name,
      email: createUserDto.email,
      password: passwordHash,
    }

    const user = this.userRepository.create(userData)
    if (!user) throw new BadRequestException('Could not create the user')
    return await this.saveUser(user)
  }

  update(id: number, updateUserDto: UpdateUserDto) {
    return `This action updates a #${id} user`
  }

  remove(id: number) {
    return `This action removes a #${id} user`
  }

  findMe(request: Request) {
    const { user }: { user: User } = request[REQUEST_TOKEN_PAYLOAD]
    return user
  }
}
