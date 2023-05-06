/*
  Warnings:

  - You are about to drop the column `perHourLimit` on the `Address` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `Address` DROP COLUMN `perHourLimit`,
    ADD COLUMN `dailyLimit` INTEGER NOT NULL DEFAULT 300;
