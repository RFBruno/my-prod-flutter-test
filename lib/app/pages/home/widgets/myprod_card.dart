// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_prod_flutter_test/app/core/ui/extensions/theme_extension.dart';
import 'package:my_prod_flutter_test/app/core/ui/icons/my_prod_icons.dart';

class MyprodCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String language;
  final int commits;

  const MyprodCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.language,
    required this.commits,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: context.textStyle.copyWith(
            color: Colors.blue,
          ),),
          const SizedBox(height: 10),
          Text(subtitle, style: context.textStyleTwo.copyWith(
            fontSize: 12.sp,
            color: context.slateGrey
          ),),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.code, color: context.slateGrey,),
              const SizedBox(width: 3),
              Text(language, style: context.textStyleTwo,),
              const SizedBox(width: 30),
              Icon(MyProd.flow_branch, color: context.slateGrey,),
              const SizedBox(width: 3),
              Text('$commits', style: context.textStyleTwo,),
            ],
          )
        ],
      ),
    );
  }
}
