const { Router } = require('express')

const UserService = require('../services/user')

const router = new Router()

/*
const routers = (mongoose) => new Router()
	.get()
*/

// Get all users
router.get('users/', async (req, res) => {
	res.send(await UserService.read())
})

// Read
router.get('users/:id', async (req, res) => {
	res.send(await UserService.read(req.params.id))
})

// Create
router.post('users/:id', async (req, res) => {
	res.send(await UserService.create(req.params.id))
})

// Update
router.put('users/:id', async (req, res) => {
	res.send(await UserService.update(req.params.id))
})

// Delete
router.delete('users/:id', async (req, res) => {
	res.send(await UserService.delete(req.params.id))
})

module.exports = router
