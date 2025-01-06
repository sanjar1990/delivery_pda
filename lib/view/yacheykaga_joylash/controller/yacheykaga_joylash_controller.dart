import 'package:audioplayers/audioplayers.dart';
import 'package:delivery_pda/controller/base/base_controller.dart';
import 'package:delivery_pda/data/tools/strings/string.dart';
import 'package:delivery_pda/utils/logger.dart';
import 'package:delivery_pda/view/connect_postamat/controller/connect_postamat_controller.dart';
import 'package:delivery_pda/view/widgets/common_sound.dart';
import 'package:delivery_pda/view/yacheykaga_joylash/models/postToYacheykaModel.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class YacheykagaJoylashController extends BaseController{
  late final AudioPlayer audioPlayer;

  String trackId = '';
  String yacheykaId = '';

@override
  void onInit() {
  super.onInit();
  audioPlayer = AudioPlayer();
  SystemChannels.keyEvent.setMessageHandler((message) async {
    return null;
  });
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
          await setBarcode(scannedBarcode);
          soundSuccess(audioPlayer);
          scannedBarcode = '';
        }

    }
  });
}
Future<void>add()async{
  if(yacheykaId.isNotEmpty && trackId .isNotEmpty){
 await  Get.find<ConnectPostamatController>().addToList( PostToYacheykaModel(trackId: trackId, yacheyka: yacheykaId));
   // Get.snackbar(Strings.appName.tr, "Tovar qo'shildi ");
trackId='';
yacheykaId='';
Get.back();
  }else{
    if(yacheykaId.isEmpty){
      Get.snackbar(Strings.appName.tr, "yacheykani scanner qiling ");
    }else if(trackId.isEmpty){
      Get.snackbar(Strings.appName.tr, "yacheykani scanner qiling ");
    }else{
      Get.snackbar(Strings.appName.tr, "yacheyka va tovarni scanner qiling ");
    }
  }
}
Future<void>setBarcode(String barcode)async{
  if(barcode.startsWith('postamat')){
   bool isExits= Get.find<ConnectPostamatController>().postToYacheykaList.any((e)=>e.yacheyka==barcode);
   if(isExits){
     print('EXISTS');
        Get.snackbar(Strings.appName.tr, "bu yacheykaga tovar qo'shilgan!");
       return;
   }else{
     print('not EXISTS');

     yacheykaId=barcode;
   }
  }else{
    bool isExits= Get.find<ConnectPostamatController>().postToYacheykaList.any((e)=>e.trackId==barcode);
    if(isExits){
      Get.snackbar(Strings.appName.tr, "bu  tovar yacheykaga qo'shilgan!");
      return;
    }else{
      trackId=barcode;
    }
  }
  update();
}

}