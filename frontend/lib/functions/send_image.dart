import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:text_to_speech/text_to_speech.dart';

import '../consts/constants.dart';

Future<void> SendImage(var pixels) async {
  TextToSpeech tts = TextToSpeech();
  final pixelsJson = json.encode({'pixels': pixels});
  final response = await http.post(
    Uri.parse(URI + '/process_image'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: pixelsJson,
  );
  final responseData = json.decode(response.body);
  print(responseData['result']);
  String text = responseData['result'];
  tts.speak(text);
}
