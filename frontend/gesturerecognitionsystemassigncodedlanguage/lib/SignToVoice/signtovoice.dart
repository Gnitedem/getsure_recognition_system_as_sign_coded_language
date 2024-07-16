// voicetosign.dart
import 'package:flutter/material.dart';
import 'package:gesturerecognitionsystemassigncodedlanguage/SignToVoice/binding/sing_binding.dart';
import 'package:gesturerecognitionsystemassigncodedlanguage/SignToVoice/view/sign_page.dart';
import 'package:get/get.dart';

class SignToVoice extends StatelessWidget {
  const SignToVoice({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home:  const SignToVoicePage(),
      initialBinding: SignBindings(),
    );
  }
  }
