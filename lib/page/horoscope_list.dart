import 'package:flutter/material.dart';
import 'package:horoscope_app/data/strings.dart';
import 'package:horoscope_app/model/horoscope.dart';
import 'package:horoscope_app/widget/horoscope_item_widget.dart';

class HoroscopeList extends StatelessWidget {
  late List<Horoscope> allHoroscope;
  HoroscopeList() {
    allHoroscope = prepareTheDataSource();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
      appBar: AppBar(
        title: const Text('Horoscope List'),
      ),
      body: HoroscopeItemWidget(allHoroscope: allHoroscope),
    );
  }

  List<Horoscope> prepareTheDataSource() {
    List<Horoscope> temporary = [];
    for (int i = 0; i < 12; i++) {
      var horoscopeName = Strings.BURC_ADLARI[i];
      var horoscopeDate = Strings.BURC_TARIHLERI[i];
      var horoscopeGenerals = Strings.HOROSCOPE_GENERALS[i];
      var horoscopeDetail = Strings.BURC_DETAYI[i];
      var horoscopeAvatar = Strings.HOROSCOPE_AVATAR[i];
      var horoscopeBigPicture = Strings.HOROSCOPE_BIG_PICTURES[i];
      Horoscope additiveHoroscope = Horoscope(
          horoscopeName,
          horoscopeDate,
          horoscopeGenerals,
          horoscopeDetail,
          horoscopeAvatar,
          horoscopeBigPicture);

      temporary.add(additiveHoroscope);
    }
    return temporary;
  }
}
