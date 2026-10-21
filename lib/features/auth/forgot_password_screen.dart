import 'package:flutter/material.dart';

import '../../core/widgets/app_text_field.dart';
import '../../core/widgets/auth_background.dart';
import '../../core/widgets/auth_heading.dart';
import '../../core/widgets/primary_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const AuthHeading(
            title: 'Відновлення пароля',
            subtitle: 'Введіть email, з яким ви реєструвалися. Ми надішлемо посилання для скидання пароля.',
          ),
          const SizedBox(height: 28),
          const AppTextField(label: 'Електронна пошта', keyboardType: TextInputType.emailAddress),
          const SizedBox(height: 20),
          PrimaryButton(
            label: 'Надіслати посилання',
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Посилання надіслано')),
            ),
          ),
          const SizedBox(height: 16),
          TextButton.icon(
            onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
            icon: const Icon(Icons.arrow_back),
            label: const Text('До входу'),
          ),
        ],
      ),
    );
  }
}