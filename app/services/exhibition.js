const postgres = require('../db/postgres')

class ExhibitionService {
	static async create({ id, name, description, creators, photos }) {
		const value = [{ id, name, description, creators, photos }]
		const { rows } = await postgres.query(
			'INSERT INTO exhibitions(data) VALUES($1) RETURNING *',
			value
		)
		return rows[0].data
	}

	static async readAll() {
		const { rows } = await postgres.query('SELECT data FROM exhibitions')
		const response = rows.map(data => Object.values(data)[0])
		return response
	}

	static async read(id) {
		const value = [id]
		const { rows } = await postgres.query(
			"SELECT * FROM exhibitions WHERE data ->> 'id'= $1",
			value
		)
		return rows[0].data
	}

	static async update({ id, name, description, creators, photos }) {
		const value = [{ id, name, description, creators, photos }, id]
		const { rows } = await postgres.query(
			"UPDATE exhibitions SET data = $1 WHERE data ->> 'id'= $2 RETURNING *",
			value
		)
		return rows[0].data
	}

	static async delete(id) {
		const value = [id]
		const { rows } = await postgres.query(
			"DELETE FROM exhibitions WHERE data ->> 'id'= $1 RETURNING *",
			value
		)
		return rows[0].data
	}
}

module.exports = ExhibitionService
