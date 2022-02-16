const express = require('express');
const { getProdak } = require('./api_prodak');
const api = express.Router();

api.get('/getProdak', getProdak)

module.exports = {
    api
}