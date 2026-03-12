import 'package:advmobprog_midterms_tp03_molina/core/responsive.dart';
import 'package:advmobprog_midterms_tp03_molina/core/theme.dart';
import 'package:advmobprog_midterms_tp03_molina/core/theme_ext.dart';
import 'package:advmobprog_midterms_tp03_molina/models/cake.dart';
import 'package:advmobprog_midterms_tp03_molina/models/cake_size.dart';
import 'package:advmobprog_midterms_tp03_molina/views/addons_screen.dart';
import 'package:advmobprog_midterms_tp03_molina/widgets/next_button.dart';
import 'package:flutter/material.dart';

class SizeScreen extends StatefulWidget {
  const SizeScreen({super.key});

  @override
  State<SizeScreen> createState() => _SizeScreenState();
}

class _SizeScreenState extends State<SizeScreen> {
  CakeSize currentSize = Cake.sizes[0];

  @override
  Widget build(BuildContext context) {
    bool isWeb = Screensize.isWeb(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Select Size", style: context.textTheme.headlineMedium),
        centerTitle: true,
        backgroundColor: AppTheme.primary,
      ),
      body: Flex(
        direction: isWeb ? Axis.horizontal : Axis.vertical,
        children: [
          Expanded(
            flex: isWeb ? 3 : 2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/sizes.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Expanded(
            flex: isWeb ? 2 : 3, 
            child: Container(
              color: AppTheme.background,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: Text(
                      "Choose your Size",
                      style: context.textTheme.headlineSmall?.copyWith(
                        color: AppTheme.primary,
                      ),
                    ),
                  ),

                  // The Scrollable List
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: Cake.sizes.length,
                      itemBuilder: (context, index) {
                        final item = Cake.sizes[index];
                        return RadioListTile<CakeSize>(
                          title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(item.description),
                          value: item,
                          groupValue: currentSize,
                          activeColor: AppTheme.primary,
                          onChanged: (val) {
                            setState(() => currentSize = val!);
                          },
                        );
                      },
                    ),
                  ),

                  NextButton(
                    label: "Next: Select Add Ons", 
                    onPressed: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => AddonsScreen()),
                      );
                    }
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}