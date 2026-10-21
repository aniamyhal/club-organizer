import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/auth/forgot_password_screen.dart';
import 'features/auth/login_screen.dart';
import 'features/auth/register_screen.dart';
import 'features/home/home_screen.dart';
import 'features/placeholder/placeholder_screen.dart';
import 'features/profile/profile_screen.dart';

class ClubOrganizerApp extends StatelessWidget {
  const ClubOrganizerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Органайзер навчального гуртка',
      theme: AppTheme.light,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/home': (context) => const HomeScreen(),
        '/schedule': (context) => const PlaceholderScreen(
              title: 'Розклад',
              subtitle: 'Плануйте зустрічі та заняття гуртка.',
            ),
        '/members': (context) => const PlaceholderScreen(
              title: 'Учасники',
              subtitle: 'Керуйте списком учасників гуртка.',
            ),
        '/tasks': (context) => const PlaceholderScreen(
              title: 'Завдання',
              subtitle: 'Переглядайте завдання гуртка.',
            ),
        '/materials': (context) => const PlaceholderScreen(
              title: 'Матеріали',
              subtitle: 'Зберігайте навчальні матеріали.',
            ),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}