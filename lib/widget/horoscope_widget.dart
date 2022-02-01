import 'package:flutter/material.dart';
import 'package:horoscope_app/model/horoscope.dart';
import 'package:horoscope_app/page/detail_page.dart';
import 'package:horoscope_app/widget/image_widget.dart';
import 'expanded_content_widget.dart';

class HoroscopeWidget extends StatefulWidget {
  final Horoscope horoscope;

  const HoroscopeWidget({
    required this.horoscope,
    Key? key,
  }) : super(key: key);

  @override
  _HoroscopeWidgetState createState() => _HoroscopeWidgetState();
}

class _HoroscopeWidgetState extends State<HoroscopeWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double dynamicSize = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            bottom: isExpanded ? (dynamicSize / 15) : (dynamicSize * 0.22),
            width: isExpanded ? size.width * 0.78 : size.width * 0.7,
            height: isExpanded ? size.height * 0.58 : size.height * 0.5,
            child: ExpandedContentWidget(
              horoscope: widget.horoscope,
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            bottom: isExpanded ? (dynamicSize / 3.3) : (dynamicSize * 0.22),
            child: GestureDetector(
              onPanUpdate: onPanUpdate,
              onTap: openDetailPage,
              child: ImageWidget(
                horoscope: widget.horoscope,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void openDetailPage() {
    if (!isExpanded) {
      setState(() => isExpanded = true);
      return;
    }
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(seconds: 1),
        reverseTransitionDuration: const Duration(seconds: 1),
        pageBuilder: (context, animation, secondaryAnimation) {
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: const Interval(0, 0.6),
          );

          return FadeTransition(
            opacity: curvedAnimation,
            child:
                DetailPage(horoscope: widget.horoscope, animation: animation),
          );
        },
      ),
    );
  }

  void onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy < 0) {
      setState(() {
        isExpanded = true;
      });
    } else if (details.delta.dy > 0) {
      setState(() {
        isExpanded = false;
      });
    }
  }
}
