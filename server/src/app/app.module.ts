import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm'
import { ConfigModule, ConfigType } from '@nestjs/config';
import appConfig from './app.config';
import { AuthModule } from 'src/auth/auth.module';
import { UsersModule } from 'src/users/users.module';

@Module({
  imports: [
    AuthModule,
    UsersModule,


    ConfigModule.forRoot({
      envFilePath: '.env'
    }),
    TypeOrmModule.forRootAsync({
      imports: [ConfigModule.forFeature(appConfig)],
      inject: [appConfig.KEY],
      useFactory: async (appSettings: ConfigType<typeof appConfig>) => {
        return {
          type: appSettings.database.type,
          database: appSettings.database.database,
          autoLoadEntities: appSettings.database.autoLoadEntities,
          synchronize: appSettings.database.synchronize
        }
      }
    })
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
