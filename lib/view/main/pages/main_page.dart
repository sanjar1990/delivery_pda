import 'package:delivery_pda/common/color/comon_colors.dart';
import 'package:delivery_pda/data/storage/auth/auth_holder.dart';
import 'package:delivery_pda/utils/scale_animation.dart';
import 'package:delivery_pda/view/main/controller/main_controller.dart';
import 'package:delivery_pda/view/widgets/common_text.dart';
import 'package:delivery_pda/view/widgets/log_out_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  // void logoutDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         backgroundColor: CommonColors.whiteColor,
  //         title: const CommonText(text: "Chiqish", size: 20),
  //         content: const Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Text('Haqiqatan ham Boshqa filial tanlamoqchimisiz?'),
  //             SizedBox(height: 10),
  //           ],
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop(); // Dialogni yopish
  //             },
  //             child: const Text('Bekor qilish'),
  //           ),
  //           GestureDetector(
  //             onTap: () {
  //               Get.find<PdaHolder>().branchID = 0;
  //               Get.find<PdaHolder>().branchName = '';
  //               Get.offAndToNamed('/home_page');
  //             },
  //             child: Container(
  //                 decoration: BoxDecoration(
  //                     color: CommonColors.primaryColor,
  //                     borderRadius: BorderRadius.circular(8)),
  //                 child: const Padding(
  //                   padding: EdgeInsets.all(5),
  //                   child: Text('Tasdiqlash',
  //                       style: TextStyle(color: Colors.white)),
  //                 )),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        init: MainController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: CommonColors.primaryBackground,
            appBar: AppBar(
              backgroundColor: CommonColors.primaryBackground,
              actions: [
                IconButton(
                  onPressed: () {
                    customLogoutDialog(
                        context: context,
                        title: "Haqiqatan ham hisobingizdan chiqmoqchimisiz?",
                        onTap: () async {
                          await controller.logout();
                        });
                  },
                  icon: const Icon(Icons.logout),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CommonText(
                              text: 'Phone:',
                              color: CommonColors.primaryBlackText,
                              size: 20,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CommonText(
                              text: '+998 ${Get.find<PdaHolder>().phone}',
                              color: CommonColors.primaryBlackText,
                              size: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CommonText(
                              text: 'ID:',
                              color: CommonColors.primaryBlackText,
                              size: 20,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CommonText(
                              text: Get.find<PdaHolder>().profileID.toString(),
                              color: CommonColors.primaryBlackText,
                              size: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed('/connect_postamat'),
                    child: Container(
                      width: double.maxFinite,
                      height: 200,
                      margin:
                          const EdgeInsets.only(top: 200, left: 20, right: 20),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color:CommonColors.whiteColor,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: CommonColors.primaryGrey
                        )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                              'assets/icons/yacheyka_add_icon.svg'),
                          SizedBox(
                            height: 10,
                          ),
                          CommonText(
                              text: 'Postamatga Bog\'lanish', size: 18)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
