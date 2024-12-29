import 'package:permission_handler/permission_handler.dart';

class CheckPermission {
    Future<bool> isStoragePermission() async {
    var isStorage = await Permission.storage.status;
    var isAccessLc = await Permission.accessMediaLocation.status;
    var isMnagExt = await Permission.manageExternalStorage.status;

    if (!isStorage.isGranted) {
      isStorage = await Permission.storage.request();
    }
    if (!isMnagExt.isGranted) {
      isMnagExt = await Permission.manageExternalStorage.request();
    }
    if (!isAccessLc.isGranted ) {
      isAccessLc = await Permission.accessMediaLocation.request();
    }

    if (!isStorage.isGranted || !isMnagExt.isGranted || !isAccessLc.isGranted) {
      return false;
    } else {
      return true;
    }
  }
}