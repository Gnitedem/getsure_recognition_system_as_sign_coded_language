import 'package:gesturerecognitionsystemassigncodedlanguage/SignToVoice/controller/sign_controller.dart';
import 'package:get/instance_manager.dart';


class SignBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignController>(() => SignController(),
        fenix: true);
  }
}
