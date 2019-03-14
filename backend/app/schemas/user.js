// const { Schema } = require('mongoose')

// const UserSchema = new Schema({
// 	id: {
// 		type: String,
// 		required: true
// 	}
// })

const UserSchema = 'CREATE TABLE IF NOT EXISTS users(id SERIAL, data JSONB)'

module.exports = UserSchema
