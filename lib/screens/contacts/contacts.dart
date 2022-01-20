import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:udemy_flutter/shared/components/Dotted_line.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class ContactsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: CustomText(text: 'Contacts Us', textColor: mainColor),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_sharp, color: mainColor),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 30.0),
            SvgPicture.asset('assets/images/empty.svg',
                fit: BoxFit.fitWidth, height: 250),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomCard(
                widget: Column(
                  children: [
                    // facebook
                    ListTile(
                      leading: Image.network(
                        "https://student.valuxapps.com/storage/uploads/contacts/Facebook.png",
                        height: 120,
                        width: 50,
                        fit: BoxFit.cover,
                        color: Colors.blueAccent,
                      ),
                      title: CustomText(
                        text: 'Visit our facebook page',
                        fontSize: 20,
                      ),
                      subtitle:
                          CustomText(text: 'FB.com/ourPage', fontSize: 15),
                    ),
                    SizedBox(height: 10.0),
                    CustomDotedLine(),
                    //twitter
                    ListTile(
                      leading: Image.network(
                        "https://student.valuxapps.com/storage/uploads/contacts/Twitter.png",
                        height: 120,
                        width: 50,
                        fit: BoxFit.cover,
                        color: Colors.blueAccent,
                      ),
                      title: CustomText(
                          text: 'Follow us on twitter', fontSize: 20),
                      subtitle:
                          CustomText(text: 'twitter.com/ourPage', fontSize: 15),
                    ),
                    SizedBox(height: 10.0),
                    CustomDotedLine(),
                    // whats app

                    ListTile(
                      leading: Image.network(
                        "https://student.valuxapps.com/storage/uploads/contacts/Whatsapp.png",
                        height: 120,
                        width: 50,
                        fit: BoxFit.cover,
                        color: Colors.green,
                      ),
                      title: CustomText(
                          text: 'Contacts us on Whats App', fontSize: 20),
                      subtitle: CustomText(text: '0123456789', fontSize: 15),
                    ),
                    SizedBox(height: 10.0),
                    CustomDotedLine(),
                    // Youtube

                    ListTile(
                      leading: Image.network(
                        "https://student.valuxapps.com/storage/uploads/contacts/Youtube.png",
                        height: 120,
                        width: 50,
                        fit: BoxFit.cover,
                        color: Colors.red,
                      ),
                      title: CustomText(
                          text: 'Subscribe our channel', fontSize: 20),
                      subtitle:
                          CustomText(text: 'youtube.com/ourPage', fontSize: 15),
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
