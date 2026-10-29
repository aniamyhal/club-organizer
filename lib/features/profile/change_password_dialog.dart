import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_text_field.dart';

class ChangePasswordDialog extends StatelessWidget {
  const ChangePasswordDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      constraints: const BoxConstraints(maxWidth: 520),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      titlePadding: const EdgeInsets.fromLTRB(24, 24, 16, 0),
      contentPadding: const EdgeInsets.all(24),
      actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      actionsAlignment: MainAxisAlignment.end,
      title: Row(
        children: [
          const Expanded(
            child: Text(
              'Заміна пароля',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
          IconButton(
            tooltip: 'Закрити',
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      content: const SizedBox(
        width: 520,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextField(
              label: 'Поточний пароль',
              obscureText: true,
              showVisibilityToggle: false,
            ),
            SizedBox(height: 16),
            AppTextField(
              label: 'Новий пароль',
              obscureText: true,
              showVisibilityToggle: false,
              helperText: 'Щонайменше 8 символів, літери та цифри',
              helperStyle: TextStyle(fontSize: 12, color: AppColors.muted),
            ),
            SizedBox(height: 16),
            AppTextField(
              label: 'Підтвердіть новий пароль',
              obscureText: true,
              showVisibilityToggle: false,
              helperText: 'Введіть новий пароль',
              helperStyle: TextStyle(fontSize: 12, color: AppColors.muted),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          style: TextButton.styleFrom(foregroundColor: AppColors.primary),
          child: const Text('Скасувати'),
        ),
        const SizedBox(width: 12),
        FilledButton(
          onPressed: () => Navigator.pop(context),
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            minimumSize: const Size(90, 44),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text('Змінити'),
        ),
      ],
    );
  }
}
