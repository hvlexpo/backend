// const { Schema } = require('mongoose')

// const ExhibitionSchema = new Schema({
// 	id: String,
// 	name: String,
// 	desc: String,
// 	photos: [String],
// 	votes: {
// 		type: Map,
// 		of: Number
// 	}
// })

const ExhibitionSchema = 'CREATE TABLE IF NOT EXISTS exhibitions(data JSONB)'

module.exports = ExhibitionSchema
