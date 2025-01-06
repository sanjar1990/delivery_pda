import 'package:delivery_pda/common/color/comon_colors.dart';
import 'package:delivery_pda/utils/scale_animation.dart';
import 'package:delivery_pda/view/login/controller/login_controller.dart';
import 'package:delivery_pda/view/login/widgets/login_text_field.dart';
import 'package:delivery_pda/view/widgets/common_text.dart';
import 'package:delivery_pda/view/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: LoginController(Get.find()),
        builder: (controller) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: customAppBar(title: ''),
            backgroundColor: CommonColors.primaryBackground,
            body: Container(
              margin: EdgeInsets.only(
                  left: 16.w, right: 16.w, top: 100.h, bottom: 100.h),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 24.h),
                        child: Text(
                          'Kirish',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      loginPhoneNumberTextField(controller, context),
                      SizedBox(height: 12.h),
                      loginPasswordTextField(controller, context),
                    ],
                  ),
                  WScaleAnimation(
                    onTap: () async {
                     controller.login();
                      if((controller.phoneController.text.isEmpty ||
                          controller.phoneController.text.length <
                              9) &&
                          controller.passwordController.text.isEmpty){
                      }else{
                        await controller.login();
                      }
                    },
                    child: Container(
                      // padding: padding,
                      width: double.maxFinite,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: (controller.phoneController.text.isEmpty ||
                                    controller.phoneController.text.length <
                                        9) &&
                                controller.passwordController.text.isEmpty
                            ? CommonColors.primaryGrey
                            : CommonColors.primaryColor,
                        borderRadius: BorderRadius.circular(31.r),
                      ),
                      child: Center(
                          child: controller.isLoading
                              ? const CircularProgressIndicator(
                                  color: CommonColors.whiteColor,
                                )
                              : const CommonText(
                                  text: 'Kirish',
                                  size: 14,
                                  color: CommonColors.whiteColor,
                                  fontWeight: FontWeight.w600,
                                )),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
