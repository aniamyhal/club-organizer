import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_text_field.dart';
import '../../core/widgets/auth_background.dart';
import '../../core/widgets/auth_heading.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/secondary_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const AuthHeading(title: 'Вхід', subtitle: 'Органайзер навчального гуртка'),
          const SizedBox(height: 28),
          const AppTextField(label: 'Електронна пошта', keyboardType: TextInputType.emailAddress),
          const SizedBox(height: 16),
          const AppTextField(label: 'Пароль', isPassword: true),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, '/forgot-password'),
              child: const Text('Забули пароль?'),
            ),
          ),
          PrimaryButton(
            label: 'Увійти',
            onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
          ),
          const SizedBox(height: 24),
          const _DividerLabel(label: 'Немає облікового запису?'),
          const SizedBox(height: 16),
          SecondaryButton(
            label: 'Зареєструватися',
            onPressed: () => Navigator.pushNamed(context, '/register'),
          ),
        ],
      ),
    );
  }
}

class _DividerLabel extends StatelessWidget {
  const _DividerLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            label,
            maxLines: 1,
            softWrap: false,
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppColors.muted, fontSize: 13),
          ),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}