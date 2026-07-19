import 'package:flutter/material.dart';
import '../../widgets/appbar/sb_app_bar.dart';
import '../../../core/theme/app_spacing.dart';

/// SBScaffold: envoltura de scaffold con paddings y appbar estandarizados.
class SBScaffold extends StatelessWidget {
  final Widget body;
  final Widget? floatingActionButton;
  final SBAppBar? appBar;

  const SBScaffold({super.key, required this.body, this.floatingActionButton, this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: body,
        ),
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
