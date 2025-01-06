import 'package:delivery_pda/domain/use_case/bring_courier_use_case/bring_courier_use_case.dart';
import 'package:delivery_pda/view/connect_postamat/controller/connect_postamat_controller.dart';
import 'package:delivery_pda/view/login/controller/login_controller.dart';
import 'package:delivery_pda/view/main/controller/main_controller.dart';
import 'package:delivery_pda/view/take_post/controller/take_post_controller.dart';
import 'package:delivery_pda/view/yacheykaga_joylash/controller/yacheykaga_joylash_controller.dart';
import 'package:get/get.dart';
import 'data/server/api/api_service.dart';
import 'data/server/auth_interceptor.dart';
import 'data/storage/app/locals/lang_prefs/language_prefs.dart';
import 'data/storage/auth/auth_holder.dart';
import 'data/storage/auth/auth_prefs.dart';
import 'domain/use_case/login/login_use_case.dart';


class DIService {
  static Future<void> init() async {
    // data

    Get.lazyPut<LangPrefs>(() => LangPrefs(), fenix: true);
    Get.lazyPut<PdaHolder>(() => PdaPrefs(), fenix: true);
    // Get.lazyPut<AppHolder>(() => AppHolderImp(), fenix: true);

    Get.lazyPut<ApiService>(() => ApiService(Get.find<AuthInterceptor>()),fenix: true);
    Get.lazyPut<AuthInterceptor>(() => AuthInterceptor(Get.find<PdaHolder>()), fenix: true);

    Get.lazyPut<LoginUseCase>(() => LoginUseCase(Get.find()), fenix: true);
    Get.lazyPut<BringCourierUseCase>(() => BringCourierUseCase(Get.find()), fenix: true);

    //controller
    Get.lazyPut<LoginController>(() => LoginController(Get.find()), fenix: true);
    Get.lazyPut<MainController>(() => MainController(), fenix: true);
    Get.lazyPut<ConnectPostamatController>(() => ConnectPostamatController(), fenix: true);
    Get.lazyPut<TakePostController>(() => TakePostController(Get.find()), fenix: true);
    Get.lazyPut<YacheykagaJoylashController>(() => YacheykagaJoylashController(), fenix: true);
  }


}


