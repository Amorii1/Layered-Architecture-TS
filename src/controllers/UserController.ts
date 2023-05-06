import { Router } from "express";
import { UserService } from "../services/UserService";


export class UserController extends UserService {
  router: Router;

  constructor( 
     private userService:UserService,
    ) {
    super();
    this.router = Router();
    this.setRoutes();
  }

  protected setRoutes = () => {
    this.router.get('/user',  async (req, res) => {
      res.send(await this.list(req.query));
    })
  }
}
