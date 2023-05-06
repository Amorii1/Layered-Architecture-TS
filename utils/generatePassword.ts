import { ENV, envData } from "./envData";

export const generatePassword = () => envData.ENV === ENV.PRODUCTION? Math.random().toString(36).slice(-8): '123456';