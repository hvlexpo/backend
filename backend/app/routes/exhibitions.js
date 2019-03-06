const { Router } = require('express')

const ExhibitionService = require('../services/exhibition')

const router = new Router()

/*
const routers = (mongoose) => new Router()
	.get()
*/

// Get all exhibitions
router.get('/', async (req, res, next) => {
	const exhibition = await ExhibitionService.read()
	
	res.send(await ExhibitionService.read())
})

// Read
router.get('/?id', async (req, res, next) => {

})

// Create
router.post('/?id', async (req, res, next) => {

})

// Update
router.put('/?id', async (req, res, next) => {

})

// Delete
router.delete('/?id', async (req, res, next) => {

})

module.exports = router
