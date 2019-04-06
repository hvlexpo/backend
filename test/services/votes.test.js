const test = require('ava')

if (process.env.NODE_ENV !== 'CI') {
	require('dotenv').config()
}

//const VoteService = require('../../app/')

test('Votes', t => {
	t.pass('Skipped')
})

test.todo('Create vote')
test.todo('Read all votes')
test.todo('Read vote by id')
test.todo('Update vote by id')
test.todo('Delete vote by id')
