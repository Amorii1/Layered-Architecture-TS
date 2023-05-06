-- CreateIndex
CREATE FULLTEXT INDEX `Address_title_idx` ON `Address`(`title`);

-- CreateIndex
CREATE FULLTEXT INDEX `FamilyMember_fullName_idx` ON `FamilyMember`(`fullName`);

-- CreateIndex
CREATE FULLTEXT INDEX `FamilyMemberInfo_motherFullName_idx` ON `FamilyMemberInfo`(`motherFullName`);
