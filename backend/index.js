const pe = require('parse-error')

// Environment variables config
const env = require('dotenv').config({path: 'config/.env'})

if (env.error) {
	console.log('❌ .env file missing, exiting...')
	process.exit(1)
}

const app = require('./app')

app.listen(3000)

process.on('unhandledRejection', error => {
	console.error('Uncaught Error', pe(error))
})
