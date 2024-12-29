import 'package:delivery_pda/view/connect_postamat/pages/connect_postamat_page.dart';
import 'package:delivery_pda/view/login/login_page.dart';
import 'package:delivery_pda/view/main/pages/main_page.dart';
import 'package:get/get.dart';



class RouteHelper {
  static const String initial = '/';
  static const String mainPage = '/main_page';
  static const String loginPage = '/login_page';
  static const String connectPostamat = '/connect_postamat';



  static String getInitial() => initial;
  static String getMainPage() => mainPage;
  static String getLoginPage() => loginPage;
  static String getConnectPostamat() => connectPostamat;





  static List<GetPage> routes = [

    GetPage(
        name: mainPage,
        page: () => const MainPage(),
        transition: Transition.fadeIn),

    GetPage(
        name: loginPage,
        page: () => const LoginPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: connectPostamat,
        page: () => const ConnectPostamatPage(),
        transition: Transition.fadeIn),



  ];
}
