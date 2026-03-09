import 'package:advmobprog_midterms_tp03_molina/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:advmobprog_midterms_tp03_molina/theme/theme_ext.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primary,
        title: Text(
          "Start Screen",
          style: context.textTheme.headlineMedium,
        ),
      ),

      body: Column(
        children: [

          Center(
            child: ElevatedButton(
              onPressed: (){}, 
              child: Text("Start")
            ),
          ),

        ],
      ),
    );
  }
}