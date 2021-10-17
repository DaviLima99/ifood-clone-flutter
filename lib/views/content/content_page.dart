import 'package:flutter/material.dart';
import 'package:ifood/controllers/content_controller.dart';
import 'package:ifood/core/theme/app_icons.dart';
import 'package:ifood/models/category.dart';
import 'package:ifood/views/content/components/bottom_navigator_component.dart';
import 'package:ifood/views/content/components/category_item_component.dart';
import 'package:ifood/views/content/components/content_tab_bar_component.dart';
import 'package:ifood/views/content/components/header_local_component.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage>     with SingleTickerProviderStateMixin {
  
  late TabController tabController;

  final contentController = ContentController();

  late List<Category> categories;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    categories = contentController.getCategory();
    super.initState();
  }

   int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxScroll) {
            return [
              const HeaderLocationComponent(location: 'Rua Pio XI, 212, São Paulo'),
              ContentTabBarComponent(controller: tabController, onTap: (index) {})
            ];
          }, 
          body: Column(
            children: [
               Expanded(
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 86,
                        child: ListView.builder(
                          itemCount: categories.length,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                left: index == 0 ? 16 : 0,
                                right: index == categories.length - 1 ? 16 : 10,
                              ),
                              child: CategoryItemComponent(category: categories[index],),
                            );
                          }
                        )
                      ),
                    )
                  ],
                ),
              ),
              BottomNavigatorComponent(
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                currentIndex: _currentIndex,
                items: const [
                  BottomNavigatorItem(title: 'Início', icon: AppIcons.home, activeIcon: AppIcons.homeActive),
                  BottomNavigatorItem(title: 'Busca', icon: AppIcons.search, activeIcon: AppIcons.searchActive),
                  BottomNavigatorItem(title: 'Pedidos', icon: AppIcons.orders, activeIcon: AppIcons.ordersActive),
                  BottomNavigatorItem(title: 'Perfil', icon: AppIcons.profile, activeIcon: AppIcons.profileActive),
                ]
              )
            ],
          )
        ),
      )
    );
  }
}