const { Client } = require('pg')

let POSTGRES_URL
if (process.env.NODE_ENV !== 'CI') {
	POSTGRES_URL = process.env.POSTGRES_URL
}

if (!POSTGRES_URL) {
	console.log('No Postgres URL. Exiting...')
	process.exit(1)
}

const postgres = new Client(POSTGRES_URL)

postgres.connect()

module.exports = postgres
