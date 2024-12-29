import 'package:audioplayers/audioplayers.dart';
import 'package:delivery_pda/controller/base/base_controller.dart';
import 'package:delivery_pda/data/tools/service/connectivity_service/connection.dart';
import 'package:delivery_pda/data/tools/strings/string.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vibration/vibration.dart';

class ConnectPostamatController extends BaseController {

  String qrCode='';
  bool isLoading = false;
  bool isCashPaid = false;
  bool isConnected = false;
  late final AudioPlayer _audioPlayer;

  @override
  void onInit() {
    super.onInit();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
  Future<void> soundError() async {
    // Ovoz ijrosi
    await _audioPlayer.play(AssetSource('audio/error.mp3'));

    // Vibratsiya
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: 500); // 500 ms davomida vibratsiya
    }
  }
  Future<void> soundSuccess() async {
    // Ovoz ijrosi
    await _audioPlayer.play(AssetSource('audio/success.mp3'));
  }
  Future<void> refreshResults() async {
    // Yangilash uchun qidiruv funksiyasini qayta chaqiramiz
    await searchByUserId();
  }
  Future<void> connectToPostamat(String qrCode)async{
    Future.delayed(Duration(seconds: 1),(){
      this.qrCode=qrCode;
      isConnected=true;
      update();
    });
  }


  Future<void>finishConnection()async{
    qrCode='';
    isConnected=false;
    Get.back();
  }
  Future<void> searchByUserId() async {

    // //#check internet connectivity
    // if (await CheckNet().checkInternet() == false) {
    //   Get.snackbar(Strings.appName.tr, Strings.noInternet.tr);
    //   return;
    // }
    // //#check field completeness
    // searchModelUseCase.invokeSearchByUserId(int.parse(searchController.text)).listen((event) {
    //   event.when(
    //       loading: () {
    //         isLoading = true;
    //         update();
    //       },
    //       content: (content) {
    //         final value = content.toJson();
    //         if (value['ret'] == 1) {
    //           Get.snackbar(Strings.appName.tr, value['msg'].toString());
    //         }
    //         else if(value['msg'] == 'SUCCESS') {
    //           result=content.data;
    //         } else {
    //           Get.snackbar(Strings.appName.tr, 'Hech narsa topilmadi');
    //           return ;
    //         }
    //         update();
    //       },
    //       error: (error) => Get.snackbar(Strings.appName.tr, '$error'));
    // })
    //   ..onDone(() {
    //     isLoading = false;
    //     update();
    //   })
    //   ..addTo(subscribe);
  }
  Future<void> searchByTrackId() async {

    //#check internet connectivity
    if (await CheckNet().checkInternet() == false) {
      Get.snackbar(Strings.appName.tr, Strings.noInternet.tr);
      return;
    }
    //#check field completeness

    // searchModelUseCase.invokeSearchByTrackId(searchController.text).listen((event) {
    //   event.when(
    //       loading: () {
    //         isLoading = true;
    //         update();
    //       },
    //       content: (content) {
    //         final value = content.toJson();
    //         if (value['ret'] == 1) {
    //           Get.snackbar(Strings.appName.tr, value['msg'].toString());
    //         }
    //         else if(value['msg'] == 'SUCCESS') {
    //           result=content.data;
    //         } else {
    //           Get.snackbar(Strings.appName.tr, 'Hech narsa topilmadi');
    //           return ;
    //         }
    //         update();
    //       },
    //       error: (error) => Get.snackbar(Strings.appName.tr, '$error'));
    // })
    //   ..onDone(() {
    //     isLoading = false;
    //     update();
    //   })
    //   ..addTo(subscribe);
  }
}
