import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

InputDecoration textFormFieldInputDecoration = InputDecoration(
    hintStyle: TextStyle(fontSize: 18.sp, color: const Color(0xff898DA9)),
    filled: true,
    fillColor: const Color(0xff2C2C3F),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(
        width: 0,
        color: Colors.transparent,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(
        width: 1,
        color: Color(0xff3DF5A7),
      ),
    ),
    contentPadding: EdgeInsets.symmetric(
      vertical: 15.h,
      horizontal: 20.w,
    ));
