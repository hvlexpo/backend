const { Schema } = require('mongoose')

const ExhibitionSchema = new Schema({
	id: String,
	name: String,
	desc: String,
	photos: [String],
	votes:  {
		type: Map,
		of: Number
	}
})

module.exports = ExhibitionSchema
