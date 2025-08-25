import 'package:adcondo_app/app/components/app_bar_component.dart';
import 'package:adcondo_app/app/components/custom_background.dart';
import 'package:adcondo_app/app/components/drop_down_component.dart';
import 'package:adcondo_app/app/components/navigator_bar.dart';
import 'package:adcondo_app/app/components/snack_bar_component.dart';
import 'package:adcondo_app/app/utils/app_colors.dart';
import 'package:adcondo_app/app/utils/validators.dart';
import 'package:adcondo_app/app/components/buttons.dart';
import 'package:adcondo_app/app/components/inputs.dart';
import 'package:flutter/material.dart';

class CadVisitor extends StatefulWidget {
  const CadVisitor({super.key});

  @override
  State<CadVisitor> createState() => _CadVisitorState();
}

class _CadVisitorState extends State<CadVisitor> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _relationshipController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _nascController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  String? currentStatus;
  final List<String> statusOptions = [
    'Liberado',
    'Bloqueado',
    'Interfonar',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(
        background: AppColors.backgroundColorDark,
        title: "Cadastro de visitantes",
        iconColor: AppColors.textColorWhite,
      ),
      body: SingleChildScrollView(
        child: CustomBackground(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: AppColors.accentColor,
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.camera_alt,
                        size: 50,
                        weight: 10,
                        color: AppColors.primaryColor,
                        applyTextScaling: false,
                      ),
                      TextButtonComponent(
                        text: "Adicionar imagem",
                        color: AppColors.primaryColor,
                        onPressed: () {},
                      )
                    ],
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
                        enabled: true,
                        hintText: "Nome Completo",
                        prefixIcon: Icons.person_pin,
                        controller: _nameController,
                        validator: Validators.required,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      DropDownComponent(
                        options: statusOptions,
                        labelText: "Liberado",
                        prefixIcon: Icons.search,
                        onChanged: (newValue) {
                          setState(() {
                            currentStatus = newValue;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InputField(
                        enabled: true,
                        hintText: "Parentesco",
                        prefixIcon: Icons.group_add,
                        controller: _relationshipController,
                        validator: Validators.required,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InputField(
                        enabled: true,
                        hintText: "CPF",
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
                        enabled: true,
                        hintText: "Data de nascimento",
                        prefixIcon: Icons.calendar_month_outlined,
                        controller: _nascController,
                        keyboardType: TextInputType.datetime,
                        validator: Validators.required,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InputField(
                        enabled: true,
                        hintText: "Telefone",
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
                      text: "Confirmar",
                      width: 130,
                      onPressed: () {
                        CustomSnackBar.sucess(
                          context,
                          message: "Visitante cadatrado com sucesso!",
                        );
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const NavBarComponent(),
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
