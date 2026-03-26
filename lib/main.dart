import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  // السطرين دول هما اللي بيفتحوا الاتصال الفعلي بقاعدة البيانات أول ما التطبيق يفتح
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
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AdminDashboard(),
    );
  }
}

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  // دالة تجريبية لرفع بيانات لـ Firestore
  Future<void> addTestProduct() async {
    try {
      await FirebaseFirestore.instance.collection('products').add({
        'name': 'منتج تجريبي من بودا',
        'price': 150,
        'created_at': FieldValue.serverTimestamp(),
      });
      print("تمت الإضافة بنجاح!");
    } catch (e) {
      print("حصل خطأ: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('لوحة تحكم المدير'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          ),
          onPressed: () {
            // لما تدوس على الزرار هينفذ دالة الرفع
            addTestProduct();
            
            // إظهار رسالة سريعة أسفل الشاشة
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('جاري إضافة المنتج لقاعدة البيانات...')),
            );
          },
          child: const Text('إضافة منتج تجريبي لـ Firebase', style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
