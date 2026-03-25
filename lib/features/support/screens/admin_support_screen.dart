import 'package:flutter/material.dart';

class AdminSupportScreen extends StatelessWidget {
  const AdminSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('رسائل الدعم الفني')),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text('العميل: مستخدم رقم ${index + 1}'),
          subtitle: const Text('عندي مشكلة في كود الخصم مش شغال...'),
          trailing: const Badge(label: Text('1')),
          onTap: () {}, // يفتح الشات للرد
        ),
      ),
    );
  }
}
