'use strict'

const express = require('express')

const helmet = require('helmet')
const logger = require('morgan')

// Start Mongoose
require('./db/mongoose')

// Initialize Express app
const app = express()
	.set('x-powered-by', false)
	.set('etag', false)

app // Middleware
	.use(helmet())
	.use(express.json({ type: 'application/json' }))
	.use(express.urlencoded({ extended: true }))
	.use(
		express.static(require('path').join(__dirname, '..', 'build'), {
			dotfiles: 'ignore'
		})
	)

// Setup dev config
if (process.env.NODE_ENV !== 'production') {
	// ( CORS middleware, allows cross origin access during development )
	app.use(logger('dev'))
} else {
	app.use(logger('tiny'))
}

const // Routers
	exhibitions = require('./routes/exhibitions'),
	users = require('./routes/users'),
	votes = require('./routes/votes')

app // Routes
	.use('/api/exhibitions', exhibitions)
	.use('/api/users', users)
	.use('/api/votes', votes)

module.exports = app
