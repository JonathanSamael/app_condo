import 'package:adcondo_app/app/components/custom_background.dart';
import 'package:adcondo_app/app/core/services/providers.dart';
import 'package:adcondo_app/app/utils/validators.dart';
import 'package:adcondo_app/features/user/view/info_cad_facial.dart';
import 'package:adcondo_app/app/components/buttons.dart';
import 'package:adcondo_app/app/components/inputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class CadAddressUser extends ConsumerStatefulWidget {
  const CadAddressUser({super.key});

  @override
  ConsumerState<CadAddressUser> createState() => _CadAddressUserState();
}

class _CadAddressUserState extends ConsumerState<CadAddressUser> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _nascController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);

    final endereco = user!.enderecos.isNotEmpty ? user.enderecos.first : null;

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
                        hintText: endereco!.cep ?? "",
                        prefixIcon: Icons.location_on,
                        controller: _cepController,
                        validator: Validators.required,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InputField(
                        hintText: endereco.logradouro,
                        prefixIcon: Icons.maps_home_work,
                        controller: _nascController,
                        keyboardType: TextInputType.datetime,
                        validator: Validators.required,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: InputField(
                              hintText: endereco.numero,
                              prefixIcon: Icons.description,
                              controller: _cpfController,
                              keyboardType: TextInputType.number,
                              validator: Validators.required,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            flex: 3,
                            child: InputField(
                              hintText: endereco.bairro,
                              prefixIcon: Icons.email,
                              controller: _emailController,
                              validator: Validators.required,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InputField(
                        hintText: endereco.complemento,
                        prefixIcon: Icons.mobile_friendly,
                        controller: _phoneNumberController,
                        keyboardType: TextInputType.phone,
                        validator: Validators.required,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InputField(
                        hintText: endereco.cidade,
                        prefixIcon: Icons.mobile_friendly,
                        controller: _phoneNumberController,
                        keyboardType: TextInputType.phone,
                        validator: Validators.required,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InputField(
                        hintText: endereco.estado,
                        prefixIcon: Icons.mobile_friendly,
                        controller: _phoneNumberController,
                        keyboardType: TextInputType.phone,
                        validator: Validators.required,
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
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const InfoCadFacial(),
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
