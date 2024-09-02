

import 'package:food_delivery/constants/exports.dart';
import 'package:food_delivery/utils/widgets/textfield_widget.dart';

class ManualLocationSearchView extends StatelessWidget {
  const ManualLocationSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black), // Custom icon
          onPressed: () {
            // Define the action for the back button
            Navigator.of(context).pop();
          },
        ),
        centerTitle: false,
        leadingWidth: 30,
        title: Text("Enter your area or appartment name"),
        titleTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldWidget(
              prefixIcon: Icon(Icons.search),
              hintText: "Try JP Nagar etc.",
            ),
            SizedBox(height: 20,),
            RichText(text: TextSpan(
              children: [
                WidgetSpan(child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(Icons.send, color: Colors.deepOrange,),
                )),
                TextSpan(
                  text: "Use my current location",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.deepOrange
                  )
                )
              ]
            )),
            Divider()
          ],
        ),
      ),
    );
  }
}
