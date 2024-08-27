


import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/modules/authentication/blocs/phone_auth_bloc.dart';

class PhoneAuthenticationView extends StatelessWidget {

  final TextEditingController _phoneController = TextEditingController();
  String _selectedCountryCode = '+91'; // Default country code

  var bloc = PhoneAuthBloc();
  

  void _submit() {
    // Handle submission logic here
    print('Phone number: ${_phoneController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Custom icon
          onPressed: () {
            // Define the action for the back button
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Title
            Text(
              'Enter your mobile number to get OTP',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Mobile number field with country code
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              onChanged: (value){
                bloc.add(PhoneAuthValidate(mobile: value));
              },
              decoration: InputDecoration(
                prefixIconConstraints: BoxConstraints(
                   minHeight: 20,
                   minWidth: 70
                ),
                prefixIcon: SizedBox(
                    height: 20,
                    width: 70,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_selectedCountryCode + ' ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                        VerticalDivider()
                      ],
                    ),
                  ),
                ),
                labelText: "Mobile Number",
                floatingLabelStyle: TextStyle(color: Colors.deepOrange),
                floatingLabelBehavior: FloatingLabelBehavior.always ,
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepOrange)),
                hintText: '10 digit mobile number',
              ),
            ),
            SizedBox(height: 20),

            // Submit button
            BlocBuilder<PhoneAuthBloc, PhoneAuthState>(
              bloc:bloc,
  builder: (context, state) {
    return Center(
              child: ElevatedButton(

                onPressed: !(state is PhoneAuthValidationSuccess)?null:_submit,
                  style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: Colors.deepOrange.withOpacity(0.3),
                      backgroundColor: Colors.deepOrange,
                      fixedSize: Size(double.maxFinite, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                  ),

                  child: Text("Get OTP", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)
              ),
            );
  },
),
            SizedBox(height: 20),

            // Terms and Policy rich text
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 14),
                children: <TextSpan>[
                  TextSpan(text: 'By signing up, you agree to our '),
                  TextSpan(
                    text: 'terms of service',

                    style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline,
                      decorationThickness: 0.5
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Handle Terms of Service tap
                        print('Terms of Service tapped');
                      },
                  ),
                  TextSpan(text: ' and '),
                  TextSpan(
                    text: 'privacy policy',
                    style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline,
                        decorationThickness: 0.5
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Handle Privacy Policy tap
                        print('Privacy Policy tapped');
                      },
                  ),
                  TextSpan(text: '.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
