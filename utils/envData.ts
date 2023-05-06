export const ENV = {
  DEVELOPMENT: "DEVELOPMENT",
  PRODUCTION: "PRODUCTION"
}

export type ENV = typeof ENV[keyof typeof ENV];

export const envData = {
  ENV: process.env.ENV! as unknown as ENV,
  SERVER_PORT: process.env.SERVER_PORT!,
  SEED_PASSWORD: process.env.SEED_PASSWORD!,
};
