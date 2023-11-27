import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FunDsTyphography {
  const FunDsTyphography._();

  /*
  ..body18U = Underline text Style
  ..body18B = Bold text Style
  */

  static const TextStyle def = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
  );

  static const TextStyle defB = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
  );

  //Heading
  static TextStyle heading24 = defB.copyWith(fontSize: 24.sp);
  static TextStyle heading20 = defB.copyWith(fontSize: 20.sp);
  static TextStyle heading16 = defB.copyWith(fontSize: 16.sp);
  static TextStyle heading14 = defB.copyWith(fontSize: 14.sp);

  //Body
  static TextStyle body18 = def.copyWith(fontSize: 18.sp);
  static TextStyle body18B = body18.copyWith(fontWeight: FontWeight.w700);
  static TextStyle body18U = body18.copyWith(
    decoration: TextDecoration.underline,
  );
  static TextStyle body16 = def.copyWith(fontSize: 16.sp);
  static TextStyle body16B = body16.copyWith(fontWeight: FontWeight.w700);
  static TextStyle body16U = body16.copyWith(
    decoration: TextDecoration.underline,
  );
  static TextStyle body14 = def.copyWith(fontSize: 14.sp);
  static TextStyle body14B = body14.copyWith(fontWeight: FontWeight.w700);
  static TextStyle body14U = body14.copyWith(
    decoration: TextDecoration.underline,
  );
  static TextStyle body12 = def.copyWith(fontSize: 12.sp);
  static TextStyle body12B = body12.copyWith(fontWeight: FontWeight.w700);
  static TextStyle body12U = body12.copyWith(
    decoration: TextDecoration.underline,
  );
  static TextStyle body10 = def.copyWith(fontSize: 10.sp);
  static TextStyle body10B = body10.copyWith(fontWeight: FontWeight.w700);
  static TextStyle body10U = body10.copyWith(
    decoration: TextDecoration.underline,
  );
}
