import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';

import 'functions/handle_image.dart';
import 'functions/send_image.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatefulWidget {
  final CameraDescription camera;

  const MyApp({
    super.key,
    required this.camera,
  });

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the camera,
    // create a CameraController.
    _controller = CameraController(
      // Get the current camera from widget.camera
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller?.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller?.dispose();
    super.dispose();
  }

  Future<Uint8List> _takePicture() async {
    try {
      final image = await _controller!.takePicture();
      // XFile? imageFile = image;
      final imageBytes = await image.readAsBytes();
      return imageBytes;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    // double deviceHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          // Wait until the controller is initialized before displaying the
          // camera preview. Use a FutureBuilder to display a loading spinner
          // until the controller has finished initializing.
          body: Column(
        children: [
          Stack(alignment: Alignment(0, 0.9), children: [
            FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the Future is complete, display the preview.
                  return CameraPreview(_controller!);
                } else {
                  // Otherwise, display a loading spinner.
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  color: Colors.red.shade400, shape: BoxShape.circle),
              child: IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: (() async {
                    Uint8List imageList = await _takePicture();
                    if (imageList != null) {
                      // Handle the selected image
                      // final imageBytes = await imageList.readAsBytes();
                      final image = await decodeImageFromList(imageList);
                      final data = await HandleImage(image);
                      SendImage(data);
                    }
                  })),
            )
          ]),
        ],
      )),
    );
  }
}
