import 'package:adcondo_app/app/components/app_bar_component.dart';
import 'package:adcondo_app/app/components/buttons.dart';
import 'package:adcondo_app/app/components/snack_bar_component.dart';
import 'package:adcondo_app/features/reservations/model/reservation_model.dart';
import 'package:adcondo_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarReservationPage extends StatefulWidget {
  final ReserveModel booking;
  const CalendarReservationPage({super.key, required this.booking});

  @override
  State<CalendarReservationPage> createState() =>
      _CalendarReservationPageState();
}

class _CalendarReservationPageState extends State<CalendarReservationPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    // Initialize _selectedDay with today's date or the booking date if applicable
    _selectedDay = _focusedDay;
  }

  Color getStatusColor() {
    switch (widget.booking.status.name) {
      case 'aprovada':
        return Colors.green;
      case 'pendente':
        return Colors.orange;
      case 'rejeitada':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    String formatBookingDate =
        DateFormat('dd/MM/yyyy', 'pt_BR').format(widget.booking.bookingDate);
    String formatCreatingDate =
        DateFormat('dd/MM/yyyy', 'pt_BR').format(widget.booking.creatingDate);

    return Scaffold(
      appBar: const AppBarComponent(
        background: AppColors.backgroundColorDark,
        title: "Reservas",
        iconColor: AppColors.backgroundColorLight,
      ),
      backgroundColor: AppColors.backgroundColorLight,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TableCalendar(
                  locale: 'pt_BR',
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: _focusedDay,
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  calendarStyle: const CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: AppColors.accentColor,
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _selectedDay != null
                      ? 'Data selecionada: ${_selectedDay!.day}/${_selectedDay!.month}/${_selectedDay!.year} --- bookingdate = $formatBookingDate'
                      : 'Nenhuma data selecionada',
                  style: GoogleFonts.montserrat(fontSize: 16),
                ),
              ),
              PrimaryButtonComponent(
                text: "Selecionar Horário",
                width: 180,
                onPressed: () async {
                  if (_selectedDay != null) {
                    final selectedTime = await showTimePicker(
                      context: context,
                      initialTime: const TimeOfDay(hour: 20, minute: 0),
                    );
                    if (selectedTime != null) {
                      final dateTime = DateTime(
                        _selectedDay!.year,
                        _selectedDay!.month,
                        _selectedDay!.day,
                        selectedTime.hour,
                        selectedTime.minute,
                      );
                      print('Horário selecionado: $dateTime');
                    }
                  } else {
                    CustomSnackBar.error(context,
                        message: "Por favor, selecione uma data primeiro.");
                  }
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Divider(),
              ),
              // _selectedDay.toString() == formatBookingDate
              // ?
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                height: 170,
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.booking.localName,
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.calendar_today,
                              size: 16, color: AppColors.inputElements),
                          const SizedBox(width: 6),
                          Text(
                            formatCreatingDate,
                            style: GoogleFonts.montserrat(
                                fontSize: 14, color: AppColors.inputElements),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.access_time,
                              size: 16, color: AppColors.inputElements),
                          const SizedBox(width: 6),
                          Text(
                            formatBookingDate,
                            style: GoogleFonts.montserrat(
                                fontSize: 14, color: AppColors.inputElements),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Chip(
                            label: Text(
                              widget.booking.status.name,
                              style: GoogleFonts.montserrat(
                                  color: AppColors.textColorWhite),
                            ),
                            backgroundColor: getStatusColor(),
                          ),
                          // if (onPressed != null)
                          TextButton(
                            onPressed: () {},
                            child: const Text("Ver detalhes"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
              // : Center(
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         const SizedBox(
              //           height: 20,
              //         ),
              //         const Icon(
              //           Icons.calendar_today,
              //           color: AppColors.textColorPrimaryBlue,
              //           size: 35,
              //         ),
              //         const SizedBox(
              //           height: 10,
              //         ),
              //         Text(
              //           "Nenhuma evento nessa data $formatBookingDate",
              //           style: GoogleFonts.montserrat(
              //             color: AppColors.textColorPrimaryBlue,
              //             fontSize: 16,
              //             fontWeight: FontWeight.w600,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
