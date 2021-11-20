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
    return Container(
      color: Colors.white,
      height: 54,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          SizedBox(
            width: 16,
          ),
          FilterItemComponent(
            label: 'Ordenar',
            icon: AppIcons.arrowDown,
          ),
          FilterItemComponent(
            label: 'Pra Retirar',
            icon: AppIcons.arrowDown,
          ),
          FilterItemComponent(
            label: 'Entra Grátis',
          ),
          FilterItemComponent(
            label: 'Vale Refeição',
          ),
          FilterItemComponent(
            label: 'Distância',
            icon: AppIcons.arrowDown,
          ),
          FilterItemComponent(
            label: 'Entrega Parceira',
            icon: AppIcons.arrowDown,
          ),
          FilterItemComponent(
            label: 'Filtros',
            icon: AppIcons.arrowDown,
            
          ),
          SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => height + 54;

  @override
  double get minExtent => height + 54;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
  
}

class FilterItemComponent extends StatelessWidget {
  final String label;
  final String? icon;
  
  const FilterItemComponent({ Key? key, required this.label, this.icon }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:  12, bottom: 12, right: 8),
      child: Container( 
        decoration: BoxDecoration( 
          borderRadius: BorderRadius.circular(32),
          color: Colors.white,
          border: Border.all(
            color: AppColors.grey
          )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Text(label, style: AppTypography.filterItemStyle(context)
                      .copyWith(color: AppColors.grey)),
               if (icon != null) AppIcon(icon!, size: const Size(14, 14), color: AppColors.grey)
            ],
          ),
        ),
      ),
    );
  }
}