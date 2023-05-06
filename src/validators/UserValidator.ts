import { IsNotEmpty, IsString, IsUUID } from "class-validator";

export class UserListInput {
    @IsNotEmpty()
    @IsUUID()
    id?:string;
    
    @IsNotEmpty()
    @IsString()
    username?:string;

    @IsNotEmpty()
    @IsString()
    name?:string;
}