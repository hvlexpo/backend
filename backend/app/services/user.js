//const UserModel = require('../models/user')

const postgres = require('../db/postgres')

class UserService {
	static async create({ name }) {
		const value = [{ name }]
		const { rows } = await postgres.query(
			'INSERT INTO users(data) VALUES($1) RETURNING *',
			value
		)
		return rows[0].data
	}

	static async readAll() {
		const { rows } = await postgres.query('SELECT * FROM users')
		const response = rows.map(data => Object.values(data)[0])
		return response
	}

	static async read(id) {
		const value = [id]
		const { rows } = await postgres.query(
			'SELECT * FROM users WHERE id = $1',
			value
		)
		return rows[0].data
	}

	static async update(id, { name }) {
		const value = [{ name }, id]
		const { rows } = await postgres.query(
			'UPDATE users SET data = $1 WHERE id = $2 RETURNING *',
			value
		)
		return rows[0].data
	}

	static async delete(id) {
		const value = [id]
		const { rows } = await postgres.query(
			'DELETE FROM users WHERE id = $1 RETURNING *',
			value
		)
		return rows[0].data
	}
}

module.exports = UserService
