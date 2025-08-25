import 'package:adcondo_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownComponent extends StatefulWidget {
  const DropDownComponent({
    super.key,
    required this.labelText,
    this.prefixIcon,
    required this.options,
    this.initialValue,
    this.onChanged,
  });

  final String labelText;
  final IconData? prefixIcon;
  final List<String> options;
  final String? initialValue;
  final ValueChanged<String?>? onChanged;

  @override
  State<DropDownComponent> createState() => _DropDownComponentState();
}

class _DropDownComponentState extends State<DropDownComponent> {
  String? _selectedStatus;

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.labelText;
  }

  @override
  Widget build(BuildContext context) {
    final InputDecoration dropdownDecoration = InputDecoration(
      prefixIcon: Icon(widget.prefixIcon, color: AppColors.inputElements),
      labelStyle: GoogleFonts.montserrat(color: AppColors.textColorBlack),
      hintText: widget.labelText,
      hintStyle: GoogleFonts.montserrat(color: AppColors.textColorBlack),
      filled: true,
      fillColor: AppColors.cardColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.primaryColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.errorColor, width: 2),
      ),
    );

    return InputDecorator(
      decoration: dropdownDecoration,
      isEmpty: _selectedStatus == null,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: _selectedStatus,
          onChanged: (String? newValue) {
            setState(() {
              _selectedStatus = newValue;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(newValue);
            }
          },
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 30,
          style: GoogleFonts.montserrat(
              color: AppColors.textColorBlack, fontWeight: FontWeight.w500),
          borderRadius: BorderRadius.circular(10),
          items: widget.options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,
                  style: GoogleFonts.montserrat(
                      color: AppColors.textColorBlack, fontSize: 16)),
            );
          }).toList(),
        ),
      ),
    );
  }
}
