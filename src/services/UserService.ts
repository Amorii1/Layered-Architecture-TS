import { UserListInput } from "../validators/UserValidator";

export class UserService{

    public list = async (data: UserListInput) => {
        return data
    }
}