import &#39;package:flutter/material.dart&#39;;
void main() =&gt; runApp(MaterialApp(home: SimpleForm(),
debugShowCheckedModeBanner: false));
class SimpleForm extends StatefulWidget {
  const SimpleForm({super.key});
  @override
  State&lt;SimpleForm&gt; createState() =&gt; _SimpleFormState();
}
class _SimpleFormState extends State&lt;SimpleForm&gt; {
  final _formKey = GlobalKey&lt;FormState&gt;();
  final name = TextEditingController(), email = TextEditingController(), pass
= TextEditingController(), dob = TextEditingController();
  String? gender;
  bool agree = false;
  Future&lt;void&gt; pickDate() async {
    final d = await showDatePicker(context: context, initialDate:
DateTime(2000), firstDate: DateTime(1980), lastDate: DateTime(2030));
    if (d != null) dob.text = &quot;${d.day}-${d.month}-${d.year}&quot;;
  }
  void submit() {
    if (_formKey.currentState!.validate() &amp;&amp; agree) {
      showDialog(
        context: context,
        builder: (_) =&gt; AlertDialog(
          title: Text(&quot;Submitted&quot;),
          content: Text(&quot;Name: ${name.text}\nEmail: ${email.text}\nGender:
$gender\nDOB: ${dob.text}&quot;),
          actions: [TextButton(onPressed: () =&gt; Navigator.pop(context), child:
Text(&quot;OK&quot;))],
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(&quot;Simple Registration&quot;)),
      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Form(
          key: _formKey,
          child: ListView(children: [
            TextFormField(controller: name, decoration:
InputDecoration(labelText: &quot;Name&quot;), validator: (v) =&gt; v!.isEmpty ? &quot;Enter
name&quot; : null),
            TextFormField(controller: email, decoration:
InputDecoration(labelText: &quot;Email&quot;), validator: (v) =&gt; !v!.contains(&#39;@&#39;) ?
&quot;Invalid email&quot; : null),
            TextFormField(controller: pass, decoration:
InputDecoration(labelText: &quot;Password&quot;), obscureText: true, validator: (v) =&gt;
v!.length &lt; 6 ? &quot;Min 6 chars&quot; : null),
            DropdownButtonFormField(
              value: gender,
              decoration: InputDecoration(labelText: &quot;Gender&quot;),
              items: [&quot;Male&quot;, &quot;Female&quot;].map((g) =&gt; DropdownMenuItem(value: g,
child: Text(g))).toList(),
              onChanged: (v) =&gt; setState(() =&gt; gender = v),
              validator: (v) =&gt; v == null ? &quot;Select gender&quot; : null,
            ),
            TextFormField(
              controller: dob,
              readOnly: true,
              decoration: InputDecoration(labelText: &quot;Date of Birth&quot;,
suffixIcon: Icon(Icons.calendar_today)),
              onTap: pickDate,
              validator: (v) =&gt; v!.isEmpty ? &quot;Select date&quot; : null,
            ),
            CheckboxListTile(
              value: agree,
              onChanged: (v) =&gt; setState(() =&gt; agree = v!),
              title: Text(&quot;I agree to terms&quot;),
              controlAffinity: ListTileControlAffinity.leading,
            ),
            ElevatedButton(onPressed: submit, child: Text(&quot;Submit&quot;))
          ]),
        ),
      ),
    );
  }
}
