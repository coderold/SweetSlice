import 'package:advmobprog_midterms_tp03_molina/controllers/order_controller.dart';
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
    bool isWeb = Screensize.isWeb(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Select Add Ons", style: context.textTheme.headlineMedium),
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
                  image: AssetImage('assets/addons/addon.jpg'),
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
                      "Choose your Add Ons",
                      style: context.textTheme.headlineSmall?.copyWith(
                        color: AppTheme.primary,
                      ),
                    ),
                  ),


                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: Screensize.isWeb(context)? 40 : 10),
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
                  ),

                  NextButton(
                    label: "Next: Fill Up Details", 
                    onPressed: (){
                      List<AddOn> selected = addons.where((item) => item.isSelected).toList();
                      OrderController.instance.selectedAddons = selected;
                      
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => UserDetailsScreen()),
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