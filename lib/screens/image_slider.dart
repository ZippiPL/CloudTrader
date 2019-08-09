import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ImageSlider();
}

class _ImageSlider extends State<ImageSlider> {
  PageController pageController;
  List<String> images = [
    'assets/images/cloudtrader.png',
    'assets/images/ehpro.jpg',
    'assets/images/VapeMons.jpg',
    
  ];
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: images.length,
        itemBuilder: (context, position) {
          return imageSlider(position);
        },
      ),
    );
  }

  imageSlider(int index) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, widget) {
        return Center(
          child: SizedBox(
            height: 200,
            width: 300,
            child: widget,
          ),
        );
      },
      child: Image.asset(images[index],fit: BoxFit.cover,),
    );
    
  }
}
