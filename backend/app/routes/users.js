const { Router } = require('express')

const UserService = require('../services/user')

const router = new Router()

/*
const routers = (mongoose) => new Router()
	.get()
*/

// Get all users
router.get('/api/users/', async (req, res) => {
	res.send(await UserService.read())
})

// Read
router.get('/api/users/:id', async (req, res) => {
	res.send(await UserService.read(req.params.id))
})

// Create
router.post('/api/users/:id', async (req, res) => {
	res.send(await UserService.create(req.params.id))
})

// Update
router.put('/api/users/:id', async (req, res) => {
	res.send(await UserService.update(req.params.id))
})

// Delete
router.delete('/api/users/:id', async (req, res) => {
	res.send(await UserService.delete(req.params.id))
})

module.exports = router
