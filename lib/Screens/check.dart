import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

// class CheckPage extends StatefulWidget {
//   const CheckPage({super.key});

//   @override
//   State<CheckPage> createState() => _CheckPageState();
// }

// class _CheckPageState extends State<CheckPage> {
//   List banner = [
//     "Assets/banner/banner1.jpg",
//     "Assets/banner/banner2.jpg",
//     "Assets/banner/banner3.jpg",
//     "Assets/banner/banner4.jpeg",
//   ];
//   int _currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SizedBox(
//         height: size.height * 0.18,
//         child: ListView(
//           physics: const NeverScrollableScrollPhysics(),
//           children: [
//             CarouselSlider(
//               items: banner
//                   .map(
//                     (e) => InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => GalleryPhotoViewWrapper(
//                               galleryItems: banner,
//                               backgroundDecoration: const BoxDecoration(
//                                 color: Colors.black,
//                               ),
//                               initialIndex: _currentIndex,
//                             ),
//                           ),
//                         );
//                       },
//                       child: Container(
//                         margin: const EdgeInsets.all(6.0),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(16.0),
//                           image: DecorationImage(
//                             image: AssetImage("$e"),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                   .toList(),
//               options: CarouselOptions(
//                 height: size.height * 0.15,
//                 enlargeCenterPage: true,
//                 onPageChanged: (index, reason) {
//                   setState(() {
//                     _currentIndex = index;
//                   });
//                 },
//                 aspectRatio: 16 / 9,
//                 autoPlayCurve: Curves.fastOutSlowIn,
//                 autoPlayAnimationDuration: const Duration(milliseconds: 800),
//                 viewportFraction: 0.95,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class GalleryPhotoViewWrapper extends StatefulWidget {
  GalleryPhotoViewWrapper({
    super.key,
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialIndex = 0,
    required this.galleryItems,
    this.scrollDirection = Axis.horizontal,
  }) : pageController = PageController(initialPage: initialIndex);

  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final PageController pageController;
  final List galleryItems;
  final Axis scrollDirection;

  @override
  State<StatefulWidget> createState() {
    return _GalleryPhotoViewWrapperState();
  }
}

class _GalleryPhotoViewWrapperState extends State<GalleryPhotoViewWrapper> {
  late int currentIndex = widget.initialIndex;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: widget.backgroundDecoration,
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: _buildItem,
              itemCount: widget.galleryItems.length,
              loadingBuilder: widget.loadingBuilder,
              backgroundDecoration: widget.backgroundDecoration,
              pageController: widget.pageController,
              onPageChanged: onPageChanged,
              scrollDirection: widget.scrollDirection,
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "${currentIndex + 1}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  decoration: null,
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.06,
              left: 10,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    return PhotoViewGalleryPageOptions(
      imageProvider: AssetImage(widget.galleryItems[index]),
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
      maxScale: PhotoViewComputedScale.covered * 4.1,
    );
  }
}
