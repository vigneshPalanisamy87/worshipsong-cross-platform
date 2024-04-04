import 'dart:core';

class Verse {
  String firstLanguage = "";
  String? secondLanguage;

  Verse({required this.firstLanguage, this.secondLanguage});

  factory Verse.fromMap(Map<String, dynamic> json) => Verse(
      firstLanguage: json["firstLanguage"],
      secondLanguage: json["secondLanguage"]
  );

}