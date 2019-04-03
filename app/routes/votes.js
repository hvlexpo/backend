const { Router } = require('express')

const VotesService = require('../services/vote')

const router = new Router()

// Get all votes
router.get('/all', async (req, res) => {
	res.send(await VotesService.readAll())
})

// Read
router.get('/:exhibition_id', async (req, res) => {
	res.send(await VotesService.read(req.user.id, req.params.exhibition_id))
})

// Get vote count for exhibition
router.get('/:exhibition_id/count', async (req, res) => {
	res.send(await VotesService.read(req.user.id, req.params.exhibition_id))
})

// Create
router.post('/', async (req, res) => {
	res.send(await VotesService.create(req.user.id, req.body))
})

// Update
router.put('/:exhibition_id', async (req, res) => {
	res.send(
		await VotesService.update(req.user.id, req.params.exhibition_id, req.body)
	)
})

// Delete
router.delete('/:exhibition_id', async (req, res) => {
	res.send(await VotesService.delete(req.user.id, req.params.exhibition_id))
})

module.exports = router
