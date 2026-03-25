import 'package:flutter/material.dart';

class AdminOrdersScreen extends StatelessWidget {
  const AdminOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إدارة الطلبات')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 4,
        itemBuilder: (context, index) => Card(
          child: ExpansionTile(
            leading: const Icon(Icons.shopping_cart, color: Colors.blueGrey),
            title: Text('طلب رقم #${1000 + index}'),
            subtitle: const Text('العميل: عبدالرحمن بودا - الإجمالي: 3500 ج.م'),
            children: [
              const ListTile(title: Text('المنتجات: تيشيرت صيفي (2)، ساعة (1)')),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _orderBtn('تجهيز', Colors.orange),
                    _orderBtn('شحن', Colors.blue),
                    _orderBtn('توصيل', Colors.green),
                    _orderBtn('إلغاء', Colors.red),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _orderBtn(String label, Color color) {
    return ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: color), child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)));
  }
}
