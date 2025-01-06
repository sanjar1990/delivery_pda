
import 'package:delivery_pda/data/storage/auth/auth_holder.dart';
import 'package:get/get.dart';

class ApiConst{
  static const CONNECTION_TIME = 20000;
  static const SEND_TIME_OUT = 20000;
  static const String Base_URl = 'https://api.abusahiy.uz/api/admin/';

  static  Map<String,String> HEADERS = {
    'Content-type' : 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${Get.find<PdaHolder>().token}',
  };

  static Map<String, String> QUERY = {
    "page" : "0",
    "size" : "50",
  };

  static const String LOGIN = "locker/service/user/login";
  static const String bringCourier = "locker/cell/order";
  static const String placingOrder = "locker/cell/order/delivered-to-locker";


}