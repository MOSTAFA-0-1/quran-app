import 'package:flutter/material.dart';
import 'package:quran/readers/getReaders/get_readers.dart';
import 'package:quran/widgets/reader.dart';


class Readers extends StatelessWidget {
  const Readers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/quran_background.png"),
                fit: BoxFit.contain)),
        child: Column(
          children: [
            Text(
              "القراء",
              style: Theme.of(context).textTheme.headline6,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: (GetReaders.readers.length % 2 == 0)
                    ? GetReaders.readers.length ~/ 2
                    : (GetReaders.readers.length + 1) ~/ 2,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Reader(
                        readerName: GetReaders.readers[index].name,
                        id: GetReaders.readers[index].id,
                      ),
                      if ((GetReaders.readers.length % 2 != 0 &&
                              index == (GetReaders.readers.length - 1) ~/ 2) ==
                          false)
                        Reader(
                          readerName: GetReaders
                              .readers[
                                  (index + GetReaders.readers.length ~/ 2) + 1]
                              .name,
                          id: GetReaders
                              .readers[
                                  (index + GetReaders.readers.length ~/ 2) + 1]
                              .id,
                        ),
                      if ((GetReaders.readers.length % 2 != 0 &&
                              index == (GetReaders.readers.length - 1) ~/ 2) ==
                          true)
                        const Expanded(child: Text(""))
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
