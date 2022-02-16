/*
  Warnings:

  - A unique constraint covering the columns `[nama]` on the table `Prodak` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `Prodak_nama_key` ON `Prodak`(`nama`);
