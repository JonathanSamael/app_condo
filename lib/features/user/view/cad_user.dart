import 'dart:developer';

import 'package:adcondo_app/app/components/custom_background.dart';
import 'package:adcondo_app/app/core/services/providers.dart';
import 'package:adcondo_app/app/utils/enums.dart';
import 'package:adcondo_app/app/utils/validators.dart';
import 'package:adcondo_app/features/user/view/cad_address_user.dart';
import 'package:adcondo_app/app/components/buttons.dart';
import 'package:adcondo_app/app/components/inputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CadUser extends ConsumerStatefulWidget {
  const CadUser({super.key});

  @override
  ConsumerState<CadUser> createState() => _CadUserState();
}

class _CadUserState extends ConsumerState<CadUser> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _nascController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: CustomBackground(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'assets/logo_black.png',
                  fit: BoxFit.contain,
                  width: 230,
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Text(
                    "Complete seu cadastro",
                    style: GoogleFonts.montserrat(
                        fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      InputField(
                        hintText: user!.nomeCompleto,
                        prefixIcon: Icons.person_pin,
                        controller: _nameController,
                        validator: Validators.required,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InputField(
                        enabled: true,
                        hintText: user.dataNascimento.toFormattedDate(),
                        prefixIcon: Icons.calendar_month_outlined,
                        controller: _nascController,
                        keyboardType: TextInputType.datetime,
                        validator: Validators.required,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InputField(
                        hintText: user.documentos[0].documento,
                        prefixIcon: Icons.description,
                        controller: _cpfController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          Validators.cpf(value) ?? Validators.required(value);
                          return value;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InputField(
                        hintText: user.email,
                        // hintText: "Email",
                        prefixIcon: Icons.email,
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: Validators.email,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InputField(
                        hintText: user.contatos[0].contato,
                        prefixIcon: Icons.mobile_friendly,
                        controller: _phoneNumberController,
                        keyboardType: TextInputType.phone,
                        validator: Validators.telefone,
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
                      text: "Próximo",
                      width: 130,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const CadAddressUser(),
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}

extension DateFormatExtension on DateTime {
  String toFormattedDate() => DateFormat('dd/MM/yyyy').format(this);
}
