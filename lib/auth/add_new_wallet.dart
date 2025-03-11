import 'package:flutter/material.dart';
import 'package:save_more/auth/sign_up_success.dart';

class AddNewWallet extends StatefulWidget {
  const AddNewWallet({super.key});

  @override
  State<AddNewWallet> createState() => _AddNewWalletState();
}

class _AddNewWalletState extends State<AddNewWallet> {
  String selectedBank = "Chase";
  String selectedAccountType = "Bank";

  final List<String> banks = [
    "Chase", "PayPal", "Citi", "BofA","jago", "Mandiri", "BCA","See Other"
  ];

  final List<String> bankLogos = [
    "assets/Bank.png", "assets/Bank1.png", "assets/Bank2.png",
    "assets/Bank3.png", "assets/Bank4.png", "assets/Bank5.png",
    "assets/Bank6.png","assets/See Other.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEF5E28),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Add new wallet", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text("Balance", style: TextStyle(color: Colors.white70, fontSize: 16)),
          const Text("\$00.0", style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),

          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDropdown("Name", selectedBank, banks, (newValue) {
                    setState(() {
                      selectedBank = newValue!;
                    });
                  }),

                  const SizedBox(height: 10),
                  _buildDropdown("Account Type", selectedAccountType, ["Bank", "Wallet", "Credit Card"], (newValue) {
                    setState(() {
                      selectedAccountType = newValue!;
                    });
                  }),

                  const SizedBox(height: 20),
                  const Text("Bank", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 10),
                  _buildBankIcons(),

                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpSuccess()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEF5E28),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text("Continue", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(String label, String value, List<String> items, ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.black54)),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              items: items.map((item) {
                return DropdownMenuItem(value: item, child: Text(item));
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBankIcons() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 80 / 40, // Ensures the aspect ratio is correct
      ),
      itemCount: banks.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedBank = banks[index];
            });
          },
          child: Container(
            width: 80, // Fixed width
            height: 40, // Fixed height
            padding: const EdgeInsets.all(8), // Padding inside the container
            decoration: BoxDecoration(
              color: selectedBank == banks[index] ? Colors.blue.withOpacity(0.2) : const Color(0xFFF1F1FA), // Background color
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8), // Radius
            ),
            child: Center(
              child: Image.asset(bankLogos[index], height: 24), // Adjusted for a better fit
            ),
          ),
        );
      },
    );
  }

}
