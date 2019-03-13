// const ExhibitionModel = require('../models/exhibition')

const postgres = require('../db/postgres')

class ExhibitionService {
	static async create(id, { name }) {
		const { rows } = await postgres.query(
			`INSERT INTO exhibitions(data) VALUES('{"id": ${id}, "name": "${name}" }') RETURNING *`
		)
		return rows[0].data
	}

	static async readAll() {
		const { rows } = await postgres.query('SELECT * FROM exhibitions')
		const response = rows.map(data => Object.values(data)[0])
		return response
	}

	static async read(id) {
		const { rows } = await postgres.query(
			`SELECT * FROM exhibitions WHERE data -> 'id' = '${id}'`
		)
		return rows[0].data
	}

	static async update(id, { name }) {
		const { rows } = await postgres.query(
			`UPDATE exhibitions SET data = '{"id": ${id}, "name": "${name}" }' WHERE data -> 'id' = '${id}' RETURNING *`
		)
		return rows[0].data
	}

	static async delete(id) {
		const { rows } = await postgres.query(
			`DELETE FROM exhibitions WHERE data -> 'id' = '${id}' RETURNING *`
		)
		return rows[0].data
	}
}

module.exports = ExhibitionService
