import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AdsBord extends StatelessWidget {
  const AdsBord({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> slidercontend = [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoCOaGxNy-aGMdKCSFCEaS_b5m-nq2Mo5isg&s'
      'https://i.ytimg.com/vi/aF_AEwxzM4A/hqdefault.jpg'
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT08cTNZVtAYspe_yS4HZGRmAJsOlhLtOy-eQ&s'
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKBl4UZw9RSDIDuyiy23gGo5uLhYHCDFZAnA&s'
    ];
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 160,
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
