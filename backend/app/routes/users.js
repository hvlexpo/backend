const { Router } = require('express')

const UserService = require('../services/user')

const router = new Router()

// Get all users
router.get('/', async (req, res) => {
	res.send(await UserService.readAll())
})

// Read
router.get('/user', async (req, res) => {
	res.send(await UserService.read(req.user.id))
})

// Create
router.post('/', async (req, res) => {
	//Spør firebase om id med token
	res.send(await UserService.create(req.user.id, req.body))
	//req.headers.token
})

// Update
router.put('/', async (req, res) => {
	res.send(await UserService.update(req.user.id, req.body))
})

// Delete
router.delete('/', async (req, res) => {
	res.send(await UserService.delete(req.user.id))
})

module.exports = router
