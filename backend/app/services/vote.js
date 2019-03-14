//const ExhibitionModel = require('../models/exhibition')
//const UserModel = require('../models/user')

const postgres = require('../db/postgres')

class VoteService {
	static async create({ exhibition_id, user_id, weight }) {
		const { rows } = await postgres.query(
			`INSERT INTO votes(data) VALUES('{"exhibition_id": "${exhibition_id}", "user_id": "${user_id}", "weight": "${weight}" }') RETURNING *`
		)
		return rows[0].data
	}

	static async readAll() {
		const { rows } = await postgres.query('SELECT * FROM votes')
		const response = rows.map(data => Object.values(data)[0])
		return response
	}

	static async read(id) {
		const { rows } = await postgres.query(
			`SELECT * FROM votes WHERE id = ${id}`
		)
		return rows[0].data
	}

	static async update(id, { exhibition_id, user_id, weight }) {
		const { rows } = await postgres.query(
			`UPDATE votes SET data = '{"exhibition_id": "${exhibition_id}", "user_id": "${user_id}", "weight": "${weight}" }' WHERE id = ${id} RETURNING *`
		)
		return rows[0].data
	}

	static async delete(id) {
		const { rows } = await postgres.query(
			`DELETE FROM votes WHERE id = ${id} RETURNING *`
		)
		return rows[0].data
	}
}

module.exports = VoteService
