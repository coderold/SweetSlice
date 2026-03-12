import 'package:advmobprog_midterms_tp03_molina/core/responsive.dart';
import 'package:advmobprog_midterms_tp03_molina/core/theme.dart';
import 'package:advmobprog_midterms_tp03_molina/core/theme_ext.dart';
import 'package:advmobprog_midterms_tp03_molina/widgets/next_button.dart';
import 'package:flutter/material.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  final List<String> _days = [
    'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
  ];
  String? _selectedDay;
  String _selectedPayment = 'Cash on Delivery';

  @override
  Widget build(BuildContext context) {
    bool isWeb = Screensize.isWeb(context);

    return Scaffold(
      // Copying your AppBar style
      appBar: AppBar(
        title: Text("Delivery Details", style: context.textTheme.headlineMedium),
        centerTitle: true,
        backgroundColor: AppTheme.primary,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Container(
            // Responsive width control
            width: isWeb ? 500 : double.infinity,
            padding: const EdgeInsets.all(25),
            // The 2px stroke you requested
            decoration: BoxDecoration(
              color: AppTheme.background,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppTheme.primary.withValues(alpha: 0.2), 
                width: 2,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Recipient Information",
                  textAlign: TextAlign.center,
                  style: context.textTheme.headlineSmall?.copyWith(
                    color: AppTheme.primary,
                  ),
                ),
                const SizedBox(height: 25),

                _inputLabel("Recipient Name"),
                _customTextField("Enter name"),

                _inputLabel("Dedication Message"),
                _customTextField("Write something sweet...", maxLines: 2),

                _inputLabel("Delivery Address"),
                _customTextField("House #, Street, City"),

                _inputLabel("Delivery Instructions"),
                _customTextField("Gate code, landmarks, etc."),

                _inputLabel("Delivery Day"),

                DropdownButtonFormField<String>(
                  value: _selectedDay,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  items: _days.map((day) => DropdownMenuItem(
                    value: day, 
                    child: Text(day),
                  )).toList(),
                  onChanged: (val) => setState(() => _selectedDay = val),
                ),

                const SizedBox(height: 20),
                _inputLabel("Mode of Payment"),
                

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildPaymentOption("Cash on Delivery"),
                    _buildPaymentOption("Bank Transfer"),
                    _buildPaymentOption("GCash"),
                  ],
                ),

                const SizedBox(height: 30),

                NextButton(
                  label: "Next: Review Order",
                  onPressed: () {
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 12),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _customTextField(String hint, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String name) {
    return Expanded(
      child: Row(
        children: [
          Radio<String>(
            value: name,
            groupValue: _selectedPayment,
            activeColor: AppTheme.primary,
            onChanged: (val) {
              setState(() {
                _selectedPayment = val!;
              });
            },
          ),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

}

