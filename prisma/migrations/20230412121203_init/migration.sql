/*
  Warnings:

  - You are about to drop the column `dailyLimit` on the `Address` table. All the data in the column will be lost.
  - Added the required column `totpKey` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Address` DROP COLUMN `dailyLimit`,
    ADD COLUMN `perHourLimit` INTEGER NOT NULL DEFAULT 300;

-- AlterTable
ALTER TABLE `AddressDay` ADD COLUMN `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3);

-- AlterTable
ALTER TABLE `User` ADD COLUMN `totpKey` VARCHAR(191) NOT NULL;

-- CreateTable
CREATE TABLE `DayHours` (
    `id` VARCHAR(191) NOT NULL,
    `date` DATETIME(3) NOT NULL,
    `addressDayId` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `DayHours` ADD CONSTRAINT `DayHours_addressDayId_fkey` FOREIGN KEY (`addressDayId`) REFERENCES `AddressDay`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
