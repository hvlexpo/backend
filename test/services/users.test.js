const test = require('ava')

if (process.env.NODE_ENV !== 'CI') {
	require('dotenv').config()
}

// const UserService = require('../../app/services/user')

test('Users', t => {
	t.pass('Skipped')
})

test.todo('Create user')
test.todo('Read all users')
test.todo('Read user by id')
test.todo('Delete user by id')
test.todo('Update user by id')
