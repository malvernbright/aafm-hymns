// import 'dart:convert';
//
// import 'package:aafm_hymns/pages/hymn.dart';
// import 'package:aafm_hymns/providers/hymn_provider.dart';
// import 'package:aafm_hymns/utils/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:line_icons/line_icon.dart';
// import 'package:line_icons/line_icons.dart';
// import 'package:provider/provider.dart';
//
// class HymnsList extends StatelessWidget {
//   const HymnsList({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: Hive.openBox(favourites),
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (snapshot.hasData) {
//             return Consumer<HymnProvider>(
//               builder: (context, provider, child) {
//                 return FutureBuilder(
//                     future: provider.readJson(),
//                     builder: (BuildContext context, AsyncSnapshot snapshot) {
//                       if (snapshot.hasData) {
//                         return Container(
//                             padding: const EdgeInsets.only(top: 50),
//                             child: provider.foundHymns.isNotEmpty
//                                 ? ListView.builder(
//                                     shrinkWrap: true,
//                                     itemCount: provider.foundHymns.length,
//                                     itemBuilder:
//                                         (BuildContext context, int index) {
//                                       return Card(
//                                         child: ListTile(
//                                           leading: CircleAvatar(
//                                             child: Text(
//                                               '${index + 1}',
//                                               style: const TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   color: Colors.white),
//                                             ),
//                                             backgroundColor: Colors.pink,
//                                           ),
//                                           title: Text(
//                                               '${provider.foundHymns[index]['title']}'),
//                                           onTap: () => Navigator.of(context)
//                                               .push(MaterialPageRoute(
//                                                   builder: (_) => Hymn(
//                                                         title:
//                                                             '${provider.foundHymns[index]['title']}',
//                                                         hymn:
//                                                             '${provider.foundHymns[index]['hymn']}',
//                                                         index: index,
//                                                       ))),
//                                           trailing: GestureDetector(
//                                             onTap: () =>
//                                                 provider.addToFavorites(
//                                                     title: provider
//                                                             .foundHymns[index]
//                                                         ['title'],
//                                                     hymn: provider
//                                                             .foundHymns[index]
//                                                         ['hymn'],
//                                                     index: index,
//                                                     context: context),
//                                             child: LineIcon(
//                                               Hive.box(favourites)
//                                                       .containsKey(index)
//                                                   ? LineIcons.heartAlt
//                                                   : LineIcons.heart,
//                                               color: Colors.pink,
//                                             ),
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                   )
//                                 : const Center(
//                                     child: Text('Nothing here'),
//                                   ));
//                       } else if (snapshot.hasError) {
//                         return const Icon(Icons.error_outline);
//                       } else {
//                         return const Center(child: CircularProgressIndicator());
//                       }
//                     });
//               },
//             );
//           } else if (snapshot.hasError) {
//             return const Icon(Icons.error_outline);
//           } else {
//             return const CircularProgressIndicator();
//           }
//         });
//   }
// }
