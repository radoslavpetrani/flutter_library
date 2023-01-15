import 'package:flutter/material.dart';

class BookPage extends StatelessWidget {
  final int? pageNum;
  final int pages;
  const BookPage({super.key, this.pageNum, required this.pages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("page $pageNum"),
      ),
      body: Center(
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(32),
                child: Text(
                  'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                  'Alps. Situated 1,578 meters above sea level, it is one of the '
                  'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                  'half-hour walk through pastures and pine forest, leads you to the '
                  'lake, which warms to 20 degrees Celsius in the summer. Activities '
                  'enjoyed here include rowing, and riding the summer toboggan run.'
                  'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                  'Alps. Situated 1,578 meters above sea level, it is one of the '
                  'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                  'half-hour walk through pastures and pine forest, leads you to the '
                  'lake, which warms to 20 degrees Celsius in the summer. Activities '
                  'enjoyed here include rowing, and riding the summer toboggan run.'
                  'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                  'Alps. Situated 1,578 meters above sea level, it is one of the '
                  'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                  'half-hour walk through pastures and pine forest, leads you to the '
                  'lake, which warms to 20 degrees Celsius in the summer. Activities '
                  'enjoyed here include rowing, and riding the summer toboggan run.',
                  softWrap: true,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Flexible(
                        flex: 1,
                        child: ElevatedButton(
                          child: const Text('previous page'),
                          onPressed: () {
                            if (pageNum! == 0) {
                              Navigator.pop(context);
                            } else {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BookPage(
                                            pageNum: pageNum! - 1,
                                            pages: pages,
                                          )));
                            }
                          },
                        ))),
                Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Flexible(
                        flex: 1,
                        child: ElevatedButton(
                          child: const Text('next page'),
                          onPressed: () {
                            if (pageNum! < pages - 1) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BookPage(
                                            pageNum: pageNum! + 1,
                                            pages: pages,
                                          )));
                            }
                          },
                        )))
              ],
            )
          ],
        ),
      ),
    );
  }
}
