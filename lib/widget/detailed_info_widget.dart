import 'package:flutter/material.dart';
import 'package:horoscope_app/data/hero_tag.dart';
import 'package:horoscope_app/model/horoscope.dart';

import 'hero_widget.dart';

class DetailedInfoWidget extends StatelessWidget {
  final Horoscope horoscope;

  const DetailedInfoWidget({
    required this.horoscope,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeroWidget(
                  tag: HeroTag.horoscopeName(horoscope),
                  child: Text(
                    horoscope.horoscopeName,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: HeroWidget(
                    tag: HeroTag.horoscopeAvatar(horoscope),
                    child: Image.asset(
                      horoscope.horoscopeAvatar,
                      fit: BoxFit.fill,
                      scale: 2.8,
                    ),
                  ),
                ),
              ],
            ),

            // HeroWidget(
            //   tag: HeroTag.stars(location),
            //   child: StarsWidget(stars: location.starRating),
            // ),
          ],
        ),
      );
}
