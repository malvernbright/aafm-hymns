import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width * .9,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        // width: MediaQuery.of(context).size.width * .75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const UserAccountsDrawerHeader(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                arrowColor: Colors.pink,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/logo.jpg'))),
                accountName: Text('AAFM Hymns'),
                accountEmail: Text('')),
            Card(
                child: ListTile(
              leading: LineIcon(LineIcons.code),
              title: const Text('Made with ♡ and lots of 🍵 by Malvern Gondo'),
            )),
            Card(
              child: ListTile(
                leading: LineIcon(LineIcons.phone),
                title: const SelectableLinkify(
                  text: '+263 712 772 812',
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: LineIcon(LineIcons.envelope),
                title: const SelectableLinkify(
                    text: 'malvern@malvernbright.co.zw'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
