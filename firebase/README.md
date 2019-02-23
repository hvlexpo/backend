# HVL EXPO

> Firebase setup & React App

This folder contains the React app and Firebase configuration. The React app will function as a display for the current poll status.

## Development setup

First, run `npm install` to install dependencies.

To start the development server, run `npm start` or `yarn start`.

To create a production bundle, use `npm run build` or `yarn build`.

To run tests, use `npm run test`.

Also, we don't do semicolons.

## Deployment

Deployment requires **firebase-tools** to be installed. Install with `npm install -g firebase-tools`. If you don't know what **npm** is, Google it.

First, create a production build of the React app with `npm run build`. To deploy this, do `firebase deploy` inside this directory. This will also deploy the Firebase Functions and other configurations.
