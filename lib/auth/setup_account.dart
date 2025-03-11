import 'package:flutter/material.dart';
import 'package:save_more/auth/add_new_account.dart';

class SetupAccount extends StatefulWidget {
  const SetupAccount({super.key});

  @override
  State<SetupAccount> createState() => _SetupAccountState();
}

class _SetupAccountState extends State<SetupAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Let's setup your account!",
              style: TextStyle(
                fontSize: 36, 
                fontWeight: FontWeight.w500, 
                color: Colors.black,
                height: 1.0, 
                letterSpacing: 0,
                fontFamily: 'Inter', 
              ),
            ),

            const SizedBox(height: 12),
            const Text(
              "Account can be your bank, credit card or your wallet.",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500, 
                color: Colors.black54,
                height: 18 / 14, 
                letterSpacing: 0, 
                fontFamily: 'Inter', 
              ),
            ),

            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddNewAccount()),
                  );
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFEF5E28),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Let’s go",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
