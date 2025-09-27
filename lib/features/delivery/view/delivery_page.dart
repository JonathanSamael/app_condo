import 'package:app_condo/app/components/app_bar_component.dart';
import 'package:app_condo/features/delivery/model/delivery_model.dart';
import 'package:app_condo/app/utils/app_colors.dart';
import 'package:app_condo/features/delivery/view/delivery_card_component.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  final List<DeliveryModel> _deliveries = [
    DeliveryModel(
      unitNumber: '1002',
      receivedDate: DateTime(2025, 4, 16),
      status: DeliveryStatus.retirado,
    ),
    DeliveryModel(
      unitNumber: '1002',
      receivedDate: DateTime(2025, 4, 16),
      status: DeliveryStatus.naoRetirada,
    ),
    DeliveryModel(
      unitNumber: '501',
      receivedDate: DateTime(2025, 7, 5),
      status: DeliveryStatus.naoRetirada,
    ),
    DeliveryModel(
      unitNumber: '203',
      receivedDate: DateTime(2025, 7, 1),
      status: DeliveryStatus.retirado,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(
        background: AppColors.backgroundColorLight,
        title: "Entregas",
        iconColor: AppColors.backgroundColorDark,
      ),
      backgroundColor: AppColors.backgroundColorDark,
      body: Stack(
        children: [
          Container(
            color: const Color(0xFF1E3A5F),
            child: _deliveries.isEmpty
                ? Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "___",
                                  style: GoogleFonts.montserrat(
                                    color: AppColors.textColorWhite,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  " _ ___",
                                  style: GoogleFonts.montserrat(
                                    color: AppColors.textColorWhite,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.local_shipping_rounded,
                              color: AppColors.textColorWhite,
                              size: 35,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Nenhuma entrega encontrada...",
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
                    padding: const EdgeInsets.only(top: 16.0, bottom: 80.0),
                    itemCount: _deliveries.length,
                    itemBuilder: (context, index) {
                      return DeliveryCardComponent(
                          delivery: _deliveries[index]);
                    },
                  ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            heightFactor: 12,
            child: FloatingActionButton(
              onPressed: () {
                print('Add new delivery tapped!');
              },
              backgroundColor: AppColors.backgroundColorLight,
              shape: const CircleBorder(),
              child:
                  const Icon(Icons.add, color: AppColors.backgroundColorDark),
            ),
          ),
        ],
      ),
    );
  }
}
