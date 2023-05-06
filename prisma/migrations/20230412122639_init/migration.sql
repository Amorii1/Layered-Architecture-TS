/*
  Warnings:

  - You are about to drop the `DayHours` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `DayHours` DROP FOREIGN KEY `DayHours_addressDayId_fkey`;

-- DropTable
DROP TABLE `DayHours`;

-- CreateTable
CREATE TABLE `DayHour` (
    `id` VARCHAR(191) NOT NULL,
    `date` DATETIME(3) NOT NULL,
    `addressDayId` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `DayHour` ADD CONSTRAINT `DayHour_addressDayId_fkey` FOREIGN KEY (`addressDayId`) REFERENCES `AddressDay`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
