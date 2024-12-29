import 'package:delivery_pda/common/color/comon_colors.dart';
import 'package:delivery_pda/utils/scale_animation.dart';
import 'package:delivery_pda/view/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    this.isLoading = false,  this.color=CommonColors.primaryColor,
  });

  final VoidCallback onTap;
  final String text;
  final bool isLoading;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: () => onTap(),
      child: Container(
        // padding: padding,
        width: double.maxFinite,
        height: 50.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(31.r),
        ),
        child: Center(
            child: isLoading
                ? const CircularProgressIndicator(
                    color: CommonColors.whiteColor,
                  )
                : CommonText(
                    text: text,
                    size: 14,
                    color: CommonColors.whiteColor,
                    fontWeight: FontWeight.w600,
                  )),
      ),
    );
  }
}
