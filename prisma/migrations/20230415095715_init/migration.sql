-- DropForeignKey
ALTER TABLE `DayHour` DROP FOREIGN KEY `DayHour_addressDayId_fkey`;

-- AddForeignKey
ALTER TABLE `DayHour` ADD CONSTRAINT `DayHour_addressDayId_fkey` FOREIGN KEY (`addressDayId`) REFERENCES `AddressDay`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
