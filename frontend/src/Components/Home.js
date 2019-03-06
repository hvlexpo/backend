import React, {Component} from 'react'

class Home extends Component {
	render() {
		const style = {
			display: 'flex',
			justifyContent: 'center',
			alignItems: 'center'
		}

		return (
			<div>
				<div style={style}>
					<div  >
						<div className={'container'}>
							<h2 className={'black-text'}>HVL EXPO</h2>
							<p>
								Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
                         </p>
						</div>
					</div>
				</div>
			</div>
		)
	}
}

export default Home
