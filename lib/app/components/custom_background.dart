import 'package:adcondo_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  final Widget child;

  const CustomBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double opacity = 0.6;

    return Stack(
      children: [
        Container(
          color: AppColors.backgroundColorLight,
          height: size.height,
          width: size.width,
        ),
        Positioned(
          top: -size.height * 0.001,
          right: -size.width * 0.10,
          child: Opacity(
            opacity: opacity,
            child: Image.asset(
              'assets/fundo-bola.png',
              width: size.width * 0.9,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Opacity(
            opacity: opacity,
            child: Image.asset(
              'assets/fundo-predio.png',
              width: size.width * 0.5,
              fit: BoxFit.contain,
            ),
          ),
        ),
        child,
      ],
    );
  }
}
