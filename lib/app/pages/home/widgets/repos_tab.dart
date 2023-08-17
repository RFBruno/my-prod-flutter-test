// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_prod_flutter_test/app/core/ui/extensions/size_screen_extension.dart';
import 'package:my_prod_flutter_test/app/pages/home/home_controller.dart';
import 'package:my_prod_flutter_test/app/pages/home/widgets/myprod_card.dart';
import 'package:my_prod_flutter_test/app/pages/home/widgets/search_form_field.dart';

class ReposTab extends StatelessWidget {
  final HomeController controller;
  const ReposTab({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            const SearchFormField(),
            Obx(() {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.reposList.length,
                itemBuilder: (context, index) {
                  final repos = controller.reposList[index];
                  return Column(
                    children: [
                      MyprodCard(
                        title: repos.name,
                        subtitle:
                            repos.description == '' ? 'Sem descrição' : repos.description,
                        icon: Icons.code,
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
        ));
  }
}
