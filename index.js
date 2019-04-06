const http = require('http')
const pe = require('parse-error')

// Environment variables config

if (process.env.NODE_ENV === 'CI') {

} else if (process.env.NODE_ENV === 'production') {

} else {
	const env = require('dotenv').config({path: 'config/.env'})
	if (env.error) {
		console.log('❌ .env file missing, exiting...')
		process.exit(1)
	}
}

const app = require('./app')

const server = http
	.createServer(app)
	.listen(8080, () => console.log('🔓  HTTP Server started on port 8080.'))

process.on('unhandledRejection', error => {
	console.error('Uncaught Error', pe(error))
})

process.on('SIGINT', () => {
	server.close(() => {
		console.log('', '💤', ' Express shut down.')
		process.exit(0)
	})
})
