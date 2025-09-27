import 'package:app_condo/features/payments/model/payment_model.dart';
import 'package:app_condo/app/utils/app_colors.dart';
import 'package:app_condo/app/utils/show_name_payment_method.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethodsCardComponent extends StatelessWidget {
  final String text;
  final String image;
  final PaymentMethodType method;
  final bool isSelected;
  const PaymentMethodsCardComponent({
    super.key,
    required this.text,
    required this.image,
    required this.method,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.textColorWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? AppColors.primaryColor : Colors.transparent,
          width: isSelected ? 2.0 : 0.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            image,
            height: 50,
          ),
          const SizedBox(width: 15),
          Text(
            showName(method.name),
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.backgroundColorDark,
            ),
          ),
        ],
      ),
    );

    // return Container(
    //   width: size.width,
    //   padding: const EdgeInsets.all(12.0),
    //   decoration: BoxDecoration(
    //     color: AppColors.textColorWhite,
    //     shape: BoxShape.rectangle,
    //     borderRadius: BorderRadius.circular(16),
    //   ),
    //   child: Row(
    //     children: [
    //       Image.asset(
    //         image,
    //         height: 50,
    //       ),
    //       const SizedBox(
    //         width: 20,
    //       ),
    //       Text(
    //         text,
    //         style: GoogleFonts.montserrat(
    //             fontSize: 18, fontWeight: FontWeight.w500),
    //       )
    //     ],
    //   ),
    // );
  }
}
