import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentIndex = 0;
  List<String> _imageUrls = [
    'images/quiz.jpg',
    'images/doraemon.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.cyan,
      child: Stack(
        children: [
          Column(
            children: [
              CarouselSlider(
                items: _imageUrls.map((imageUrl) {
                  return Container(
                    margin: EdgeInsets.all(5),
                    height: 300.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      //set border radius to 50% of square height and width
                      image: DecorationImage(
                        image: AssetImage(imageUrl),
                        fit: BoxFit.cover, //change image fill type
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, _) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _imageUrls.map((imageUrl) {
                  int index = _imageUrls.indexOf(imageUrl);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? Colors.blueAccent
                          : Colors.grey,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
          Positioned(
              top: 5,
              left: 5,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ))
        ],
      ),
    );
  }
}
