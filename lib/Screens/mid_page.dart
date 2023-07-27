import 'package:carib/Screens/product_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CategoryMidPage extends StatefulWidget {
  const CategoryMidPage({super.key});

  @override
  State<CategoryMidPage> createState() => _CategoryMidPageState();
}

class _CategoryMidPageState extends State<CategoryMidPage> {
  String? yearValue;
  String? makeValue;
  String? modelValue;
  bool filteredData = false;
  List year = [
    '2000',
    '2001',
    '2002',
    '2003',
    '2004',
    '2005',
    '2006',
    '2007',
    '2008',
    '2009',
    '2010',
  ];
  List banner = [
    "Assets/banner/banner11.jpg",
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: const Center(
                  child: Text(
                'Category',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
              trailing: const Text('           '),
            ),
            SizedBox(
              height: size.height * 0.15,
              child: ListView(
                children: [
                  CarouselSlider(
                    items: banner
                        .map(
                          (e) => Container(
                            margin: const EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              image: DecorationImage(
                                image: AssetImage("$e"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                      height: size.height * 0.15,
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      viewportFraction: 0.95,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton(
                    value: yearValue,
                    hint: const Text('Year'),
                    items: year.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                    onChanged: (e) {
                      setState(() {
                        yearValue = e.toString();
                      });
                    },
                  ),
                  DropdownButton(
                    value: makeValue,
                    hint: const Text('Make'),
                    items: year.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                    onChanged: (e) {
                      setState(() {
                        makeValue = e.toString();
                      });
                    },
                  ),
                  DropdownButton(
                    value: modelValue,
                    hint: const Text('Model'),
                    items: year.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                    onChanged: (e) {
                      setState(() {
                        modelValue = e.toString();
                      });
                    },
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Interior',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 100,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CategoryPage()));
                    },
                    child: Column(
                      children: [
                        const Text('(109)'),
                        Container(
                          margin: const EdgeInsets.all(2.0),
                          height: size.height * 0.1,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('Assets/image1.jpg'),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          // child: const Center(child: Text('data')
                          // ),
                        ),
                        const Text('Itme Name'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
