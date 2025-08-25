import 'package:adcondo_app/app/components/app_bar_component.dart';
import 'package:adcondo_app/features/notices/view/notice_card_component.dart';
import 'package:adcondo_app/features/notices/model/notices_model.dart';
import 'package:adcondo_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoticesPage extends StatelessWidget {
  const NoticesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<NoticesModel> notices = [
      NoticesModel(
        name: 'Eleição de sindico',
        description: 'Votação online',
        icon: Icons.how_to_vote,
        timestamp: DateTime.now().subtract(const Duration(minutes: 50)),
        onClick: () {},
      ),
      NoticesModel(
        name: 'Manutenção',
        description: 'Serviço',
        icon: Icons.work_history_outlined,
        timestamp: DateTime.now().subtract(const Duration(days: 1, minutes: 5)),
        onClick: () {},
      ),
      NoticesModel(
        name: 'Limpeza da Piscina',
        description: 'Serviço',
        icon: Icons.pool,
        timestamp: DateTime.now().subtract(const Duration(days: 5)),
        onClick: () {},
      ),
      NoticesModel(
        name: 'Horários e dias de mudança',
        description: 'Informe',
        icon: Icons.info,
        timestamp: DateTime.now().subtract(const Duration(days: 8)),
        onClick: () {},
      ),
    ];

    final List<NoticesModel> emptyNotices = [];

    return Scaffold(
      appBar: const AppBarComponent(
          background: AppColors.backgroundColorLight,
          title: "Mural de Avisos",
          iconColor: AppColors.backgroundColorDark),
      backgroundColor: AppColors.backgroundColorDark,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: notices.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: AppColors.textColorWhite,
                      size: 35,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Nenhum aviso disponível",
                      style: GoogleFonts.montserrat(
                        color: AppColors.textColorWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: notices.length,
                itemBuilder: (context, index) {
                  return NoticeCardComponent(notices: notices[index]);
                },
              ),
      ),
    );
  }
}
