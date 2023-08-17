import 'package:flutter/material.dart';
import 'package:my_prod_flutter_test/app/core/ui/extensions/size_screen_extension.dart';
import 'package:my_prod_flutter_test/app/core/ui/extensions/theme_extension.dart';
import 'package:my_prod_flutter_test/app/core/ui/icons/my_prod_icons.dart';
import 'package:my_prod_flutter_test/app/pages/home/widgets/myprod_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              width: double.infinity,
              height: 120.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 40.h,
                    backgroundImage: const NetworkImage(
                      'https://cdn.pixabay.com/photo/2020/10/11/19/51/cat-5646889_640.jpg',
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Roger Ramos',
                        style: context.textStyle,
                      ),
                      Text(
                        'Front End Dev and UI',
                        style: context.textStyleTwo,
                      )
                    ],
                  )
                ],
              ),
            ),
            DefaultTabController(
              initialIndex: 0,
              length: 2,
              child: TabBar(
                indicatorColor: context.rustyOrange,
                onTap: (value) {
                  print(value);
                },
                indicatorWeight: 6,
                tabs: [
                  _tab(context, 'Repos', 73),
                  _tab(context, 'Starred', 5),
                ],
              ),
              // Container(
              //   color: Colors.amber,
              //   child: TabBarView(
              //     children: [
              //       Text('data1'),
              //       Text('data2'),
              //     ],
              //   ),
              // ),
            ),
            // const MyprodCard(
            //   title: 'todo-back',
            //   subtitle:
            //       'Lorem Ipsum is simply dummy text of the printing and typesetting i',
            //   language: 'JavaScript',
            //   commits: 177,
            // ),
            // Divider(
            //   thickness: 1.sp,
            // )
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
                borderRadius: BorderRadius.circular(30)),
            child: Center(
                child: Text(
              '$total',
            )),
          )
        ],
      ),
    );
  }
}
