import 'package:flutter/material.dart';
import 'dashboard_screen.dart';

class AdminLayout extends StatefulWidget {
  const AdminLayout({super.key});

  @override
  State<AdminLayout> createState() => _AdminLayoutState();
}

class _AdminLayoutState extends State<AdminLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const DashboardScreen(),
    const Center(child: Text('إدارة المنتجات', style: TextStyle(fontSize: 24))),
    const Center(child: Text('إدارة الطلبات', style: TextStyle(fontSize: 24))),
    const Center(child: Text('الدعم الفني والرسائل', style: TextStyle(fontSize: 24))),
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
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_outlined), activeIcon: Icon(Icons.dashboard), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.inventory_2_outlined), activeIcon: Icon(Icons.inventory_2), label: 'المنتجات'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_checkout), activeIcon: Icon(Icons.shopping_cart_checkout), label: 'الطلبات'),
          BottomNavigationBarItem(icon: Icon(Icons.support_agent), activeIcon: Icon(Icons.support_agent), label: 'الدعم'),
        ],
      ),
    );
  }
}
