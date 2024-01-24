import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';

class DSettingsMenuTile extends StatelessWidget {
  const DSettingsMenuTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      this.trailing,
      this.onTap});

  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, size: 28, color: DColors.primary),
      title: Text(title, style: themeData.textTheme.titleMedium),
      subtitle: Text(subtitle, style: themeData.textTheme.labelMedium),
      trailing: trailing,
    );
  }
}
