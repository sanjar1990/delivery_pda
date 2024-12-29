import 'package:delivery_pda/controller/base/base_controller.dart';
import 'package:delivery_pda/data/storage/auth/auth_holder.dart';
import 'package:delivery_pda/data/tools/service/connectivity_service/connection.dart';
import 'package:delivery_pda/data/tools/strings/string.dart';
import 'package:delivery_pda/domain/entities/login/login_request.dart';
import 'package:delivery_pda/domain/use_case/login/login_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


 class LoginController extends BaseController {

   bool isLoading = false;
   TextEditingController phoneController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
   LoginUseCase loginUseCase;
   LoginController(this.loginUseCase);
   bool isObscured=true;

   Future<void>setObscure()async{
     isObscured=!isObscured;
     update();
   }
   @override
   dispose() {
     super.dispose();
     phoneController.dispose();
     passwordController.dispose();
   }

   Future<void> testLogin() async {
     print('TEST');
    String password = passwordController.text.trim();
     String phone = phoneController.text.trim();
     //#check internet connectivity
     if (await CheckNet().checkInternet() == false) {
       Get.snackbar(Strings.appName.tr, Strings.noInternet.tr);
       return;
     }
     //#check field completeness
     if(phone.length != 9 || phone.isEmpty){
       Get.snackbar(Strings.appName.tr, "Telefon raqamda xatolik");

       return;
     }
     if(password.isEmpty){
       Get.snackbar(Strings.appName.tr, "Parolda raqamda xatolik");
       update();
       return;
     }
      Get.find<PdaHolder>().phone=phoneController.text;
      Get.find<PdaHolder>().token=phoneController.text;
      Get.find<PdaHolder>().profileID=99999999999999;
     Get.offAllNamed('/main_page');
   }
   Future<void> login() async {
     print('TEST');
    String password = passwordController.text.trim();
     String phone = phoneController.text.trim();
     //#check internet connectivity
     if (await CheckNet().checkInternet() == false) {
       Get.snackbar(Strings.appName.tr, Strings.noInternet.tr);
       return;
     }
     //#check field completeness
     if(phone.length != 9 || phone.isEmpty){
       Get.snackbar(Strings.appName.tr, "Telefon raqamda xatolik");

       return;
     }
     if(password.isEmpty){
       Get.snackbar(Strings.appName.tr, "Parolda raqamda xatolik");
       update();
       return;
     }
     LoginRequest request = LoginRequest(phone,password);
     try {
       isLoading = true;
       update();
       await for (final event in loginUseCase.invoke(request)) {
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
                 // Get.find<PdaHolder>().phone=phoneController.text;
                 // Get.find<PdaHolder>().token = content.data?.token ?? "";
                 Get.offAllNamed('/main_page');
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
