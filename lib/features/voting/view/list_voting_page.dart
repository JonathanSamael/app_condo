import 'package:adcondo_app/app/components/app_bar_component.dart';
import 'package:adcondo_app/features/voting/model/voting_model.dart';
import 'package:adcondo_app/app/utils/app_colors.dart';
import 'package:adcondo_app/features/voting/view/voting_card_component.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ListVotingPage extends StatefulWidget {
  const ListVotingPage({super.key});

  @override
  State<ListVotingPage> createState() => _ListVotingPageState();
}

class _ListVotingPageState extends State<ListVotingPage> {
  @override
  Widget build(BuildContext context) {
    String formatDate(DateTime dateTime) {
      final formatter = DateFormat('dd/MM/yyyy - HH:mm');
      return formatter.format(dateTime);
    }

    String ajustedDate = formatDate(DateTime.now());

    final List<VotingModel> votacoes = [
      VotingModel(
        id: '1',
        title: 'Eleição de Síndico',
        description: 'Escolha o novo síndico do condomínio',
        endDate: DateFormat('dd-MM-yyyy').format(DateTime.now()),
        lastUpdated: ajustedDate,
        // lastUpdated: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
        image: 'assets/vote.png',
        isClosed: false,
        hasUserVoted: true,
        options: [
          VotingOptionModel(
              id: '1', title: 'Opção 1', image: null, totalVotes: 25),
          VotingOptionModel(
              id: '2', title: 'Opção 2', image: null, totalVotes: 10),
          VotingOptionModel(
              id: '3', title: 'Opção 3', image: null, totalVotes: 35),
          VotingOptionModel(
              id: '4', title: 'Opção 4', image: null, totalVotes: 35),
          VotingOptionModel(
              id: '5', title: 'Opção 5', image: null, totalVotes: 35),
        ],
      ),
      VotingModel(
        id: '2',
        title: 'Reforma área de lazer',
        description: 'Melhorias na área de lazer do condomínio',
        endDate: DateFormat('dd-MM-yyyy').format(DateTime.now()),
        lastUpdated: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
        image: 'assets/reforma.png',
        isClosed: false,
        hasUserVoted: false,
        options: [
          VotingOptionModel(
              id: '1', title: 'Aceito a reforma', image: null, totalVotes: 40),
          VotingOptionModel(
              id: '2', title: 'Rejeito a reforma', image: null, totalVotes: 10),
        ],
      ),
      VotingModel(
        id: '3',
        title: 'Instalação câmeras',
        description: 'Decisão sobre instalação das câmeras de segurança',
        endDate: DateFormat('dd-MM-yyyy').format(DateTime.now()),
        lastUpdated: DateFormat('dd-MM-yyyy').format(DateTime.now()).toString(),
        image: 'assets/camera.png',
        isClosed: true,
        hasUserVoted: true,
        options: [
          VotingOptionModel(
              id: '1', title: 'Instalar', image: null, totalVotes: 60),
          VotingOptionModel(
              id: '2', title: 'Não instalar', image: null, totalVotes: 25),
        ],
      ),
    ];
    return Scaffold(
      appBar: const AppBarComponent(
          background: AppColors.backgroundColorLight,
          title: "Votação",
          iconColor: AppColors.backgroundColorDark),
      backgroundColor: AppColors.backgroundColorDark,
      body: votacoes.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.how_to_vote_outlined,
                    color: AppColors.textColorWhite,
                    size: 35,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Nenhuma votação aberta!",
                    style: GoogleFonts.montserrat(
                      color: AppColors.textColorWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: votacoes.length,
              itemBuilder: (context, index) {
                return VotingCardComponent(votingModel: votacoes[index]);
              },
            ),
    );
  }
}
