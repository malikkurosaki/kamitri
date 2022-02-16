const express = require('express');
const app = express();
const cors = require('cors');
const { api } = require('./routes');
const port = process.env.PORT || 3000


app.use(cors())
app.use(express.static('../build/web'))
app.use(express.urlencoded({extended: true}));
app.use('/api', api)

app.listen(port, () => console.log("aplikasi berjalan di port : "+port))

