import 'package:flutter/material.dart';

class BookPage extends StatelessWidget {
  const BookPage({super.key, this.pageNum, required this.pages});
  final int? pageNum;
  final int pages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("page $pageNum"),
      ),
      body: ListView(
        children: [
          Row(children: const [
            Flexible(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(32),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis nisl faucibus rhoncus'
                  'iaculis. Maecenas imperdiet semper ante a malesuada. In a est massa. Morbi finibus metus neque.'
                  'Donec tristique odio orci, vitae accumsan magna accumsan in. Cras vitae enim blandit, pulvinar'
                  'diam sit amet, ultricies dolor. Sed accumsan mi felis, non rhoncus quam efficitur a.'
                  'Aenean ac pulvinar velit. Morbi pretium ante eget urna vulputate, vitae mollis sem maximus.'
                  ' Integer quis purus ut mauris commodo ornare non sed libero. Donec tempor in nulla at sollicitudin.'
                  ' Donec laoreet eget dolor condimentum venenatis. In ornare orci scelerisque, molestie orci ut,'
                  ' convallis ante. Vestibulum pharetra elit nisi.'
                  'Cras vehicula, ipsum et ultrices vehicula, justo justo condimentum quam, non malesuada nisl mauris'
                  ' ac nunc. Aenean rutrum augue feugiat, convallis augue rutrum, posuere urna.'
                  ' Vestibulum lacinia rutrum rhoncus. Suspendisse et mauris erat. Cras consectetur tincidunt quam'
                  ' at malesuada. Suspendisse bibendum dolor erat, ac faucibus nisl maximus at.'
                  ' Nunc eu diam eget eros scelerisque blandit. '
                  'Phasellus a tincidunt turpis, nec ultrices orci. Aliquam sit amet odio in purus varius dignissim.'
                  ' Cras non urna ac arcu lacinia pulvinar sagittis nec erat. Aliquam velit dui, commodo nec iaculis a,'
                  ' sagittis eu eros. Nulla facilisi. Ut urna orci, dignissim in tempus id, posuere eleifend arcu.',
                  softWrap: true,
                ),
              ),
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
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
                  )),
              Flexible(
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
                  ))
            ],
          )
        ],
      ),
    );
  }
}
