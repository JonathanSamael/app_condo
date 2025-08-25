import 'dart:convert';

class DocumentModel {
  final String name;
  final String dateTime;
  final String urlLink;

  DocumentModel({
    required this.name,
    required this.dateTime,
    required this.urlLink,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'dateTime': dateTime,
      'urlLink': urlLink,
    };
  }

  factory DocumentModel.fromMap(Map<String, dynamic> map) {
    return DocumentModel(
      name: map['name'] as String,
      dateTime: map['dateTime'] as String,
      urlLink: map['urlLink'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DocumentModel.fromJson(String source) => DocumentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
