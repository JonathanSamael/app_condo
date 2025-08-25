import 'dart:developer';

import 'package:adcondo_app/app/components/app_bar_component.dart';
import 'package:adcondo_app/app/components/feature_grid.dart';
import 'package:adcondo_app/app/components/item_grid.dart';
import 'package:adcondo_app/app/core/services/providers.dart';
import 'package:adcondo_app/app/utils/app_colors.dart';
import 'package:adcondo_app/features/delivery/view/delivery_page.dart';
import 'package:adcondo_app/features/documents/view/documents_page.dart';
import 'package:adcondo_app/features/intercom/view/intercom_page.dart';
import 'package:adcondo_app/features/notices/view/notices_page.dart';
import 'package:adcondo_app/features/payments/view/expense_page.dart';
import 'package:adcondo_app/features/reservations/view/reservations_page.dart';
import 'package:adcondo_app/features/settings/personal_tracking_view.dart';
import 'package:adcondo_app/features/voting/view/list_voting_page.dart';
import 'package:adcondo_app/features/user/view/cad_visitor.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);

    if (user != null) {
      print("Usuário logado: ${user.nomeCompleto}");
    }

    final List<ItemGrid> features = [
      ItemGrid(
        label: "Visitantes",
        icon: Icons.people,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CadVisitor(),
            ),
          );
        },
      ),
      ItemGrid(
        label: "Mural de avisos",
        icon: Icons.newspaper_rounded,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const NoticesPage(),
            ),
          );
        },
      ),
      ItemGrid(
        label: "Documentos",
        icon: Icons.description,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const DocumentsPage(),
            ),
          );
        },
      ),
      ItemGrid(
        label: "Rastreamento\npessoal",
        icon: Icons.location_pin,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const PersonalTracking(),
            ),
          );
        },
      ),
      ItemGrid(
        label: "Votações",
        icon: Icons.how_to_vote,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ListVotingPage(),
            ),
          );
        },
      ),
      ItemGrid(
        label: "Consumos",
        icon: Icons.attach_money_rounded,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ExpensePage(),
            ),
          );
        },
      ),
      ItemGrid(
        label: "Entregas",
        icon: Icons.local_shipping,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const DeliveryPage(),
            ),
          );
        },
      ),
      ItemGrid(
        label: "Minhas\nreservas",
        icon: Icons.calendar_today,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ReservationsPage(),
            ),
          );
        },
      ),
      ItemGrid(
        label: "Vizinhança",
        icon: Icons.people,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const IntercomPage(),
            ),
          );
        },
      ),
      ItemGrid(
        label: "Fale conosco",
        icon: Icons.chat_bubble_outline,
        onPressed: () {},
      ),
    ];

    return Scaffold(
      appBar: HomeAppBar(
        background: AppColors.backgroundColorDark,
        title: user!.nomeCompleto,
        subTitle: "<subtitle>",
        height: 80,
        foto: user.foto != null ? user.foto! : "",
      ),
      backgroundColor: AppColors.backgroundColorLight,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 120.0,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                ),
                items: user.enderecos.map(
                  (i) {
                    inspect(i);
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Minha Unidade ${user.enderecos[0].complemento}",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textColorWhite,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "número - ${user.enderecos[0].numero}",
                                          style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.textColorWhite,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 120,
                                height: MediaQuery.of(context).size.height,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("assets/apto.png"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ).toList(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 4.0),
                child: Divider(),
              ),
              FeatureGrid(features: features),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 4.0),
                child: Divider(),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  initialPage: 2,
                  autoPlay: true,
                ),
                items: [1, 2, 3, 4, 5].map(
                  (i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          margin: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16.0)),
                              child: Stack(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/apto.png",
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                  Positioned(
                                    bottom: 0.0,
                                    left: 0.0,
                                    right: 0.0,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(200, 0, 0, 0),
                                            Color.fromARGB(0, 0, 0, 0)
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                        ),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 20.0),
                                      child: Text(
                                        'No. $i image',
                                        style: GoogleFonts.montserrat(
                                          color: AppColors.cardColor,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        );
                      },
                    );
                  },
                ).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
