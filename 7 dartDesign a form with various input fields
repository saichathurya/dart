import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(home: SimpleForm(), debugShowCheckedModeBanner: false));


class SimpleForm extends StatefulWidget {
  const SimpleForm({super.key});


  @override
  State<SimpleForm> createState() => _SimpleFormState();
}


class _SimpleFormState extends State<SimpleForm> {
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController(), email = TextEditingController(), pass = TextEditingController(), dob = TextEditingController();
  String? gender;
  bool agree = false;


  Future<void> pickDate() async {
    final d = await showDatePicker(context: context, initialDate: DateTime(2000), firstDate: DateTime(1980), lastDate: DateTime(2030));
    if (d != null) dob.text = "${d.day}-${d.month}-${d.year}";
  }


  void submit() {
    if (_formKey.currentState!.validate() && agree) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Submitted"),
          content: Text("Name: ${name.text}\nEmail: ${email.text}\nGender: $gender\nDOB: ${dob.text}"),
          actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text("OK"))],
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Registration")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(children: [
            TextFormField(controller: name, decoration: InputDecoration(labelText: "Name"), validator: (v) => v!.isEmpty ? "Enter name" : null),
            TextFormField(controller: email, decoration: InputDecoration(labelText: "Email"), validator: (v) => !v!.contains('@') ? "Invalid email" : null),
            TextFormField(controller: pass, decoration: InputDecoration(labelText: "Password"), obscureText: true, validator: (v) => v!.length < 6 ? "Min 6 chars" : null),
            DropdownButtonFormField(
              value: gender,
              decoration: InputDecoration(labelText: "Gender"),
              items: ["Male", "Female"].map((g) => DropdownMenuItem(value: g, child: Text(g))).toList(),
              onChanged: (v) => setState(() => gender = v),
              validator: (v) => v == null ? "Select gender" : null,
            ),
            TextFormField(
              controller: dob,
              readOnly: true,
              decoration: InputDecoration(labelText: "Date of Birth", suffixIcon: Icon(Icons.calendar_today)),
              onTap: pickDate,
              validator: (v) => v!.isEmpty ? "Select date" : null,
            ),
            CheckboxListTile(
              value: agree,
              onChanged: (v) => setState(() => agree = v!),
              title: Text("I agree to terms"),
              controlAffinity: ListTileControlAffinity.leading,
            ),
            ElevatedButton(onPressed: submit, child: Text("Submit"))
          ]),
        ),
      ),
    );
  }
}


