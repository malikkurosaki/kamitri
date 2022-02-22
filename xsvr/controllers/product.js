const expressAsyncHandler = require('express-async-handler');
const {PrismaClient} = require('@prisma/client')
const prisma = new PrismaClient()

const Product = expressAsyncHandler(async (req, res) => {
    const data = await prisma.product.findMany();
    res.json(data);
});

module.exports = {
    Product
}