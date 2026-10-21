import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AuthHeading extends StatelessWidget {
  const AuthHeading({required this.title, required this.subtitle, super.key});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(color: AppColors.primaryContainer, borderRadius: BorderRadius.circular(16)),
          child: const Icon(Icons.school_outlined, color: AppColors.primary, size: 32),
        ),
        const SizedBox(height: 20),
        Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        Text(subtitle, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.muted)),
      ],
    );
  }
}