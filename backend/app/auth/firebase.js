const admin = require('firebase-admin')

const serviceAccount = require('../../config/serviceAccountKey.json')

admin.initializeApp({
	credential: admin.credential.cert(serviceAccount),
	databaseURL: 'https://hvl-expo.firebaseio.com'
})

module.exports = async (req, res, next) => {
	const {FirebaseToken} = req.headers

	if (!FirebaseToken) {
		res.send({
			error: 'No token.'
		})
	}

	if (await admin.auth().verifyIdToken(FirebaseToken)) {
		next()
	} else {
		res.send({
			error: 'Token invalid.'
		})
	}
}
