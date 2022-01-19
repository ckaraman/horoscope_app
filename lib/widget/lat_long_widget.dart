import 'package:flutter/material.dart';
import 'package:horoscope_app/data/hero_tag.dart';
import 'package:horoscope_app/model/horoscope.dart';
import 'package:horoscope_app/widget/hero_widget.dart';

class LatLongWidget extends StatelessWidget {
  final Horoscope horoscope;

  const LatLongWidget({required this.horoscope, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          HeroWidget(
            tag: HeroTag.horoscopeDate(horoscope),
            child: Text(
              horoscope.horoscopeDate,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),

          // const Icon(
          //   Icons.attractions_sharp,
          //   color: Colors.white,
          //   size: 34,
          // ),

          // Text(
          //   location.longitude,
          //   style: TextStyle(color: Colors.white70),
          // )
        ],
      );
}
