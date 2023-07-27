import 'package:carib/Screens/Login_Signup/login.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import '../Components/theme_button.dart';

class MyCountryPicker extends StatefulWidget {
  const MyCountryPicker({super.key});

  @override
  State<MyCountryPicker> createState() => _MyCountryPickerState();
}

class _MyCountryPickerState extends State<MyCountryPicker> {
  String? selectedCountry = 'Pakistan';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Your Country'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            const Text('Select Your Country'),
            const SizedBox(
              height: 10,
            ),
            CountryListPick(
              appBar: AppBar(
                title: const Text('Pick your country'),
              ),
              // if you need custom picker use this
              pickerBuilder: (context, countryCode) {
                return Column(
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 30,
                            width: 50,
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                countryCode!.flagUri!,
                                package: 'country_list_pick',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${countryCode.name}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                  ],
                );
              },

              initialSelection: '+92',
              onChanged: (code) {
                setState(() {
                  selectedCountry = code!.name;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ThemeButton(
              title: 'Confirm',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}
