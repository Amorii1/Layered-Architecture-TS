/*
  Warnings:

  - The values [REJECTED] on the enum `Card_formState` will be removed. If these variants are still used in the database, this will fail.
  - You are about to alter the column `idCardIssueDate` on the `FamilyMemberInfo` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `DateTime(3)`.

*/
-- AlterTable
ALTER TABLE `Card` MODIFY `formState` ENUM('FORMPENDING', 'FORMSUBMITTED', 'ACTIVE') NOT NULL DEFAULT 'FORMPENDING';

-- AlterTable
ALTER TABLE `FamilyMember` MODIFY `relation` ENUM('MAIN', 'PARTNER', 'CHILD', 'PARENT', 'SIBLING', 'OTHER') NULL;

-- AlterTable
ALTER TABLE `FamilyMemberInfo` ADD COLUMN `socialCare` BOOLEAN NULL,
    MODIFY `motherFullName` VARCHAR(191) NULL,
    MODIFY `idCardIssueDate` DATETIME(3) NULL;

-- CreateTable
CREATE TABLE `Log` (
    `id` VARCHAR(191) NOT NULL,
    `type` ENUM('FORM_VIEW', 'FORM_UPDATE', 'FORM_STATE', 'USER_LOGIN') NOT NULL,
    `userId` VARCHAR(191) NOT NULL,
    `cardId` VARCHAR(191) NULL,
    `message` VARCHAR(191) NULL DEFAULT '',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Log` ADD CONSTRAINT `Log_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Log` ADD CONSTRAINT `Log_cardId_fkey` FOREIGN KEY (`cardId`) REFERENCES `Card`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
