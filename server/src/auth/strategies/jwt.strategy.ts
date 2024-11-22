import { Inject, Injectable, UnauthorizedException } from "@nestjs/common";
import { PassportStrategy } from "@nestjs/passport";
import { ExtractJwt, Strategy } from "passport-jwt";
import { AuthService } from "../auth.service";
import jwtConfig from "../config/jwt.config";
import { ConfigType } from "@nestjs/config";
import { InjectRepository } from "@nestjs/typeorm";
import { User } from "src/users/entities/user.entity";
import { Repository } from "typeorm";

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
  constructor (
    @InjectRepository(User)
    private readonly userRepository: Repository<User>,
    @Inject(jwtConfig.KEY)
    private readonly jwtSettings: ConfigType<typeof jwtConfig>
  ) { 
    super({
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      ignoreException: false,
      secretOrKey: jwtSettings.secret
    }) 
  }

  async validate(username: string, password: string) {
    const user = await this.userRepository.findBy({email: username}
    )
    if (!user) {
      throw new UnauthorizedException()
    }
    return user
  }
}