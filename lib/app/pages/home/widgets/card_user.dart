// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:my_prod_flutter_test/app/core/ui/extensions/size_screen_extension.dart';
import 'package:my_prod_flutter_test/app/core/ui/extensions/theme_extension.dart';

class CardUser extends StatelessWidget {
  final String name;
  final String avatar;
  final String bio;

  const CardUser({
    Key? key,
    required this.name,
    required this.avatar,
    required this.bio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        height: 120.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(

              backgroundColor: Colors.grey,
              radius: 40.h,
              backgroundImage: avatar == '' ?  const NetworkImage(
                'https://cdn.pixabay.com/photo/2020/10/11/19/51/cat-5646889_640.jpg',
              ):  NetworkImage(
                avatar,
              ),
              
            ),
            const SizedBox(width: 15),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: context.textStyle,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    bio,
                    softWrap: true,
                    style: context.textStyleTwo.copyWith(fontSize: 14.sp),
                  )
                ],
              ),
            )
          ],
        ),
      );
  }
}
