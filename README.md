# Object Detection and Recognition with Flutter and Python
This project uses the YOLO (You Only Look Once) algorithm for object detection and recognition in a Flutter app. The app connects to a Flask backend server, which runs the Python code for the YOLO algorithm.

Installation
Clone this repository.

Download the YOLO weights file from [here](https://drive.google.com/file/d/1Z-jrUIoIQPUDNYaXE9GyHnliMvwspP82/view?usp=share_link) and place it in the 'backend/model' directory.

Install the required Python packages by running the following command in the backend directory:

'''pip install -r requirements.txt'''

Install the required Flutter packages by running the following command in the flutter_app directory:

'''flutter pub get'''

In the flutter_app/lib/consts/constants.dart file, replace the URI variable with your local IP address to connect to the Flask backend server.
Usage
Start the Flask server by running the following command in the backend directory:

'''python main.py'''

Run the Flutter app on an emulator or physical device by running the following command in the flutter_app directory:

'''flutter run'''

Use the app to take a picture and detect objects in the image.

Security
To ensure secure connections between the Flutter app and Flask backend server, it's recommended to use HTTPS and implement proper authentication and authorization mechanisms.

License
This project is licensed under the MIT License.
