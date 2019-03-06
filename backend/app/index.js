'use strict'

const express = require('express')

const helmet = require('helmet')

// Start Mongoose
require('./db/mongoose')

// Initialize Express app
const app = express()
	.set('x-powered-by', false)
	.set('etag', false)

// Middleware
app.use(helmet())
app.use('/', express.static(__dirname + '/../build'))

// Routers
const exhibitions = require('./routes/exhibitions')
const users = require('./routes/users')

// Routes
app.use('/exhibitions', exhibitions)
app.use('/users', users)


module.exports = app
