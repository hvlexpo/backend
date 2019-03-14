//const UserModel = require('../models/user')

const postgres = require('../db/postgres')

class UserService {
	static async create({ name }) {
		const { rows } = await postgres.query(
			`INSERT INTO users(data) VALUES('{"name": "${name}" }') RETURNING *`
		)
		return rows[0].data
	}

	static async readAll() {
		const { rows } = await postgres.query('SELECT * FROM users')
		const response = rows.map(data => Object.values(data)[0])
		return response
	}

	static async read(id) {
		const { rows } = await postgres.query(
			`SELECT * FROM users WHERE id = ${id}`
		)
		return rows[0].data
	}

	static async update(id, { name }) {
		const { rows } = await postgres.query(
			`UPDATE users SET data = '{"name": "${name}" }' WHERE id = ${id} RETURNING *`
		)
		return rows[0].data
	}

	static async delete(id) {
		const { rows } = await postgres.query(
			`DELETE FROM users WHERE id = ${id} RETURNING *`
		)
		return rows[0].data
	}
}

module.exports = UserService
