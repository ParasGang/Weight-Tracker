import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weight_tracker/utilities/color_constants.dart';

class CustomGradientButton extends StatelessWidget {
  final Function onTap;
  final String text;
  const CustomGradientButton(
      {Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: double.infinity,
        height: 48.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          gradient: const LinearGradient(
            colors: [
              Color(0xff3DF5A7),
              Color(0xff096FE0),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: primaryColorLight,
            fontSize: 18.sp,
          ),
        ),
      ),
    );
  }
}
