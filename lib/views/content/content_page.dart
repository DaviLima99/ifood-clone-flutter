import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ifood/core/theme/app_icons.dart';
import 'package:ifood/views/content/components/bottom_navigator_component.dart';
import 'package:ifood/views/content/components/content_tab_bar_component.dart';
import 'package:ifood/views/content/components/header_local_component.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage>     with SingleTickerProviderStateMixin {
  
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

   int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: 
            Column(
              children: [
                const HeaderLocationComponent(location: 'Rua das Flores do Campo, 51121'),
                ContentTabBarComponent(
                  controller: tabController,
                  onTap: (index) {
                   
                  },  
                )
              ],
            )
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
      ),
    );
  }
}