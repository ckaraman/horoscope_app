import 'package:flutter/material.dart';
import 'package:horoscope_app/data/hero_tag.dart';
import 'package:horoscope_app/model/horoscope.dart';
import 'package:horoscope_app/widget/detailed_info_widget.dart';
import 'package:horoscope_app/widget/hero_widget.dart';
import 'package:palette_generator/palette_generator.dart';

class DetailPage extends StatefulWidget {
  final Horoscope horoscope;
  final Animation animation;

  const DetailPage({
    required this.horoscope,
    required this.animation,
    Key? key,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Color appColor = Colors.blueGrey[300] as Color;
  late PaletteGenerator _generator;

  @override
  void initState() {
    super.initState();
    findAppColor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: appColor,
            flexibleSpace: FlexibleSpaceBar(
              title: HeroWidget(
                tag: HeroTag.horoscopeName(widget.horoscope),
                child: Text(
                  widget.horoscope.horoscopeName,
                  style: TextStyle(
                      color: Colors.grey[100],
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              centerTitle: true,
              background: HeroWidget(
                  tag: HeroTag.image(widget.horoscope.horoscopeBigPicture),
                  child: Image.asset(
                    widget.horoscope.horoscopeBigPicture,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          SliverToBoxAdapter(
            child: DetailedInfoWidget(
              horoscope: widget.horoscope,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.horoscope.horoscopeDetail),
            ),
          ),
        ],
      ),
    );
  }

  void findAppColor() async {
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage(widget.horoscope.horoscopeBigPicture));
    appColor = _generator.dominantColor!.color;
    setState(() {});
  }
}
