import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:stripe_todo/screens/purchase_screen.dart';

String stripePublishableKey =
    'pk_test_51KaaZESEwsQGWkerX9OGEHBO8wzHBGLSsIWSRPsp4QIGylF6HLabFEILR8y7YiQGiR3roL5UMrlANNFHcXe5AGNh00ucKgkuba';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // set the publishable key for Stripe - this is mandatory
  Stripe.publishableKey = stripePublishableKey;
  Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  Stripe.urlScheme = 'flutterstripe';
  await Stripe.instance.applySettings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const
 GetMaterialApp(
        home: PurchaseScreen(),
      );

  }
}
