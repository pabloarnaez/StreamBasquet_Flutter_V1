import 'package:flutter/material.dart';
import '../../core/theme/app_spacing.dart';

/// SBLogo: icono de la marca reutilizable.
class SBLogo extends StatelessWidget {
  final double size;

  const SBLogo({
    super.key,
    this.size = 120,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.sports_basketball,
      size: size,
    );
  }
}