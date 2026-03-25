import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminSettingsScreen extends StatelessWidget {
  const AdminSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إعدادات المتجر')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildOption(Icons.notifications_active, 'إرسال إشعار جماعي للكل', () {
             Get.defaultDialog(title: "إرسال إشعار", content: const TextField(decoration: InputDecoration(hintText: 'اكتب نص الإشعار هنا')), textConfirm: "إرسال الآن", onConfirm: () => Get.back());
          }),
          _buildOption(Icons.confirmation_number, 'إدارة كوبونات الخصم', () {}),
          _buildOption(Icons.admin_panel_settings, 'إدارة المديرين المساعدين', () {}),
          _buildOption(Icons.security, 'سياسات المتجر والقوانين', () {}),
          const Divider(),
          _buildOption(Icons.logout, 'تسجيل الخروج', () => Get.back(), color: Colors.red),
        ],
      ),
    );
  }

  Widget _buildOption(IconData icon, String title, VoidCallback onTap, {Color color = Colors.black}) {
    return ListTile(
      leading: Icon(icon, color: color == Colors.black ? Colors.blueGrey : color),
      title: Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
