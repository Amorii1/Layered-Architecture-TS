/*
  Warnings:

  - You are about to drop the column `centerNumber` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `role` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `totpKey` on the `User` table. All the data in the column will be lost.
  - You are about to drop the `Address` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `AddressDay` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Agency` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Agent` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Card` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CardInfo` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Center` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `DayHour` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `FamilyMember` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `FamilyMemberInfo` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `File` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Log` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Notification` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Product` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Ration` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RationProduct` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ReceivedRation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ReviewedCard` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `Address` DROP FOREIGN KEY `Address_centerNumber_fkey`;

-- DropForeignKey
ALTER TABLE `AddressDay` DROP FOREIGN KEY `AddressDay_addressId_fkey`;

-- DropForeignKey
ALTER TABLE `Agency` DROP FOREIGN KEY `Agency_centerNumber_fkey`;

-- DropForeignKey
ALTER TABLE `Agency` DROP FOREIGN KEY `Agency_flourAgentId_fkey`;

-- DropForeignKey
ALTER TABLE `Agency` DROP FOREIGN KEY `Agency_foodAgentId_fkey`;

-- DropForeignKey
ALTER TABLE `Card` DROP FOREIGN KEY `Card_addressHourId_fkey`;

-- DropForeignKey
ALTER TABLE `Card` DROP FOREIGN KEY `Card_centerNumber_fkey`;

-- DropForeignKey
ALTER TABLE `Card` DROP FOREIGN KEY `Card_flourAgencyId_fkey`;

-- DropForeignKey
ALTER TABLE `Card` DROP FOREIGN KEY `Card_foodAgencyId_fkey`;

-- DropForeignKey
ALTER TABLE `CardInfo` DROP FOREIGN KEY `CardInfo_cardId_fkey`;

-- DropForeignKey
ALTER TABLE `DayHour` DROP FOREIGN KEY `DayHour_addressDayId_fkey`;

-- DropForeignKey
ALTER TABLE `FamilyMember` DROP FOREIGN KEY `FamilyMember_cardId_fkey`;

-- DropForeignKey
ALTER TABLE `FamilyMemberInfo` DROP FOREIGN KEY `FamilyMemberInfo_familyMemberId_fkey`;

-- DropForeignKey
ALTER TABLE `File` DROP FOREIGN KEY `File_familyMemberId_fkey`;

-- DropForeignKey
ALTER TABLE `Log` DROP FOREIGN KEY `Log_cardId_fkey`;

-- DropForeignKey
ALTER TABLE `Log` DROP FOREIGN KEY `Log_userId_fkey`;

-- DropForeignKey
ALTER TABLE `Notification` DROP FOREIGN KEY `Notification_centerNumber_fkey`;

-- DropForeignKey
ALTER TABLE `Ration` DROP FOREIGN KEY `Ration_agencyId_fkey`;

-- DropForeignKey
ALTER TABLE `RationProduct` DROP FOREIGN KEY `RationProduct_productId_fkey`;

-- DropForeignKey
ALTER TABLE `RationProduct` DROP FOREIGN KEY `RationProduct_rationId_fkey`;

-- DropForeignKey
ALTER TABLE `ReceivedRation` DROP FOREIGN KEY `ReceivedRation_cardId_fkey`;

-- DropForeignKey
ALTER TABLE `ReceivedRation` DROP FOREIGN KEY `ReceivedRation_rationId_fkey`;

-- DropForeignKey
ALTER TABLE `ReviewedCard` DROP FOREIGN KEY `ReviewedCard_cardId_fkey`;

-- DropForeignKey
ALTER TABLE `ReviewedCard` DROP FOREIGN KEY `ReviewedCard_userId_fkey`;

-- DropForeignKey
ALTER TABLE `User` DROP FOREIGN KEY `User_centerNumber_fkey`;

-- AlterTable
ALTER TABLE `User` DROP COLUMN `centerNumber`,
    DROP COLUMN `role`,
    DROP COLUMN `totpKey`;

-- DropTable
DROP TABLE `Address`;

-- DropTable
DROP TABLE `AddressDay`;

-- DropTable
DROP TABLE `Agency`;

-- DropTable
DROP TABLE `Agent`;

-- DropTable
DROP TABLE `Card`;

-- DropTable
DROP TABLE `CardInfo`;

-- DropTable
DROP TABLE `Center`;

-- DropTable
DROP TABLE `DayHour`;

-- DropTable
DROP TABLE `FamilyMember`;

-- DropTable
DROP TABLE `FamilyMemberInfo`;

-- DropTable
DROP TABLE `File`;

-- DropTable
DROP TABLE `Log`;

-- DropTable
DROP TABLE `Notification`;

-- DropTable
DROP TABLE `Product`;

-- DropTable
DROP TABLE `Ration`;

-- DropTable
DROP TABLE `RationProduct`;

-- DropTable
DROP TABLE `ReceivedRation`;

-- DropTable
DROP TABLE `ReviewedCard`;
