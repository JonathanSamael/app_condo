import 'package:app_condo/app/components/app_bar_component.dart';
import 'package:app_condo/app/components/drop_down_component.dart';
import 'package:app_condo/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:geolocator/geolocator.dart';

// Future<void> _checkLocationPermission() async {
//   LocationPermission permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.deniedForever) {
//       // Handle cases where permission is permanently denied
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }
//   }
//   if (permission == LocationPermission.denied) {
//     // Handle cases where permission is denied but not permanently
//     return Future.error('Location permissions are denied.');
//   }
//   // Permissions granted, proceed with location services
// }

class PersonalTracking extends StatefulWidget {
  const PersonalTracking({super.key});

  @override
  State<PersonalTracking> createState() => _PersonalTrackingState();
}

class _PersonalTrackingState extends State<PersonalTracking> {
  bool turnOn = false;
  String? currentStatus;

  final List<String> statusOptions = [
    '3 quilômetros',
    '5 quilômetros',
    '10 quilômetros',
  ];

  @override
  Widget build(BuildContext context) {
    // _checkLocationPermission();
    return Scaffold(
      appBar: const AppBarComponent(
          background: AppColors.backgroundColorDark,
          title: "Rastreamento pessoal",
          iconColor: AppColors.textColorWhite),
      backgroundColor: AppColors.backgroundColorLight,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "Minha Localização",
              style: GoogleFonts.montserrat(
                  color: AppColors.primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Habilitar rastreamento em tempo \nreal pela portaria do condomínio.",
                  softWrap: true,
                  style: GoogleFonts.montserrat(
                      color: AppColors.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Switch(
                  thumbIcon: WidgetStateProperty.resolveWith<Icon?>(
                      (Set<WidgetState> states) {
                    if (turnOn) {
                      return const Icon(
                        Icons.check,
                        color: AppColors.textColorWhite,
                      );
                    } else {
                      return const Icon(
                        Icons.close,
                        color: AppColors.textColorWhite,
                      );
                    }
                  }),
                  activeColor: AppColors.primaryColor,
                  value: turnOn,
                  onChanged: (bool value) {
                    setState(() {
                      turnOn = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Escolher raio de rastreamento:",
              textAlign: TextAlign.start,
              style: GoogleFonts.montserrat(
                  fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: DropDownComponent(
                options: statusOptions,
                labelText: "3 quilômetros",
                prefixIcon: Icons.route_outlined,
                onChanged: (newValue) {
                  setState(() {
                    currentStatus = newValue;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
