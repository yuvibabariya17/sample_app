// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// class ShowDataScreen extends StatefulWidget {
//   const ShowDataScreen({super.key});

//   @override
//   State<ShowDataScreen> createState() => _ShowDataScreenState();
// }

// class _ShowDataScreenState extends State<ShowDataScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Show Data"),
//         centerTitle: true,
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection("Users").snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.active) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                 itemCount: snapshot.data!.docs.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     leading: CircleAvatar(
//                       child: Text("${index + 1}"),
//                     ),
//                     title: Text("${snapshot.data!.docs[index]["title"]}"),
//                   );

//                   // Container(
//                   //   margin: EdgeInsets.only(left: 3.w, right: 3.w),
//                   //   child: Text(
//                   //     snapshot.data!.docs[index]["email"],
//                   //   ),
//                   // );
//                 },
//               );
//             } else if (snapshot.hasError) {
//               print(snapshot.hasError.toString());
//               return Center(child: Text("Nooo dataaaaaa"));
//             } else {
//               return Text("No Data Found");
//             }
//           } else {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
