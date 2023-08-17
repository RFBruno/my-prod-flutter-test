import 'package:flutter/material.dart';
import 'package:my_prod_flutter_test/app/core/ui/extensions/size_screen_extension.dart';
import 'package:my_prod_flutter_test/app/core/ui/extensions/theme_extension.dart';
import 'package:my_prod_flutter_test/app/core/ui/icons/my_prod_icons.dart';

PreferredSizeWidget homeAppbar(BuildContext context) {
  return AppBar(
    title: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 10),
          child: Icon(
            MyProd.github,
            size: 28.sp,
            color: context.white,
          ),
        ),
        RichText(
          text: TextSpan(
            text: 'Github ',
            children: const [
              TextSpan(
                  text: 'profiles',
                  style: TextStyle(fontWeight: FontWeight.normal)),
            ],
            style: context.textStyle,
          ),
        ),
      ],
    ),
  );
}
