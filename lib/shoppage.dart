import 'package:flutter/material.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({super.key});

  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _phone = '';
  String _pan = '';
  double _amount = 0.0;
  String _paymentMethod = 'Credit Card';
  String _notes = '';

  final List<String> _paymentMethods = [
    'Credit Card',
    'Debit Card',
    'PayPal',
    'Bank Transfer'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temple Donation Form'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _phone = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'PAN Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your PAN number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _pan = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Donation Amount'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      double.tryParse(value) == null) {
                    return 'Please enter a valid amount';
                  }
                  return null;
                },
                onSaved: (value) {
                  _amount = double.parse(value!);
                },
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: 'Payment Method'),
                value: _paymentMethod,
                onChanged: (String? newValue) {
                  setState(() {
                    _paymentMethod = newValue!;
                  });
                },
                items: _paymentMethods.map((String method) {
                  return DropdownMenuItem(
                    value: method,
                    child: Text(method),
                  );
                }).toList(),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Notes'),
                maxLines: 3,
                onSaved: (value) {
                  _notes = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _showReceiptDialog(context);
                  }
                },
                child: Text('Submit Donation'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showReceiptDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Donation Receipt'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Name: $_name'),
                Text('Email: $_email'),
                Text('Phone: $_phone'),
                Text('PAN Number: $_pan'),
                Text('Amount: \$$_amount'),
                Text('Payment Method: $_paymentMethod'),
                Text('Notes: $_notes'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
