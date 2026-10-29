import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/theme/app_theme.dart';
import 'core/widgets/app_shell.dart';
import 'features/auth/forgot_password_screen.dart';
import 'features/auth/login_screen.dart';
import 'features/auth/register_screen.dart';
import 'features/home/home_screen.dart';
import 'features/placeholder/placeholder_screen.dart';
import 'features/profile/profile_screen.dart';

final _router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/forgot-password',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) => AppShell(state: state, child: child),
      routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const HomeScreen(),
          ),
        ),
        GoRoute(
          path: '/schedule',
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const PlaceholderScreen(
              title: 'Розклад',
              subtitle: 'Плануйте зустрічі та заняття гуртка.',
            ),
          ),
        ),
        GoRoute(
          path: '/members',
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const PlaceholderScreen(
              title: 'Учасники',
              subtitle: 'Керуйте списком учасників гуртка.',
            ),
          ),
        ),
        GoRoute(
          path: '/tasks',
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const PlaceholderScreen(
              title: 'Завдання',
              subtitle: 'Переглядайте завдання гуртка.',
            ),
          ),
        ),
        GoRoute(
          path: '/materials',
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const PlaceholderScreen(
              title: 'Матеріали',
              subtitle: 'Зберігайте навчальні матеріали.',
            ),
          ),
        ),
        GoRoute(
          path: '/profile',
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: const ProfileScreen(),
          ),
        ),
      ],
    ),
  ],
);

class ClubOrganizerApp extends StatelessWidget {
  const ClubOrganizerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Органайзер навчального гуртка',
      theme: AppTheme.light,
      routerConfig: _router,
    );
  }
}
