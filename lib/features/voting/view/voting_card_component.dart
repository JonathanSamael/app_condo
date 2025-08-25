import 'package:adcondo_app/app/components/buttons.dart';
import 'package:adcondo_app/features/voting/model/voting_model.dart';
import 'package:adcondo_app/app/utils/app_colors.dart';
import 'package:adcondo_app/features/voting/view/track_voting_page.dart';
import 'package:adcondo_app/features/voting/view/voting_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VotingCardComponent extends StatelessWidget {
  final VotingModel votingModel;
  const VotingCardComponent({super.key, required this.votingModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        height: 340,
        width: MediaQuery.of(context).size.width,
        child: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          votingModel.title,
                          style: GoogleFonts.montserrat(
                            color: AppColors.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Aberta até - ${votingModel.endDate}",
                          style: GoogleFonts.montserrat(
                            color: AppColors.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 180,
                child: Image.asset(
                  votingModel.image,
                  fit: BoxFit.contain,
                ),
              ),
              const Divider(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SecondaryButtonComponent(
                      text: "Acompanhar votos",
                      width: 210,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TrackVotingPage(
                              votingList: votingModel,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    PrimaryButtonComponent(
                      text: "Votar",
                      width: 100,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => VotingPage(
                              voting: votingModel,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
