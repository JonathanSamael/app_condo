import 'package:flutter/material.dart';

enum StatusReserva {
  pendente,
  aprovada,
  rejeitada,
  cancelada,
}

class ReserveModel {
  final String id;
  final String localId;
  final String localName;
  final String userId;
  final String userName;
  final String image;

  final DateTime bookingDate;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  final StatusReserva status;
  final DateTime creatingDate;

  final String? description;

  ReserveModel({
    required this.id,
    required this.localId,
    required this.localName,
    required this.userId,
    required this.userName,
    required this.image,
    required this.bookingDate,
    required this.startTime,
    required this.endTime,
    required this.status,
    required this.creatingDate,
    this.description,
  });
}
