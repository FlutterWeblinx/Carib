import 'package:carib/Components/product_card.dart';
import 'package:flutter/material.dart';
import 'item_details.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List banner = [
    "Assets/banner/banner1.jpg",
    "Assets/banner/banner2.jpg",
    "Assets/banner/banner3.jpg",
    "Assets/banner/banner4.jpeg",
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: const Text('Products'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              myBottomSheet(context);
            },
            icon: const Icon(Icons.filter_alt),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Lorem Ipsum',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'),
                ),
                const SizedBox(
                  height: 10,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 100,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 4.0,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ItemDetails()));
                      },
                      child: ProductCard(
                        imageHeight: size.height * 0.14,
                        imageWidth: size.width * 0.4,
                        size: size,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> myBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [Text('Filters')],
        );
      },
    );
  }
}
      // ListTile(
            //   leading: IconButton(
            //     icon: const Icon(Icons.arrow_back_ios),
            //     onPressed: () {
            //       Navigator.pop(context);
            //     },
            //   ),
            //   title: const Center(
            //       child: Text(
            //     'Products',
            //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //   )),
            //   trailing: const Text('         '),
            //   //  IconButton(
            //   //   icon: const Icon(Icons.favorite_outline),
            //   //   onPressed: () {},
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       // const Center(
            //       //   child: Text('Please Provide Information',
            //       //       style: TextStyle(
            //       //         fontSize: 20,
            //       //       )),
            //       // ),
            //       // Row(
            //       //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       //   children: [
            //       //     DropdownButton(
            //       //       value: yearValue,
            //       //       hint: const Text('Select Year'),
            //       //       items: year.map((e) {
            //       //         return DropdownMenuItem(
            //       //           value: e,
            //       //           child: Text(e),
            //       //         );
            //       //       }).toList(),
            //       //       onChanged: (e) {
            //       //         setState(() {
            //       //           yearValue = e.toString();
            //       //         });
            //       //       },
            //       //     ),
            //       //     DropdownButton(
            //       //       value: makeValue,
            //       //       hint: const Text('Select Make'),
            //       //       items: year.map((e) {
            //       //         return DropdownMenuItem(
            //       //           value: e,
            //       //           child: Text(e),
            //       //         );
            //       //       }).toList(),
            //       //       onChanged: (e) {
            //       //         setState(() {
            //       //           makeValue = e.toString();
            //       //         });
            //       //       },
            //       //     ),
            //       //     DropdownButton(
            //       //       value: modelValue,
            //       //       hint: const Text('Select Model'),
            //       //       items: year.map((e) {
            //       //         return DropdownMenuItem(
            //       //           value: e,
            //       //           child: Text(e),
            //       //         );
            //       //       }).toList(),
            //       //       onChanged: (e) {
            //       //         setState(() {
            //       //           modelValue = e.toString();
            //       //         });
            //       //       },
            //       //     ),
            //       //   ],
            //       // ),

            //       // Center(
            //       //   child: SmallThemeButton(
            //       //     title: 'Filter',
            //       //     ontap: () {
            //       //       // if (yearValue != null ||
            //       //       //     makeValue != null ||
            //       //       //     modelValue != null) {
            //       //       //   setState(() {
            //       //       //     filteredData = true;
            //       //       //   });
            //       //       // } else {
            //       //       //   ScaffoldMessenger.of(context).showSnackBar(
            //       //       //     const SnackBar(
            //       //       //       elevation: 0,
            //       //       //       backgroundColor: Colors.green,
            //       //       //       content: Text('Please Select One !!!!!!'),
            //       //       //     ),
            //       //       //   );
            //       //       // }
            //       //     },
            //       //   ),
            //       // ),
            //     ],
            //   ),
            // ),
            // filteredData == false
            //     ? Container()
            //     :
            // SizedBox(
            //   height: size.height * 0.15,
            //   child: ListView(
            //     children: [
            //       CarouselSlider(
            //         items: banner
            //             .map(
            //               (e) => Container(
            //                 margin: const EdgeInsets.all(6.0),
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(16.0),
            //                   image: DecorationImage(
            //                     image: AssetImage("$e"),
            //                     fit: BoxFit.cover,
            //                   ),
            //                 ),
            //               ),
            //             )
            //             .toList(),
            //         options: CarouselOptions(
            //           height: size.height * 0.15,
            //           enlargeCenterPage: true,
            //           aspectRatio: 16 / 9,
            //           autoPlayCurve: Curves.fastOutSlowIn,
            //           autoPlayAnimationDuration:
            //               const Duration(milliseconds: 800),
            //           viewportFraction: 0.95,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),