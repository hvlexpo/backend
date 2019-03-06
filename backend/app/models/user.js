const mongoose = require('mongoose')
const UserSchema = require('../schemas/user')

const UserModel = mongoose.model('UserModel', UserSchema)

UserModel.prototype.create = () => {
	
}

module.exports = UserModel
