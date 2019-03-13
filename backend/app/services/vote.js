//const ExhibitionModel = require('../models/exhibition')
//const UserModel = require('../models/user')

const postgres = require('../db/postgres')

class VoteService {
	static async create(id, { name }) {
		const { rows } = await postgres.query(
			`INSERT INTO votes(data) VALUES('{"id": ${id}, "name": "${name}" }') RETURNING *`
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
			`SELECT * FROM votes WHERE data -> 'id' = '${id}'`
		)
		return rows[0].data
	}

	static async update(id, { name }) {
		const { rows } = await postgres.query(
			`UPDATE votes SET data = '{"id": ${id}, "name": "${name}" }' WHERE data -> 'id' = '${id}' RETURNING *`
		)
		return rows[0].data
	}

	static async delete(id) {
		const { rows } = await postgres.query(
			`DELETE FROM votes WHERE data -> 'id' = '${id}' RETURNING *`
		)
		return rows[0].data
	}
}

module.exports = VoteService
