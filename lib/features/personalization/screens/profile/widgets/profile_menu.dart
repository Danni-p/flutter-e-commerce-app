import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class DProfileMenu extends StatelessWidget {
  const DProfileMenu(
      {super.key,
      this.icon = Iconsax.arrow_right_34,
      required this.title,
      required this.value,
      required this.onPressed});

  final IconData icon;
  final String title, value;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: DSizes.spaceBtwItems / 1.5),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Text(title,
                    style: themeData.textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis)),
            Expanded(
                flex: 5,
                child: Text(value,
                    style: themeData.textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis)),
            Expanded(child: Icon(icon, size: 18))
          ],
        ),
      ),
    );
  }
}
