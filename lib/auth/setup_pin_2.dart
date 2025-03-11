import 'package:flutter/material.dart';
import 'setup_account.dart';

class SetupPin2 extends StatefulWidget {
  const SetupPin2({super.key});

  @override
  State<SetupPin2> createState() => _SetupPin2State();
}

class _SetupPin2State extends State<SetupPin2> {
  List<String> pin = [];

  void _onKeyPressed(String value) {
    if (pin.length < 4) {
      setState(() {
        pin.add(value);
      });
    }
  }

  void _onDeletePressed() {
    if (pin.isNotEmpty) {
      setState(() {
        pin.removeLast();
      });
    }
  }

  void _onSubmit() {
    if (pin.length == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SetupAccount()),
      );
    }
  }

  Widget _buildPinIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        bool isFilled = index < pin.length;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: isFilled ? Colors.white : Colors.white.withOpacity(0.4),
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }

  Widget _buildKeypadButton(String number) {
    return GestureDetector(
      onTap: () => _onKeyPressed(number),
      child: Container(
        width: 80,
        height: 80,
        alignment: Alignment.center,
        child: Text(
          number,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildKeypad() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: ['1', '2', '3'].map(_buildKeypadButton).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: ['4', '5', '6'].map(_buildKeypadButton).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: ['7', '8', '9'].map(_buildKeypadButton).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: _onDeletePressed,
              child: const Icon(Icons.backspace, color: Colors.white, size: 32),
            ),
            _buildKeypadButton('0'),
            GestureDetector(
              onTap: _onSubmit,
              child: const Icon(Icons.arrow_forward, color: Colors.white, size: 32),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEF5E28),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEF5E28),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          const Text(
            "Ok. Re type your PIN again.",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 40),
          _buildPinIndicator(),
          const SizedBox(height: 60),
          _buildKeypad(),
        ],
      ),
    );
  }
}
