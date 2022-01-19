import 'package:flutter/material.dart';
import 'package:horoscope_app/data/hero_tag.dart';
import 'package:horoscope_app/model/horoscope.dart';
import 'package:horoscope_app/widget/detailed_info_widget.dart';
import 'package:horoscope_app/widget/hero_widget.dart';
import 'package:horoscope_app/widget/lat_long_widget.dart';

class DetailPage extends StatelessWidget {
  final Horoscope horoscope;
  final Animation animation;

  const DetailPage({
    required this.horoscope,
    required this.animation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          // title: const Text('Detay'),
          //centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: Navigator.of(context).pop,
            ),
            const SizedBox(width: 10)
          ],
          // leading: const Icon(Icons.search_outlined),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox.expand(
                    child: HeroWidget(
                      tag: HeroTag.image(horoscope.horoscopeBigPicture),
                      child: Image.asset(horoscope.horoscopeBigPicture,
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: LatLongWidget(
                      horoscope: horoscope,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(flex: 1, child: DetailedInfoWidget(horoscope: horoscope))
            // Expanded(
            //   flex: 5,
            //   child: ReviewsWidget(location: location, animation: animation),
            // ),
            ,
            Expanded(flex: 4, child: Text(horoscope.horoscopeDetail)),
          ],
        ),
      );
}
