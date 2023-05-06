-- AlterTable
ALTER TABLE `Card` MODIFY `flag` ENUM('ADD_MEMBER', 'REMOVE_MEMBER', 'SPLIT_FAMILY', 'OTHER', 'UPDATED') NOT NULL DEFAULT 'UPDATED';

-- AlterTable
ALTER TABLE `FamilyMember` ADD COLUMN `blockOldReason` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `User` MODIFY `role` ENUM('SUPERADMIN', 'CENTER', 'REVIEWER', 'PRINTER') NOT NULL;

-- CreateTable
CREATE TABLE `Notification` (
    `id` VARCHAR(191) NOT NULL,
    `title` VARCHAR(191) NOT NULL,
    `message` VARCHAR(191) NOT NULL,
    `centerNumber` VARCHAR(191) NULL,
    `district` VARCHAR(191) NULL,
    `disabled` BOOLEAN NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `Notification_district_idx`(`district`),
    INDEX `Notification_disabled_idx`(`disabled`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `User_centerNumber_fkey` FOREIGN KEY (`centerNumber`) REFERENCES `Center`(`number`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Notification` ADD CONSTRAINT `Notification_centerNumber_fkey` FOREIGN KEY (`centerNumber`) REFERENCES `Center`(`number`) ON DELETE SET NULL ON UPDATE CASCADE;
