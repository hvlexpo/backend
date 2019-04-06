const test = require('ava')

if (process.env.NODE_ENV !== 'CI') {
	require('dotenv').config()
}

//const ExhibitionService = require('../../app/services/exhibition')

test('Exhibitions', t => {
	t.pass('Skipped')
})

test.todo('Create exhibition')
test.todo('Read all exhibitions')
test.todo('Read exhibition by id')
test.todo('Update existing exhibition by id')
test.todo('Delete exhibition by id')
