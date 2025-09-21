import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moltaqa/core/theming/colors_manager.dart';
import 'package:moltaqa/core/theming/text_styles.dart';

class PacksCategories extends StatelessWidget {
  const PacksCategories({super.key});

  static final categories = [
    "All",
    "Popular",
    "New",
    "Created",
    "Bookmarked",
    "Bookmarked",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder:
            (context, index) => GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: ColorsManager.borderColor,
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Text(
                  categories[index],
                  style: TextStylesManager.titleSmall,
                ),
              ),
            ),
      ),
    );
  }
}
