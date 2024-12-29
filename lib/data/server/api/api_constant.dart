
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
  static const String GETBRANCHLIST = "pda/branch";
  static const String GET_ORDER_LOCATION_LIST = "pda/location";
  static const String SAVE_ORDER = "pda/item";
  static const String POST_LOCATION = "pda/location";
  static const String POST_UNKNOWN_ORDER = "pda/item/create";
  static const String searchOrdersByUserId= "pda/item/show/";
  static const String searchOrdersByTrackID= "pda/item/show/items/";
  static const String deleteOrderUser= "pda/item/user/";
  static const String deleteOrders= "pda/item";
  static const String searchArchiveOrdersByUserId= "pda/item/show/delivered/";
  static const String getYacheykaByBranchId= "pda/location/";
  static const String getOrdersByYacheykaId= "pda/location/show/all/";


}