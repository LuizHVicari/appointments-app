import { UnauthorizedException } from '@nestjs/common'
import { Request } from 'express'
import { User } from 'src/users/entities/user.entity'
import { REQUEST_TOKEN_PAYLOAD } from '../constants'

const extractUserFromRequest = (request: Request): User => {
  const { user }: { user: User } = request[REQUEST_TOKEN_PAYLOAD]
  if (!user) {
    throw new UnauthorizedException()
  }
  return user
}

export default extractUserFromRequest
