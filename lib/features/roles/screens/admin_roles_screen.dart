import 'package:flutter/material.dart';

class AdminRolesScreen extends StatelessWidget {
  const AdminRolesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إدارة طاقم العمل')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildStaffMember('أحمد علي', 'مدير مخازن', ['الطلبات', 'المنتجات']),
          _buildStaffMember('سارة محمد', 'دعم فني', ['المحادثات']),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: () {}, label: const Text('إضافة موظف'), icon: const Icon(Icons.person_add)),
    );
  }

  Widget _buildStaffMember(String name, String role, List<String> permissions) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.admin_panel_settings)),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('الوظيفة: $role'),
            Wrap(spacing: 4, children: permissions.map((p) => Chip(label: Text(p, style: const TextStyle(fontSize: 10)), padding: EdgeInsets.zero)).toList()),
          ],
        ),
        trailing: IconButton(icon: const Icon(Icons.edit), onPressed: () {}),
      ),
    );
  }
}
