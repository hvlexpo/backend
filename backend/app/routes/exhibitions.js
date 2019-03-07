const { Router } = require('express')

const ExhibitionService = require('../services/exhibition')

const router = new Router()

/*
const routers = (mongoose) => new Router()
	.get()
*/

// Get all exhibitions
router.get('exhibitions/', async (req, res) => {
	res.send(await ExhibitionService.read())
})

// Read
router.get('exhibitions/:id', async (req, res) => {
	res.send(await ExhibitionService.read(req.params.id))
})

// Create
router.post('exhibitions/:id', async (req, res) => {
	res.send(await ExhibitionService.create(req.params.id))
})

// Update
router.put('exhibitions/:id', async (req, res) => {
	res.send(await ExhibitionService.update(req.params.id))
})

// Delete
router.delete('exhibitions/:id', async (req, res) => {
	res.send(await ExhibitionService.delete(req.params.id))
})

module.exports = router
