import 'package:carib/Components/small_theme_button.dart';
import 'package:carib/Screens/check.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({super.key});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  bool added = false;
  List banner = [
    "Assets/asset.jpeg",
    'Assets/Screenshot.png',
    'Assets/check.png',
  ];
  bool isExpanded = false;
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          elevation: 0.5,
          title: const Text('Lorem'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: added
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_outline),
              onPressed: () {
                setState(() {
                  added = !added;
                });
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 250.0,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    CarouselSlider(
                      items: banner
                          .map(
                            (e) => InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        GalleryPhotoViewWrapper(
                                      galleryItems: banner,
                                      initialIndex: currentIndex,
                                      backgroundDecoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.5)),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  image: DecorationImage(
                                    image: AssetImage(e),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      options: CarouselOptions(
                        height: 250.0,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 16 / 9,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        autoPlayCurve: Curves.fastOutSlowIn,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        viewportFraction: 0.95,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  // color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          Expanded(
                              child: Text(
                            'Lorem Ipsum',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )),
                          // const Icon(
                          //   Icons.star,
                          //   color: Colors.green,
                          // ),
                          // const Text('4.3'),
                          // Text(
                          //   '(150 Reviews)',
                          //   style: TextStyle(
                          //       color: Colors.black.withOpacity(0.5)),
                          // ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                        maxLines: isExpanded ? 100 : 3,
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.black.withOpacity(0.5)),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: isExpanded
                            ? const Text(
                                'Show Less',
                                style: TextStyle(color: Colors.green),
                              )
                            : const Text(
                                'Show More',
                                style: TextStyle(color: Colors.green),
                              ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Year',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                              const FittedBox(
                                child: Text(
                                  '2020',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Make',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                                const FittedBox(
                                  child: Text(
                                    'Corolla',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: [
                              Text(
                                'Model',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                              const FittedBox(
                                child: Text(
                                  'GLi',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Price',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white.withOpacity(0.4),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        '\$99.09',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '\$105.09',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SmallThemeButton(
                title: 'Add to Cart',
                ontap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(
    imagesLength,
    (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black : Colors.black26,
            shape: BoxShape.circle),
      );
    },
  );
}
