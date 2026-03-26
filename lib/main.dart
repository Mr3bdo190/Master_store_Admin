import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const AdminApp());
}

class AdminApp extends StatelessWidget {
  const AdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Master Store Admin',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const AdminDashboard(),
    );
  }
}

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  // للتحكم في الحقول اللي المدير بيكتب فيها
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  // دالة إضافة منتج لقاعدة البيانات
  Future<void> addProduct() async {
    if (nameController.text.isEmpty || priceController.text.isEmpty) return;

    await FirebaseFirestore.instance.collection('products').add({
      'name': nameController.text,
      'price': double.parse(priceController.text),
      'created_at': FieldValue.serverTimestamp(),
    });

    // تفريغ الحقول بعد الإضافة
    nameController.clear();
    priceController.clear();
    if (mounted) Navigator.pop(context); // قفل النافذة
  }

  // نافذة (Dialog) إضافة منتج جديد
  void showAddProductDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('إضافة منتج جديد', textAlign: TextAlign.right),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'اسم المنتج'),
              textAlign: TextAlign.right,
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'السعر'),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.right,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: addProduct,
            child: const Text('إضافة'),
          ),
        ],
      ),
    );
  }

  // دالة لحذف المنتج
  Future<void> deleteProduct(String docId) async {
    await FirebaseFirestore.instance.collection('products').doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إدارة المنتجات', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      // StreamBuilder بيسمع قاعدة البيانات لحظة بلحظة
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('products').orderBy('created_at', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('لا توجد منتجات حالياً. أضف منتجك الأول!', style: TextStyle(fontSize: 18)));
          }

          final products = snapshot.data!.docs;

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              var product = products[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  title: Text(product['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('السعر: ${product['price']} جنيه'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => deleteProduct(product.id),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: showAddProductDialog,
        icon: const Icon(Icons.add),
        label: const Text('إضافة منتج'),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
