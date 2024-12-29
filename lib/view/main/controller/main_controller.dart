import 'package:delivery_pda/controller/base/base_controller.dart';
import 'package:delivery_pda/data/storage/auth/auth_holder.dart';
import 'package:delivery_pda/view/main/models/yacheyka_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


const platform = MethodChannel('com.example.pda_scan_final/scanner');

class MainController extends BaseController{


  Future<void>logout()async{
    Get.find<PdaHolder>().clearPda();
    Get.offAllNamed('/login_page');
  }
}