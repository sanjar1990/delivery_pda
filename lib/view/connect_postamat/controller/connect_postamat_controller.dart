import 'package:audioplayers/audioplayers.dart';
import 'package:delivery_pda/controller/base/base_controller.dart';
import 'package:delivery_pda/data/storage/auth/auth_holder.dart';
import 'package:delivery_pda/data/tools/service/connectivity_service/connection.dart';
import 'package:delivery_pda/data/tools/strings/string.dart';
import 'package:delivery_pda/domain/entities/bring_courier/bring_courier_request.dart';
import 'package:delivery_pda/domain/entities/place_order/place_order_request.dart';
import 'package:delivery_pda/domain/use_case/place_order_use_case/place_order_use_case.dart';
import 'package:delivery_pda/view/widgets/common_sound.dart';
import 'package:delivery_pda/view/yacheykaga_joylash/models/postToYacheykaModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:vibration/vibration.dart';

import '../../../utils/logger.dart';

class ConnectPostamatController extends BaseController {
final PlaceOrderUseCase placeOrderUseCase;
ConnectPostamatController(this.placeOrderUseCase);
  String qrCode='';
  bool isLoading = false;
  bool isConnected = false;
  bool isOpenPostamat=false;
  String trackId = '';
  String yacheykaId = '';
  bool isLockerCell = false;
  late final AudioPlayer audioPlayer;
  List<PostToYacheykaModel> postToYacheykaList=[];
  List<String> trackIdList=[];
  final ValueNotifier<String> lockerCellId = ValueNotifier<String>("");
  Future<void>addToList(PostToYacheykaModel model)async{
    postToYacheykaList.add(model);
    update();
  }
  @override
  void onInit() {
    super.onInit();
    audioPlayer = AudioPlayer();
    SystemChannels.keyEvent.setMessageHandler((message) async {
      return null;
    });

    startListeningForScans();
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
            soundSuccess(audioPlayer);
            if(isConnected){
              if(isLockerCell){
                lockerCellId.value=scannedBarcode;
              }else{
                if(trackIdList.contains(scannedBarcode)){
                  Get.snackbar(Strings.appName.tr, 'Bu tovarni scanner qilgansiz');

                }else{
                  trackIdList.add(scannedBarcode);
                }

              }

              // await setBarcode(scannedBarcode);
              soundSuccess(audioPlayer);
              update();
              scannedBarcode = '';


            }else{
              await connectToPostamat(scannedBarcode);
              scannedBarcode = '';
            }

          }

      }
    });
  }
Future<void> placeOrder() async {

  //#check internet connectivity
  if (await CheckNet().checkInternet() == false) {
    Get.snackbar(Strings.appName.tr, Strings.noInternet.tr);
    return;
  }

  PlaceOrderRequest request = PlaceOrderRequest(trackIdList.map((trackNumber) => {"trackNumber": trackNumber}).toList(),
      Get.find<PdaHolder>().userID, int.parse(lockerCellId.value));
  try {
    isLoading = true;
    update();
    await for (final event in placeOrderUseCase.invoke(request)) {
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
              trackIdList.clear();

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
  // Future<void>setBarcode(String barcode)async{
  //   if(barcode.startsWith('postamat')){
  //     if(trackId.isEmpty){
  //       Get.snackbar(Strings.appName.tr, "Avval tovarni scanner qiling");
  //       return;
  //     }
  //     bool isExits= postToYacheykaList.any((e)=>e.yacheyka==barcode);
  //     if(isExits){
  //       Get.snackbar(Strings.appName.tr, "bu yacheykaga tovar qo'shilgan!");
  //       return;
  //     }else{
  //       yacheykaId=barcode;
  //       await updateList(yacheykaId);
  //       trackId='';
  //       yacheykaId='';
  //       update();
  //     }
  //   }else{
  //     bool isExits= postToYacheykaList.any((e)=>e.trackId==barcode);
  //
  //     if(isExits){
  //       Get.snackbar(Strings.appName.tr, "bu  tovar yacheykaga qo'shilgan!");
  //       return;
  //     }else{
  //       trackId=barcode;
  //       addToList(PostToYacheykaModel(trackId: barcode, yacheyka: ''));
  //
  //
  //     }
  //   }
  //   update();
  // }
  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
  Future<void>placePostToPostamat()async{
    isLoading=true;
    update();
    Future.delayed(Duration(seconds: 1),(){
      isOpenPostamat=true;
      update();
    });
    isLoading=false;
    update();
  }
  Future<void>disconnectPostamat()async{
    isConnected=false;
    qrCode='';
  }
  Future<void>delete(int index)async{
    postToYacheykaList.removeAt(index);
    update();
  }
  // Future<void> soundError() async {
  //   // Ovoz ijrosi
  //   await _audioPlayer.play(AssetSource('audio/error.mp3'));
  //
  //   // Vibratsiya
  //   if (await Vibration.hasVibrator() ?? false) {
  //     Vibration.vibrate(duration: 500); // 500 ms davomida vibratsiya
  //   }
  // }

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
