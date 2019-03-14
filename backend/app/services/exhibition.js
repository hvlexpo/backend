// const ExhibitionModel = require('../models/exhibition')

const postgres = require('../db/postgres')

class ExhibitionService {
	static async create({ name, desc, photo }) {
		const { rows } = await postgres.query(
			`INSERT INTO exhibitions(data) VALUES('{"name": "${name}", "desc": "${desc}", "photo": "${photo}" }') RETURNING *`
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
			`SELECT * FROM exhibitions WHERE id = ${id}`
		)
		return rows[0].data
	}

	static async update(id, { name, desc, photo }) {
		const { rows } = await postgres.query(
			`UPDATE exhibitions SET data = '{"name": "${name}", "desc": "${desc}", "photo": "${photo}" }' WHERE id = ${id} RETURNING *`
		)
		return rows[0].data
	}

	static async delete(id) {
		const { rows } = await postgres.query(
			`DELETE FROM exhibitions WHERE id = ${id} RETURNING *`
		)
		return rows[0].data
	}
}

module.exports = ExhibitionService
