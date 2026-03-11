import 'package:advmobprog_midterms_tp03_molina/core/responsive.dart';
import 'package:advmobprog_midterms_tp03_molina/core/theme.dart';
import 'package:advmobprog_midterms_tp03_molina/views/user_details_screen.dart';
import 'package:advmobprog_midterms_tp03_molina/core/theme_ext.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: AppTheme.primary
            ),
          ),

          Align(
            alignment: Screensize.isWeb(context)? Alignment.centerRight : Alignment.bottomCenter,
            child: Container(
              width: Screensize.isWeb(context)? Screensize.width(context) * 0.8: double.infinity,
              height: Screensize.isWeb(context)? double.infinity: Screensize.height(context) * 0.8,

              decoration: BoxDecoration(
                color: AppTheme.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Screensize.isWeb(context)? Radius.zero : Radius.circular(100),
                  bottomLeft: Screensize.isWeb(context)? Radius.circular(100) : Radius.zero
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        FractionallySizedBox(
                          alignment: Alignment.center,
                          widthFactor: Screensize.isWeb(context)? 0.5: 0.7,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 20, top: 30),
                            child: Image.asset('assets/sweetslicelogo.png'),
                          )
                        ),
                        Text(
                          "Baked fresh daily and delivered to your doorstep.",
                          textAlign: TextAlign.center,
                          style: context.textTheme.bodyLarge!.copyWith(
                            color: AppTheme.primary,
                            fontSize: Screensize.isWeb(context)? 24 : 18
                          ),
                        ),
                      ],
                    ),
                  ),

                  if(Screensize.isMobile(context)) Spacer(),
                  
                  FractionallySizedBox(
                    widthFactor: 0.7,
                    child: Container(
                      height: 100,
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(AppTheme.primary)                  
                        ),
                        onPressed: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => UserDetailsScreen()),
                            //(route) => false
                          );
                        }, 
                        child: Text(
                          "Start Ordering",
                          style: context.textTheme.headlineSmall!.copyWith(
                            color: AppTheme.background
                          ),
                          )
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),

          
          
        ]
      )
      
    );
  }
}