import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class CheckNet {
  Future<bool> checkInternet() async {
    List<ConnectivityResult> connectivityResult =
    await (Connectivity().checkConnectivity());

    connectivityResult.map((e){
      if (e == ConnectivityResult.none) {
        return false;
      }
    });

    return true;
  }
}