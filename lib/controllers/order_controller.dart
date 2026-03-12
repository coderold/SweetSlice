import 'package:advmobprog_midterms_tp03_molina/models/cake_flavor.dart';
import 'package:advmobprog_midterms_tp03_molina/models/cake_size.dart';
import 'package:advmobprog_midterms_tp03_molina/models/addons.dart';

class OrderController {

  OrderController._internal();
  static final OrderController _instance = OrderController._internal();
  static OrderController get instance => _instance;

  CakeFlavor? selectedFlavor;
  CakeSize? selectedSize;
  List<AddOn> selectedAddons = [];
  

  String recipientName = "";
  String dedication = "";
  String address = "";
  String instructions = "";
  String deliveryDay = "";
  String paymentMode = "Cash on Delivery";

  double get totalPrice {
    double base = selectedFlavor?.basePrice ?? 0.0;
    double sizeExtra = selectedSize?.addPrice ?? 0.0;
    double addonTotal = selectedAddons.fold(0, (sum, item) => sum + item.price);
    return base + sizeExtra + addonTotal;
  }

  void clearOrder() {
    selectedFlavor = null;
    selectedSize = null;
    selectedAddons.clear();
    recipientName = "";
    dedication = "";
    address = "";
    instructions = "";
    deliveryDay = "";
    paymentMode = "Cash on Delivery";
  }
}