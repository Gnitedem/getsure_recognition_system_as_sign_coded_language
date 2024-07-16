import 'package:flutter/material.dart';
import 'package:gesturerecognitionsystemassigncodedlanguage/SignToVoice/signtovoice.dart';
import 'package:gesturerecognitionsystemassigncodedlanguage/VoiceToSign/voicetosign.dart';
import 'package:gesturerecognitionsystemassigncodedlanguage/Welcome/welcome.dart';
import 'package:gesturerecognitionsystemassigncodedlanguage/Home/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Gesture Recognition System As Sign Coded Language',
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/home': (context) => const HomePage(),
        '/voicetosign': (context) => const VoiceToSignPage(),
        '/signtovoice': (context) => const SignToVoice(),
      },
      
    );
  }
}




