import 'package:carib/Components/small_theme_button.dart';
import 'package:carib/Screens/checkout.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int item = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'My Cart',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 100,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          width: size.width,
                          height: size.height * 0.13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 150,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset('Assets/asset.jpeg'),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 130,
                                    child: Text(
                                      'Lorem Ipsum ',
                                      style: TextStyle(fontSize: 20),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 35,
                                  ),
                                  FittedBox(
                                    child: Text(
                                      '\$99.09',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title:
                                                    const Text('Are you sure?'),
                                                content: const Text(
                                                    'Delete from Cart?'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text('No'),
                                                  ),
                                                  Container(
                                                    height: 50.0,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
                                                        gradient:
                                                            const LinearGradient(
                                                                begin: Alignment
                                                                    .topRight,
                                                                end: Alignment
                                                                    .bottomLeft,
                                                                colors: [
                                                              Color.fromARGB(
                                                                  255,
                                                                  24,
                                                                  24,
                                                                  24),
                                                              Color.fromARGB(
                                                                  255,
                                                                  128,
                                                                  183,
                                                                  56),
                                                            ])),
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          item = 0;
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30.0),
                                                              ),
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              shadowColor: Colors
                                                                  .transparent),
                                                      child: const FittedBox(
                                                          child: Text('Yes')),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                      child: const Icon(
                                        Icons.cancel_outlined,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.22,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              if (item > 1) {
                                                setState(() {
                                                  item--;
                                                });
                                              }
                                            },
                                            child: Container(
                                              height: size.height * 0.032,
                                              width: size.width * 0.065,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.green),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: const Center(
                                                  child: Icon(Icons.remove)),
                                            ),
                                          ),
                                          Text('$item'),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                item++;
                                              });
                                            },
                                            child: Container(
                                              height: size.height * 0.032,
                                              width: size.width * 0.065,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: const Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
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
                      '\$99.09',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SmallThemeButton(
                title: 'Check Out',
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CheckOutPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
