const express = require('express')
const routerr = express.Router()

routerr.use('/favoriteProd', require('./favoriteNewsRoute'))
routerr.use('/user', require('./authRoute'))

module.exports = routerr