import 'package:flutter/material.dart';
import 'package:my_prod_flutter_test/app/core/ui/extensions/size_screen_extension.dart';

extension ThemeExtension on BuildContext {
  Color get rustyOrange => const Color(0xffE36209);
  Color get slateGrey => const Color(0xff5C646C);
  Color get brownishGrey => const Color(0xff666666);
  Color get warmGrey => const Color(0xff999999);
  Color get paleGrey => const Color(0xffE1E4E8);
  Color get white => const Color(0xffFFFFFF);
  Color get whiteTwo => const Color(0xffE3E3E3);
  Color get slateGreyTwo => const Color(0xff586069);

  TextStyle get textStyle => TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 18.sp,
        fontWeight: FontWeight.bold
      );
  TextStyle get textStyleTwo => TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: slateGrey
      );
}
