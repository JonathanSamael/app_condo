// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Contact {
  final String name;
  final String address;

  Contact({
    required this.name,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'address': address,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      name: map['name'] as String,
      address: map['address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Contact.fromJson(String source) => Contact.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Groups {
  final String name;
  final int participants;
  final String imagePath;

  Groups({
    required this.name,
    required this.participants,
    required this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'participants': participants,
      'imagePath': imagePath,
    };
  }

  factory Groups.fromMap(Map<String, dynamic> map) {
    return Groups(
      name: map['name'] as String,
      participants: map['participants'] as int,
      imagePath: map['imagePath'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Groups.fromJson(String source) => Groups.fromMap(json.decode(source) as Map<String, dynamic>);
}
