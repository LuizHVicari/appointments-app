import { Module } from '@nestjs/common'
import { ConfigModule, ConfigType } from '@nestjs/config'
import { TypeOrmModule } from '@nestjs/typeorm'
import { AuthModule } from 'src/auth/auth.module'
import { PatientsModule } from 'src/patients/patients.module'
import { UsersModule } from 'src/users/users.module'
import appConfig from './app.config'
import { AppController } from './app.controller'
import { AppService } from './app.service'

@Module({
  imports: [
    AuthModule,
    UsersModule,
    PatientsModule,

    ConfigModule.forRoot({
      envFilePath: '.env',
    }),
    TypeOrmModule.forRootAsync({
      imports: [ConfigModule.forFeature(appConfig)],
      inject: [appConfig.KEY],
      useFactory: async (appSettings: ConfigType<typeof appConfig>) => {
        return {
          type: appSettings.database.type,
          database: appSettings.database.database,
          autoLoadEntities: appSettings.database.autoLoadEntities,
          synchronize: appSettings.database.synchronize,
        }
      },
    }),
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
