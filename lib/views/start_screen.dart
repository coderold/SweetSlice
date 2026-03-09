import 'package:advmobprog_midterms_tp03_molina/views/user_details_screen.dart';
import 'package:advmobprog_midterms_tp03_molina/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:advmobprog_midterms_tp03_molina/core/theme_ext.dart';

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
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Center(
            child: ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => UserDetailsScreen())
                );
              }, 
              child: Text("Start")
            ),
          ),

        ],
      ),
    );
  }
}