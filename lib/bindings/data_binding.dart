import 'package:get/get.dart';
import 'package:stock_app/controllers/data_controller.dart';

class DataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataController>(() => DataController());
  }
}