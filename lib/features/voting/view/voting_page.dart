import 'package:app_condo/app/components/buttons.dart';
import 'package:app_condo/app/components/custom_background.dart';
import 'package:app_condo/features/voting/model/voting_model.dart';
import 'package:app_condo/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VotingPage extends StatefulWidget {
  final VotingModel voting;
  const VotingPage({super.key, required this.voting});

  @override
  State<VotingPage> createState() => _VotingPageState();
}

class _VotingPageState extends State<VotingPage> {
  String? selectedOptionId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColorLight,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.voting.title,
              style: GoogleFonts.montserrat(
                color: AppColors.primaryColor,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            )
          ],
        ),
      ),
      backgroundColor: AppColors.backgroundColorLight,
      body: CustomBackground(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                shadowColor: AppColors.transparent,
                color: AppColors.accentColor,
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.voting.title,
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textColorPrimaryBlue,
                        ),
                      ),
                      Text(
                        widget.voting.description,
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColorPrimaryBlue,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    "Aberta até o dia: ${widget.voting.endDate}",
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.inputElements,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: ListView.separated(
                itemCount: widget.voting.options.length,
                separatorBuilder: (_, __) => const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  final option = widget.voting.options[index];
                  final isSelected = option.id == selectedOptionId;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedOptionId = option.id;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.successColor
                                : Colors.grey.shade300,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          children: [
                            Radio<String>(
                              value: option.id,
                              groupValue: selectedOptionId,
                              activeColor: AppColors.primaryColor,
                              onChanged: (value) {
                                setState(() {
                                  selectedOptionId = value;
                                });
                              },
                            ),
                            Expanded(
                              child: Text(
                                option.title,
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.accentColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.asset(
                                option.image ?? 'assets/people.png',
                                width: 60,
                                height: 60,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 80,
              decoration: const BoxDecoration(
                color: AppColors.textColorWhite,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SecondaryButtonComponent(
                    text: "Cancelar",
                    width: 140,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  PrimaryButtonComponent(
                    text: "Confirmar",
                    width: 140,
                    onPressed: () {
                      selectedOptionId == null
                          ? null
                          : () {
                              widget.voting.hasUserVoted = true;
                            };
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
