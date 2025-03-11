import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/profile.png'), // Profile Image
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.purple),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("October", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 5),
            const Text("Account Balance", style: TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 5),
            const Text("\$9400", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),

            // Income & Expenses
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBalanceCard("Income", "\$5000", Colors.green, Icons.download),
                _buildBalanceCard("Expenses", "\$1200", Colors.red, Icons.upload),
              ],
            ),

            const SizedBox(height: 20),
            const Text("Spend Frequency", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              height: 100,
              decoration: BoxDecoration(color: Colors.purple.shade100, borderRadius: BorderRadius.circular(20)),
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Recent Transaction", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                GestureDetector(
                  onTap: () {},
                  child: const Text("See All", style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
                ),
              ],
            ),

            const SizedBox(height: 10),
            Expanded(child: _buildTransactionList()),
          ],
        ),
      ),

      // ✅ Custom Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(LucideIcons.creditCard), label: "Transaction"),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle, size: 40, color: Colors.purple), label: ""),
          BottomNavigationBarItem(icon: Icon(LucideIcons.wallet), label: "Budget"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }


  Widget _buildBalanceCard(String title, String amount, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: 160,
      decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              Text(amount, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }


  Widget _buildTransactionList() {
    return ListView(
      children: [
        _buildTransactionItem("Shopping", "Buy some grocery", "-\$120", Icons.shopping_bag, Colors.orange),
        _buildTransactionItem("Subscription", "Disney+ Annual..", "-\$80", Icons.subscriptions, Colors.purple),
        _buildTransactionItem("Food", "Buy a ramen", "-\$32", Icons.fastfood, Colors.red),
      ],
    );
  }


  Widget _buildTransactionItem(String title, String subtitle, String amount, IconData icon, Color color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.2),
        child: Icon(icon, color: color),
      ),
      title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
      trailing: Text(amount, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red)),
    );
  }
}
