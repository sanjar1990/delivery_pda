import 'package:delivery_pda/common/color/comon_colors.dart';
import 'package:delivery_pda/view/take_post/controller/take_post_controller.dart';
import 'package:delivery_pda/view/widgets/common_text.dart';
import 'package:delivery_pda/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TakePostPage extends StatelessWidget {
  const TakePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TakePostController>(
        init: TakePostController(Get.find()),
        builder: (controller){
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: CommonText(text:'Tovar olib ketish',
              size: 18, color: CommonColors.primaryBlackText, fontWeight: FontWeight.w700,),
            ),
            body: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 13.w
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(text: 'Tovarni Scannerlang:', color: CommonColors.primaryBlackText, size: 18,),
                  Container(
                      width: double.maxFinite,
                      child: Divider(color: CommonColors.primaryBlackText,)),
                  Expanded(child: ListView.builder(
                      itemCount: controller.trackNumberList.length,
                      itemBuilder: (ctx,index){
                        final item=controller.trackNumberList[index];
                        return CommonText(text: item, size: 16, color: CommonColors.primaryBlackText,);
                      })),
                  
                  CustomButton(onTap: (){
                    if(controller.trackNumberList.isNotEmpty){
                      controller.bringCourier();
                    }
                  }, text: 'Olib ketdim',
                    color: controller.trackNumberList.isEmpty
                        ?CommonColors.primaryColorLight
                        :CommonColors.primaryColor,),
                  SizedBox(height: 40.h,)
                ],
              ),
            ),
          );
        });
  }
}
