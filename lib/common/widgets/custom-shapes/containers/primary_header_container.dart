import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/custom-shapes/containers/rounded_container.dart';
import 'package:flutter_e_commerce_app/common/widgets/custom-shapes/curved-edges/curved_edges_widget.dart';
import 'package:flutter_e_commerce_app/utils/constants/colors.dart';

class DPrimaryHeaderContainer extends StatelessWidget {
  const DPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  /// if size.isFinite is not true, error will occure in stack
  final Widget child;
  
  @override
  Widget build(BuildContext context) {
    return DCurvedEdgesWidget(
      child: Container(
        color: DColors.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: DRoundedContainer(
                backgroundColor: DColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: DRoundedContainer(
                backgroundColor: DColors.textWhite.withOpacity(0.1),
              ),
            ),
            child
          ],
        ),
      ),
    );
  }
}