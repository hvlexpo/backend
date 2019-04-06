'use strict'

const express = require('express')
const helmet = require('helmet')
const cors = require('cors')
const logger = require('morgan')

// Start Postgres
const postgres = require('./db/postgres')

// Create initial empty table if not exists
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
	.use(cors())
	.use(express.json())
	.use(express.urlencoded({ extended: true }))

// Setup env config
if (process.env.NODE_ENV === 'production') {
	const firebaseMiddleware = require('./auth/firebase')

	app.use(firebaseMiddleware)
	app.use(logger('tiny'))
} else if (process.env.NODE_ENV === 'CI') {
	app.use(logger('dev'))
} else {
	const firebaseMiddleware = require('./auth/firebase')

	app.use(firebaseMiddleware)
	app.use(logger('dev'))
}

app.get('/test', async (req, res) => {
	console.log('Token good 😎')
	res.status(200).send('Token good 😎')
})

const // Routers
	exhibitions = require('./routes/exhibitions'),
	users = require('./routes/users'),
	votes = require('./routes/votes')

app // Routes
	.use('/exhibitions', exhibitions)
	.use('/users', users)
	.use('/votes', votes)

module.exports = app
