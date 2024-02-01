import 'package:flutter/material.dart';
import '../models/student.dart';

class BeautifulCard extends StatelessWidget {
  final Student student;
  final VoidCallback onDelete;
  final VoidCallback onUpdate;

  const BeautifulCard({
    super.key,
    required this.student,
    required this.onDelete,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.all(7),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blueAccent,
                Colors.black87,
                Colors.black54,
                Colors.blue,
              Colors.teal,
              ]),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      student.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontFamily: "monospace",
                      ),
                    ),
                    // Adds a title to the card
                    const Spacer(),
                    const  Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.black,
                          size: 45,
                        ),
                        Icon(
                          Icons.person,
                          color: Colors.amber,
                          size: 40,
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  student.uni,
                  style: const TextStyle(color: Colors.white, fontSize: 17),
                ),
                Text(
                  'Course: ${student.course}',
                  style: const TextStyle(color: Colors.white, fontSize: 17),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.email,
                      size: 25,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      student.email,
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.phone,
                      size: 25,
                      color: Colors.white,
                    ),
                    const  SizedBox(width: 10),
                    Text(
                      student.mobile,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: onUpdate,
                        child: const Text(
                          "UPDATE",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        )),
                    TextButton(
                        onPressed: onDelete,
                        child: const Text(
                          "DELETE",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        )),
                  ],
                )
                // Adds a subtitle to the card
              ],
            ),
          ],
        ),
      ),
    );
  }
}
