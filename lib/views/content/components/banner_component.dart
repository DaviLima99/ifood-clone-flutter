 import 'package:flutter/material.dart';
import 'package:ifood/core/theme/app_colors.dart';

class BannerComponent extends StatefulWidget {
  final List<BannerItemComponent> itens;

  const BannerComponent({ Key? key, required this.itens }) : super(key: key);

  @override
  State<BannerComponent> createState() => _BannerComponentState();
}

class _BannerComponentState extends State<BannerComponent> {
  final PageController _pageController = PageController(
    viewportFraction: 0.9
  );

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onChange);
  }

  _onChange() {
    setState(() {
      _currentIndex = _pageController.page!.toInt(); 
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(_onChange);
    super.dispose();
  }

   

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children:[ 
          SizedBox(
            height: 110,
            child: PageView(
              controller: _pageController ,
              children: widget.itens,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.itens.map((e) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration( 
                    shape: BoxShape.circle,
                    color: widget.itens.indexOf(e) == _currentIndex ? AppColors.grey : AppColors.grey300,
                  ),
                  height: 6,
                  width: 6
                ),
              )).toList(),
            ),
          )
        ]
      ),
    ); 
  }
}

 class BannerItemComponent extends StatelessWidget {
   final String imagePath;

   const BannerItemComponent({ Key? key, required this.imagePath }) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8 ),
          child: Image.asset( 
            imagePath,
            fit: BoxFit.cover,
         ),
       ),
     );
   }
 }