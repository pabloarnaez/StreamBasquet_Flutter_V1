import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// AppTypography centraliza los estilos de texto usados en la app.
///
/// Use las propiedades estáticas desde cualquier widget, por ejemplo:
/// `style: AppTypography.body`.
class AppTypography {
	AppTypography._();

	static final TextStyle headlineLarge = GoogleFonts.inter(
		fontSize: 32,
		fontWeight: FontWeight.bold,
	);

	static final TextStyle headlineMedium = GoogleFonts.inter(
		fontSize: 24,
		fontWeight: FontWeight.w700,
	);

	static final TextStyle title = GoogleFonts.inter(
		fontSize: 18,
		fontWeight: FontWeight.w600,
	);

	static final TextStyle body = GoogleFonts.inter(
		fontSize: 15,
	);

	static final TextStyle caption = GoogleFonts.inter(
		fontSize: 13,
		color: Colors.grey,
	);
}
