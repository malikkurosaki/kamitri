const expressAsyncHandler = require('express-async-handler');
const {PrismaClient} = require('@prisma/client')
const prisma = new PrismaClient()

const getProdak = expressAsyncHandler(async (req, res) => {
    const data = await prisma.prodak.findMany();
    res.json(data);
});

module.exports = {
    getProdak
}