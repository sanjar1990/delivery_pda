import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class BaseController extends GetxController {
  final subscribe = CompositeSubscription();

  @override
  void onClose() {
    subscribe.dispose();
    Get.log("dispose VM");
    super.onClose();
  }
}
