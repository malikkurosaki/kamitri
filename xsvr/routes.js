const express = require('express');
const { Login } = require('./controllers/login');
const { Product } = require('./controllers/product');
const { Register } = require('./controllers/register');
const api = express.Router();

api.post('/login', Login)
api.post('/register', Register);
api.get('/product', Product)

module.exports = {
    api
}