import 'package:adcondo_app/app/components/buttons.dart';
import 'package:adcondo_app/app/components/navigator_bar.dart';
import 'package:adcondo_app/app/core/services/providers.dart';
import 'package:adcondo_app/app/utils/app_colors.dart';
import 'package:adcondo_app/features/user/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({super.key});

  @override
  ConsumerState<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends ConsumerState<SettingsView> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const NavBarComponent(),
              ),
            );
          },
          icon: const Icon(Icons.close),
          color: AppColors.primaryColor,
        ),
        title: Text(
          "Configurações",
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textColorPrimaryBlue,
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundColorLight,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Card(
              shadowColor: AppColors.transparent,
              color: AppColors.accentColor,
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const SettingsView(),
                      ),
                    );
                  },
                  icon: (user?.foto != null && user!.foto!.isNotEmpty)
                      ? ClipOval(
                          child: Image.network(
                            user.foto!,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Icon(
                          Icons.account_circle,
                          size: 40,
                          color: AppColors.primaryColor,
                        ),
                  color: AppColors.textColorWhite,
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user!.nomeCompleto,
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColorPrimaryBlue,
                      ),
                    ),
                    Text(
                      "Cond. Nome do condomínio",
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColorPrimaryBlue,
                      ),
                    ),
                  ],
                ),
                subtitle: Text(
                  "Bloco A, apto 202",
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.inputElements,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Conta',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColorPrimaryBlue,
                ),
              ),
              contentPadding: const EdgeInsets.all(8.0),
              leading: const Icon(
                Icons.person_2_outlined,
                color: AppColors.primaryColor,
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_right,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            const Divider(
              height: 10,
            ),
            ListTile(
              title: Text(
                'Condomínio',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColorPrimaryBlue,
                ),
              ),
              contentPadding: const EdgeInsets.all(8.0),
              leading: const Icon(
                Icons.groups_2_outlined,
                color: AppColors.primaryColor,
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_right,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            const Divider(
              height: 10,
            ),
            ListTile(
              title: Text(
                'Métodos de Pagamento',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColorPrimaryBlue,
                ),
              ),
              contentPadding: const EdgeInsets.all(8.0),
              leading: const Icon(
                Icons.attach_money_rounded,
                color: AppColors.primaryColor,
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_right,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            const Divider(
              height: 10,
            ),
            ListTile(
              title: Text(
                'Fale com o Condomínio',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColorPrimaryBlue,
                ),
              ),
              contentPadding: const EdgeInsets.all(8.0),
              leading: const Icon(
                Icons.mic_none,
                color: AppColors.primaryColor,
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_right,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            const Divider(
              height: 10,
            ),
            ListTile(
              title: Text(
                'Privacidade e Segurança',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColorPrimaryBlue,
                ),
              ),
              contentPadding: const EdgeInsets.all(8.0),
              leading: const Icon(
                Icons.security_outlined,
                color: AppColors.primaryColor,
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_right,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            const Divider(
              height: 10,
            ),
            ListTile(
              title: Text(
                'Suporte',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColorPrimaryBlue,
                ),
              ),
              contentPadding: const EdgeInsets.all(8.0),
              leading: const Icon(
                Icons.help_outline_rounded,
                color: AppColors.primaryColor,
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_right,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            const Divider(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: TextButtonComponent(
                  text: 'Sair',
                  onPressed: () {
                    ref.read(userProvider.notifier).state = null;

                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  color: AppColors.errorColor),
            )
          ],
        ),
      ),
    );
  }
}
