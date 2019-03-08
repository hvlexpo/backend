const { Client } = require('pg')

const postgres = new Client(process.env.POSTGRES_URL)

postgres.connect()

module.exports = postgres
