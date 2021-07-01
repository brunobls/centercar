import 'package:app/repositories/loja_repository.dart';
import 'package:get/get.dart';
import 'loja_controller.dart';

class LojaBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(LojaRepository(Get.find()));
    Get.put(LojaController(Get.find()));
  }
}
