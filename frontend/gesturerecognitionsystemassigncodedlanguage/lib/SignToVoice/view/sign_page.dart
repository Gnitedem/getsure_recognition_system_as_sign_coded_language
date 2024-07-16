
import 'package:flutter/material.dart';
import 'package:gesturerecognitionsystemassigncodedlanguage/SignToVoice/controller/sign_controller.dart';
import 'package:get/get.dart';

class SignToVoicePage extends StatefulWidget {
  const SignToVoicePage({super.key});

  @override
  State<SignToVoicePage> createState() => _SignToVoicePageState();
}

class _SignToVoicePageState extends State<SignToVoicePage> {
  SignController controller = Get.find<SignController>();
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign To Voice',
          style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF5DADE2),
        ),
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
           const Text(
              "Letters From Web Socket ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30),
            ),
            Obx(() => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  controller.text.value,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 250, 194, 25),
                      fontSize: 30),
                ),
              )
            ),
            SizedBox(
              height: size.height * .65,
              child: SingleChildScrollView(
                child: GetBuilder<SignController>(
                  builder: (Tc) {
                    return Wrap(
                      spacing: 0,
                      runSpacing: 8,
                      children: Tc.showsigns.map((sign) {
                        return Image.asset(
                          sign.values.first,
                          height: 100,
                          width: 100,
                        );
                      }).toList(),
                    );
                  },
                ),
              )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.clearWords();
        },
        child: const Icon(Icons.clear),
      ),
    );
  }
}