// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';

import 'package:my_prod_flutter_test/app/core/ui/extensions/size_screen_extension.dart';
import 'package:my_prod_flutter_test/app/pages/home/home_controller.dart';
import 'package:my_prod_flutter_test/app/pages/home/widgets/myprod_card.dart';
import 'package:my_prod_flutter_test/app/pages/home/widgets/search_form_field.dart';

class StarredTab extends StatelessWidget {
  final HomeController controller;
  const StarredTab({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SearchFormField(controller: controller,),
          Obx(() {
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.starredList.length,
              itemBuilder: (context, index) {
                final repos = controller.starredList[index];
                return Column(
                  children: [
                    MyprodCard(
                      title: repos.name,
                      subtitle: repos.description == ''
                          ? 'Sem descrição'
                          : repos.description,
                      icon: Icons.star,
                      favorites: true,
                      totalStar: repos.stargazersCount,
                      language: repos.language,
                      commits: repos.totalCommits,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                        thickness: 1.sp,
                      ),
                    ),
                  ],
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
