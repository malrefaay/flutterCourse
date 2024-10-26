import 'package:flutter/material.dart';
enum Currency { usd, egp }

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Currency _currency = Currency.egp;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Change Currency"),
          ListTile(
            title: const Text('USD \$'),
            leading: Radio<Currency>(
              value: Currency.usd,
              groupValue: _currency,
              onChanged: (Currency? value) {
                setState(() {
                  if (value != null) {
                    _currency = value;
                  }
                });
              },
            ),
          ),
          ListTile(
            title: const Text('EGP '),
            leading: Radio<Currency>(
              value: Currency.egp,
              groupValue: _currency,
              onChanged: (Currency? value) {
                setState(() {
                  if (value != null) {
                    _currency = value;
                  }
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
