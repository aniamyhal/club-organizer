import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_colors.dart';

class AppShell extends StatelessWidget {
  const AppShell({required this.state, required this.child, super.key});

  final GoRouterState state;
  final Widget child;

  String get activeRoute => state.uri.path;

  String get title => switch (activeRoute) {
    '/home' => 'Вітаємо, Анно!',
    '/schedule' => 'Розклад',
    '/members' => 'Учасники',
    '/tasks' => 'Завдання',
    '/materials' => 'Матеріали',
    '/profile' => 'Профіль',
    _ => '',
  };

  String get subtitle => switch (activeRoute) {
    '/home' => 'Четвер, 1 жовтня 2026',
    '/schedule' => 'Плануйте зустрічі та заняття гуртка.',
    '/members' => 'Керуйте списком учасників гуртка.',
    '/tasks' => 'Переглядайте завдання гуртка.',
    '/materials' => 'Зберігайте навчальні матеріали.',
    '/profile' => 'Керуйте особистими даними та налаштуваннями безпеки',
    _ => '',
  };

  static const _routes = <String>[
    '/home',
    '/schedule',
    '/members',
    '/tasks',
    '/materials',
    '/profile',
  ];
  static const _labels = <String>[
    'Головна',
    'Розклад',
    'Учасники',
    'Завдання',
    'Матеріали',
    'Профіль',
  ];
  static const _icons = <IconData>[
    Icons.home_outlined,
    Icons.calendar_month_outlined,
    Icons.people_outline,
    Icons.task_alt_outlined,
    Icons.folder_outlined,
    Icons.person_outline,
  ];

  void _navigate(BuildContext context, String route) {
    if (route != activeRoute) context.go(route);
  }

  @override
  Widget build(BuildContext context) {
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _PageHeader(title: title, subtitle: subtitle),
        Expanded(child: child),
      ],
    );
    final compact = MediaQuery.sizeOf(context).width < 700;
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            if (!compact)
              _SideNavigation(
                activeRoute: activeRoute,
                onSelect: (route) => _navigate(context, route),
              ),
            Expanded(child: content),
          ],
        ),
      ),
      bottomNavigationBar: compact
          ? NavigationBar(
              selectedIndex: _routes
                  .indexOf(activeRoute)
                  .clamp(0, _routes.length - 1),
              onDestinationSelected: (index) =>
                  _navigate(context, _routes[index]),
              destinations: List.generate(
                _routes.length,
                (index) => NavigationDestination(
                  icon: Icon(_icons[index]),
                  label: _labels[index],
                ),
              ),
            )
          : null,
    );
  }
}

class _SideNavigation extends StatelessWidget {
  const _SideNavigation({required this.activeRoute, required this.onSelect});

  final String activeRoute;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      color: AppColors.rail,
      child: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Icon(
                Icons.school_outlined,
                color: AppColors.primary,
                size: 30,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (
                      var index = 0;
                      index < AppShell._routes.length;
                      index++
                    )
                      _RailItem(
                        icon: AppShell._icons[index],
                        label: AppShell._labels[index],
                        selected: activeRoute == AppShell._routes[index],
                        onTap: () => onSelect(AppShell._routes[index]),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RailItem extends StatelessWidget {
  const _RailItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Container(
          width: 80,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
          decoration: BoxDecoration(
            color: selected ? AppColors.primaryContainer : Colors.transparent,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              Icon(icon, color: selected ? AppColors.primary : AppColors.muted),
              const SizedBox(height: 4),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10,
                  color: selected ? AppColors.primary : AppColors.muted,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 24, 32, 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(color: AppColors.muted, fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          InkWell(
  customBorder: const CircleBorder(),
  onTap: () => context.go('/profile'),
  child: const CircleAvatar(
    radius: 22,
    backgroundColor: AppColors.primaryContainer,
    child: Text(
      'АМ',
      style: TextStyle(
        color: AppColors.primary,
        fontWeight: FontWeight.w700,
      ),
    ),
  ),
),
        ],
      ),
    );
  }
}
