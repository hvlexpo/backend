const { Client } = require('pg')

const { POSTGRES_URL } = process.env

if (!POSTGRES_URL) {
	console.log('No Postgres URL. Exiting...')
	process.exit(1)
}

const postgres = new Client(POSTGRES_URL)

postgres.connect()

module.exports = postgres
