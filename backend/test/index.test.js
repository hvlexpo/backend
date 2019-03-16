const test = require('ava')

if (process.env.NODE_ENV !== 'CI') {
	require('dotenv').config()
}

test.todo('Test server')
