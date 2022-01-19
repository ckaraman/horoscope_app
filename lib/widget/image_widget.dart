import 'package:flutter/material.dart';
import 'package:horoscope_app/data/hero_tag.dart';
import 'package:horoscope_app/model/horoscope.dart';
import 'package:horoscope_app/widget/hero_widget.dart';

import 'lat_long_widget.dart';

class ImageWidget extends StatelessWidget {
  final Horoscope horoscope;

  const ImageWidget({required this.horoscope, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      /// space from white container
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: size.height * 0.5,
      width: size.width * 0.8,
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 2, spreadRadius: 1),
          ],
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Stack(
          children: [
            buildImage(),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildTopText(),
                  LatLongWidget(
                    horoscope: horoscope,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildImage() => SizedBox.expand(
        child: HeroWidget(
          tag: HeroTag.image(horoscope.horoscopeBigPicture),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child:
                Image.asset(horoscope.horoscopeBigPicture, fit: BoxFit.cover),
          ),
        ),
      );

  Widget buildTopText() => Text(
        horoscope.horoscopeName,
        style: TextStyle(
          color: Colors.grey[100],
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
      );
}
