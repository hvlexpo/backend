'use strict'

const express = require('express')
const helmet = require('helmet')
const logger = require('morgan')

const firebaseMiddleware = require('./auth/firebase')

//Start Postgres
const postgres = require('./db/postgres')

//Create initial empty table if not exists
const createVoteTable = require('./schemas/vote')
const createUserTable = require('./schemas/user')
const createExhibitionTable = require('./schemas/exhibition')
postgres.query(createVoteTable)
postgres.query(createUserTable)
postgres.query(createExhibitionTable)


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
	.use(firebaseMiddleware)

// Setup dev config
if (process.env.NODE_ENV !== 'production') {
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
