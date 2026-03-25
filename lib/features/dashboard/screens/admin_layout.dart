import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import '../../products/screens/admin_products_screen.dart';
import '../../orders/screens/admin_orders_screen.dart';
import '../../support/screens/admin_support_screen.dart';
import 'admin_settings_screen.dart';

class AdminLayout extends StatefulWidget {
  const AdminLayout({super.key});

  @override
  State<AdminLayout> createState() => _AdminLayoutState();
}

class _AdminLayoutState extends State<AdminLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const DashboardScreen(),
    const AdminProductsScreen(),
    const AdminOrdersScreen(),
    const AdminSupportScreen(),
    const AdminSettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueGrey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.inventory), label: 'المنتجات'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'الطلبات'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'الدعم'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'الإعدادات'),
        ],
      ),
    );
  }
}
