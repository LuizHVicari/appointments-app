import { registerAs } from '@nestjs/config'

export default registerAs('jwt', () => ({
  secret: process.env.JWT_SECRET,
  audience: process.env.JWT_AUDIENCE,
  expiresIn: process.env.JWT_TTL,
  refreshExpiresIn: process.env.JWT_REFRESH_TTL,
  refreshSecret: process.env.JWT_REFRESH_SECRET,
}))
