import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AdsBord extends StatelessWidget {
  const AdsBord({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> slidercontend = [
      'https://www.thedailystar.net/sites/default/files/styles/big_4/public/2026-03/Domm%202.jpg?h=66a2249f',
      'https://www.thedailystar.net/sites/default/files/styles/big_1/public/2026-02/poster.png?h=a6c55029',
      'https://www.businesstimes-bd.com/assets/news_photos/2026/03/24/image_4963_1774351649.webp',
      'https://rakkhosh.net/wp-content/uploads/Rakkhosh-Movie.webp',
      'https://mir-s3-cdn-cf.behance.net/projects/808/5d227c233479187.Y3JvcCwxOTk5LDE1NjQsMCwxMDI5.jpg'
    ];
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 200,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
      itemCount: slidercontend.length,
      itemBuilder: (context, index, realIndex) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(slidercontend[index]), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
