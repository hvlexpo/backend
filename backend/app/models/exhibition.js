const mongoose = require('mongoose')
const ExhibitionSchema = require('../schemas/exhibition')

const ExhibitionModel = mongoose.model('ExhibitionModel', ExhibitionSchema)

module.exports = ExhibitionModel
