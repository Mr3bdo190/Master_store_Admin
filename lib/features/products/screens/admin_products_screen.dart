import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminProductsScreen extends StatelessWidget {
  const AdminProductsScreen({super.key});

  void _showAddProductSheet(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor, borderRadius: const BorderRadius.vertical(top: Radius.circular(24))),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('إضافة منتج جديد', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              _buildField('اسم المنتج'),
              _buildField('السعر'),
              _buildField('القسم (موبايلات، ملابس...)'),
              _buildField('الوصف', maxLines: 3),
              const SizedBox(height: 16),
              ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.add_a_photo), label: const Text('رفع صور المنتج')),
              const SizedBox(height: 24),
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.back(), style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey), child: const Text('حفظ ونشر المنتج', style: TextStyle(color: Colors.white)))),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

  Widget _buildField(String label, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(maxLines: maxLines, decoration: InputDecoration(labelText: label, border: const OutlineInputBorder())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إدارة المنتجات'), actions: [IconButton(icon: const Icon(Icons.add), onPressed: () => _showAddProductSheet(context))]),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => ListTile(
          leading: Container(width: 50, height: 50, color: Colors.grey[300], child: const Icon(Icons.image)),
          title: Text('اسم المنتج رقم ${index + 1}'),
          subtitle: const Text('السعر: 1500 ج.م - القسم: إلكترونيات'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(icon: const Icon(Icons.edit, color: Colors.blue), onPressed: () {}),
              IconButton(icon: const Icon(Icons.delete, color: Colors.red), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
