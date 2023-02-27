import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10))),
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
                      fit: BoxFit.contain,
                      image: AssetImage('assets/images/logo.jpg'))),
              accountName: Text('AAFM Hymns'),
              accountEmail: Text('')),
          const AboutCard(
              icon: LineIcons.church,
              cardText: 'Central Tabernacle & HQ',
              subtitle: 'Stand No. 10369\nZororo Section, Highfield'),
          Card(
            child: GestureDetector(
              child: ListTile(
                  leading: LineIcon(LineIcons.code),
                  title: const Text('Developer')),
              onTap: () {
                showDeveloperInfo(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  void showDeveloperInfo(context) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text(
              'About Developer',
              textAlign: TextAlign.center,
            ),
            children: [
              const AboutCard(
                icon: LineIcons.phone,
                cardText: '+263 782 628 137',
                subtitle: '',
              ),
              const AboutCard(
                icon: LineIcons.envelopeAlt,
                cardText: 'malvern@malvernbright.co.zw',
                subtitle: '',
              ),
              const AboutCard(
                icon: LineIcons.globeWithAfricaShown,
                cardText: 'https://malvernbright.co.zw',
                subtitle: '',
              ),
              ButtonBar(
                children: [
                  MaterialButton(
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Dismiss'))
                ],
              )
            ],
          );
        });
  }

  PersistentBottomSheetController<dynamic> buildShowBottomSheet(
      BuildContext context) {
    return showBottomSheet(
        context: context,
        builder: (_) => Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: const BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  )),
              child: ListView(
                shrinkWrap: true,
                primary: false,
                children: [
                  const AboutCard(
                    icon: LineIcons.phone,
                    cardText: '+263 712 772 812',
                    subtitle: '',
                  ),
                  const AboutCard(
                    icon: LineIcons.envelopeAlt,
                    cardText: 'malvern@malvernbright.co.zw',
                    subtitle: '',
                  ),
                  const AboutCard(
                    icon: LineIcons.googleLogo,
                    cardText: 'https://malvernbright.co.zw',
                    subtitle: '',
                  ),
                  ButtonBar(
                    children: [
                      MaterialButton(
                          color: Colors.white,
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Dismiss'))
                    ],
                  )
                ],
              ),
            ));
  }
}

class AboutCard extends StatelessWidget {
  const AboutCard({
    Key? key,
    required this.icon,
    required this.cardText,
    required this.subtitle,
  }) : super(key: key);
  final IconData icon;
  final String cardText;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: LineIcon(icon),
      title: Text(cardText),
      subtitle: Text(subtitle),
    ));
  }
}
