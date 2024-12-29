import 'package:delivery_pda/data/routes/route_helper.dart';
import 'package:delivery_pda/set_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'data/storage/auth/auth_holder.dart';
import 'data/tools/service/lang_service/lang_service.dart';


void main() async {
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    PdaHolder holder=Get.find<PdaHolder>();
    return ScreenUtilInit(
      designSize: Size(
          MediaQuery.sizeOf(context).width, MediaQuery.sizeOf(context).height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Barcode Scanner',
          translations: LangService(),
          locale: LangService.defaultLanguage(),
          fallbackLocale: LangService.fallbackLocale,
          theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: "Gabarito",
              colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: const Color(0xffFD521C),
                secondary: const Color(0xffFD521C),
              )
          ),
          initialRoute:   holder.token.isNotEmpty? RouteHelper.getMainPage():RouteHelper.getLoginPage(),
          // initialRoute:  RouteHelper.getMainPage(),
          getPages: RouteHelper.routes,
        );
      },
    );
  }
}
