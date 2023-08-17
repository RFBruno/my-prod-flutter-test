// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

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
          SearchFormField(),
          ...List.generate(
            5,
            (index) {
              return Column(
                children: [
                  const MyprodCard(
                    title: 'todo-back',
                    subtitle:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting i',
                    icon: Icons.star,
                    language: 'JavaScript',
                    commits: 177,
                    favorites: true,
                    totalStar: 150,
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
          ),
        ],
      ),
    );
  }
}
