import 'package:flutter/material.dart';
import 'package:horoscope_app/data/hero_tag.dart';

import 'package:horoscope_app/model/horoscope.dart';
import 'package:horoscope_app/widget/hero_widget.dart';

class ExpandedContentWidget extends StatelessWidget {
  final Horoscope horoscope;

  const ExpandedContentWidget({required this.horoscope, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Spacer(
            flex: 2,
          ),
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
          // const SizedBox(height: 12),
          buildReview(horoscope: horoscope)
        ],
      ),
    );
  }

  Widget buildReview({
    required Horoscope horoscope,
  }) =>
      Expanded(
        child: Text(horoscope.horoscopeGenerals,
            style: const TextStyle(color: Colors.black54, fontSize: 13)),
      );
}
