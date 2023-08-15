import 'package:flutter/material.dart';
import 'package:hs_frontend/screens/home/screen/home_screen.dart';
import 'package:hs_frontend/screens/profile/profile.dart';
import 'package:hs_frontend/screens/technician/technician_list_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreen() {
    return [
      HomeScreen(),
      Text('Cart'),
      Text('Search'),
      TechnicianListScreen(),
      ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItem() {
    return [
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          activeColorPrimary: Colors.teal.shade800,
          inactiveIcon: Icon(Icons.home, color: Colors.grey.shade100)),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.shopping_cart),
          activeColorPrimary: Colors.teal.shade800,
          inactiveIcon: Icon(Icons.shopping_cart, color: Colors.grey.shade100)),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.search),
          activeColorPrimary: Colors.teal.shade800,
          inactiveIcon: Icon(Icons.search, color: Colors.grey.shade100)),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.message),
          activeColorPrimary: Colors.teal.shade800,
          inactiveIcon: Icon(Icons.message, color: Colors.grey.shade100)),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.person),
          activeColorPrimary: Colors.teal.shade800,
          inactiveIcon: Icon(Icons.person, color: Colors.grey.shade100)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreen(),
      items: _navBarItem(),
      controller: controller,
      backgroundColor: Colors.teal.shade300,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(1),
      ),
      navBarStyle: NavBarStyle.style15,
    );
  }
}
