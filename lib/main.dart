import 'package:flutter/material.dart';
import 'package:todo_list/pages/home.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Color(0xFFF57B24),
      secondary: Color(0xFFFFC107),
    ),
  ),
  home: Home(),
));


