const fs = require('fs');
const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()


async function seedProduct() {
    await prisma.product.deleteMany({
        where: {
            price: {
                gt: 0
            }
        }
    })

    const products = JSON.parse(fs.readFileSync('./xsvr/seeds/products.json', 'utf8'));
    for (let product of products) {
        await prisma.product.create({
            data: product
        })
    }
}

async function seedCategory() {
    await prisma.category.deleteMany({
        where: {
            name: {
                notIn: ['x']
            }
        }
    })

    const categories = JSON.parse(fs.readFileSync('./xsvr/seeds/categories.json', 'utf8'));
    for (let category of categories) {
        await prisma.category.create({
            data: category
        })
    }
}

async function seedUser(){
    await prisma.user.deleteMany({
        where: {
            email: {
                notIn: ['x']
            }
        }
    })

    const users = JSON.parse(fs.readFileSync('./xsvr/seeds/users.json', 'utf8'));
    for (let user of users) {
        await prisma.user.create({
            data: user
        })
    }
}

; (async () => {
    seedProduct();
    seedCategory();
    seedUser();

})();