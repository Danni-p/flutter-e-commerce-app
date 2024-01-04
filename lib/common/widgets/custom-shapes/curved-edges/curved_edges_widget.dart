import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/common/widgets/custom-shapes/curved-edges/custom_curved_edges.dart';

class DCurvedEdgesWidget extends StatelessWidget {
  const DCurvedEdgesWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: DCustomCurvedEdges(), child: child);
  }
}