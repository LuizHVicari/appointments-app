import { compare as bcCompare, hash as bcHash, genSalt } from 'bcrypt'
import { HashingServiceProtocol } from './hashing.service'

export class BCryptService extends HashingServiceProtocol {
  async hash(password: string): Promise<string> {
    const salt = await genSalt()
    return await bcHash(password, salt)
  }

  async compare(password: string, passwordHash: string): Promise<boolean> {
    const equal = await bcCompare(password, passwordHash)
    return equal
  }
}
