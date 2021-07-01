import 'package:app/app/modules/cadastro/cadastro_controller.dart';
import 'package:app/repositories/cadastro_repository.dart';
import 'package:get/get.dart';

class CadastroBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(CadastroRepository(Get.find()));
    Get.put(CadastroController(Get.find()));
  }
}
