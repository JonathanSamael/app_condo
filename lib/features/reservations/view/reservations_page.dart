import 'package:adcondo_app/app/components/app_bar_component.dart';
import 'package:adcondo_app/features/reservations/model/reservation_model.dart';
import 'package:adcondo_app/app/utils/app_colors.dart';
import 'package:adcondo_app/features/reservations/view/reservation_card_component.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReservationsPage extends StatefulWidget {
  const ReservationsPage({super.key});

  @override
  State<ReservationsPage> createState() => _ReservationsPageState();
}

class _ReservationsPageState extends State<ReservationsPage> {
  final List<ReserveModel> booking = [
    ReserveModel(
      id: "1",
      localId: "1",
      localName: "Piscina",
      userId: "1",
      userName: "Johnson",
      image:
          "https://www.4devs.com.br/4devs_gerador_imagem.php?acao=gerar_imagem&txt_largura=320&txt_altura=180&extensao=png&fundo_r=0.06274509803921569&fundo_g=0.996078431372549&fundo_b=0.9568627450980393&texto_r=0&texto_g=0&texto_b=0&texto=Gerador%20Imagem%20%234Devs&tamanho_fonte=10",
      bookingDate: DateTime(2025, 7, 15),
      startTime: const TimeOfDay(hour: 12, minute: 00),
      endTime: const TimeOfDay(hour: 14, minute: 00),
      status: StatusReserva.aprovada,
      creatingDate: DateTime(2025, 7, 10),
    ),
    ReserveModel(
      id: "2",
      localId: "2",
      localName: "Salão de festa",
      userId: "2",
      userName: "Johnson",
      image:
          "https://www.4devs.com.br/4devs_gerador_imagem.php?acao=gerar_imagem&txt_largura=320&txt_altura=180&extensao=png&fundo_r=0.06274509803921569&fundo_g=0.996078431372549&fundo_b=0.9568627450980393&texto_r=0&texto_g=0&texto_b=0&texto=Gerador%20Imagem%20%234Devs&tamanho_fonte=10",
      bookingDate: DateTime(2025, 7, 8),
      startTime: const TimeOfDay(hour: 12, minute: 00),
      endTime: const TimeOfDay(hour: 14, minute: 00),
      status: StatusReserva.aprovada,
      creatingDate: DateTime(2025, 7, 2),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(
          background: AppColors.backgroundColorLight,
          title: "Reservas",
          iconColor: AppColors.textColorPrimaryBlue),
      backgroundColor: AppColors.backgroundColorDark,
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: booking.isEmpty
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
                        "Nenhuma reserva disponível",
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
                  itemCount: booking.length,
                  itemBuilder: (context, index) {
                    return ReservationCardComponent(booking: booking[index]);
                  },
                )),
    );
  }
}
