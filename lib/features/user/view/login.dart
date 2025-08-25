import 'dart:developer';

import 'package:adcondo_app/app/components/navigator_bar.dart';
import 'package:adcondo_app/app/components/snack_bar_component.dart';
import 'package:adcondo_app/app/core/services/auth_service.dart';
import 'package:adcondo_app/app/core/services/providers.dart';
import 'package:adcondo_app/app/core/services/user_service.dart';
import 'package:adcondo_app/app/utils/app_colors.dart';
import 'package:adcondo_app/app/utils/validators.dart';
import 'package:adcondo_app/features/user/view/cad_user.dart';
import 'package:adcondo_app/app/components/buttons.dart';
import 'package:adcondo_app/app/components/inputs.dart';
import 'package:adcondo_app/features/user/view/pre_cad_person.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_fonts/google_fonts.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool _isHidden = true;

  void togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColorDark,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.asset(
                'assets/logo_white.png',
                fit: BoxFit.contain,
                width: 230,
              ),
              const SizedBox(
                height: 80,
              ),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                width: 300,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: Image.asset(
                          'assets/AdCondo_logo_medium.png',
                          width: 160,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 25),
                      InputField(
                        enabled: true,
                        hintText: "Email",
                        prefixIcon: Icons.person_pin,
                        controller: _userController,
                        keyboardType: TextInputType.emailAddress,
                        validator: Validators.email,
                      ),
                      const SizedBox(height: 16),
                      Stack(children: [
                        InputField(
                          enabled: true,
                          hintText: "Senha",
                          prefixIcon: Icons.key,
                          controller: _passController,
                          validator: Validators.strongPassword,
                          obscuredText: _isHidden,
                          suffixIcon: InkWell(
                            onTap: togglePasswordView,
                            child: Icon(
                              _isHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppColors.inputElements,
                            ),
                          ),
                        ),
                      ]),
                      const SizedBox(height: 24),
                      PrimaryButtonComponent(
                        text: "Entrar",
                        width: 160.0,
                        onPressed: () async {
                          final email = _userController.text;
                          final password = _passController.text;

                          try {
                            final authService = ref.read(authServiceProvider);
                            var userLogin =
                                await authService.login(email, password);
                            ref.read(userLoginProvider.notifier).state =
                                userLogin;

                            final userService = ref.read(userServiceProvider);

                            final getUser =
                                await userService.getUser(userLogin.pessoaId);

                            inspect(getUser);
                            
                            ref.read(userProvider.notifier).state = getUser;

                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) =>
                                    // const NavBarComponent(),
                                    userLogin.firstLogin
                                        ? const PreCadPerson()
                                        : const NavBarComponent(),
                              ),
                            );
                          } catch (e) {
                            print(e);
                            CustomSnackBar.error(context,
                                message:
                                    "Erro ao tentar fazer login. Verifique suas credenciais.");
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                      "Ainda não tem uma conta?",
                      style: GoogleFonts.montserrat(
                        color: AppColors.textColorWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      visualDensity: VisualDensity.compact,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {},
                    child: TextButtonComponent(
                      text: "Cadastre-se aqui!",
                      color: AppColors.textColorWhite,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const CadUser(),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
