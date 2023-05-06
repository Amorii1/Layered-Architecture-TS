/*
  Warnings:

  - You are about to drop the column `dailyLimit` on the `Address` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `Address` DROP COLUMN `dailyLimit`,
    ADD COLUMN `perHourLimit` INTEGER NOT NULL DEFAULT 50;
