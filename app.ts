import "reflect-metadata";
import * as dotenv from "dotenv";
dotenv.config();
import express from "express";
import "express-async-errors";
import { queryParser } from "express-query-parser";
import cors from "cors";
import { envData } from "./utils/envData";
import { UserService } from "./src/services/UserService";
import { UserController } from "./src/controllers/UserController";



process.stdin.resume(); //so the program will not close instantly

const app = express();

app.set("trust proxy", true);


app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(
  queryParser({
    parseNull: true,
    parseUndefined: true,
    parseBoolean: true,
    parseNumber: false,
  })
);

app.use("/api", [
  new UserController(new UserService).router,
]);


app.listen(envData.SERVER_PORT, () =>
  console.log("started at port: " + envData.SERVER_PORT)
);
