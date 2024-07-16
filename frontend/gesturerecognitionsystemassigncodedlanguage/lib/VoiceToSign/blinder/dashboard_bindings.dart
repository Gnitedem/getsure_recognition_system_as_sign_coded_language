import 'package:gesturerecognitionsystemassigncodedlanguage/VoiceToSign/controller/translate.dart';
import 'package:get/instance_manager.dart';


class TranslateBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TranslaterController>(() => TranslaterController(),
        fenix: true);
  }
}
