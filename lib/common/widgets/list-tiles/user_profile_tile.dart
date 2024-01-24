import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/images/rounded_image.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/constants/images.dart';
import 'package:iconsax/iconsax.dart';

class DUserProfileTile extends StatelessWidget {
  const DUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return ListTile(
       leading: const DRoundedImage(imageUrl: DImages.user),
       title: Text('Coding with T', style: themeData.textTheme.headlineSmall!.apply(color: DColors.white)),
       subtitle: Text('support@codingwithT.com', style: themeData.textTheme.bodyMedium!.apply(color: DColors.white)),
       trailing: IconButton(onPressed: (){}, icon: const Icon(Iconsax.edit, color: DColors.white,),),
     );
  }
}