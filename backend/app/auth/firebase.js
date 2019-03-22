const admin = require('firebase-admin')

const serviceAccount = require('../../config/serviceAccountKey.json')

admin.initializeApp({
	credential: admin.credential.cert(serviceAccount),
	databaseURL: 'https://hvl-expo.firebaseio.com'
})

module.exports = async (req, res, next) => {
	const {firebasetoken} = req.headers

	if (!firebasetoken) {
		res.status(400).send({error: 'No token.'})
	}

	try {
		const decodedToken = await admin.auth().verifyIdToken(firebasetoken)

		if (!req.user) {
			req.user = {id: decodedToken.uid}
		} else {
			req.user.id = decodedToken.uid
		}

		console.log('UID', req.user.id)

		next()
		
	} catch (err) {
		console.log(err)
	
		res.status(403).send({err})
	}
}
