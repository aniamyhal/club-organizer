import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    final color = switch (label) {
      'Нове' => AppColors.newBadge,
      'У процесі' => AppColors.progressBadge,
      'Виконано' => AppColors.doneBadge,
      _ => AppColors.primaryContainer,
    };
    return DecoratedBox(
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
      ),
    );
  }
}