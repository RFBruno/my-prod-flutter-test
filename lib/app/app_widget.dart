import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_prod_flutter_test/app/core/ui/extensions/theme_extension.dart';
import 'package:my_prod_flutter_test/app/pages/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  static Map<String, WidgetBuilder>routes = {
    '/' :  (context) => const HomePage()
  };

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'My prod test',
          theme: ThemeData(
            primarySwatch: Colors.grey,
            appBarTheme: AppBarTheme(
              elevation: 0,
              backgroundColor: context.slateGreyTwo
            )
          ),
          routes: routes,
        );
      },
    );
  }
}
