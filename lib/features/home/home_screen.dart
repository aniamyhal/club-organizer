import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_shell.dart';
import '../../core/widgets/section_card.dart';
import '../../core/widgets/status_badge.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _meetings = <_MeetingData>[
    _MeetingData('03', 'ЖОВ', 'Кольори та ангоби', '17:00–18:30', 'Майстерня 2'),
    _MeetingData('08', 'ЖОВ', 'Створюємо власну чашку', '16:30–18:00', 'Майстерня 1'),
    _MeetingData('15', 'ЖОВ', 'Глазурування виробів', '16:30–18:00', 'Майстерня 2'),
  ];

  static const _tasks = <_TaskData>[
    _TaskData('Підготувати ескіз виробу', 'Нове'),
    _TaskData('Здати фото готової роботи', 'Нове'),
    _TaskData('Переглянути техніку безпеки', 'Виконано'),
  ];

  @override
  Widget build(BuildContext context) {
    return AppShell(
      title: 'Вітаємо, Анно!',
      subtitle: 'Четвер, 1 жовтня 2026',
      activeRoute: '/home',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final narrow = constraints.maxWidth < 800;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (narrow)
                const Column(
                  children: [
                    _NextMeetingCard(),
                    SizedBox(height: 16),
                    _MetricCards(),
                  ],
                )
              else
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: _NextMeetingCard()),
                    SizedBox(width: 16),
                    Expanded(flex: 1, child: _MetricCards()),
                  ],
                ),
              const SizedBox(height: 24),
              const _QuickActions(),
              const SizedBox(height: 24),
              if (narrow)
                const Column(
                  children: [
                    _MeetingList(meetings: _meetings),
                    SizedBox(height: 20),
                    _TaskList(tasks: _tasks),
                  ],
                )
              else
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _MeetingList(meetings: _meetings)),
                    SizedBox(width: 20),
                    Expanded(child: _TaskList(tasks: _tasks)),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}

class _NextMeetingCard extends StatelessWidget {
  const _NextMeetingCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: AppColors.primaryContainer, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('НАЙБЛИЖЧА ЗУСТРІЧ', style: TextStyle(fontSize: 12, letterSpacing: 1, fontWeight: FontWeight.w700, color: AppColors.primary)),
          const SizedBox(height: 18),
          const Text('Основи ліплення з глини', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          const Text('Сьогодні, 16:30–18:00', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          const Text('Майстерня 2', style: TextStyle(color: AppColors.muted)),
          const SizedBox(height: 20),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              FilledButton(onPressed: () {}, child: const Text('Відкрити')),
              OutlinedButton(onPressed: () {}, child: const Text('Учасники (8)')),
            ],
          ),
        ],
      ),
    );
  }
}

class _MetricCards extends StatelessWidget {
  const _MetricCards();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _MetricCard(number: '12', label: 'Учасників гуртка', icon: Icons.people_outline),
        SizedBox(height: 16),
        _MetricCard(number: '5', label: 'Відкритих завдань', icon: Icons.task_alt_outlined),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({required this.number, required this.label, required this.icon});

  final String number;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(number, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
                Text(label, style: const TextStyle(color: AppColors.muted, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActions extends StatelessWidget {
  const _QuickActions();

  @override
  Widget build(BuildContext context) {
    const actions = <(IconData, String)>[
      (Icons.event_available_outlined, 'Нова зустріч'),
      (Icons.person_add_alt_outlined, 'Новий учасник'),
      (Icons.add_task, 'Нове завдання'),
      (Icons.file_upload_outlined, 'Завантажити матеріал'),
    ];
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: actions
          .map(
            (action) => OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, size: 18),
              label: Text(action.$2),
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.primaryContainer,
                side: BorderSide.none,
                foregroundColor: AppColors.primary,
              ),
            ),
          )
          .toList(),
    );
  }
}

class _MeetingData {
  const _MeetingData(this.day, this.month, this.title, this.time, this.place);
  final String day;
  final String month;
  final String title;
  final String time;
  final String place;
}

class _MeetingList extends StatelessWidget {
  const _MeetingList({required this.meetings});
  final List<_MeetingData> meetings;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Найближчі зустрічі',
      trailing: const Text('4 заплановано', style: TextStyle(color: AppColors.muted, fontSize: 12)),
      child: Column(
        children: meetings
            .map(
              (meeting) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Container(
                      width: 52,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(color: AppColors.primaryContainer, borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          Text(meeting.day, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.primary)),
                          Text(meeting.month, style: const TextStyle(fontSize: 10, color: AppColors.primary, fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(meeting.title, style: const TextStyle(fontWeight: FontWeight.w600)),
                          const SizedBox(height: 4),
                          Text('${meeting.time} · ${meeting.place}', style: const TextStyle(color: AppColors.muted, fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _TaskData {
  const _TaskData(this.title, this.status);
  final String title;
  final String status;
}

class _TaskList extends StatelessWidget {
  const _TaskList({required this.tasks});
  final List<_TaskData> tasks;

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Завдання',
      trailing: const Text('3 відкриті', style: TextStyle(color: AppColors.muted, fontSize: 12)),
      child: Column(
        children: tasks
            .map(
              (task) => Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Text(task.title, style: const TextStyle(fontWeight: FontWeight.w500))),
                    const SizedBox(width: 8),
                    StatusBadge(label: task.status),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}