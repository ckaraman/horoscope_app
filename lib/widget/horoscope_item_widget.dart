import 'package:flutter/material.dart';
import 'package:horoscope_app/data/strings.dart';
import 'package:horoscope_app/model/horoscope.dart';
import 'package:horoscope_app/widget/horoscope_widget.dart';

class HoroscopeItemWidget extends StatefulWidget {
  List<Horoscope> allHoroscope;
  HoroscopeItemWidget({required this.allHoroscope, Key? key}) : super(key: key);

  @override
  _HoroscopeItemWidgetState createState() => _HoroscopeItemWidgetState();
}

class _HoroscopeItemWidgetState extends State<HoroscopeItemWidget> {
  final pageController = PageController(viewportFraction: 0.8);
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: pageController,
            itemCount: widget.allHoroscope.length,
            itemBuilder: (context, index) {
              final listingHoroscope = widget.allHoroscope[index];
              return HoroscopeWidget(
                horoscope: listingHoroscope,
              );
            },
            onPageChanged: (index) => setState(() => pageIndex = index),
          ),
        ),
        Text(
          "${pageIndex + 1}/ ${Strings.BURC_ADLARI.length}",
          style: const TextStyle(color: Colors.white70),
        )
      ],
    );
  }
}
