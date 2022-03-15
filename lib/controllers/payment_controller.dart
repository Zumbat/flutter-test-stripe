import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PaymentController extends GetxController {
  Map<String, dynamic>? paymentIntentData;
  RxBool isLoading = false.obs;

  payOnTap() async {
    isLoading = true.obs;
    final url = Uri.parse(
        "https://us-central1-calicoffee-7341a.cloudfunctions.net/stripePayment");
    final response = await http.get(url);
    paymentIntentData = jsonDecode(response.body);

    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntentData!['paymentIntent'],
            merchantCountryCode: 'IN',
            merchantDisplayName: "Savi",
            applePay: true,
            googlePay: true,
            style: ThemeMode.light));
    update();
    _showPaymentScreen();
  }

  _showPaymentScreen() async {
    try {
      await Stripe.instance.presentPaymentSheet();

      paymentIntentData = null;
      isLoading = false.obs;
      update();

    } catch (e) {
      log(e.toString());
    }
  }
}
