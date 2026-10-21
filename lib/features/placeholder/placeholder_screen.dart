import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_shell.dart';

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({required this.title, required this.subtitle, super.key});

  final String title;
  final String subtitle;

  String get _route => switch (title) {
        'Розклад' => '/schedule',
        'Учасники' => '/members',
        'Завдання' => '/tasks',
        _ => '/materials',
      };

  @override
  Widget build(BuildContext context) {
    return AppShell(
      title: title,
      subtitle: subtitle,
      activeRoute: _route,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80),
          child: Column(
            children: [
              const Icon(Icons.construction_outlined, size: 40, color: AppColors.primary),
              const SizedBox(height: 16),
              const Text('Розділ у розробці', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}