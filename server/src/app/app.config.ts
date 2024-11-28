import { registerAs } from '@nestjs/config'

export default registerAs('app', () => ({
  database: {
    type: process.env.DB_TYPE as 'postgres',
    database: process.env.DB_NAME,
    host: process.env.DB_HOST,
    port: +process.env.DB_PORT,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    autoLoadEntities: Boolean(process.env.DB_AUTO_LOAD_ENTITIES),
    synchronize: Boolean(process.env.DB_SYNCHRONIZE),
  },
}))

