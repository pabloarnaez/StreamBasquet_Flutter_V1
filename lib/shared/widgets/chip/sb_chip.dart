import 'package:flutter/material.dart';
import '../../../core/theme/app_spacing.dart';

/// SBChip: chip estilizado reutilizable.
class SBChip extends StatelessWidget {
  final String label;
  final VoidCallback? onDeleted;
  final Widget? avatar;

  const SBChip({super.key, required this.label, this.onDeleted, this.avatar});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: avatar,
      label: Text(label),
      deleteIcon: onDeleted != null ? const Icon(Icons.close) : null,
      onDeleted: onDeleted,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
    );
  }
}
