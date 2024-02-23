import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/funds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunDsTypography {
  const FunDsTypography._();

  /*
  ..body18U = Underline text Style
  ..body18B = Bold text Style
  */

  static const defaultLetterSpacing = 0.0;
  static const iosLetterSpacing = -0.5;

  static final letterSpacing =
      !kIsWeb && Platform.isIOS ? iosLetterSpacing : defaultLetterSpacing;

  static final TextStyle def = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    letterSpacing: letterSpacing,
    color: FunDsColors.colorTextDefault,
  );

  static final TextStyle defB = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    letterSpacing: letterSpacing,
    color: FunDsColors.colorTextDefault,
  );

  //Heading
  static TextStyle get heading24 => defB.copyWith(fontSize: 24.sp);

  static TextStyle get heading20 => defB.copyWith(fontSize: 20.sp);

  static TextStyle get heading16 => defB.copyWith(fontSize: 16.sp);

  static TextStyle get heading14 => defB.copyWith(fontSize: 14.sp);

  //Body
  static TextStyle get body18 => def.copyWith(
        fontSize: 18.sp,
        height: 1.5,
      );

  static TextStyle get body18B => body18.copyWith(
        fontWeight: FontWeight.w700,
        height: 1.5,
      );

  static TextStyle get body18U => body18.copyWith(
        decoration: TextDecoration.underline,
        height: 1.5,
      );

  static TextStyle get body16 => def.copyWith(
        fontSize: 16.sp,
        height: 1.5,
      );

  static TextStyle get body16B => body16.copyWith(
        fontWeight: FontWeight.w700,
        height: 1.5,
      );

  static TextStyle get body16U => body16.copyWith(
        decoration: TextDecoration.underline,
        height: 1.5,
      );

  static TextStyle get body14 => def.copyWith(
        fontSize: 14.sp,
        height: 1.5,
      );

  static TextStyle get body14B => body14.copyWith(
        fontWeight: FontWeight.w700,
        height: 1.5,
      );

  static TextStyle get body14U => body14.copyWith(
        decoration: TextDecoration.underline,
        height: 1.5,
      );

  static TextStyle get body12 => def.copyWith(
        fontSize: 12.sp,
        height: 1.5,
      );

  static TextStyle get body12B => body12.copyWith(
        fontWeight: FontWeight.w700,
        height: 1.5,
      );

  static TextStyle get body12U => body12.copyWith(
        decoration: TextDecoration.underline,
        height: 1.5,
      );

  static TextStyle get body10 => def.copyWith(
        fontSize: 10.sp,
        height: 1.5,
      );

  static TextStyle get body10B => body10.copyWith(
        fontWeight: FontWeight.w700,
        height: 1.5,
      );

  static TextStyle get body10U => body10.copyWith(
        decoration: TextDecoration.underline,
        height: 1.5,
      );
}
