import React, {Component} from 'react'
import {
	BrowserRouter as Router,
	Route
} from 'react-router-dom';

import Home from './Components/Home'
import About from './Components/About'
import Navigation from './Components/Navigation'

class App extends Component {
	render() {
		return (
			<div>
				<Router>
					<div>
						<Navigation />

						{/* Routes */}
						<Route exact={true} path={'/'} component={Home} />
						<Route exact={true} path={'/about'} component={About} />
					</div>
				</Router>
			</div>
		)
	}
}

export default App
