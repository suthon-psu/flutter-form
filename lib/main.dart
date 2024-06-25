import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FormScreen(),
    );
  }
}

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final TextEditingController username = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: username,
              decoration: const InputDecoration(labelText: "Username"),
              validator: (value) {
                if (value!.isNotEmpty) {
                  return null;
                } else {
                  return "value = null";
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                bool isValidate = _formKey.currentState!.validate();
                if (isValidate) {
                  print(username.text);
                }
              },
              child: const Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
