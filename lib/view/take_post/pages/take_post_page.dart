import 'package:delivery_pda/view/take_post/controller/take_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TakePostPage extends StatelessWidget {
  const TakePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TakePostController>(
        init: TakePostController(),
        builder: (controller){
          return Scaffold(
            body: Center(child: Text('Take post')),
          );
        });
  }
}
