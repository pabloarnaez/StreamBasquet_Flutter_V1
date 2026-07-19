import 'package:flutter/material.dart';

import '../../../../shared/widgets/buttons/sb_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Iniciar sesión"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Spacer(),
            SBButton(
              label: "Ingresar",
              icon: Icons.login,
              onPressed: () {
                // Más adelante aquí irá la autenticación
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}