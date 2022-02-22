const expressAsyncHandler = require("express-async-handler");
const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

const Register = expressAsyncHandler(async (req, res) => {
    const { email, password, name } = req.body;
    var success, message, dataUser, error;

    try {
        const data = await prisma.user.create({
            data: {
                email,
                password,
                name
            }
        });
    
        success = data ? true : false;
        message = data ? "Register Success" : "Register Failed";
        dataUser = data ? data : {};
    } catch (error) {
        error = error;
    }

    res.json({ success, message, dataUser, error });
});

module.exports = { Register };