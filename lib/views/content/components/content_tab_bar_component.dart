import 'package:flutter/material.dart';
import 'package:ifood/core/theme/app_colors.dart';
import 'package:ifood/core/theme/app_typography.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class ContentTabBarComponent extends StatelessWidget {
  final TabController controller;

  final Function(int) onTap;

  const ContentTabBarComponent({ Key? key, required this.controller, required this.onTap }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _ContentTabBarComponentDelegate(controller, onTap)
    );
  }
}


class _ContentTabBarComponentDelegate extends SliverPersistentHeaderDelegate {
  final TabController controller;
  final Function(int) onTap;

  _ContentTabBarComponentDelegate(this.controller, this.onTap);


  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 200),
      child: TabBar(
        onTap: onTap,
        labelPadding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        labelColor: AppColors.primaryColor,
        unselectedLabelColor: AppColors.black54,
        labelStyle: AppTypography.tabBarStyle(context),
        indicator: MaterialIndicator(
          color: AppColors.primaryColor,
          height: 2,
          bottomLeftRadius: 5,
          bottomRightRadius: 5
        ),
        controller: controller,
        tabs: const [
        Tab(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Restaurantes'),
          ),
        ),
        Tab(
            child: Align(
            alignment: Alignment.center,
            child: Text('Mercados'),
          ),
        ),
      ]),
    );
  }

  @override
  double get maxExtent => 50;
  
  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
  
} 