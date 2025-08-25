import 'package:adcondo_app/app/components/buttons.dart';
import 'package:adcondo_app/features/reservations/model/reservation_model.dart';
import 'package:adcondo_app/app/utils/app_colors.dart';
import 'package:adcondo_app/features/reservations/view/calendar_reservation_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReservationCardComponent extends StatelessWidget {
  final ReserveModel booking;
  const ReservationCardComponent({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              booking.image,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  booking.localName,
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColorPrimaryBlue,
                  ),
                ),
                PrimaryButtonComponent(
                  text: "Reservar",
                  width: 120,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (builder) => CalendarReservationPage(
                              booking: booking,
                            )));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // return Card(
    //   margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
    //   child: Column(
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Align(
    //           alignment: Alignment.centerLeft,
    //           child: Text(
    //             booking.localName,
    //             style: GoogleFonts.montserrat(
    //               color: AppColors.primaryColor,
    //               fontSize: 16,
    //               fontWeight: FontWeight.w600,
    //             ),
    //           ),
    //         ),
    //       ),
    //       Image.network(
    //         booking.image,
    //         fit: BoxFit.fitWidth,
    //       ),
    //       Align(
    //         alignment: AlignmentDirectional.centerEnd,
    //         child: Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: PrimaryButtonComponent(
    //             text: "Reservar",
    //             width: 120,
    //             onPressed: () {},
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
