import 'package:audioplayers/audioplayers.dart';
import 'package:delivery_pda/controller/base/base_controller.dart';
import 'package:delivery_pda/data/storage/auth/auth_holder.dart';
import 'package:delivery_pda/data/tools/service/connectivity_service/connection.dart';
import 'package:delivery_pda/data/tools/strings/string.dart';
import 'package:delivery_pda/domain/entities/bring_courier/bring_courier_request.dart';
import 'package:delivery_pda/domain/use_case/bring_courier_use_case/bring_courier_use_case.dart';
import 'package:delivery_pda/utils/logger.dart';
import 'package:delivery_pda/view/widgets/common_sound.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class TakePostController extends BaseController{
  bool isLoading=false;
  final BringCourierUseCase bringCourierUseCase;
  TakePostController(this.bringCourierUseCase);
  late final AudioPlayer audioPlayer;
  List<String> trackNumberList=[];
@override
  void onInit() {
    super.onInit();
    SystemChannels.keyEvent.setMessageHandler((message) async {
      return null;
    });
    audioPlayer = AudioPlayer();
    startListeningForScans();
  }
  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
  Future<void> startListeningForScans() async {
    const platform = MethodChannel('com.example.pda_scan_final/scanner');
    platform.setMethodCallHandler((call) async {
      String scannedBarcode = '';
      if (call.method == 'onBarcodeScanned') {
        // Qo'shimcha tekshirish
        Log.i(call.arguments ?? '');
        scannedBarcode = call.arguments ?? '';

        if (scannedBarcode.isNotEmpty) {
          await addTrackId(scannedBarcode);
          soundSuccess(audioPlayer);
          scannedBarcode = '';
        }

      }
    });
  }
  Future<void>addTrackId(String trackId)async{
  if(trackNumberList.contains(trackId)){
    Get.snackbar(Strings.appName.tr, "bu tovar scanner qilingan");

  }else{
    trackNumberList.add(trackId);
  }

  update();
  }

  Future<void> bringCourier() async {

    //#check internet connectivity
    if (await CheckNet().checkInternet() == false) {
      Get.snackbar(Strings.appName.tr, Strings.noInternet.tr);
      return;
    }

    BringCourierRequest request = BringCourierRequest(trackNumberList.map((trackNumber) => {"trackNumber": trackNumber}).toList(),
        Get.find<PdaHolder>().userID);
    try {
      isLoading = true;
      update();
      await for (final event in bringCourierUseCase.invoke(request)) {
        event.when(
          loading: () {
            isLoading = true;
            update();
          },
          content: (content) {
            final value = content.toJson();
            if (value['ret'] != 0) {
              Get.snackbar(Strings.appName.tr, value['msg'].toString());
            } else if (value['ret'] == 0) {
              if (content.data != null) {
                Get.snackbar(Strings.appName.tr, 'Muvaffaqiyatli saqlandi');
                trackNumberList.clear();
              } else {
                Get.snackbar(Strings.appName.tr, value['msg'].toString());
              }
            } else {
              Get.snackbar(Strings.appName.tr, Strings.unKnownError);
            }
            update();
          },
          error: (error) {
            Get.snackbar(Strings.appName.tr, '$error');
          },
        );
      }
    } finally {
      isLoading = false;
      update();
    }

  }
}