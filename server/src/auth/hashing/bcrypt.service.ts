import { HashingServiceProtocol } from "./hashing.service";
import { genSalt, hash as bcHash, compare as bcCompare } from 'bcrypt'

export class BCryptService extends HashingServiceProtocol {
	async hash(password: string): Promise<string> {
		const salt = await genSalt()
		return await bcHash(password, salt)
	}

	async compare(password: string, passwordHash: string): Promise<boolean> {
		return await bcCompare(password, passwordHash)
	}
    
}