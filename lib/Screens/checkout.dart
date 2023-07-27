import 'package:carib/Components/small_theme_button.dart';
import 'package:carib/Screens/payment_details.dart';
import 'package:carib/Screens/shipping_address.dart';
import 'package:flutter/material.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  String homeAddress = '';
  String payMethod = 'Card';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: const Text('Checkout'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Shipping Address',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Home Address',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ShippingAddress()));
                    },
                    child: Text(
                      'Update Address',
                      style: TextStyle(color: Colors.green.withOpacity(0.6)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              RadioListTile<String>(
                title: const Text('Address Goes Here'),
                groupValue: 'Home Address',
                value: 'Home Address',
                onChanged: (value) {
                  setState(() {
                    homeAddress = value!;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Choose Payment Method',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: <Widget>[
                  RadioListTile<String>(
                    title: const Text('Credit Card'),
                    value: 'Card',
                    groupValue: payMethod,
                    onChanged: (value) {
                      setState(() {
                        payMethod = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('E-Banking'),
                    value: 'e-banking',
                    groupValue: payMethod,
                    onChanged: (value) {
                      setState(() {
                        payMethod = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 30,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PaymentDetails()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Add Payment Details'),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Order Summary',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const ListTile(
                leading: Text('Subtotal'),
                trailing: Text(
                  '\$90.0',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const ListTile(
                leading: Text('Delivery Charges'),
                trailing: Text(
                  '\$10.0',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: size.height * 0.13,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.9),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total Price',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '\$100.00',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SmallThemeButton(
              title: 'Pay Now',
              ontap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
