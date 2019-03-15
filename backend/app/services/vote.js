//const ExhibitionModel = require('../models/exhibition')
//const UserModel = require('../models/user')

const postgres = require('../db/postgres')

class VoteService {
	static async create({ exhibition_id, user_id, weight }) {
		const value = [{ exhibition_id, user_id, weight }]
		const { rows } = await postgres.query(
			'INSERT INTO votes(data) VALUES($1) RETURNING *',
			value
		)
		return rows[0].data
	}

	static async readAll() {
		const { rows } = await postgres.query('SELECT data FROM votes')
		const response = rows.map(data => Object.values(data)[0])
		return response
	}

	static async read(id) {
		const value = [id]
		const { rows } = await postgres.query(
			'SELECT * FROM votes WHERE id = $1',
			value
		)
		return rows[0].data
	}

	static async update(id, { exhibition_id, user_id, weight }) {
		const value = [{ exhibition_id, user_id, weight }, id]
		const { rows } = await postgres.query(
			'UPDATE votes SET data = $1 WHERE id = $2 RETURNING *',
			value
		)
		return rows[0].data
	}

	static async delete(id) {
		const value = [id]
		const { rows } = await postgres.query(
			'DELETE FROM votes WHERE id = $1 RETURNING *',
			value
		)
		return rows[0].data
	}
}

module.exports = VoteService
