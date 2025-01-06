import 'package:hive_flutter/hive_flutter.dart';
import 'auth_holder.dart';

class PdaPrefs extends PdaHolder {
  late Box pdaBox;

  PdaPrefs() {
   pdaBox = Hive.box(pdaBoxID);
  }



  @override
  int get userID => pdaBox.get(userId, defaultValue: 1);

  @override
  set userID(int userID) => pdaBox.put(userId, userID);

  @override
  String get token => pdaBox.get(tokenId, defaultValue: '');

  @override
  set token(String token) => pdaBox.put(tokenId, token);

  @override
  String get phone => pdaBox.get(phoneId, defaultValue: '');

  @override
  set phone(String name) => pdaBox.put(phoneId, name);
  // @override
  // String get firstName => authBox.get(firstNameId, defaultValue: '');
  //
  // @override
  // set firstName(String name) => authBox.put(firstNameId, name);
  //
  // @override
  // String get lastName => authBox.get(lastNameId, defaultValue: '');
  //
  // @override
  // set lastName(String name) => authBox.put(lastNameId, name);
  //

  //
  // @override
  // String get role => authBox.get(roleId, defaultValue: '');
  //
  // @override
  // set role(String role) => authBox.put(roleId, role);
  //
  // @override
  // String get fcmToken => authBox.get(fcmTokenId, defaultValue: '');
  //
  // @override
  // set fcmToken(String fcmToken) => authBox.put(fcmTokenId, fcmToken);

  @override
  Future<void> clearPda() async => await pdaBox.clear();

  static const tokenId = 'token';
  static const pdaBoxID = 'pda_hive_box';
  static const userId = 'userID';
  static const firstNameId = 'firstName';
  static const lastNameId = 'lastName';
  static const phoneId = 'phone';
  static const fcmTokenId = 'fcmToken';
}
