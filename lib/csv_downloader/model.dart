import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

@immutable
class User {
  const User({
    required this.name,
    required this.age,
    required this.blood,
    required this.birthDate,
  });
  final String name;
  final int age;
  final Blood blood;
  final DateTime birthDate;

  List<String> toCsvFormat() => [
        name,
        '$age',
        describeEnum(blood).toUpperCase(),
        DateFormat('yyyy/MM/dd').format(birthDate),
      ];
}

enum Blood {
  a,
  b,
  o,
  ab,
}

// ref. https://www.perfume-web.jp/profile/
final dummyUsers = [
  User(
    name: 'a-chan',
    age: 32,
    blood: Blood.a,
    birthDate: DateTime(1989, 2, 15),
  ),
  User(
    name: 'NOCCHi',
    age: 33,
    blood: Blood.a,
    birthDate: DateTime(1988, 9, 20),
  ),
  User(
    name: 'KASHIYUKA',
    age: 32,
    blood: Blood.a,
    birthDate: DateTime(1988, 12, 23),
  ),
];
