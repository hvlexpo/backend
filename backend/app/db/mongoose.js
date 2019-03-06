const mongoose = require('mongoose')

mongoose // Declare DB Events
	.connection
	.on('error', () => console.log('❌ ', 'Connection to database failed.'))
	.on('disconnecting', () => console.log('🌄 ', 'Disconnecting from database...'))
	.on('disconnected', () => console.log('❗ ' , 'Disconnected from database.'))
	.on('open', () => console.log('✅ ', 'Connected to MongoDB database.'))

mongoose // Connect to database
	.connect(process.env.MONGO_URI, {useNewUrlParser: true})
	.then()
	.catch((reason) => console.log('Reason:', reason.message/*, '\nRetrying...\n'*/))

module.exports = mongoose
