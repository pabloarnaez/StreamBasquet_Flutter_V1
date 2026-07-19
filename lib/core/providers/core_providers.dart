import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/app_config.dart';
import '../network/dio_client.dart';

/// Auth provider: guarda token (aún no implementado el login).
final authProvider = StateProvider<String?>((ref) => null);

/// Theme provider para cambiar `ThemeMode` en tiempo de ejecución.
final themeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);

/// Locale provider para internacionalización.
final localeProvider = StateProvider<Locale>((ref) => const Locale('es'));

/// Dio provider: crea una instancia de Dio configurada con interceptores.
final dioProvider = Provider<Dio>((ref) {
  final config = AppConfig.current;

  String? tokenGetter() => ref.read(authProvider.notifier).state;

  return createDio(
    baseUrl: config.baseUrl,
    tokenGetter: tokenGetter,
    enableLogging: config.enableLogging,
  );
});
