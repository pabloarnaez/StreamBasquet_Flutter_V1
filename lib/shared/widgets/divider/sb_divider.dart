import 'package:flutter/material.dart';
import '../../../core/theme/app_spacing.dart';

/// SBDivider: divisor con padding consistente.
class SBDivider extends StatelessWidget {
  final double thickness;
  final double indent;
  final double endIndent;

  const SBDivider({super.key, this.thickness = 1, this.indent = 0, this.endIndent = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Divider(thickness: thickness, indent: indent, endIndent: endIndent),
    );
  }
}
