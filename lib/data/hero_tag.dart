import 'package:horoscope_app/model/horoscope.dart';

class HeroTag {
  static String image(String horoscopeBigPicture) => horoscopeBigPicture;

  static String horoscopeName(Horoscope horoscope) => horoscope.horoscopeName;

  static String horoscopeAvatar(Horoscope horoscope) =>
      horoscope.horoscopeAvatar;

  static String horoscopeDate(Horoscope horoscope) => horoscope.horoscopeDate;

  static String sharp(String sharp) => sharp;
  // static String avatar(Review review, int position) =>
  //     review.urlImage + position.toString();
}
