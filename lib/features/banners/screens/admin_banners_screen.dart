import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminBannersScreen extends StatelessWidget {
  const AdminBannersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إدارة بنرات العروض')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.snackbar('رفع بنر', 'سيتم فتح معرض الصور لرفع عرض جديد'),
        backgroundColor: Colors.blueGrey,
        child: const Icon(Icons.add_photo_alternate, color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 3,
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Column(
            children: [
              Container(height: 150, width: double.infinity, color: Colors.blueGrey.withOpacity(0.1), child: const Icon(Icons.image, size: 50, color: Colors.grey)),
              ListTile(
                title: Text('عرض رقم ${index + 1}'),
                subtitle: const Text('رابط العرض: قسم الموبايلات'),
                trailing: IconButton(icon: const Icon(Icons.delete, color: Colors.red), onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
