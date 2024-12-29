import 'package:delivery_pda/common/color/comon_colors.dart';
import 'package:delivery_pda/view/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


AppBar customAppBar({required String title,  VoidCallback? onTap,}){
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: CommonColors.primaryBackground,
    flexibleSpace: Container(
      margin: const EdgeInsets.only(
        top: 12,
        left: 20,
      ),
      width: double.maxFinite,
      height: 100,
      child:Row(
crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if(onTap!=null)
          Center(
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                margin: EdgeInsets.only(top: 16.h),
                width:36.w,
                height: 36.h,
                child: SvgPicture.asset('assets/icons/app_back_icon.svg'),
              ),
            ),
          ),
        ],
      ),
    ),
    title: CommonText( text: title, color: CommonColors.primaryBlackText,size: 17,fontWeight: FontWeight.w500,),
    centerTitle: true,
  );
}
