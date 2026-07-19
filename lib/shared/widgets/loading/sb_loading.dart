import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

/// SBLoading: indicador de carga centralizado con color del Design System.
class SBLoading extends StatelessWidget {
  const SBLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.primary,
      ),
    );
  }
}