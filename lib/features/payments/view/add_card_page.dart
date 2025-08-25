import 'package:adcondo_app/app/components/buttons.dart';
import 'package:adcondo_app/app/components/inputs.dart';
import 'package:adcondo_app/app/utils/app_colors.dart';
import 'package:adcondo_app/app/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _validController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';

  bool isChecked = false;

  Color getColor(Set<WidgetState> states) {
    const Set<WidgetState> interactiveStates = <WidgetState>{
      WidgetState.pressed,
      WidgetState.hovered,
      WidgetState.focused,
      WidgetState.selected
    };
    if (states.any(interactiveStates.contains)) {
      return AppColors.backgroundColorDark;
    }
    return AppColors.cardColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Adicionar  Cartão",
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textColorPrimaryBlue,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_rounded),
          color: AppColors.primaryColor,
        ),
      ),
      backgroundColor: AppColors.backgroundColorLight,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CreditCardWidget(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: false,
                  onCreditCardWidgetChange: (CreditCardBrand brand) {},
                  cardBgColor: AppColors.backgroundColorDark,
                  enableFloatingCard: true,
                  floatingConfig: const FloatingConfig(
                    isGlareEnabled: true,
                    isShadowEnabled: true,
                    shadowConfig: FloatingShadowConfig(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      InputField(
                        enabled: true,
                        hintText: "Número do cartão",
                        keyboardType: TextInputType.number,
                        prefixIcon: Icons.add_card_rounded,
                        controller: _cardNumberController,
                        validator: Validators.required,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InputField(
                        enabled: true,
                        hintText: "Nome",
                        prefixIcon: Icons.account_circle_rounded,
                        controller: _nameController,
                        validator: Validators.required,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: InputField(
                              enabled: true,
                              hintText: "Valid.",
                              prefixIcon: Icons.credit_score_rounded,
                              controller: _validController,
                              keyboardType: TextInputType.number,
                              validator: Validators.required,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            flex: 3,
                            child: InputField(
                              enabled: true,
                              hintText: "CVV",
                              prefixIcon: Icons.credit_score_rounded,
                              controller: _cvvController,
                              keyboardType: TextInputType.number,
                              validator: Validators.required,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: isChecked,
                            checkColor: AppColors.textColorWhite,
                            fillColor:
                                WidgetStateProperty.resolveWith(getColor),
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          Text(
                            "Salvar cartão para depois.",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SecondaryButtonComponent(
                      text: "Cancelar",
                      width: 130,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    PrimaryButtonComponent(
                      text: "Salvar",
                      width: 130,
                      onPressed: () {
                        // Navigator.of(context).pushReplacement(
                        //   MaterialPageRoute(
                        //     builder: (context) => const CardPaymentPage(
                        //         paymentMethod: paymentMethod),
                        //   ),
                        // );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
