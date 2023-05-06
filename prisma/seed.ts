import { PrismaClient } from "@prisma/client"
import { generatePassword } from '../utils/generatePassword';
import bcrypt from "bcrypt";
const prisma = new PrismaClient();

async function main()
{

    const password = bcrypt.hashSync(generatePassword(), 10)

      //Add User 
     const user= await prisma.user.create({
        data: {
          name: 'Super Admin',
          username: 'superadmin',
          password,
        }
      })

}

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })
