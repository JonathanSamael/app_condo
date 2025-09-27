import 'package:app_condo/features/notifications/model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel access;

  const NotificationCard({super.key, required this.access});

  @override
  Widget build(BuildContext context) {
    final time = DateFormat.Hms().format(access.timestamp);
    final date = DateFormat('dd/MM/yy').format(access.timestamp);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(access.imageUrl),
          radius: 24,
        ),
        title: Text(
          access.name,
          style: GoogleFonts.montserrat(),
        ),
        subtitle: Text(
          access.description,
          style: GoogleFonts.montserrat(),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(time, style: GoogleFonts.montserrat(fontSize: 12)),
            Text(date, style: GoogleFonts.montserrat(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
