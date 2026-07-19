import 'package:flutter/material.dart';

/// SBAppBar: AppBar consistente con Material 3 y tokens.
class SBAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;

  const SBAppBar({super.key, this.title, this.actions, this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: title,
      actions: actions,
      centerTitle: true,
      elevation: 0,
      toolbarHeight: kToolbarHeight,
      titleSpacing: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
