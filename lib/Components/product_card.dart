import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.size,
    required this.imageHeight,
    required this.imageWidth,
  }) : super(key: key);

  final Size size;
  final double imageHeight;
  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.18,
      width: size.width * 0.4,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
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
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  width: size.width,
                  height: imageHeight,
                  'Assets/asset.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Recently Added',
                      style: TextStyle(color: Colors.green, fontSize: 10),
                    ),
                    Text(
                      'Lorem Ipsum',
                      style: TextStyle(fontSize: 15),
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
          //       children: const [Icon(Icons.star, size: 15), Text('3.5')],
          //     ),
          //   ),
          // ),

          Positioned(
            left: 120,
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
    );
  }
}
