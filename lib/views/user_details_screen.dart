import 'package:advmobprog_midterms_tp03_molina/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:advmobprog_midterms_tp03_molina/core/theme_ext.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primary,
        title: Text(
          "User Details Screen",
          style: context.textTheme.headlineMedium,
        ),
        centerTitle: true,
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