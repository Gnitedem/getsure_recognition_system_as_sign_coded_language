// voicetosign.dart
import 'package:flutter/material.dart';
import 'package:gesturerecognitionsystemassigncodedlanguage/VoiceToSign/blinder/dashboard_bindings.dart';
import 'package:gesturerecognitionsystemassigncodedlanguage/VoiceToSign/view/dashboard.dart';
import 'package:get/get.dart';

class VoiceToSignPage extends StatelessWidget {
  const VoiceToSignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: const Dashboard(),
      initialBinding: TranslateBindings(),
    );
  }
  }
