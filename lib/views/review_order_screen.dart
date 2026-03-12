import 'package:advmobprog_midterms_tp03_molina/controllers/order_controller.dart';
import 'package:advmobprog_midterms_tp03_molina/core/responsive.dart';
import 'package:advmobprog_midterms_tp03_molina/core/theme.dart';
import 'package:advmobprog_midterms_tp03_molina/core/theme_ext.dart';
import 'package:advmobprog_midterms_tp03_molina/views/start_screen.dart';
import 'package:advmobprog_midterms_tp03_molina/views/thank_you_screen.dart';
import 'package:advmobprog_midterms_tp03_molina/widgets/next_button.dart';
import 'package:flutter/material.dart';

class ReviewOrderScreen extends StatelessWidget {
  const ReviewOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isWeb = Screensize.isWeb(context);
    final order = OrderController.instance;

    return Scaffold(
      appBar: AppBar(
        title: Text("Order Review", style: context.textTheme.headlineMedium),
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
                  image: AssetImage(order.selectedFlavor?.imagePath ?? 'assets/cakeswp.jpg'),
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
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(24),
                      children: [
                        _buildSectionHeader(context, "Price Breakdown"),                      

                        if (order.selectedFlavor != null)
                          _buildPriceRow(
                            "Flavor: ${order.selectedFlavor!.name}", 
                            order.selectedFlavor!.basePrice
                          ),
                        
                        if (order.selectedSize != null)
                          _buildPriceRow(
                            "Size: ${order.selectedSize!.name}", 
                            order.selectedSize!.addPrice
                          ),

                        ...order.selectedAddons.map((addon) => 
                          _buildPriceRow(addon.name, addon.price)
                        ),

                        const Divider(height: 30, thickness: 1),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total Amount", style: context.textTheme.headlineSmall),
                            Text(
                              "₱${order.totalPrice.toStringAsFixed(2)}",
                              style: context.textTheme.titleLarge?.copyWith(
                                color: AppTheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 30),
                        _buildSectionHeader(context, "Delivery Details"),
                        _buildDetailRow("Recipient", order.recipientName),
                        _buildDetailRow("Address", order.address),
                        _buildDetailRow("Day", order.deliveryDay),
                        _buildDetailRow("Payment", order.paymentMode),
                      ],
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        NextButton(
                          label: "Confirm & Submit",
                          backgroundColor: AppTheme.success,
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context, 
                              MaterialPageRoute(builder: (context) => ThankYouScreen()),
                              (route) => false
                            );
                          },
                        ),
                        NextButton(
                          label: "Reset Order",
                          padding: EdgeInsets.symmetric(vertical: 10),
                          onPressed: () {
                            order.clearOrder();
                            Navigator.pushAndRemoveUntil(
                              context, 
                              MaterialPageRoute(builder: (context) => StartScreen()),
                              (route) => false
                            );
                          },
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildPriceRow(String label, double price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: AppTheme.textMuted)),
          Text("₱${price.toString()}", style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, top: 8),
      child: Text(
        title,
        style: context.textTheme.headlineMedium?.copyWith(
          color: AppTheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: AppTheme.textMuted, fontSize: 18),
          children: [
            TextSpan(text: "$label: ", style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}