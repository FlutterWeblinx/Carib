import 'package:carib/Components/my_text_field.dart';
import 'package:carib/Components/small_theme_button.dart';
import 'package:flutter/material.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({super.key});

  @override
  State<PaymentDetails> createState() => PaymentDetailsState();
}

class PaymentDetailsState extends State<PaymentDetails> {
  bool saveDetails = false;
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
        title: const Text('Shipping Address'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              // ListTile(
              //   leading: IconButton(
              //     icon: const Icon(Icons.arrow_back_ios),
              //     onPressed: () {
              //       Navigator.pop(context);
              //     },
              //   ),
              //   title: const Center(
              //       child: Text(
              //     'Payment Details',
              //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              //   )),
              //   trailing: IconButton(
              //     icon: const Icon(Icons.menu),
              //     onPressed: () {},
              //   ),
              // ),
              // const SizedBox(
              //   height: 30,
              // ),
              const Text(
                'Enter Card Details',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    MyTextField(
                      title: 'Card Holder Name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextField(
                      title: 'Card Number',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MyTextField(
                              keyboardType: TextInputType.datetime,
                              title: 'Expiry Date',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: MyTextField(
                              maxLength: 3,
                              obscureText: true,
                              keyboardType: TextInputType.number,
                              title: 'CVV',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Center(
                child: CheckboxListTile(
                  title: const Text('Save this for further payments'),
                  value: saveDetails,
                  onChanged: (value) {
                    setState(() {
                      saveDetails = value!;
                    });
                  },
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
                    fontSize: 15,
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '79.00',
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
              ontap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
