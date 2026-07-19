import 'package:flutter/material.dart';

/// AppRadius define radios reutilizables para bordes y tarjetas.
class AppRadius {
  AppRadius._();

  static const BorderRadius small = BorderRadius.all(Radius.circular(8));
  static const BorderRadius medium = BorderRadius.all(Radius.circular(14));
  static const BorderRadius large = BorderRadius.all(Radius.circular(24));

  static const double smallValue = 8.0;
  static const double mediumValue = 14.0;
  static const double largeValue = 24.0;
}