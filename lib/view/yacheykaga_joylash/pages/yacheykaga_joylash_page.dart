import 'package:delivery_pda/common/color/comon_colors.dart';
import 'package:delivery_pda/view/widgets/common_text.dart';
import 'package:delivery_pda/view/widgets/custom_button.dart';
import 'package:delivery_pda/view/yacheykaga_joylash/controller/yacheykaga_joylash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class YacheykagaJoylashPage extends StatelessWidget {
  const YacheykagaJoylashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<YacheykagaJoylashController>(init: YacheykagaJoylashController(),
        builder: (controller){
      return Scaffold(
        backgroundColor: CommonColors.primaryBackground,
        appBar: AppBar(title: Text("yacheykaga qo'shish"),
        centerTitle: true,
        ),
        body: Container(
          width: double.maxFinite,

          margin: EdgeInsets.only(
            top: 50,
            left: 16,
            right: 16,
            bottom: 20
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(text: 'Track id:', size: 20,color: CommonColors.primaryBlackText, fontWeight: FontWeight.w600,),
                      CommonText(text: controller.trackId, size: 20,color: CommonColors.primaryBlackText, fontWeight: FontWeight.w600,),
                      Divider(
                        color: CommonColors.primaryBlackText,
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(text: 'yacheyka id:', size: 20,color: CommonColors.primaryBlackText, fontWeight: FontWeight.w600,),
                      CommonText(text: controller.yacheykaId, size: 20,color: CommonColors.primaryBlackText, fontWeight: FontWeight.w600,),
                      Divider(
                        color: CommonColors.primaryBlackText,
                      ),

                    ],
                  ),
                ],
              ),
              CustomButton(
                  color: controller.trackId.isEmpty || controller.yacheykaId.isEmpty? CommonColors.primaryColorLight:
                  CommonColors.primaryColor,
                  onTap: () async {
                await controller.add();
              }, text: "Qo'shish")
            ],
          ),
        ),
      );
        });
  }
}
