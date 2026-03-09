import 'package:advmobprog_midterms_tp03_molina/pages/start_screen.dart';
import 'package:advmobprog_midterms_tp03_molina/theme/theme.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(SweetSlice());
}

class SweetSlice extends StatelessWidget {
  const SweetSlice({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
    );
  }
}