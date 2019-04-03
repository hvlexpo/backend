<h1 align="center">
  <br>
  <a href="http://www.hvl.no"><img src="http://drive.google.com/uc?export=view&id=1arruHIXA2AeDNhefnsU61Mk_dQiiq7NB" alt="Markdownify" width="150"></a>
  <br>
  HVL EXPO Backend
  <br>
</h1>

<h4 align="center">The HVL Expo experience built on <a href="https://flutter.io" target="_blank">Flutter</a>, <a href="https://reactjs.org/" target="_blank">React</a> and <a href="https://firebase.google.com/" target="_blank">Firebase</a>.</h4>

<p align="center">
  <a href="https://travis-ci.com/hvlexpo/backend/">
    <img src="https://travis-ci.com/hvlexpo/backend.svg?branch=master">
  </a>
  <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/github/license/Naereen/StrapDown.js.svg"></a>
  <a href="https://github.com/hvlexpo/backend/graphs/contributors">
      <img src="https://img.shields.io/github/contributors/hvlexpo/backend.svg">
  </a>
  <a href="https://www.hvl.no">
    <img src="https://img.shields.io/badge/hvl-dat109-blue.svg">
  </a>
</p>

<p align="center">
  <a href="#usage">Usage</a> •
  <a href="#installation">Installation</a> •
  <a href="#credits">Credits</a> •
  <a href="#license">License</a>
</p>

Welcome to the backend server for HVL EXPO. The server is built with Node and uses PostgreSQL as a database. It also makes use of various technologies, such as Express, and Firebase for phone authentication.

## Usage

First, make sure you have installed Node and NPM.

To run the app with the database, a `.env` file must be present in the config folder. If it is not, the app will quit with an error message. To make one, duplicate the `sample.env` file inside config and rename it to `.env`. You must then fill it with the appropriate values, which for testing purposes can be a MongoDB instance running on the local machine.

*More information...*

## Development

The development of each part of the software will happen on it's own branch. After significant progress, a pull request can be made to merge it into master. In general you shouldn't commit directly to master. You should also consider branching out from each respective branch if you are going to work on a specific feature or issue, and then make a pull request back to the original branch.

For pull requests to be merged into master they must be reviewed and pass all the tests.

## Installation

Information on how to download and install/run web and mobile clients.

## Progress

| Week          | To-do                               | Done  |
| ------------- | ----------------------------------- | :---: |
| 9             | Initial planning, product planning  | ✅    |
| 10            | First iteration; vision             | ✅    |
| 11            | Second iteration; architecture      | ✅    |
| 12            | Third iteration; implementation     | 🔄    |
| 13            | Fourth iteration; implementation    | 🔜    |
| 14            | Presentation and summary            | 🔜    |

## Credits

This software uses the following open source packages:

- [Flutter](https://flutter.io)
- More packages

## License

MIT
