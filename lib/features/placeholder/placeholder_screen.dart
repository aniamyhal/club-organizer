import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/page_body.dart';

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({
    required this.title,
    required this.subtitle,
    super.key,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return PageBody(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80),
          child: Column(
            children: [
              const Icon(
                Icons.construction_outlined,
                size: 40,
                color: AppColors.primary,
              ),
              const SizedBox(height: 16),
              const Text(
                'Розділ у розробці',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
