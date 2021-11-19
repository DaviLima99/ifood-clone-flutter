import 'package:flutter/material.dart';
import 'package:ifood/core/theme/app_colors.dart';
import 'package:ifood/core/theme/app_icons.dart';
import 'package:ifood/core/theme/app_typography.dart';

class FiltersComponent extends StatelessWidget {

  const FiltersComponent({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(pinned: true, delegate: _FiltersComponentDelegate(MediaQuery.of(context).padding.top));
  }
}

class _FiltersComponentDelegate extends SliverPersistentHeaderDelegate {
  final double height;

  _FiltersComponentDelegate(this.height);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child:  Row(
                children: [
                  Text("äsa", style: AppTypography.bodyText(context)),
                  const AppIcon(AppIcons.arrowDown, size: Size(20, 20), color: AppColors.primaryColor)
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  @override
  double get maxExtent => height + 40;

  @override
  double get minExtent => height + 40;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
  
} 