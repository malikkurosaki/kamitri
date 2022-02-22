/*
  Warnings:

  - You are about to drop the column `companyId` on the `Outlet` table. All the data in the column will be lost.
  - You are about to drop the `Company` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `Company` DROP FOREIGN KEY `Company_userId_fkey`;

-- DropForeignKey
ALTER TABLE `Outlet` DROP FOREIGN KEY `Outlet_companyId_fkey`;

-- AlterTable
ALTER TABLE `Outlet` DROP COLUMN `companyId`;

-- AlterTable
ALTER TABLE `Profile` ADD COLUMN `outletId` VARCHAR(191) NULL;

-- DropTable
DROP TABLE `Company`;

-- AddForeignKey
ALTER TABLE `Profile` ADD CONSTRAINT `Profile_outletId_fkey` FOREIGN KEY (`outletId`) REFERENCES `Outlet`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
