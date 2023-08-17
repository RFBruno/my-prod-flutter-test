import 'package:flutter/material.dart';
import 'package:my_prod_flutter_test/app/core/ui/extensions/size_screen_extension.dart';
import 'package:my_prod_flutter_test/app/core/ui/extensions/theme_extension.dart';

class SearchFormField extends StatelessWidget {

  const SearchFormField({ super.key });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 30, vertical: 40),
      child: SizedBox(
        height: 40.sp,
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(top: 10),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10),
              child: Icon(
                Icons.search,
                size: 30.sp,
              ),
            ),
            hintText: 'Filter by name',
            hintStyle:
                context.textStyleTwo.copyWith(),
            isDense: true,
            border: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}