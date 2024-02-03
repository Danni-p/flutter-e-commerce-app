import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/custom-shapes/containers/rounded_container.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';
import 'package:flutter_e_commerce_app/utils/helpers/helper_functions.dart';

class DChoiceChip extends StatelessWidget {
  const DChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final colorRecognized = DHelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: colorRecognized ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: const TextStyle(color: DColors.white),
        avatar: colorRecognized
            ? DRoundedContainer(
                width: 50,
                height: 50,
                backgroundColor: DHelperFunctions.getColor(text)!)
            : null,
        shape: colorRecognized ? const CircleBorder() : null,
        labelPadding: colorRecognized ? const EdgeInsets.all(0) : null,
        padding: colorRecognized ? const EdgeInsets.all(0) : null,
        backgroundColor: DHelperFunctions.getColor(text),
        selectedColor: DHelperFunctions.getColor(text),
      ),
    );
  }
}
