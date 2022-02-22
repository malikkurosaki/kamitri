const expressAsyncHandler = require("express-async-handler");
const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();


const Login = expressAsyncHandler(async (req, res) => {
    const { email, password } = req.body;

    console.log(email, password);
    const data = await prisma.user.findFirst({
        where: {
            email: {
                equals: email
            },
            password: {
                equals: password
            }
        }
    });

    let success = data ? true : false;
    let message = data ? "Login Success" : "Login Failed";
    let dataUser = data ? data : {};

    res.json({ success, message, dataUser });
})

module.exports = { Login };