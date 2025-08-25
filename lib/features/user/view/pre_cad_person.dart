import 'package:adcondo_app/app/core/services/api_service.dart';
import 'package:adcondo_app/app/core/services/providers.dart';
import 'package:adcondo_app/app/core/services/user_service.dart';
import 'package:adcondo_app/app/utils/app_colors.dart';
import 'package:adcondo_app/features/user/view/change_password.dart';
import 'package:adcondo_app/app/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class PreCadPerson extends ConsumerStatefulWidget {
  const PreCadPerson({super.key});

  @override
  ConsumerState<PreCadPerson> createState() => _PreCadPersonState();
}

class _PreCadPersonState extends ConsumerState<PreCadPerson> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);

    return Scaffold(
      backgroundColor: AppColors.backgroundColorLight,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 55, 0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Olá, ${user!.nomeCompleto}!',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.montserrat(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Esse é seu primeiro acesso, por favor redefina sua senha e complete seu cadastro.",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.montserrat(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                PrimaryButtonComponent(
                  text: "Redefinir senha",
                  width: 165,
                  onPressed: () {
                    final api = ApiService();
                    final userService = UserService(api);

                    userService.updateLoginStatus(user.userId);

                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const ChangePassword(),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextButtonComponent(
                    text: "Cancelar",
                    color: AppColors.primaryColor,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.only(left: 0, bottom: 0),
                child: Image.asset(
                  "assets/products.png",
                  width: 250,
                  height: 300,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
