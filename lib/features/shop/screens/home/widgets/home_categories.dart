import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/image-text/vertical_image_text.dart';
import 'package:flutter_e_commerce_app/utils/constants/images.dart';

class DHomeCategories extends StatelessWidget {
  const DHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return DVerticalImageText(
              title: 'Sportgeräte',
              image: DImages.shoeIcon,
              onTap: () {},
            );
          }),
    );
  }
}