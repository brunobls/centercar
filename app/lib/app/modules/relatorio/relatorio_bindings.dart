import 'package:app/app/modules/relatorio/relatorio_controller.dart';
import 'package:app/repositories/relatorio_repository.dart';
import 'package:get/get.dart';

class RelatorioBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(RelatorioRepository(Get.find()));
    Get.put(RelatorioController(Get.find()));
  }
}
