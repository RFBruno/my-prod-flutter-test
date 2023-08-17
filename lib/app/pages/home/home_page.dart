import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_prod_flutter_test/app/core/ui/extensions/size_screen_extension.dart';
import 'package:my_prod_flutter_test/app/core/ui/extensions/theme_extension.dart';
import 'package:my_prod_flutter_test/app/core/ui/icons/my_prod_icons.dart';
import 'package:my_prod_flutter_test/app/pages/home/home_controller.dart';
import 'package:my_prod_flutter_test/app/pages/home/widgets/card_user.dart';
import 'package:my_prod_flutter_test/app/pages/home/widgets/repos_tab.dart';
import 'package:my_prod_flutter_test/app/pages/home/widgets/starred_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.toLoadInformations();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
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
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            Obx(() {
              return CardUser(
                name: '${controller.name}',
                avatar: '${controller.avatar}',
                bio: '${controller.bio}',
              );
            }),
            DefaultTabController(
              initialIndex: 0,
              length: 2,
              child: Expanded(
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: context.rustyOrange,
                      indicatorWeight: 6,
                      tabs: [
                        Obx(() => _tab(context, 'Repos', controller.reposList.length)),
                        Obx(() => _tab(context, 'Starred', controller.starredList.length)),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ReposTab(controller: controller),
                          StarredTab(controller: controller),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Tab _tab(BuildContext context, String label, int total) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: context.textStyle,
          ),
          Container(
            margin: const EdgeInsets.only(left: 4),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            height: 15.h,
            decoration: BoxDecoration(
              color: context.paleGrey,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
                child: Text('$total'),
            ),
          )
        ],
      ),
    );
  }
}
