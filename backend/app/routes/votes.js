const { Router } = require('express')

const VotesService = require('../services/vote')

const router = new Router()

/*
const routers = (mongoose) => new Router()
	.get()
*/

// Get all votes
router.get('/', async (req, res) => {
	res.send(await VotesService.read())
})

// Read
router.get('/:id', async (req, res) => {
	res.send(await VotesService.read(req.params.id))
})

// Create
router.post('/:id', async (req, res) => {
	res.send(await VotesService.create(req.params.id))
})

// Update
router.put('/:id', async (req, res) => {
	res.send(await VotesService.update(req.params.id))
})

// Delete
router.delete('/:id', async (req, res) => {
	res.send(await VotesService.delete(req.params.id))
})

module.exports = router