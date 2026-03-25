import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../banners/screens/admin_banners_screen.dart';
import '../../roles/screens/admin_roles_screen.dart';

class AdminSettingsScreen extends StatelessWidget {
  const AdminSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إدارة المتجر بالكامل')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildOption(Icons.add_photo_alternate_outlined, 'إدارة سلايدر العروض', () => Get.to(() => const AdminBannersScreen())),
          _buildOption(Icons.supervisor_account_outlined, 'صلاحيات الموظفين والمديرين', () => Get.to(() => const AdminRolesScreen())),
          const Divider(),
          _buildOption(Icons.notifications_active_outlined, 'إرسال إشعار جماعي للعملاء', () {}),
          _buildOption(Icons.confirmation_number_outlined, 'إدارة كوبونات الخصم', () {}),
          _buildOption(Icons.analytics_outlined, 'تقارير المبيعات التفصيلية', () {}),
          const Divider(),
          _buildOption(Icons.logout, 'تسجيل الخروج من الإدارة', () => Get.back(), color: Colors.red),
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
