import 'package:carib/Screens/Drawer/drawer.dart';
import 'package:carib/Screens/item_details.dart';
import 'package:carib/Screens/mid_page.dart';
import 'package:carib/Screens/product_search.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List countryState = [
    {"name": "Afghanistan", "code": "AF"},
    {"name": "land Islands", "code": "AX"},
    {"name": "Albania", "code": "AL"},
    {"name": "Algeria", "code": "DZ"},
    {"name": "American Samoa", "code": "AS"},
    {"name": "AndorrA", "code": "AD"},
    {"name": "Angola", "code": "AO"},
    {"name": "Anguilla", "code": "AI"},
    {"name": "Antarctica", "code": "AQ"},
    {"name": "Antigua and Barbuda", "code": "AG"},
    {"name": "Argentina", "code": "AR"},
    {"name": "Armenia", "code": "AM"},
    {"name": "Aruba", "code": "AW"},
    {"name": "Australia", "code": "AU"},
    {"name": "Austria", "code": "AT"},
    {"name": "Azerbaijan", "code": "AZ"},
    {"name": "Bahamas", "code": "BS"},
    {"name": "Bahrain", "code": "BH"},
    {"name": "Bangladesh", "code": "BD"},
    {"name": "Barbados", "code": "BB"},
    {"name": "Belarus", "code": "BY"},
    {"name": "Belgium", "code": "BE"},
    {"name": "Belize", "code": "BZ"},
    {"name": "Benin", "code": "BJ"},
    {"name": "Bermuda", "code": "BM"},
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
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          drawer: const MyDrawer(),
          // appBar: AppBar(backgroundColor: Colors.white70),
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Hey, John 👋',
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            showSearch(
                                context: context, delegate: ProductSearch());
                          },
                          icon: const Icon(
                            Icons.search,
                            color: Colors.black,
                          )),
                      Builder(builder: (context) {
                        return IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.black,
                            ));
                      }),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.155,
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        CarouselSlider(
                          items: banner
                              .map(
                                (e) => Container(
                                  // margin: const EdgeInsets.all(6.0),
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
                            height: size.height * 0.155,
                            enlargeCenterPage: true,
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            viewportFraction: 0.99,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Parts Categories',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.15,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 50,
                      itemBuilder: (context, ind) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CategoryMidPage()));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: size.height * 0.1,
                                  width: size.height * 0.1,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('Assets/image1.jpg'),
                                    ),
                                  ),
                                ),
                                const Text('data'),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * 0.45,
                        height: size.height * 0.1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            'Assets/const.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.45,
                        height: size.height * 0.1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            'Assets/const.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                    child: TabBar(
                      isScrollable: true,
                      indicator: ShapeDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 128, 183, 56),
                            Color.fromARGB(255, 24, 24, 24),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      overlayColor: MaterialStateProperty.all<Color>(
                        Colors.green,
                      ),
                      unselectedLabelColor: Colors.black.withOpacity(0.5),
                      physics: const ClampingScrollPhysics(),
                      labelColor: Colors.white,
                      tabs: const [
                        Tab(
                          text: 'Break Parts',
                        ),
                        Tab(text: 'Interior'),
                        Tab(text: 'Lighting'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.2,
                    child: TabBarView(
                      children: [
                        SubcategoryCard(countryState: countryState, size: size),
                        Container(),
                        Container(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.155,
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        CarouselSlider(
                          items: banner
                              .map(
                                (e) => Container(
                                  // margin: const EdgeInsets.all(6.0),
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
                            height: size.height * 0.155,
                            enlargeCenterPage: true,
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            viewportFraction: 0.99,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Universal Categories',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.15,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 50,
                      itemBuilder: (context, ind) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: size.height * 0.1,
                                width: size.height * 0.1,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('Assets/image1.jpg'),
                                  ),
                                ),
                              ),
                              const Text('data'),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SubcategoryCard(countryState: countryState, size: size),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SubcategoryCard extends StatelessWidget {
  const SubcategoryCard({
    Key? key,
    required this.countryState,
    required this.size,
  }) : super(key: key);

  final List countryState;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Recommended',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'See all',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: [
              ...countryState.map((country) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: size.height * 0.13,
                    width: size.width * 0.3,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.greenAccent.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    // margin: const EdgeInsets.all(16.0),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ItemDetails()));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  width: size.width,
                                  height: size.height * 0.08,
                                  'Assets/asset.jpeg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      country['code'],
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ],
    );
  }
}

class TabBodyOne extends StatelessWidget {
  const TabBodyOne({
    Key? key,
    required this.countryState,
    required this.size,
  }) : super(key: key);

  final List countryState;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Recommended',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'See all',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                ...countryState.map((country) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: size.height * 0.22,
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.greenAccent.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 5,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      // margin: const EdgeInsets.all(16.0),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ItemDetails()));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    width: size.width,
                                    height: size.height * 0.13,
                                    'Assets/asset.jpeg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    // Text(
                                    //   'Recently Added',
                                    //   style: TextStyle(
                                    //       color: Colors.green, fontSize: 10),
                                    // ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Lorem Ipsum',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '\$99.09',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          // Positioned(
                          //   left: 100,
                          //   right: 10,
                          //   top: 10,
                          //   child: Container(
                          //     height: 20,
                          //     width: 60,
                          //     decoration: BoxDecoration(
                          //       color: Colors.green,
                          //       borderRadius: BorderRadius.circular(30),
                          //     ),
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: const [
                          //         Icon(Icons.star, size: 15),
                          //         Text('3.5')
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          Positioned(
                            left: 110,
                            right: -1,
                            bottom: -1,
                            child: Container(
                                height: 40,
                                width: 30,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(15),
                                  ),
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
