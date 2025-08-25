enum DeliveryStatus {
  retirado, 
  naoRetirada,
}

class DeliveryModel {
  final String unitNumber;
  final DateTime receivedDate;
  final DeliveryStatus status;

  DeliveryModel({
    required this.unitNumber,
    required this.receivedDate,
    required this.status,
  });

  factory DeliveryModel.fromJson(Map<String, dynamic> json) {
    return DeliveryModel(
      unitNumber: json['unitNumber'] as String,
      receivedDate: DateTime.parse(json['receivedDate'] as String),
      status: (json['status'] as String) == 'retirado'
          ? DeliveryStatus.retirado
          : DeliveryStatus.naoRetirada,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'unitNumber': unitNumber,
      'receivedDate': receivedDate.toIso8601String(),
      'status': status == DeliveryStatus.retirado ? 'retirado' : 'naoRetirada',
    };
  }
}