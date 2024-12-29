import 'package:delivery_pda/common/color/comon_colors.dart';
import 'package:delivery_pda/view/widgets/common_text.dart';
import 'package:flutter/material.dart';


void customLogoutDialog({required BuildContext context, required String title,  VoidCallback? onTap}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: CommonColors.whiteColor,
        title: const CommonText(text: "Chiqish", size: 20),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            const SizedBox(height: 10),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Dialogni yopish
            },
            child: const Text('Bekor qilish'),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
                decoration: BoxDecoration(
                    color: CommonColors.primaryColor,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text('Tasdiqlash', style: TextStyle(color: Colors.white)),
                )),
          ),
        ],
      );
    },
  );
}
