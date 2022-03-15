import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stripe_todo/controllers/payment_controller.dart';
import 'package:stripe_todo/widgets/loader.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({Key? key}) : super(key: key);

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  var paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        centerTitle: true,
        title: const Text(
          "Cart",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: GetBuilder<PaymentController>(builder: (_) {
        if (_.isLoading == true.obs) {
          LoaderDialog.showLoadingDialog(context);
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(elevation: 5,
                child: ListTile(isThreeLine: true,
                  title: const Text(
                    "Demo Product 17.00",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  subtitle: const Text(
                    "This is a demo purchase",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  trailing: ElevatedButton(
                      onPressed: () async {
                        _.payOnTap();
                      },
                      child: const Text(
                        'Pay',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                      )),
                  leading: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                'https://www.pinclipart.com/picdir/big/176-1764508_shopping-cart-loaded-icon-checkout-icon-clipart.png'))),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
