import 'package:app/helpers/rest_client.dart';
import 'package:get/get.dart';

class StartupBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient(), fenix: true);
  }
}
