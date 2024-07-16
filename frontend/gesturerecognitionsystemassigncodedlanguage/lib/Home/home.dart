import 'package:flutter/material.dart';
import 'package:gesturerecognitionsystemassigncodedlanguage/SignToVoice/signtovoice.dart';
import 'package:gesturerecognitionsystemassigncodedlanguage/VoiceToSign/voicetosign.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Gesture Recognition System',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF5DADE2),
        ),
        body: Column(
          children: <Widget>[
            const SizedBox(height: 40), // added space at the top
            const Row(
              children: <Widget>[
                SizedBox(width: 20), // added space at the left corner
                Text(
                  'Hello,',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF5DADE2),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                const SizedBox(width: 20), // added space at the left corner
                RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'What will you like to\n'),
                      TextSpan(text: 'transcribe today?'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20), // add 20 pixels of margin to the left and right
              child: ElevatedButton(
                onPressed: () {
                  // Handle Sign to Voice button press
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignToVoice()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5DADE2),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 35),
                  textStyle: const TextStyle(fontSize: 18, color: Colors.white),
                  foregroundColor: Colors.white, // icon color
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sign to Voice'),
                    SizedBox(width: 20),
                    Icon(Icons.handshake),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20), // add 20 pixels of margin to the left and right
              child: ElevatedButton(
                onPressed: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const VoiceToSignPage()),
                                    );
                  // Handle Voice to Sign button press2
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5DADE2),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 35),
                  textStyle: const TextStyle(fontSize: 18, color: Colors.white),
                  foregroundColor: Colors.white, 
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Voice to Sign'),
                    SizedBox(width: 20),
                    Icon(Icons.mic),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 85), // add some space before the footer
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 2, color: Color(0xFF5DADE2)),
                ),
                color: Color(0xFF5DADE2),
              ),
              padding: const EdgeInsets.all(20),
              width: double.infinity, // take up the full width
              child: Center(
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 24, color: Colors.white),
                    children: <TextSpan>[
                      TextSpan(text: 'Bridge your hearing '),
                      TextSpan(text: 'and\n'),
                      TextSpan(text: 'speech gap by using '),
                      TextSpan(text: 'our\n'),
                      TextSpan(text: 'system'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}