import 'package:advmobprog_midterms_tp03_molina/core/responsive.dart';
import 'package:advmobprog_midterms_tp03_molina/core/theme.dart';
import 'package:advmobprog_midterms_tp03_molina/core/theme_ext.dart';
import 'package:advmobprog_midterms_tp03_molina/models/addons.dart';
import 'package:advmobprog_midterms_tp03_molina/views/user_details_screen.dart';
import 'package:advmobprog_midterms_tp03_molina/widgets/addon_checkbox.dart';
import 'package:advmobprog_midterms_tp03_molina/widgets/next_button.dart';
import 'package:flutter/material.dart';

class AddonsScreen extends StatefulWidget {
  const AddonsScreen({super.key});

  @override
  State<AddonsScreen> createState() => _AddonsScreenState();
}

class _AddonsScreenState extends State<AddonsScreen> {
  List<AddOn> addons = AddOn.items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Add Ons", style: context.textTheme.headlineMedium),
        centerTitle: true,
        backgroundColor: AppTheme.primary,
      ),
      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              itemCount: addons.length,
              itemBuilder: (context, index) {
                 final addon = addons[index];
                return AddonCheckbox(
                  name: addon.name,
                  description: addon.description,
                  imagePath: addon.imagePath,
                  price: addon.price,
                  isSelected: addon.isSelected, 
                  onChanged: (bool? value) {
                    setState(() {
                      addon.isSelected = value ?? false;
                    });
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
                MaterialPageRoute(builder: (context) => UserDetailsScreen()),
              );
            }
          ),
        ],
      ),
    );
  }
}