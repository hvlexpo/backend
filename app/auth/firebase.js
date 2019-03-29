const admin = require('firebase-admin')

let serviceAccount = null

if (process.env.NODE_ENV === 'production') {
	const atob = require('atob')

	const serviceAccountFile = atob(process.env.EXPO_SERVICE_ACCOUNT_KEY)
	serviceAccount = JSON.parse(serviceAccountFile)
} else if (process.env.NODE_ENV === 'CI') {
	serviceAccount = null
} else {
	serviceAccount = require('../../config/serviceAccountKey.json')
}

if (!serviceAccount) {
	console.log('🔥 No Firebase service account. Exiting...')
	process.exit(1)
}

admin.initializeApp({
	credential: admin.credential.cert(serviceAccount),
	databaseURL: 'https://hvl-expo.firebaseio.com'
})

module.exports = async (req, res, next) => {
	const { firebasetoken } = req.headers

	console.log('🔐 Token', firebasetoken)

	if (!firebasetoken) {
		res.status(400).send({
			error: 'No token.'
		})
	}

	try {
		const decodedToken = await admin.auth().verifyIdToken(firebasetoken)

		if (!req.user) {
			req.user = { id: decodedToken.uid }
		} else {
			req.user.id = decodedToken.uid
		}

		next()
	} catch (err) {
		console.log(err)
		res.status(403).send({ err })
	}
}
