import 'package:delivery_pda/common/color/comon_colors.dart';
import 'package:delivery_pda/utils/logger.dart';
import 'package:delivery_pda/utils/utils.dart';
import 'package:delivery_pda/view/connect_postamat/controller/connect_postamat_controller.dart';
import 'package:delivery_pda/view/widgets/common_sound.dart';
import 'package:delivery_pda/view/widgets/common_text.dart';
import 'package:delivery_pda/view/widgets/custom_button.dart';
import 'package:delivery_pda/view/yacheykaga_joylash/pages/yacheykaga_joylash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ConnectPostamatPage extends StatelessWidget {
  const ConnectPostamatPage({super.key});


  // Future<void>showDeleteDialog(BuildContext context, int index)async{
  //   print('INN');
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return   AlertDialog(
  //           title: const Text('O\'chirish'),
  //           content: const Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Text('Haqiqatan ham o\'chirmoqchimisiz?'),
  //               SizedBox(height: 10),
  //             ],
  //           ),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop(); // Dialogni yopish
  //               },
  //               child: const Text('Bekor qilish'),
  //             ),
  //             GestureDetector(
  //               onTap: () {
  //                 controller.delete(index);
  //                 Navigator.of(context).pop();
  //               },
  //               child: const Text('Tasdiqlash', style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.w600)),
  //
  //             ),
  //           ],
  //         );
  //       }
  //
  //     );
  //
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConnectPostamatController>(
        init: ConnectPostamatController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: CommonColors.primaryBackground,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: controller.isConnected
                  ? CommonColors.green
                  : CommonColors.red,
              flexibleSpace: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 12,
                    left: 20,
                  ),
                  width: double.maxFinite,
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 16.h),
                          width: 36.w,
                          height: 36.h,
                          child: SvgPicture.asset(
                              'assets/icons/app_back_icon.svg'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              foregroundColor: Colors.white,
              title: controller.isConnected
                  ? const CommonText(
                      text: 'Connected ',
                      color: CommonColors.primaryBlackText,
                      size: 17,
                      fontWeight: FontWeight.w500,
                    )
                  : const CommonText(
                      text: 'Not Connected ',
                      color: CommonColors.primaryBlackText,
                      size: 17,
                      fontWeight: FontWeight.w500,
                    ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: controller.isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: CommonColors.primaryColor,
                          ),
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              controller.qrCode.isEmpty
                                  ? CommonText(
                                      text: 'Qr Codeni scanner qiling',
                                      color: Colors.black,
                                      size: 18.sp,
                                      fontWeight: FontWeight.w700,
                                    )
                                  : Container(
                                      height:
                                          MediaQuery.of(context).size.height -
                                              100.h,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          if (controller.isOpenPostamat)
                                            SizedBox(
                                              width: double.maxFinite,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          height: 40,
                                                          decoration: BoxDecoration(
                                                              color: CommonColors
                                                                  .primaryColor,
                                                              border: Border.all(
                                                                  color: CommonColors
                                                                      .primaryGrey)),
                                                          child: CommonText(
                                                            text: 'Track id',
                                                            size: 20,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: CommonColors
                                                                .whiteColor,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          height: 40,
                                                          decoration: BoxDecoration(
                                                              color: CommonColors
                                                                  .primaryColor,
                                                              border: Border.all(
                                                                  color: CommonColors
                                                                      .primaryGrey)),
                                                          child: CommonText(
                                                            text: 'Postamat id',
                                                            size: 20,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: CommonColors
                                                                .whiteColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: 380,
                                                    child: ListView.builder(
                                                        itemCount: controller
                                                            .postToYacheykaList
                                                            .length,
                                                        itemBuilder: (_, index) {
                                                          final model = controller
                                                                  .postToYacheykaList[
                                                              index];
                                                          return Row(
                                                            children: [
                                                              Expanded(
                                                                child: Container(
                                                                  height: 50,
                                                                  padding:EdgeInsets.only(
                                                                      left: 6
                                                                  ),
                                                                  decoration: BoxDecoration(
                                                                      color: CommonColors
                                                                          .whiteColor,
                                                                      border: Border.all(
                                                                          color: CommonColors
                                                                              .primaryGrey)),
                                                                  child: CommonText(
                                                                    text: model
                                                                        .trackId,
                                                                    size: 16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: CommonColors
                                                                        .primaryBlackText,
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Container(
                                                                  height: 50,
                                                                  padding:EdgeInsets.only(
                                                                    left: 6
                                                                  ),
                                                                  decoration: BoxDecoration(

                                                                      border: Border.all(
                                                                          color: CommonColors
                                                                              .primaryGrey)),
                                                                  child: Row(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      CommonText(
                                                                        text:
                                                                            model.yacheyka,
                                                                        size: 16,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                        color: CommonColors
                                                                            .primaryBlackText,
                                                                      ),
                                                                      // IconButton(
                                                                      //     onPressed: (){
                                                                      //       showDeleteDialog(index);
                                                                      // }, icon: Icon(Icons.delete))
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),

                                                            ],
                                                          );
                                                        }),
                                                  )
                                                ],
                                              ),
                                            ),
                                          Spacer(),
                                          Column(
                                            children: [
                                              controller.isOpenPostamat
                                                  ?  CustomButton(
                                          onTap: () async {
            await controller
                .disconnectPostamat();
            Get.back();
            },
              text: 'Yakunlash',
              color: CommonColors
                  .primaryColorLight,
            )
                                                  : CustomButton(
                                                      onTap: () {
                                                        controller
                                                            .placePostToPostamat();
                                                      },
                                                      text: 'OCHISH',
                                                    ),
                                              SizedBox(
                                                height: 20.h,
                                              ),

                                            ],
                                          )
                                        ],
                                      ),
                                    )
                            ],
                          ),
                        )),
            ),
          );
        });
  }
}
