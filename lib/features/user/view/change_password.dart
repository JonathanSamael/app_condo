import 'package:adcondo_app/app/utils/app_colors.dart';
import 'package:adcondo_app/app/utils/validators.dart';
import 'package:adcondo_app/features/user/view/cad_user.dart';
import 'package:adcondo_app/app/components/buttons.dart';
import 'package:adcondo_app/app/components/inputs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _rePassController = TextEditingController();
  bool _senhaOK = false;
  bool _isHidden = true;
  bool _reIsHidden = true;

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _toggleRePasswordView() {
    setState(() {
      _reIsHidden = !_reIsHidden;
    });
  }

  void _onPasswordChanged(String value) {
    setState(() {
      _senhaOK = true;
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
                          width: 120,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Redefina sua senha",
                        style: GoogleFonts.montserrat(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Digite sua nova senha abaixo e repita em seguida",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(height: 15),
                      InputField(
                        enabled: true,
                        hintText: "Nova senha",
                        prefixIcon: Icons.key,
                        controller: _passController,
                        obscuredText: _isHidden,
                        suffixIcon: InkWell(
                          onTap: _togglePasswordView,
                          child: Icon(
                            _isHidden ? Icons.visibility : Icons.visibility_off,
                            color: AppColors.inputElements,
                          ),
                        ),
                        validator: Validators.strongPassword,
                      ),
                      const SizedBox(height: 16),
                      InputField(
                        enabled: true,
                        hintText: "Repita a senha",
                        prefixIcon: Icons.key,
                        controller: _rePassController,
                        obscuredText: _reIsHidden,
                        suffixIcon: InkWell(
                          onTap: _toggleRePasswordView,
                          child: Icon(
                            _reIsHidden
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.inputElements,
                          ),
                        ),
                        onChanged: _onPasswordChanged,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Repita a senha";
                          }
                          if (text != _passController.text) {
                            _senhaOK = false;
                            return "A senha deve ser igual a anterior";
                          }
                          _senhaOK = true;
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      PrimaryButtonComponent(
                        text: "Cadastrar senha",
                        width: 165.0,
                        onPressed: _senhaOK
                            ? () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const CadUser(),
                                  ),
                                );
                              }
                            : null,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
