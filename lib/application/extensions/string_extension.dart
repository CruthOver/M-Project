import 'package:get/get_utils/src/extensions/string_extensions.dart';

// ignore: duplicate_ignore
extension StringExtension on String {
  String get inCaps => isEmpty ? '' : '${this[0].toUpperCase()}${substring(1)}';
  String get allInCaps => toUpperCase();
  String get capitalizeFirsTofEach => split(" ").map((str) => str.capitalize).join(" ");
  String get fileName => split('/').last;
  String get extension => split('.').last;
}
