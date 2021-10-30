import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weight_tracker/controller/weight_controller.dart';
import 'package:weight_tracker/utilities/color_constants.dart';
import 'package:weight_tracker/utilities/style_constants.dart';
import 'package:weight_tracker/view/widgets/back_button_widget.dart';
import 'package:weight_tracker/view/widgets/background_gradient_widget.dart';
import 'package:weight_tracker/view/widgets/custom_gradient_button.dart';

class AddWeightPage extends StatelessWidget {
  WeightController _weightController = Get.find<WeightController>();
  AddWeightPage({Key? key}) : super(key: key);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BackgroundGradientWidget(
        child: Scaffold(
      body: Obx(
        () => Column(
          children: [
            BackButtonWidget(),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter value';
                    }
                    return null;
                  },
                  controller: _weightController.textEditingController.value,
                  decoration: textFormFieldInputDecoration.copyWith(
                    hintText: "Add New Weight",
                    suffix: Image.asset(
                      "assets/weight.png",
                      height: 20.h,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 18.sp, color: grey2),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 14.h, right: 16.w, left: 200.w, bottom: 16.h),
              child: CustomGradientButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {}
                    _weightController.addWeight();
                  },
                  text: "Save Weight"),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: _weightController.weightsList.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return UpdateListItemWidget(
                        weightController: _weightController,
                        index: index,
                      );
                    }))
          ],
        ),
      ),
    ));
  }
}

class UpdateListItemWidget extends StatelessWidget {
  final int index;

  UpdateListItemWidget({
    Key? key,
    required WeightController weightController,
    required this.index,
    required,
  })  : _weightController = weightController,
        super(key: key);

  final WeightController _weightController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: darkColor2,
        borderRadius: BorderRadius.circular(10.r),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ExpansionTile(
        children: [
          Form(
            key: formKey,
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter value';
                }
                return null;
              },
              controller: _weightController.editingControllerList[index].value,
              decoration: textFormFieldInputDecoration.copyWith(
                  hintText: "Update Weight",
                  suffix: Image.asset(
                    "assets/weight.png",
                    height: 20.h,
                  ),
                  fillColor: grey2.withOpacity(0.6)),
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 18.sp, color: grey2),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 14.h,
                // right: 16.w,
                left: 160.w,
                bottom: 14.h),
            child: CustomGradientButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    _weightController.updateWeight(index);
                  }
                },
                text: "Update Weight"),
          ),
        ],
        title: SizedBox(
          height: 60.h,
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
        ),
      ),
    );
  }
}
