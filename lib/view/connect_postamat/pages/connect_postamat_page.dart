import 'package:delivery_pda/common/color/comon_colors.dart';
import 'package:delivery_pda/utils/logger.dart';
import 'package:delivery_pda/utils/utils.dart';
import 'package:delivery_pda/view/connect_postamat/controller/connect_postamat_controller.dart';
import 'package:delivery_pda/view/widgets/common_text.dart';
import 'package:delivery_pda/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class ConnectPostamatPage extends StatefulWidget {
  const ConnectPostamatPage({super.key});

  @override
  State<ConnectPostamatPage> createState() => _ConnectPostamatPageState();
}

class _ConnectPostamatPageState extends State<ConnectPostamatPage> {

  final ConnectPostamatController controller=Get.find<ConnectPostamatController>();
  @override
  void initState() {
    super.initState();

    SystemChannels.keyEvent.setMessageHandler((message) async {
      return null;
    });

    startListeningForScans();
  }


  Future<void> startListeningForScans() async {
    const platform = MethodChannel('com.example.pda_scan_final/scanner');
    platform.setMethodCallHandler((call) async {
      String scannedBarcode = '';
      if (call.method == 'onBarcodeScanned') {

        if (mounted) {
          // Qo'shimcha tekshirish
          Log.i(call.arguments ?? '');
          scannedBarcode = call.arguments ?? '';

          if (scannedBarcode.isNotEmpty) {
            controller.soundSuccess();
           await controller.connectToPostamat(scannedBarcode);
            scannedBarcode='';
          }

        }
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConnectPostamatController>(
        init: ConnectPostamatController(),
        builder: (controller){
          return  Scaffold(
            backgroundColor: CommonColors.primaryBackground,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: controller.isConnected?CommonColors.green:CommonColors.red,
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
                          child: SvgPicture.asset('assets/icons/app_back_icon.svg'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              foregroundColor: Colors.white,
              title: controller.isConnected
                  ?const CommonText(
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
            body: RefreshIndicator(
              onRefresh: controller.refreshResults,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: controller.isLoading?
                  Center(child: CircularProgressIndicator(color: CommonColors.primaryColor,),)
                  :Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       controller.qrCode.isEmpty?
                       CommonText(text: 'Qr Codeni scanner qiling', color: Colors.black,size: 18.sp,fontWeight: FontWeight.w700,):
                           Container(
                            height: MediaQuery.of(context).size.height-150,
                             child:Column(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                   Container(),
                                 Column(
                                   children: [
                CustomButton(onTap: (){}, text: 'OCHISH',),
                SizedBox(height: 20.h,),
                CustomButton(onTap: () async {

             await controller.finishConnection();
                }, text: 'Yakunlash',color: CommonColors.primaryGrey,)
                                   ],
                                 )
                               ],
                             ),
                           )
                      ],
                    ),
                  )
                ),
              ),
            ),
          );
        });

  }
}
