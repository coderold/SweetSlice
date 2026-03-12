import 'package:advmobprog_midterms_tp03_molina/controllers/order_controller.dart';
import 'package:advmobprog_midterms_tp03_molina/core/responsive.dart';
import 'package:advmobprog_midterms_tp03_molina/core/theme.dart';
import 'package:advmobprog_midterms_tp03_molina/core/theme_ext.dart';
import 'package:advmobprog_midterms_tp03_molina/models/cake.dart';
import 'package:advmobprog_midterms_tp03_molina/models/cake_flavor.dart';
import 'package:advmobprog_midterms_tp03_molina/views/size_screen.dart';
import 'package:advmobprog_midterms_tp03_molina/widgets/next_button.dart';
import 'package:flutter/material.dart';

class FlavorScreen extends StatefulWidget {
  const FlavorScreen({super.key});

  @override
  State<FlavorScreen> createState() => _FlavorScreenState();
}

class _FlavorScreenState extends State<FlavorScreen> {
  CakeFlavor currentCake = Cake.flavors[0];

  @override
  Widget build(BuildContext context) {
    bool isWeb = Screensize.isWeb(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Select Flavor", style: context.textTheme.headlineMedium),
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
                  image: AssetImage(currentCake.imagePath),
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
                      "Choose your Flavor",
                      style: context.textTheme.headlineSmall?.copyWith(
                        color: AppTheme.primary,
                      ),
                    ),
                  ),

                  // The Scrollable List
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: Cake.flavors.length,
                      itemBuilder: (context, index) {
                        final item = Cake.flavors[index];
                        return RadioListTile<CakeFlavor>(
                          title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "${item.description}\n",
                                  style: context.textTheme.bodySmall,
                                ),
                                TextSpan(
                                  text: "₱${item.basePrice.toStringAsFixed(2)}",
                                  style: TextStyle(
                                    color: AppTheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ]
                            )
                          ),
                          value: item,
                          groupValue: currentCake,
                          activeColor: AppTheme.primary,
                          onChanged: (val) {
                            setState(() => currentCake = val!);
                          },
                        );
                      },
                    ),
                  ),

                  NextButton(
                    label: "Next: Select Size", 
                    onPressed: (){
                    OrderController.instance.selectedFlavor = currentCake;
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => SizeScreen()),
                        //(route) => false
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