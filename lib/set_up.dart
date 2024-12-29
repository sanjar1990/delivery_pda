import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';
import 'data/storage/app/locals/lang_prefs/language_prefs.dart';
import 'data/storage/auth/auth_prefs.dart';
import 'injection.dart';

final branchStore = GetStorage();

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
   // await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  await DIService.init();
  await Hive.initFlutter();
  await Hive.openBox(PdaPrefs.pdaBoxID);
  await Hive.openBox(LangPrefs.langBox);

 // await LocalNotificationService().initialize();
}