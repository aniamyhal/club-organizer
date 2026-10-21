import 'package:flutter/material.dart';

import '../../core/widgets/app_text_field.dart';

class ChangePasswordDialog extends StatelessWidget {
  const ChangePasswordDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Row(
        children: [
          const Expanded(child: Text('Заміна пароля')),
          IconButton(
            tooltip: 'Закрити',
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      content: const SizedBox(
        width: 420,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextField(label: 'Поточний пароль', isPassword: true),
            SizedBox(height: 16),
            AppTextField(
              label: 'Новий пароль',
              isPassword: true,
              helperText: 'Щонайменше 8 символів, літери та цифри',
            ),
            SizedBox(height: 16),
            AppTextField(label: 'Підтвердіть новий пароль', isPassword: true),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Скасувати')),
        FilledButton(onPressed: () => Navigator.pop(context), child: const Text('Змінити')),
      ],
    );
  }
}