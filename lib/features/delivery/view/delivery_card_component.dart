import 'package:app_condo/features/delivery/model/delivery_model.dart';
import 'package:app_condo/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DeliveryCardComponent extends StatelessWidget {
  final DeliveryModel delivery;

  const DeliveryCardComponent({super.key, required this.delivery});

  @override
  Widget build(BuildContext context) {
    String statusText;
    Color statusColor;
    Color statusTextColor = AppColors.textColorWhite;

    switch (delivery.status) {
      case DeliveryStatus.retirado:
        statusText = 'Retirado';
        statusColor = AppColors.successColor;
        break;
      case DeliveryStatus.naoRetirada:
        statusText = 'Não retirada';
        statusColor = AppColors.warningColor;
        break;
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 1.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.inventory_2_outlined,
              size: 40.0,
              color: Colors.black54,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Unidade ${delivery.unitNumber}',
                    style: GoogleFonts.montserrat(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'Recebido em ${DateFormat('dd/MM/yyyy').format(delivery.receivedDate)}',
                    style: GoogleFonts.montserrat(
                      fontSize: 14.0,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: statusColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      statusText,
                      style: GoogleFonts.montserrat(
                        color: statusTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
