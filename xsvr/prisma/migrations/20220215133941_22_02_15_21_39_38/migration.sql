/*
  Warnings:

  - You are about to drop the column `lisNotaId` on the `Nota` table. All the data in the column will be lost.
  - You are about to drop the `LisNota` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `Nota` DROP FOREIGN KEY `Nota_lisNotaId_fkey`;

-- AlterTable
ALTER TABLE `Nota` DROP COLUMN `lisNotaId`;

-- DropTable
DROP TABLE `LisNota`;

-- CreateTable
CREATE TABLE `NotaDetail` (
    `id` VARCHAR(191) NOT NULL,
    `notaId` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `NotaDetail` ADD CONSTRAINT `NotaDetail_notaId_fkey` FOREIGN KEY (`notaId`) REFERENCES `Nota`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
