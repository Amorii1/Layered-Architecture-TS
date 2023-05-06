/*
  Warnings:

  - You are about to drop the column `addressDayId` on the `Card` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `Card` DROP FOREIGN KEY `Card_addressDayId_fkey`;

-- DropForeignKey
ALTER TABLE `DayHour` DROP FOREIGN KEY `DayHour_addressDayId_fkey`;

-- AlterTable
ALTER TABLE `Card` DROP COLUMN `addressDayId`,
    ADD COLUMN `addressHourId` VARCHAR(191) NULL;

-- AddForeignKey
ALTER TABLE `Card` ADD CONSTRAINT `Card_addressHourId_fkey` FOREIGN KEY (`addressHourId`) REFERENCES `DayHour`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DayHour` ADD CONSTRAINT `DayHour_addressDayId_fkey` FOREIGN KEY (`addressDayId`) REFERENCES `AddressDay`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
