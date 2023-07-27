import 'package:carib/Components/theme_button.dart';
import 'package:flutter/material.dart';

class EnterForgetPassword extends StatefulWidget {
  const EnterForgetPassword({super.key});

  @override
  State<EnterForgetPassword> createState() => _EnterForgetPasswordState();
}

class _EnterForgetPasswordState extends State<EnterForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Forget Password'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Text('Enter Varification Code'),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    MyPinInputField(),
                    MyPinInputField(),
                    MyPinInputField(),
                    MyPinInputField(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Didn\'t Recieve Code? '),
                    Text(
                      'Reset Here',
                      style: TextStyle(color: Colors.green),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ThemeButton(
                  onTap: () {},
                  title: 'Send',
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyPinInputField extends StatelessWidget {
  final TextEditingController? controller;
  const MyPinInputField({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: TextField(
        controller: controller,
        autofocus: true,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
            ),
            counterText: '',
            hintStyle: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
