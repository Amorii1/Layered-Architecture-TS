/*
  Warnings:

  - Added the required column `flag` to the `Card` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `AddressDay` DROP FOREIGN KEY `AddressDay_addressId_fkey`;

-- AlterTable
ALTER TABLE `Card` ADD COLUMN `comment` VARCHAR(191) NULL,
    ADD COLUMN `flag` ENUM('ADD_MEMBER', 'REMOVE_MEMBER', 'SPLIT_FAMILY', 'OTHER', 'UPDATED') NOT NULL;

-- AddForeignKey
ALTER TABLE `AddressDay` ADD CONSTRAINT `AddressDay_addressId_fkey` FOREIGN KEY (`addressId`) REFERENCES `Address`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
