-- CreateEnum
CREATE TYPE "PermissionTypes" AS ENUM ('Viewer', 'Editor', 'Admin');

-- CreateEnum
CREATE TYPE "TaskStage" AS ENUM ('Complete', 'InProgress', 'Todo');

-- CreateEnum
CREATE TYPE "TaskPriority" AS ENUM ('Low', 'Medium', 'High');

-- CreateEnum
CREATE TYPE "UserStatus" AS ENUM ('Active', 'Suspendend', 'Invited');

-- CreateEnum
CREATE TYPE "FeatureType" AS ENUM ('Free', 'Premium');

-- CreateEnum
CREATE TYPE "ImageSide" AS ENUM ('front', 'left', 'right', 'back', 'inside');

-- CreateEnum
CREATE TYPE "DraftType" AS ENUM ('FromClient', 'InProgress', 'Rejected', 'Review', 'ClientEdits');

-- CreateEnum
CREATE TYPE "DarftSources" AS ENUM ('Client', 'Mine', 'Reviewer', 'Admin');

-- CreateEnum
CREATE TYPE "ClientEditAction" AS ENUM ('Added', 'Changed', 'Removed');

-- CreateTable
CREATE TABLE "Industry" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Industry_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Country" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Country_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Role" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "Role_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Domain" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,

    CONSTRAINT "Domain_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Permissions" (
    "id" TEXT NOT NULL,
    "accessLevel" "PermissionTypes" NOT NULL DEFAULT 'Viewer',
    "domainId" TEXT NOT NULL,
    "roleId" TEXT NOT NULL,

    CONSTRAINT "Permissions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT,
    "token" TEXT,
    "fcm_token" TEXT,
    "avatar" TEXT,
    "roleId" TEXT,
    "suspendendAt" TIMESTAMP(3),
    "status" "UserStatus",
    "streetAddress" TEXT,
    "city" TEXT,
    "cell" TEXT,
    "tell" TEXT,
    "verificationCode" INTEGER,
    "countryId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Team" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "leader" TEXT NOT NULL,
    "userId" TEXT,

    CONSTRAINT "Team_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Goal" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "startDate" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deadline" TIMESTAMP(3),
    "active" BOOLEAN,
    "isComplete" BOOLEAN,

    CONSTRAINT "Goal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Task" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "comments" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "startDate" TIMESTAMP(3),
    "dueDate" TIMESTAMP(3),
    "priority" "TaskPriority",
    "stage" "TaskStage",
    "GoalId" TEXT,
    "assigneeId" TEXT,
    "createdById" TEXT,

    CONSTRAINT "Task_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Feature" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "type" "FeatureType" NOT NULL DEFAULT 'Free',

    CONSTRAINT "Feature_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Package" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "color" TEXT,
    "level" INTEGER NOT NULL,

    CONSTRAINT "Package_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PackagePrice" (
    "id" TEXT NOT NULL,
    "duration" DOUBLE PRECISION NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "extentionTime" DOUBLE PRECISION,
    "packageId" TEXT,

    CONSTRAINT "PackagePrice_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Promotion" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3) NOT NULL,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Promotion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Payment" (
    "id" TEXT NOT NULL,
    "amount" DECIMAL(65,30) NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "center" TEXT,
    "packageId" TEXT NOT NULL,
    "paymentMethod" TEXT NOT NULL,
    "cashierId" TEXT NOT NULL,
    "revoked" BOOLEAN,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Payment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Category" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "icon" TEXT,
    "createdBy" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Image" (
    "id" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "incomplete" BOOLEAN,
    "incompleteMessage" TEXT,
    "isTransparent" BOOLEAN,
    "side" "ImageSide" NOT NULL DEFAULT 'front',

    CONSTRAINT "Image_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ClientEdit" (
    "id" TEXT NOT NULL,
    "clientId" TEXT,
    "action" "ClientEditAction" NOT NULL,
    "field" TEXT NOT NULL,
    "newValue" TEXT NOT NULL,
    "oldValue" TEXT NOT NULL,
    "approved" BOOLEAN,
    "approvedTime" TIMESTAMP(3),
    "approvedById" TEXT,
    "brandTemplateId" TEXT NOT NULL,

    CONSTRAINT "ClientEdit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ClientRating" (
    "id" TEXT NOT NULL,
    "client_id" TEXT NOT NULL,
    "rating" INTEGER NOT NULL,
    "goodImplematation" BOOLEAN,
    "comment" TEXT,
    "brandTemplateId" TEXT NOT NULL,

    CONSTRAINT "ClientRating_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tel" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "brandTemplateId" TEXT NOT NULL,

    CONSTRAINT "Tel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BrandTemplate" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "tags" TEXT[],
    "imageId" TEXT,
    "threeDImage" TEXT,
    "video" TEXT,
    "sizes" TEXT[],
    "units" TEXT[],
    "categoryId" TEXT NOT NULL,
    "addon_categories" TEXT[],
    "varieties" TEXT[],
    "manufacturer" TEXT NOT NULL,
    "street_address" TEXT,
    "city" TEXT,
    "countryId" TEXT,
    "email" TEXT,
    "website" TEXT,
    "draftNotes" TEXT,
    "draftType" TEXT,
    "draftCreatedAt" TIMESTAMP(3) NOT NULL,
    "createdById" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "reviewedAt" TIMESTAMP(3),
    "reviewNotes" TEXT,
    "reviewerId" TEXT,
    "inReview" BOOLEAN,
    "isApproved" BOOLEAN,
    "lastModified" TIMESTAMP(3) NOT NULL,
    "creatorClientId" TEXT,
    "creatorClientProductId" TEXT,
    "fromClientCleanedBy" TEXT,
    "hasZeroDepositOrder" BOOLEAN,
    "hasTransparencyAll" BOOLEAN,
    "isNotForUnder18" BOOLEAN,
    "isDirty" BOOLEAN,

    CONSTRAINT "BrandTemplate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_IndustryToPromotion" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_CountryToPromotion" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_CountryToFeature" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_GoalToTeam" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_FeatureToIndustry" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_FeatureToPromotion" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_FeatureToPackage" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_PackageToPromotion" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_CategoryToIndustry" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Industry_name_key" ON "Industry"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Country_name_key" ON "Country"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Role_name_key" ON "Role"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Domain_name_key" ON "Domain"("name");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Goal_title_key" ON "Goal"("title");

-- CreateIndex
CREATE UNIQUE INDEX "Task_title_key" ON "Task"("title");

-- CreateIndex
CREATE UNIQUE INDEX "Feature_name_key" ON "Feature"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Package_name_key" ON "Package"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Package_level_key" ON "Package"("level");

-- CreateIndex
CREATE UNIQUE INDEX "Category_name_key" ON "Category"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Image_url_key" ON "Image"("url");

-- CreateIndex
CREATE UNIQUE INDEX "BrandTemplate_name_key" ON "BrandTemplate"("name");

-- CreateIndex
CREATE UNIQUE INDEX "_IndustryToPromotion_AB_unique" ON "_IndustryToPromotion"("A", "B");

-- CreateIndex
CREATE INDEX "_IndustryToPromotion_B_index" ON "_IndustryToPromotion"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CountryToPromotion_AB_unique" ON "_CountryToPromotion"("A", "B");

-- CreateIndex
CREATE INDEX "_CountryToPromotion_B_index" ON "_CountryToPromotion"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CountryToFeature_AB_unique" ON "_CountryToFeature"("A", "B");

-- CreateIndex
CREATE INDEX "_CountryToFeature_B_index" ON "_CountryToFeature"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_GoalToTeam_AB_unique" ON "_GoalToTeam"("A", "B");

-- CreateIndex
CREATE INDEX "_GoalToTeam_B_index" ON "_GoalToTeam"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_FeatureToIndustry_AB_unique" ON "_FeatureToIndustry"("A", "B");

-- CreateIndex
CREATE INDEX "_FeatureToIndustry_B_index" ON "_FeatureToIndustry"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_FeatureToPromotion_AB_unique" ON "_FeatureToPromotion"("A", "B");

-- CreateIndex
CREATE INDEX "_FeatureToPromotion_B_index" ON "_FeatureToPromotion"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_FeatureToPackage_AB_unique" ON "_FeatureToPackage"("A", "B");

-- CreateIndex
CREATE INDEX "_FeatureToPackage_B_index" ON "_FeatureToPackage"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_PackageToPromotion_AB_unique" ON "_PackageToPromotion"("A", "B");

-- CreateIndex
CREATE INDEX "_PackageToPromotion_B_index" ON "_PackageToPromotion"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CategoryToIndustry_AB_unique" ON "_CategoryToIndustry"("A", "B");

-- CreateIndex
CREATE INDEX "_CategoryToIndustry_B_index" ON "_CategoryToIndustry"("B");

-- AddForeignKey
ALTER TABLE "Permissions" ADD CONSTRAINT "Permissions_domainId_fkey" FOREIGN KEY ("domainId") REFERENCES "Domain"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Permissions" ADD CONSTRAINT "Permissions_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "Role"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "Role"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES "Country"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Team" ADD CONSTRAINT "Team_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_GoalId_fkey" FOREIGN KEY ("GoalId") REFERENCES "Goal"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_assigneeId_fkey" FOREIGN KEY ("assigneeId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Task" ADD CONSTRAINT "Task_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PackagePrice" ADD CONSTRAINT "PackagePrice_packageId_fkey" FOREIGN KEY ("packageId") REFERENCES "Package"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Promotion" ADD CONSTRAINT "Promotion_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Payment" ADD CONSTRAINT "Payment_packageId_fkey" FOREIGN KEY ("packageId") REFERENCES "Package"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Payment" ADD CONSTRAINT "Payment_cashierId_fkey" FOREIGN KEY ("cashierId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClientEdit" ADD CONSTRAINT "ClientEdit_approvedById_fkey" FOREIGN KEY ("approvedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClientEdit" ADD CONSTRAINT "ClientEdit_brandTemplateId_fkey" FOREIGN KEY ("brandTemplateId") REFERENCES "BrandTemplate"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClientRating" ADD CONSTRAINT "ClientRating_brandTemplateId_fkey" FOREIGN KEY ("brandTemplateId") REFERENCES "BrandTemplate"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tel" ADD CONSTRAINT "Tel_brandTemplateId_fkey" FOREIGN KEY ("brandTemplateId") REFERENCES "BrandTemplate"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BrandTemplate" ADD CONSTRAINT "BrandTemplate_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BrandTemplate" ADD CONSTRAINT "BrandTemplate_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BrandTemplate" ADD CONSTRAINT "BrandTemplate_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES "Country"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BrandTemplate" ADD CONSTRAINT "BrandTemplate_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BrandTemplate" ADD CONSTRAINT "BrandTemplate_reviewerId_fkey" FOREIGN KEY ("reviewerId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_IndustryToPromotion" ADD CONSTRAINT "_IndustryToPromotion_A_fkey" FOREIGN KEY ("A") REFERENCES "Industry"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_IndustryToPromotion" ADD CONSTRAINT "_IndustryToPromotion_B_fkey" FOREIGN KEY ("B") REFERENCES "Promotion"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CountryToPromotion" ADD CONSTRAINT "_CountryToPromotion_A_fkey" FOREIGN KEY ("A") REFERENCES "Country"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CountryToPromotion" ADD CONSTRAINT "_CountryToPromotion_B_fkey" FOREIGN KEY ("B") REFERENCES "Promotion"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CountryToFeature" ADD CONSTRAINT "_CountryToFeature_A_fkey" FOREIGN KEY ("A") REFERENCES "Country"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CountryToFeature" ADD CONSTRAINT "_CountryToFeature_B_fkey" FOREIGN KEY ("B") REFERENCES "Feature"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GoalToTeam" ADD CONSTRAINT "_GoalToTeam_A_fkey" FOREIGN KEY ("A") REFERENCES "Goal"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GoalToTeam" ADD CONSTRAINT "_GoalToTeam_B_fkey" FOREIGN KEY ("B") REFERENCES "Team"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FeatureToIndustry" ADD CONSTRAINT "_FeatureToIndustry_A_fkey" FOREIGN KEY ("A") REFERENCES "Feature"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FeatureToIndustry" ADD CONSTRAINT "_FeatureToIndustry_B_fkey" FOREIGN KEY ("B") REFERENCES "Industry"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FeatureToPromotion" ADD CONSTRAINT "_FeatureToPromotion_A_fkey" FOREIGN KEY ("A") REFERENCES "Feature"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FeatureToPromotion" ADD CONSTRAINT "_FeatureToPromotion_B_fkey" FOREIGN KEY ("B") REFERENCES "Promotion"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FeatureToPackage" ADD CONSTRAINT "_FeatureToPackage_A_fkey" FOREIGN KEY ("A") REFERENCES "Feature"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FeatureToPackage" ADD CONSTRAINT "_FeatureToPackage_B_fkey" FOREIGN KEY ("B") REFERENCES "Package"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PackageToPromotion" ADD CONSTRAINT "_PackageToPromotion_A_fkey" FOREIGN KEY ("A") REFERENCES "Package"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PackageToPromotion" ADD CONSTRAINT "_PackageToPromotion_B_fkey" FOREIGN KEY ("B") REFERENCES "Promotion"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CategoryToIndustry" ADD CONSTRAINT "_CategoryToIndustry_A_fkey" FOREIGN KEY ("A") REFERENCES "Category"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CategoryToIndustry" ADD CONSTRAINT "_CategoryToIndustry_B_fkey" FOREIGN KEY ("B") REFERENCES "Industry"("id") ON DELETE CASCADE ON UPDATE CASCADE;
