import 'package:flutter/material.dart';

import '../../constants/app_text_styles.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 15,
                childAspectRatio: 2,
              ),
              itemBuilder: (_, index) {
                return const MovieCategoryWidget(
                  imagePath: "assets/images/c1.png",
                  categoryName: "Comedies",
                );
              }),
        )
      ],
    );
  }
}

class MovieCategoryWidget extends StatelessWidget {
  final String? imagePath;
  final String? categoryName;
  const MovieCategoryWidget({Key? key, this.imagePath, this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: AssetImage(imagePath!), fit: BoxFit.fill)),
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.only(
          left: 10,
          bottom: 10,
          right: 10,
        ),
        child: Text(
          categoryName!,
          style: AppTextStyle.kEighteenWithWhiteColor500,
        ),
      ),
    );
  }
}
