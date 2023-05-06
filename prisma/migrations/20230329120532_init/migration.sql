-- CreateTable
CREATE TABLE `User` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `username` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `role` ENUM('SUPERADMIN', 'CENTER', 'REVIEWER') NOT NULL,
    `centerNumber` VARCHAR(191) NULL,
    `active` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `User_username_key`(`username`),
    FULLTEXT INDEX `User_name_idx`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ReviewedCard` (
    `id` VARCHAR(191) NOT NULL,
    `cardId` VARCHAR(191) NOT NULL,
    `userId` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `ReviewedCard_cardId_key`(`cardId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Card` (
    `id` VARCHAR(191) NOT NULL,
    `number` VARCHAR(191) NULL,
    `oldNumber` VARCHAR(191) NOT NULL,
    `new` BOOLEAN NOT NULL DEFAULT false,
    `password` VARCHAR(191) NULL,
    `nfcCardId` VARCHAR(191) NULL,
    `phone` VARCHAR(191) NULL,
    `formState` ENUM('FORMPENDING', 'FORMSUBMITTED', 'ACTIVE', 'REJECTED') NOT NULL DEFAULT 'FORMPENDING',
    `blocked` BOOLEAN NOT NULL,
    `centerNumber` VARCHAR(191) NOT NULL,
    `foodAgencyId` VARCHAR(191) NOT NULL,
    `flourAgencyId` VARCHAR(191) NOT NULL,
    `addressDayId` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Card_number_key`(`number`),
    UNIQUE INDEX `Card_phone_key`(`phone`),
    INDEX `Card_oldNumber_idx`(`oldNumber`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CardInfo` (
    `id` VARCHAR(191) NOT NULL,
    `district` VARCHAR(191) NOT NULL,
    `subDistrict` VARCHAR(191) NOT NULL,
    `housingType` ENUM('TINPLATE', 'RENT', 'AGRICULTURAL', 'TRANSCEND', 'TENTS', 'WITH_RELATIVES', 'OWNED') NOT NULL,
    `checkpoint` VARCHAR(191) NOT NULL,
    `disabled` BOOLEAN NOT NULL,
    `cardId` VARCHAR(191) NULL,

    UNIQUE INDEX `CardInfo_cardId_key`(`cardId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Center` (
    `number` VARCHAR(191) NOT NULL,
    `title` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`number`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Address` (
    `id` VARCHAR(191) NOT NULL,
    `title` VARCHAR(191) NOT NULL,
    `fromDate` DATETIME(3) NOT NULL,
    `toDate` DATETIME(3) NOT NULL,
    `dailyLimit` INTEGER NOT NULL DEFAULT 300,
    `centerNumber` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `AddressDay` (
    `id` VARCHAR(191) NOT NULL,
    `date` DATETIME(3) NOT NULL,
    `addressId` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `FamilyMember` (
    `id` VARCHAR(191) NOT NULL,
    `name1` VARCHAR(191) NOT NULL,
    `name2` VARCHAR(191) NOT NULL,
    `name3` VARCHAR(191) NOT NULL,
    `name4` VARCHAR(191) NULL,
    `surname` VARCHAR(191) NULL,
    `fullName` VARCHAR(191) NOT NULL,
    `birthDate` DATETIME(3) NULL,
    `gender` ENUM('MALE', 'FEMALE') NULL,
    `relation` ENUM('MAIN', 'PARTNER', 'CHILD') NULL,
    `type` ENUM('ADULT', 'SOCIAL_CARE', 'CHILD') NOT NULL,
    `formState` ENUM('FORMPENDING', 'FORMSUBMITTED') NOT NULL DEFAULT 'FORMPENDING',
    `blocked` BOOLEAN NOT NULL,
    `cardId` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `FamilyMemberInfo` (
    `id` VARCHAR(191) NOT NULL,
    `familyMemberId` VARCHAR(191) NULL,
    `motherName1` VARCHAR(191) NULL,
    `motherName2` VARCHAR(191) NULL,
    `motherName3` VARCHAR(191) NULL,
    `motherFullName` VARCHAR(191) NOT NULL,
    `maritalStatus` ENUM('MARRIED', 'SINGLE', 'WIDOW', 'DIVORCED') NULL,
    `job` ENUM('UNEMPLOYED', 'PUBLIC', 'PRIVATE', 'RETIRED') NULL,
    `jobTitle` VARCHAR(191) NULL,
    `jobNumber` VARCHAR(191) NULL,
    `salary` INTEGER NULL,
    `idCardType` ENUM('NATIONALID', 'OLDID') NULL,
    `idCardNumber` VARCHAR(191) NULL,
    `idCardFamilyNumber` VARCHAR(191) NULL,
    `idCardIssueDate` VARCHAR(191) NULL,
    `idCardIssuer` VARCHAR(191) NULL,
    `idCardPageNumber` VARCHAR(191) NULL,
    `idCardLogNumber` VARCHAR(191) NULL,
    `idCardOffice` VARCHAR(191) NULL,

    UNIQUE INDEX `FamilyMemberInfo_familyMemberId_key`(`familyMemberId`),
    INDEX `FamilyMemberInfo_idCardNumber_idx`(`idCardNumber`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Agency` (
    `id` VARCHAR(191) NOT NULL,
    `number` VARCHAR(191) NOT NULL,
    `type` ENUM('FOOD', 'FLOUR') NOT NULL,
    `foodAgentId` VARCHAR(191) NULL,
    `flourAgentId` VARCHAR(191) NULL,
    `centerNumber` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Agency_foodAgentId_key`(`foodAgentId`),
    UNIQUE INDEX `Agency_flourAgentId_key`(`flourAgentId`),
    INDEX `Agency_number_idx`(`number`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Agent` (
    `id` VARCHAR(191) NOT NULL,
    `type` ENUM('FOOD', 'FLOUR', 'FOODFLOUR') NOT NULL,
    `fullName` VARCHAR(191) NOT NULL,
    `phone` VARCHAR(191) NULL,
    `password` VARCHAR(191) NULL,
    `username` VARCHAR(191) NULL,
    `district` VARCHAR(191) NULL,
    `area` INTEGER NULL,
    `street` INTEGER NULL,
    `house` VARCHAR(191) NULL,
    `active` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Agent_phone_key`(`phone`),
    UNIQUE INDEX `Agent_username_key`(`username`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Product` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `qtyForAdult` DOUBLE NOT NULL,
    `qtyForChild` DOUBLE NOT NULL,
    `qtyForSocialCare` DOUBLE NOT NULL,
    `type` ENUM('FOOD', 'FLOUR') NOT NULL,
    `active` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Ration` (
    `id` VARCHAR(191) NOT NULL,
    `year` INTEGER NOT NULL,
    `month` INTEGER NOT NULL,
    `agencyId` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Ration_year_month_agencyId_key`(`year`, `month`, `agencyId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `RationProduct` (
    `id` VARCHAR(191) NOT NULL,
    `title` VARCHAR(191) NULL,
    `quantity` DOUBLE NOT NULL,
    `productId` VARCHAR(191) NOT NULL,
    `rationId` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ReceivedRation` (
    `id` VARCHAR(191) NOT NULL,
    `cardId` VARCHAR(191) NOT NULL,
    `rationId` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `ReceivedRation_cardId_rationId_key`(`cardId`, `rationId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `File` (
    `id` VARCHAR(191) NOT NULL,
    `key` VARCHAR(191) NULL,
    `mimetype` VARCHAR(191) NOT NULL,
    `familyMemberId` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `File_key_familyMemberId_key`(`key`, `familyMemberId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `ReviewedCard` ADD CONSTRAINT `ReviewedCard_cardId_fkey` FOREIGN KEY (`cardId`) REFERENCES `Card`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ReviewedCard` ADD CONSTRAINT `ReviewedCard_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Card` ADD CONSTRAINT `Card_centerNumber_fkey` FOREIGN KEY (`centerNumber`) REFERENCES `Center`(`number`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Card` ADD CONSTRAINT `Card_foodAgencyId_fkey` FOREIGN KEY (`foodAgencyId`) REFERENCES `Agency`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Card` ADD CONSTRAINT `Card_flourAgencyId_fkey` FOREIGN KEY (`flourAgencyId`) REFERENCES `Agency`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Card` ADD CONSTRAINT `Card_addressDayId_fkey` FOREIGN KEY (`addressDayId`) REFERENCES `AddressDay`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CardInfo` ADD CONSTRAINT `CardInfo_cardId_fkey` FOREIGN KEY (`cardId`) REFERENCES `Card`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Address` ADD CONSTRAINT `Address_centerNumber_fkey` FOREIGN KEY (`centerNumber`) REFERENCES `Center`(`number`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AddressDay` ADD CONSTRAINT `AddressDay_addressId_fkey` FOREIGN KEY (`addressId`) REFERENCES `Address`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FamilyMember` ADD CONSTRAINT `FamilyMember_cardId_fkey` FOREIGN KEY (`cardId`) REFERENCES `Card`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FamilyMemberInfo` ADD CONSTRAINT `FamilyMemberInfo_familyMemberId_fkey` FOREIGN KEY (`familyMemberId`) REFERENCES `FamilyMember`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Agency` ADD CONSTRAINT `Agency_foodAgentId_fkey` FOREIGN KEY (`foodAgentId`) REFERENCES `Agent`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Agency` ADD CONSTRAINT `Agency_flourAgentId_fkey` FOREIGN KEY (`flourAgentId`) REFERENCES `Agent`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Agency` ADD CONSTRAINT `Agency_centerNumber_fkey` FOREIGN KEY (`centerNumber`) REFERENCES `Center`(`number`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Ration` ADD CONSTRAINT `Ration_agencyId_fkey` FOREIGN KEY (`agencyId`) REFERENCES `Agency`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RationProduct` ADD CONSTRAINT `RationProduct_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `Product`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RationProduct` ADD CONSTRAINT `RationProduct_rationId_fkey` FOREIGN KEY (`rationId`) REFERENCES `Ration`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ReceivedRation` ADD CONSTRAINT `ReceivedRation_cardId_fkey` FOREIGN KEY (`cardId`) REFERENCES `Card`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ReceivedRation` ADD CONSTRAINT `ReceivedRation_rationId_fkey` FOREIGN KEY (`rationId`) REFERENCES `Ration`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `File` ADD CONSTRAINT `File_familyMemberId_fkey` FOREIGN KEY (`familyMemberId`) REFERENCES `FamilyMember`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
