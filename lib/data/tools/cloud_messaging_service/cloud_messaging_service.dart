// import 'dart:developer' as devtools show log;
// import 'dart:math';
// import 'package:get/get.dart';
//
// extension Log on Object {
//   void log() => devtools.log(toString());
// }
//
// Future<void> _onBackgroundNotification(RemoteMessage message) async {
//   "Handing a background message : ${message.messageId} / ${message.notification?.body} / ${message.notification?.title} / ${message.notification?.titleLocKey}"
//       .log();
// }
//
// final _localNotificationService = FlutterLocalNotificationsPlugin();
//
// class LocalNotificationService {
//   LocalNotificationService._();
//
//   static final _instance = LocalNotificationService._();
//
//   factory LocalNotificationService() => _instance;
//
//   Future<void> initialize() async {
//     await FirebaseMessaging.instance.getInitialMessage();
//     await requestPermission();
//     await getToken();
//     await initInfo();
//   }
//
//
//   Future<void> getToken() async {
//     String fcmToken = '';
//
//     await FirebaseMessaging.instance.getToken().then(
//           (value) => fcmToken = value ?? '',
//       onError: (e, stack) async => await _instance.initialize(),
//     );
//
//     if (fcmToken.isNotEmpty) {
//       Get.find<AuthHolder>().fcmToken = fcmToken;
//     }
//
//     Get.log("FCM Token: $fcmToken");
//   }
//
//   Future<void> initInfo() async {
//     const androidInitializationSettings = AndroidInitializationSettings(
//       '@drawable/notification_ic',
//     );
//
//     final iosInitializationSettings = DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//       //onDidReceiveLocalNotification: (int id, String? title, String? body, String? payload) =>  Get.log('FCM initInfo iOS : ID - $id'),
//     );
//
//     final settings = InitializationSettings(
//       android: androidInitializationSettings,
//       iOS: iosInitializationSettings,
//     );
//
//     await _localNotificationService.initialize(
//       settings,
//       onDidReceiveNotificationResponse: (NotificationResponse detail) {
//         Get.log("OnClicked Notification Payload : ${detail.payload.toString()}");
//
//         final payload = detail.payload;
//
//         try {
//           if (payload != null && payload.isNotEmpty) {
//           } else {}
//         } catch (e) {
//           Get.log("FCM Error (router) : $e");
//         }
//         return;
//       },
//     );
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       "----------------- onMessage ------------------------".log();
//       "onMessage : ${message.notification?.title} / ${message.notification?.body} / ${message.data["product_id"].toString()}".log();
//
//       if (message.notification != null) {
//         final bigTextStyleInfo = BigTextStyleInformation(
//           message.notification!.body.toString(),
//           htmlFormatBigText: true,
//           contentTitle: message.notification!.title.toString(),
//           htmlFormatContentTitle: true,
//         );
//
//         final androidPlatformSpecifics = AndroidNotificationDetails(
//           "youGo_notification_id",
//           "youGo_notification_name",
//           importance: Importance.high,
//           styleInformation: bigTextStyleInfo,
//           priority: Priority.high,
//           playSound: true,
//           // sound: const RawResourceAndroidNotificationSound('notification_sound'), // you are need to add android->app->src->main->res-> "raw" new folder
//         );
//
//         final platformChannelSpecifics = NotificationDetails(
//           android: androidPlatformSpecifics,
//           iOS: const DarwinNotificationDetails(),
//         );
//
//         int id = Random().nextInt((pow(2, 31) - 1).toInt());
//         await _localNotificationService.show(
//           id,
//           message.notification!.title,
//           message.notification!.body,
//           platformChannelSpecifics,
//           payload: message.data['product_id'].toString(),
//         );
//       }
//     });
//
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
//       "----------------- onMessageOpenedApp ------------------------".log();
//       "onMessageOpenedApp : ${message.notification?.title} / ${message.notification?.body} / ${message.data["product_id"].toString()}"
//           .log();
//
//       if (message.notification != null) {
//         final bigTextStyleInfo = BigTextStyleInformation(
//           message.notification!.body.toString(),
//           htmlFormatBigText: true,
//           contentTitle: message.notification!.title.toString(),
//           htmlFormatContentTitle: true,
//         );
//
//         final androidPlatformSpecifics = AndroidNotificationDetails(
//           "youGo_notification_id",
//           "youGo_notification_name",
//           importance: Importance.high,
//           styleInformation: bigTextStyleInfo,
//           priority: Priority.high,
//           playSound: true,
//           // sound: const RawResourceAndroidNotificationSound('notification_sound'), // you are need to add android->app->src->main->res-> "raw" new folder
//         );
//
//         final platformChannelSpecifics = NotificationDetails(
//           android: androidPlatformSpecifics,
//           iOS: const DarwinNotificationDetails(),
//         );
//
//         int id = Random().nextInt((pow(2, 31) - 1).toInt());
//         await _localNotificationService.show(
//           id,
//           message.notification!.title,
//           message.notification!.body,
//           platformChannelSpecifics,
//           payload: message.data['product_id'].toString(),
//         );
//       }
//     });
//
//     FirebaseMessaging.onBackgroundMessage(_onBackgroundNotification);
//   }
//
//   Future<void> requestPermission() async {
//     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//
//     final settings = await FirebaseMessaging.instance.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//
//     switch (settings.authorizationStatus) {
//       case AuthorizationStatus.authorized:
//         Get.log('FCM Permission : User grated permission');
//         break;
//       case AuthorizationStatus.provisional:
//         Get.log('FCM Permission : User granted provisional permission');
//         break;
//       case AuthorizationStatus.notDetermined:
//       case AuthorizationStatus.denied:
//         Get.log('FCM Permission : User declined or has not accepted permission');
//         break;
//     }
//   }
//
// //   void sendNotification({required String token, required String title, required String body}) async {
// //     final client = HttpClient();
// //
// //     try {
// //       final request = await client.postUrl(Uri.parse('https://fcm.googleapis.com/fcm/send'));
// //
// //       request.headers.add('Content-Type', 'application/json; charset=UTF-8');
// //       request.headers.add(
// //         'Authorization',
// //         'key=', // you need to add Firebase Cloud-Messaging server key
// //       );
// //
// //       request.write(jsonEncode(
// //         <String, dynamic>{
// //           "priority": "high",
// //           "data": <String, dynamic>{
// //             "click_action": "FLUTTER_NOTIFICATION_CLICK",
// //             "status": "done",
// //             "body": body,
// //             "title": title,
// //             "product_id": "Test 88888",
// //           },
// //           "notification": <String, dynamic>{
// //             "body": body,
// //             "title": title,
// //             "android_channel_id": "perfetto_notification_id",
// //           },
// //           "to": token,
// //         },
// //       ));
// //
// //       final response = await request.close();
// //       final stringData = await response.transform(utf8.decoder).join();
// //
// //       if (response.statusCode == 201 || response.statusCode == 200) {
// //         stringData.log();
// //       }
// //     } catch (e) {
// //       l.e('FCM Error (Send Notification) : $e');
// //     } finally {
// //       client.close();
// //     }
// //   }
// }
