import 'package:flutter/material.dart';

class NoticesModel {
  final String name;
  final String description;
  final IconData? icon;
  final VoidCallback onClick;
  final DateTime timestamp;

  NoticesModel({
    required this.name,
    required this.description,
    required this.icon,
    required this.onClick,
    required this.timestamp,
  });
}
