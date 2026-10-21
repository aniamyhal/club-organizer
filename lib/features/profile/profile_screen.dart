import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_shell.dart';
import '../../core/widgets/app_text_field.dart';
import '../../core/widgets/section_card.dart';
import 'change_password_dialog.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShell(
      title: 'Профіль',
      subtitle: 'Керуйте особистими даними та налаштуваннями безпеки',
      activeRoute: '/profile',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final narrow = constraints.maxWidth < 900;
          final profile = const _ProfileCard();
          const details = _ProfileDetails();
          return narrow
              ? Column(children: [profile, const SizedBox(height: 20), details])
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 280, child: profile),
                    const SizedBox(width: 24),
                    const Expanded(child: details),
                  ],
                );
        },
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              const CircleAvatar(
                radius: 48,
                backgroundColor: AppColors.primaryContainer,
                child: Text('АМ', style: TextStyle(fontSize: 24, color: AppColors.primary, fontWeight: FontWeight.w700)),
              ),
              Positioned(
                right: -2,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
                  child: const Icon(Icons.camera_alt_outlined, size: 18, color: AppColors.primary),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Анна Мигаль', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          const Text('anna.myhal@gmail.com', textAlign: TextAlign.center, style: TextStyle(color: AppColors.muted)),
          const SizedBox(height: 14),
          const _RoleBadge(),
          const SizedBox(height: 24),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt_outlined),
            label: const Text('Змінити фото'),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(foregroundColor: AppColors.danger),
            child: const Text('Видалити фото'),
          ),
        ],
      ),
    );
  }
}

class _RoleBadge extends StatelessWidget {
  const _RoleBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: AppColors.primaryContainer, borderRadius: BorderRadius.circular(24)),
      child: const Text('Керівник гуртка', style: TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.w600)),
    );
  }
}

class _ProfileDetails extends StatelessWidget {
  const _ProfileDetails();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionCard(
          title: 'Особисті дані',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Оновіть контактну інформацію профілю', style: TextStyle(color: AppColors.muted)),
              const SizedBox(height: 20),
              LayoutBuilder(
                builder: (context, constraints) {
                  final narrow = constraints.maxWidth < 520;
                  final firstName = const AppTextField(label: "Ім'я", initialValue: 'Анна');
                  final lastName = const AppTextField(label: 'Прізвище', initialValue: 'Мигаль');
                  final email = const AppTextField(label: 'Email', initialValue: 'anna.myhal@gmail.com', keyboardType: TextInputType.emailAddress);
                  final phone = const AppTextField(label: 'Телефон', initialValue: '+380 67 456 78 90', keyboardType: TextInputType.phone);
                  if (narrow) {
                    return Column(
                      children: [firstName, const SizedBox(height: 16), lastName, const SizedBox(height: 16), email, const SizedBox(height: 16), phone],
                    );
                  }
                  return Column(
                    children: [
                      Row(children: [Expanded(child: firstName), const SizedBox(width: 16), Expanded(child: lastName)]),
                      const SizedBox(height: 16),
                      Row(children: [Expanded(child: email), const SizedBox(width: 16), Expanded(child: phone)]),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: FilledButton(
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Зміни збережено')),
                  ),
                  child: const Text('Зберегти зміни'),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SectionCard(
          title: 'Безпека',
          child: Row(
            children: [
              const Icon(Icons.lock_outline, color: AppColors.primary),
              const SizedBox(width: 12),
              const Expanded(child: Text('Пароль облікового запису')),
              OutlinedButton(
                onPressed: () => showDialog<void>(
                  context: context,
                  barrierColor: Colors.black.withValues(alpha: 0.4),
                  builder: (context) => const ChangePasswordDialog(),
                ),
                child: const Text('Змінити пароль'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false),
            icon: const Icon(Icons.logout),
            label: const Text('Вийти з облікового запису'),
            style: TextButton.styleFrom(foregroundColor: AppColors.danger),
          ),
        ),
      ],
    );
  }
}