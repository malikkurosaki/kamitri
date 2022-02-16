const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient();

const listKategori = [
    {
        "nama": "Makanan"
    },
    {
        "nama": "Minuman"
    }
];

const listProduk = [
    {
        "nama": "cah kangkung",
        "harga": 5000

    },
    {
        "nama": "cah kangkung 2",
        "harga": 5000,

    },
    {
        "nama": "cah kangkung 3",
        "harga": 5000,

    },
    {
        "nama": "cah kangkung 4",
        "harga": 5000,

    },
    {
        "nama": "cah kangkung 5",
        "harga": 5000,

    },
    {
        "nama": "cah kangkung 6",
        "harga": 5000,

    }
]

    ; (async () => {
        try {
            await prisma.kategori.deleteMany({
                where: {
                    id: {
                        not: ""
                    }
                }
            })

            await prisma.kategori.createMany({
                data: listKategori
            })

            await prisma.prodak.deleteMany({
                where: {
                    id: {
                        not: ""
                    }
                }
            })
            await prisma.prodak.createMany({
                data: listProduk
            })
        } catch (error) {
            console.log(error)
        }

        console.log("berhasil")
    })();