const { Schema } = require('mongoose')

const UserSchema = new Schema({
	id: {
		type: String,
		required: true
	}
})

module.exports = UserSchema
