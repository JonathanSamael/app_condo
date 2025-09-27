import 'package:app_condo/app/components/custom_background.dart';
import 'package:app_condo/features/voting/model/voting_model.dart';
import 'package:app_condo/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrackVotingPage extends StatefulWidget {
  final VotingModel votingList;
  const TrackVotingPage({super.key, required this.votingList});

  @override
  State<TrackVotingPage> createState() => _TrackVotingPageState();
}

class _TrackVotingPageState extends State<TrackVotingPage> {
  int get totalVotes => widget.votingList.options
      .fold(0, (sum, option) => sum + option.totalVotes);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColorLight,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.votingList.title,
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
      backgroundColor: AppColors.backgroundColorDark,
      body: CustomBackground(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Card(
                shadowColor: AppColors.transparent,
                color: AppColors.accentColor,
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  leading: Image.asset("assets/voting.png"),
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.votingList.title,
                            style: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textColorPrimaryBlue,
                            ),
                          ),
                          Text(
                            "Última atualização -\n ${widget.votingList.lastUpdated}",
                            softWrap: true,
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.inputElements,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.refresh,
                            size: 30,
                            color: AppColors.primaryColor,
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  widget.votingList.description,
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColorPrimaryBlue,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                // margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    ...widget.votingList.options.map((option) {
                      final percentage = totalVotes == 0
                          ? 0
                          : ((option.totalVotes / totalVotes) * 100).round();

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: option.image != null
                                  ? AssetImage(option.image!)
                                  : const NetworkImage(
                                      "https://avatar.iran.liara.run/public/10"),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    option.title,
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: AppColors.textColorPrimaryBlue),
                                  ),
                                  const SizedBox(height: 6),
                                  LinearProgressIndicator(
                                    value: percentage / 100,
                                    minHeight: 8,
                                    backgroundColor: Colors.grey.shade300,
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                      AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text("${option.totalVotes} votos",
                                    style:
                                        GoogleFonts.montserrat(fontSize: 12)),
                                Text("$percentage %",
                                    style:
                                        GoogleFonts.montserrat(fontSize: 12)),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "$totalVotes votos computados",
                        style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: AppColors.textColorPrimaryBlue),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
