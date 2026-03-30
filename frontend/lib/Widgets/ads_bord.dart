import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AdsBord extends StatelessWidget {
  const AdsBord({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> slidercontend = [
      'https://www.techbros.ae/cdn/shop/files/Social_Media_Banners_9.jpg?v=1747327728&width=1400',
      'https://www.ecselectronics.com/cdn/shop/files/Home_Page_-_Big_Banners_1903_X_520_cf7c8c7c-d2bb-4925-9a95-6843f872bbcc.png?v=1755499319',
      'https://storage.googleapis.com/mj-banner-bucket/banner-1734598374.png',
      'https://img.freepik.com/free-vector/instagram-carousel-templates_52683-51654.jpg?semt=ais_hybrid&w=740&q=80',
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
