import 'package:delivery_pda/common/color/comon_colors.dart';
import 'package:delivery_pda/view/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Widget loginPhoneNumberTextField(LoginController controller, BuildContext context){
  return SizedBox(
    width: MediaQuery.of(context).size.width - 50,
    child: TextField(
      keyboardType: TextInputType.number,
      style:  const TextStyle(color: CommonColors.primaryBlackText),
      controller: controller.phoneController,
      maxLength: 9,
      decoration: InputDecoration(
        counterText: '',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(
            color: CommonColors.primaryGrey
          ),
        ),
        prefixIcon: Container(
          padding: const EdgeInsets.only(top: 12,
              left: 12),
          child: Text(
            "+998 ",
            style: TextStyle(
                color: CommonColors.primaryGrey,
                fontSize: 16.2.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(
            color: CommonColors.primaryGrey
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        hintText: 'telefon raqamni kiriting',
        hintStyle:
        const TextStyle(color: Color(0xffABAFB6)),
      ),
    ),
  );
}
Widget loginPasswordTextField(LoginController controller, BuildContext context){
  return SizedBox(
    width: MediaQuery.sizeOf(context).width - 50,
    child: TextField(
      obscureText: controller.isObscured,
      style:  const TextStyle(color: CommonColors.primaryBlackText),
      controller:  controller.passwordController,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: controller.isObscured ? const Icon(Icons.visibility, color: CommonColors.primaryGrey)
                : const Icon(Icons.visibility_off, color: CommonColors.primaryGrey),
            onPressed: () async {
              await controller.setObscure();
            },
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(
              color: CommonColors.primaryGrey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(
              color: CommonColors.primaryGrey
            ),
          ),
          hintText: 'Parolni kiriting',
          hintStyle:
          const TextStyle(color: Color(0xffABAFB6)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
          )),
    ),
  );
}

