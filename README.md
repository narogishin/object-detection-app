# Object Detection and Recognition with Flutter and Python

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://docs.flutter.dev/get-started/install)
[![Python 3.9+](https://img.shields.io/badge/python-3.9+-blue.svg)](https://www.python.org/downloads/release/python-390/)
[![Flask](https://img.shields.io/badge/Flask-000000?style=for-the-badge&logo=flask&logoColor=white)](https://flask.palletsprojects.com/en/2.2.x/quickstart/)
[![Code License](https://img.shields.io/badge/License-MIT-yellow.svg))](https://github.com/narogishin/object-detection-app/LICENSE)

This project uses the YOLO (You Only Look Once) algorithm for object detection and recognition in a Flutter app. The app connects to a Flask backend server, which runs the Python code for the YOLO algorithm.

## Installation
Clone this repository.

Download the YOLO weights file from [here](https://drive.google.com/file/d/1Z-jrUIoIQPUDNYaXE9GyHnliMvwspP82/view?usp=share_link) and place it in the 'backend/model' directory.

Install the required Python packages by running the following command in the backend directory:

```pip install -r requirements.txt```

Install the required Flutter packages by running the following command in the flutter_app directory:

```flutter pub get```

In the flutter_app/lib/consts/constants.dart file, replace the URI variable with your local IP address to connect to the Flask backend server.

## Usage

Start the Flask server by running the following command in the backend directory:

```python main.py```

Run the Flutter app on an emulator or physical device by running the following command in the flutter_app directory:

```flutter run```

Use the app to take a picture and detect objects in the image.

## Security

To ensure secure connections between the Flutter app and Flask backend server, it's recommended to use HTTPS and implement proper authentication and authorization mechanisms.
