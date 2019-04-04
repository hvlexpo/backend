const postgres = require('../db/postgres')

class VoteService {
	static async create(userId, exhibitionId, {weight}) {
		const value = [{ userId, exhibitionId, weight }]
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

	static async read(user_id, exhibition_id) {
		const value = [user_id, exhibition_id]
		const { rows } = await postgres.query(
			"SELECT * FROM votes WHERE data ->> 'user_id'= $1 AND 'exhibition_id' = $2",
			value
		)
		return rows[0].data
	}

	static async readForUser(userId) {
		const value = [userId]
		const { rows } = await postgres.query(
			"SELECT data FROM votes WHERE data ->> 'user_id' = $1",
			value
		)

		return rows.map(data => Object.values(data)[0])
	}

	static async update(user_id, exhibition_id, { weight }) {
		const value = [{ user_id, exhibition_id, weight }, user_id, exhibition_id]
		const { rows } = await postgres.query(
			"UPDATE votes SET data = $1 WHERE data ->> 'user_id'= $2 AND data ->> 'exhibition_id' = $3 RETURNING *",
			value
		)
		return rows[0].data
	}

	static async delete(user_id, exhibition_id) {
		const value = [user_id, exhibition_id]
		const { rows } = await postgres.query(
			"DELETE FROM votes WHERE data ->> 'user_id'= $1 AND 'exhibition_id = $2 RETURNING *",
			value
		)
		return rows[0].data
	}
}

module.exports = VoteService
