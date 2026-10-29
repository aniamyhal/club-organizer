import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_text_field.dart';
import '../../core/widgets/auth_background.dart';
import '../../core/widgets/auth_heading.dart';
import '../../core/widgets/primary_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      maxWidth: 480,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const AuthHeading(
            title: 'Реєстрація',
            subtitle: 'Створіть обліковий запис організатора',
          ),
          const SizedBox(height: 28),
          LayoutBuilder(
            builder: (context, constraints) {
              final firstName = const AppTextField(label: "Ім'я");
              final lastName = const AppTextField(label: 'Прізвище');
              return constraints.maxWidth < 360
                  ? Column(
                      children: [
                        firstName,
                        const SizedBox(height: 16),
                        lastName,
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(child: firstName),
                        const SizedBox(width: 16),
                        Expanded(child: lastName),
                      ],
                    );
            },
          ),
          const SizedBox(height: 16),
          const AppTextField(
            label: 'Електронна пошта',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          const AppTextField(
            label: 'Пароль',
            isPassword: true,
            helperText: 'Щонайменше 8 символів, літери та цифри',
          ),
          const SizedBox(height: 16),
          const AppTextField(label: 'Підтвердіть пароль', isPassword: true),
          const SizedBox(height: 24),
          PrimaryButton(
            label: 'Зареєструватися',
            onPressed: () => context.go('/home'),
          ),
          const SizedBox(height: 16),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const Text('Вже є обліковий запис? '),
              TextButton(
                onPressed: () => context.go('/login'),
                style: TextButton.styleFrom(foregroundColor: AppColors.primary),
                child: const Text(
                  'Увійти',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
