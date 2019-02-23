import React, {Component} from 'react';
import {Route, Link} from 'react-router-dom'
import Home from './Home'
import About from './About'

class Navigation extends Component {
	render() {
		return (
			<nav className={'black darken-1'}>
				<div className={"nav-wrapper"}>
					<ul className={'left'}>
						<li>
							<Link to={'/'}>
								<span className={'white-text'}>Home</span>
							</Link>
						</li>
						<li>
							<Link to={'/about'}>
								<span className={'white-text'}>About</span>
							</Link>
						</li>
					</ul>
				</div>
			</nav>
		)
	}
}

export default Navigation
