import 'package:flutter/material.dart';
import 'package:ifood/core/theme/app_colors.dart';
import 'package:ifood/core/theme/app_icons.dart';

class BottomNavigatorComponent extends StatelessWidget {
  final List<BottomNavigatorItem> items;
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigatorComponent({ Key? key, required this.items, this.currentIndex = 0, required this.onTap }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white
      ),
      child: Column(
        children: [
          Container(
            height: 1,
            color: AppColors.grey300,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: items.map(
                (e) => e.copyWith(
                  isActive: items.indexOf(e) == currentIndex,
                  onTap: () => onTap(items.indexOf(e))
                )
              ).toList()
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
    );
  }
}


class BottomNavigatorItem extends StatelessWidget {

  final String title;

  final String icon;

  final String activeIcon;

  final bool isActive;

  final VoidCallback? onTap;

  BottomNavigatorItem copyWith({
    String? title,
    String? activeIcon,
    String? icon,
    required bool isActive,
    VoidCallback? onTap
  }) {
    return BottomNavigatorItem(
      title: title ?? this.title,
      activeIcon: activeIcon ?? this.activeIcon,
      icon: icon ?? this.icon,
      isActive: isActive ? true : false,
      onTap: onTap ?? this.onTap,
    );
  }
    
  const BottomNavigatorItem({
     Key? key,
    required this.title,
    required this.icon,
    required this.activeIcon,
    this.isActive = false,
    this.onTap
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AppIcon(isActive ? activeIcon : icon, size: const Size(20, 20), color: AppColors.black),
            Text(title),
          ],
        ),
      )
    );
  }
}