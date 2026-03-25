import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const AdminApp());
}

class AdminApp extends StatelessWidget {
  const AdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Master Store Admin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
        textTheme: GoogleFonts.cairoTextTheme(),
      ),
      textDirection: TextDirection.rtl,
      home: const AdminLoginScreen(),
    );
  }
}

class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.admin_panel_settings, size: 100, color: Colors.blueGrey),
              const SizedBox(height: 16),
              const Text('لوحة تحكم المدير', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 32),
              TextFormField(decoration: const InputDecoration(labelText: 'كود المدير', border: OutlineInputBorder())),
              const SizedBox(height: 16),
              TextFormField(obscureText: true, decoration: const InputDecoration(labelText: 'كلمة السر', border: OutlineInputBorder())),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {}, 
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey, padding: const EdgeInsets.symmetric(vertical: 16)),
                  child: const Text('دخول الإدارة', style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
