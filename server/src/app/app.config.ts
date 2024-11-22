import { registerAs } from "@nestjs/config";

export default registerAs('app', () => ({
  database: {
    type: process.env.DB_TYPE as 'sqlite',
    database: process.env.DB_NAME,
    autoLoadEntities: Boolean(process.env.DB_AUTO_LOAD_ENTITIES),
    synchronize: Boolean(process.env.DB_SYNCHRONIZE),
  }
}))