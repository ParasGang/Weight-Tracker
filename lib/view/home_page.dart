import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weight_tracker/controller/weight_controller.dart';
import 'package:weight_tracker/utilities/color_constants.dart';
import 'package:weight_tracker/view/add_weight_page.dart';
import 'package:weight_tracker/view/widgets/background_gradient_widget.dart';

class HomePage extends StatelessWidget {
  WeightController _weightController = Get.put(WeightController());
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundGradientWidget(
        child: Obx(() => 
       _weightController.loading.value? Scaffold(body: Center(
         child: CircularProgressIndicator()
       ),):
        Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return AddWeightPage();
                  }));
                },
                backgroundColor: grey2,
                child: Icon(Icons.add, size: 36.h),
              ),
              body: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      backgroundColor: Colors.transparent,
                      stretch: true,
                      expandedHeight: 270.h,
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                background: Container(
                    margin: EdgeInsets.only(top: 24.h),
                    width: double.maxFinite,
                    height: 52.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xff1C192D).withOpacity(0),
                            const Color(0xff4A4C85).withOpacity(0.5),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Text(
                            "Average Weight",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 36.sp,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              FittedBox(
                                child: Obx(() => Text(
                                      _weightController.averageWeight.value
                                          .toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 80.sp,
                                      ),
                                    )),
                              ),
                              SizedBox(width: 16.w),
                              Image.asset(
                                "assets/weight.png",
                                height: 64.h,
                              ),
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                    )),
              ),
            ),
          ];
        },
        body: Obx(() => ListView.builder(
            itemCount: _weightController.weightsList.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                height: 60.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: darkColor2,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/weight.png",
                      height: 40.h,
                    ),
                    SizedBox(width: 14.w),
                    Text(
                      _weightController.weightsList[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: grey2,
                        fontSize: 24.sp,
                      ),
                    ),
                  ],
                ),
              );
            })),
      )),
    ));
  }
}
