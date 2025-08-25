import 'package:adcondo_app/app/components/app_bar_component.dart';
import 'package:adcondo_app/features/notifications/view/notification_card.dart';
import 'package:adcondo_app/features/notifications/model/notification_model.dart';
import 'package:adcondo_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List<NotificationModel> fakeData = [
    NotificationModel(
      name: 'Maria Silva',
      description: '🏠 Morador - Reconhecimento facial',
      imageUrl: 'https://avatar.iran.liara.run/public/47',
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
    NotificationModel(
      name: 'João Souza',
      description: '🏠 Morador - Reconhecimento facial',
      imageUrl: 'https://avatar.iran.liara.run/public/19',
      timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 3)),
    ),
    NotificationModel(
      name: 'João Souza',
      description: '🏠 Morador - Reconhecimento facial',
      imageUrl: 'https://avatar.iran.liara.run/public/2',
      timestamp: DateTime.now().subtract(const Duration(days: 2, hours: 7)),
    ),
    NotificationModel(
      name: 'João Souza',
      description: '🏠 Morador - Reconhecimento facial',
      imageUrl: 'https://avatar.iran.liara.run/public/10',
      timestamp: DateTime.now().subtract(const Duration(days: 2, hours: 4)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final grouped = groupByDate(fakeData);
    return Scaffold(
      appBar: const AppBarComponent(
        background: AppColors.backgroundColorDark,
        title: "Notificações",
        iconColor: AppColors.backgroundColorLight,
      ),
      body: ListView(
        children: grouped.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 0, 8),
                child: Text(
                  entry.key,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              ...entry.value.map((item) => NotificationCard(access: item)),
            ],
          );
        }).toList(),
      ),
    );
  }
}

Map<String, List<NotificationModel>> groupByDate(List<NotificationModel> list) {
  final Map<String, List<NotificationModel>> grouped = {};
  final now = DateUtils.dateOnly(DateTime.now());

  for (final access in list) {
    final date = DateUtils.dateOnly(access.timestamp);
    final difference = now.difference(date).inDays;

    String key;

    switch (difference) {
      case 0:
        key = 'Hoje';
        break;
      case 1:
        key = 'Ontem';
        break;
      default:
        key = DateFormat('dd/MM/yy').format(date);
    }

    grouped.putIfAbsent(key, () => []).add(access);
  }

  return grouped;
}
