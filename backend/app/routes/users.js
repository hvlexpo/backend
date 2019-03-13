const { Router } = require('express')

const UserService = require('../services/user')

const router = new Router()

/*
const routers = (mongoose) => new Router()
	.get()
*/

// Get all users
router.get('/', async (req, res) => {
	res.send(await UserService.readAll())
})

// Read
router.get('/:id', async (req, res) => {
	res.send(await UserService.read(req.params.id))
})

// Create
router.post('/:id', async (req, res) => {
	res.send(await UserService.create(req.params.id, req.body))
})

// Update
router.put('/:id', async (req, res) => {
	res.send(await UserService.update(req.params.id, req.body))
})

// Delete
router.delete('/:id', async (req, res) => {
	res.send(await UserService.delete(req.params.id))
})

module.exports = router
