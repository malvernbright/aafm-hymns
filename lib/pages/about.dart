import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class About extends StatelessWidget {
  const About({super.key});

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
                        fit: BoxFit.fitHeight,
                        image: AssetImage('assets/images/logo.jpg'))),
                accountName: Text(''),
                accountEmail: Text('')),
            const AboutCard(
                icon: LineIcons.church,
                cardText: 'Central Tabernacle & HQ',
                subtitle: 'Stand No. 10369\nZororo Section, Highfield'),
            const Divider(
              color: Color.fromARGB(255, 255, 1, 1),
              indent: 6,
              endIndent: 6,
              thickness: 1,
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 192, 188, 188),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Text(
                    'About',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const AboutCard(
                    icon: LineIcons.user,
                    cardText: 'Developer',
                    subtitle: 'Malvern Gondo',
                  ),
                  const AboutCard(
                    icon: LineIcons.phone,
                    cardText: '+263 714 072 135',
                    subtitle: '+263 782 628 137',
                  ),
                  const AboutCard(
                    icon: LineIcons.envelopeAlt,
                    cardText: 'malvern@malvernbright.co.zw',
                    subtitle: 'developer@malvernbright.co.zw',
                  ),
                  const AboutCard(
                    icon: LineIcons.googleLogo,
                    cardText: 'https://malvernbright.co.zw',
                    subtitle: '',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildShowBottomSheet(BuildContext context) {
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
                    cardText: '+263 714 072 135',
                    subtitle: '+263 782 628 137',
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
                  OverflowBar(
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
    super.key,
    required this.icon,
    required this.cardText,
    required this.subtitle,
  });
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
