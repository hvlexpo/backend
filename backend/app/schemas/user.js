// const { Schema } = require('mongoose')

// const UserSchema = new Schema({
// 	id: {
// 		type: String,
// 		required: true
// 	}
// })

const UserSchema = 'CREATE TABLE IF NOT EXISTS users(data JSONB)'

module.exports = UserSchema
