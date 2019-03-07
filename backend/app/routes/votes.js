const { Router } = require('express')

const VotesService = require('../services/votes')

const router = new Router()

/*
const routers = (mongoose) => new Router()
	.get()
*/

// Get all votes
router.get('votes/', async (req, res) => {
	res.send(await VotesService.read())
})

// Read
router.get('votes/:id', async (req, res) => {
	res.send(await VotesService.read(req.params.id))
})

// Create
router.post('votes/:id', async (req, res) => {
	res.send(await VotesService.create(req.params.id))
})

// Update
router.put('votes/:id', async (req, res) => {
	res.send(await VotesService.update(req.params.id))
})

// Delete
router.delete('votes/:id', async (req, res) => {
	res.send(await VotesService.delete(req.params.id))
})

module.exports = router
