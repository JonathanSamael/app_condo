import 'package:adcondo_app/app/components/app_bar_component.dart';
import 'package:adcondo_app/app/components/buttons.dart';
import 'package:adcondo_app/features/intercom/model/intercom_model.dart';
import 'package:adcondo_app/app/utils/app_colors.dart';
import 'package:adcondo_app/features/intercom/view/contact_card_component.dart';
import 'package:adcondo_app/features/intercom/view/groups_card_component.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntercomPage extends StatefulWidget {
  const IntercomPage({super.key});

  @override
  State<IntercomPage> createState() => _IntercomPageState();
}

class _IntercomPageState extends State<IntercomPage> {
  final List<Contact> _contacts = [
    Contact(name: 'Fulano', address: 'Bloco A, 1002'),
    Contact(name: 'Ciclano', address: 'Bloco A, 1003'),
    Contact(name: 'Beltrano', address: 'Bloco A, 1004'),
    Contact(name: 'Irmão do fulano', address: 'Bloco A, 1006'),
  ];

  final List<Groups> _groups = [
    Groups(
        name: 'Cuidadores de plantas',
        participants: 45,
        imagePath: 'assets/plantas.png'),
    Groups(
        name: 'Aulas de reforço',
        participants: 14,
        imagePath: 'https://avatar.iran.liara.run/public/2'),
    Groups(
        name: 'Academia/esportes',
        participants: 68,
        imagePath: 'https://avatar.iran.liara.run/public/10'),
    Groups(
        name: 'Ciclismo Eldorado',
        participants: 23,
        imagePath: 'https://avatar.iran.liara.run/public/7'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponent(
          background: AppColors.backgroundColorLight,
          title: "Interfone Eletrônico",
          iconColor: AppColors.backgroundColorDark),
      backgroundColor: AppColors.backgroundColorDark,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Vizinhos',
                style: GoogleFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColorWhite),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _contacts.length,
              itemBuilder: (context, index) {
                return ContactCard(contact: _contacts[index]);
              },
            ),
            Center(
              child: TextButtonComponent(
                onPressed: () {},
                text: "Ver mais",
                color: AppColors.inputElements,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Grupos',
                style: GoogleFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColorWhite),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _groups.length,
                itemBuilder: (context, index) {
                  if (index == _groups.length - 1) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: GroupsCard(group: _groups[index]),
                    );
                  }
                  return GroupsCard(group: _groups[index]);
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
