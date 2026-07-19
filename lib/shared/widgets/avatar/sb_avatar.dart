import 'package:flutter/material.dart';

/// SBAvatar: avatar circular con imagen o iniciales.
class SBAvatar extends StatelessWidget {
  final double size;
  final String? imageUrl;
  final String? initials;

  const SBAvatar({
    super.key,
    this.size = 40,
    this.imageUrl,
    this.initials,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: Image.network(imageUrl!, width: size, height: size, fit: BoxFit.cover),
      );
    }

    return CircleAvatar(
      radius: size / 2,
      child: Text(initials ?? ''),
    );
  }
}
