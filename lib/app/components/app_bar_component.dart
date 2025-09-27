import 'package:app_condo/app/utils/app_colors.dart';
import 'package:app_condo/features/notifications/view/notification_view.dart';
import 'package:app_condo/features/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  final Color background;
  final Color iconColor;
  final String title;
  const AppBarComponent({
    super.key,
    required this.background,
    required this.title,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: background,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            color: iconColor,
            onPressed: () => Navigator.of(context).pop(),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: iconColor,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.account_circle,
              color: iconColor,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SettingsView()),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color background;
  final String title;
  final String subTitle;
  final double height;
  final String foto;
  const HomeAppBar({
    super.key,
    required this.background,
    required this.title,
    required this.subTitle,
    required this.height,
    required this.foto,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: background,
      toolbarHeight: height,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.accentColor,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const SettingsView(),
                  ),
                );
              },
              icon: foto.isNotEmpty
                  ? ClipOval(
                      child: Image.network(
                        foto,
                        width: 24,
                        height: 24,
                        fit: BoxFit.cover,
                      ),
                    )
                  : const Icon(Icons.account_circle),
              color: AppColors.textColorWhite,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColorWhite,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      subTitle,
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColorWhite,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      size: 18,
                      color: AppColors.textColorWhite,
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.textColorWhite),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none,
                color: AppColors.textColorWhite),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NotificationPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
