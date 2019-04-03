const postgres = require('../db/postgres')

class UserService {
	static async create(id, { name }) {
		const value = [{ id, name }]
		const { rows } = await postgres.query(
			'INSERT INTO users(data) VALUES($1) RETURNING *',
			value
		)
		return rows[0].data
	}

	static async readAll() {
		const { rows } = await postgres.query('SELECT data FROM users')
		const response = rows.map(data => Object.values(data)[0])
		return response
	}

	static async read(id) {
		const value = [id]
		const { rows } = await postgres.query(
			"SELECT * FROM users WHERE data ->> 'id'= $1",
			value
		)
		if (rows[0]) {
			return rows[0].data
		}
	}

	static async createOrRead(id) {
		const value = [id, {name: ''}]
		const { rows } = await postgres.query(`
		INSERT INTO users(name, value) 
		SELECT '', 'true'
		WHERE NOT EXISTS (
			SELECT 1 FROM keys WHERE name='blah'
		);
		`,
		value)
		
		return rows[0].data
	}

	static async update(id, { name }) {
		const value = [{ id, name }, id]
		const { rows } = await postgres.query(
			"UPDATE users SET data = $1 WHERE data ->> 'id'= $2 RETURNING *",
			value
		)
		return rows[0].data
	}

	static async delete(id) {
		const value = [id]
		const { rows } = await postgres.query(
			"DELETE FROM users WHERE data ->> 'id'= $1 RETURNING *",
			value
		)
		return rows[0].data
	}
}

module.exports = UserService
