import 'package:flutter/material.dart';
import 'package:madlab1/classes/subjectFaculty.dart';

class Mylist extends StatefulWidget {
  const Mylist({super.key});

  @override
  State<Mylist> createState() => _MylistState();
}

class _MylistState extends State<Mylist> {
  // final List subject = ['MAD','EH','DMBI','WT','WEB X'];
  List<SubjectFaculty> subjects = [
    SubjectFaculty('MAD', 'Nilesh G.'),
    SubjectFaculty('DMBI', 'Vaishali'),
    SubjectFaculty('DMBI', 'Vaishali'),
    SubjectFaculty('DMBI', 'Vaishali'),
    SubjectFaculty('DMBI', 'Vaishali'),
    SubjectFaculty('DMBI', 'Vaishali'),
    SubjectFaculty('DMBI', 'Vaishali'),
    SubjectFaculty('DMBI', 'Vaishali'),
    SubjectFaculty('DMBI', 'Vaishali'),
    SubjectFaculty('DMBI', 'Vaishali'),
    SubjectFaculty('DMBI', 'Vaishali'),
    SubjectFaculty('DMBI', 'Vaishali'),
    SubjectFaculty('DMBI', 'Vaishali'),
    SubjectFaculty('DMBI', 'Vaishali'),
    SubjectFaculty('DMBI', 'Vaishali'),
    SubjectFaculty('DMBI', 'Vaishali'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My List Page"),
        centerTitle: true,
      ),
      body: Column(
        children: subjects.map((e) => SubjectCard(e)).toList(),
      ),
    );
  }
}

Widget SubjectCard(sub) {
  return Card(
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              sub.subject,
              style: const TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              sub.faculty,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ));
}
// Scaffold(
//         backgroundColor: Colors.black87,
//           body: Column(
//             children: [
//             SizedBox(
//               width: 500.0,
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50.0),
//                   color: Colors.amber,
//                 ),
//                 child: const Image(
//                 image: NetworkImage(
//                     "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fstatic1.cbrimages.com%2Fwordpress%2Fwp-content%2Fuploads%2F2020%2F11%2FJujutsu-Kaisen-header.jpg&f=1&nofb=1&ipt=b38495d1a9f8d9b2c417d37bf45610c3313bb48522f90004aa5a2a37e64d56ca&ipo=images"),
//                 fit: BoxFit.fitWidth,
//               ),
//               ) 
//             ),
//             SizedBox(
//               child: Row(
//                 children: const [
//                   Icon(Icons.email),
//                   Text(
//                     "jaanu@jaanu.com",
//                     style: TextStyle(
//                       color: Colors.redAccent,

//                     ),
//                   )
//                 ],
//               ),
//             )
//           ]
//         )
//       ),