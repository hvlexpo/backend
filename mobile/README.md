# HVL Expo

🌍 A mobile app for voting on different HVL Expo exhibitions.

## Getting Started

To get started, run ```flutter run``` in your terminal.

## Architecture
In this project, we're using a pattern and state management system called BLoC (Business Logic Component).
These are some key features of the BLoC pattern.

* BLoC's input and output interfaces are all Stream/Sink
* BLoC's dependencies are always injectable and environment independent
* There is no conditional branch for each environment in BLoC
* Implementation is free as long as it complies with the above rules

<img src="https://cdn-images-1.medium.com/max/1200/1*MqYPYKdNBiID0mZ-zyE-mA.png">

The above diagram represents the data flow from the UI layer to the Data layer and vice versa. BLoC classes will never have any reference of the widgets in the UI layer, and the UI layer will only observe changes coming from the BLoC class.

We're focusing on other general practises like low coupling, high cohesion and thorough, quality code. Feel free to open a PR or raise an issue if you're seeing otherwise!
