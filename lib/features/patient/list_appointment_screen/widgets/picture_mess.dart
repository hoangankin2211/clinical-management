import 'package:flutter/material.dart';

class PictureMess extends StatelessWidget {
  final List<String> mess;
  final int type;
  const PictureMess({super.key, required this.mess, required this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Align(
        alignment: type == 0 ? Alignment.centerRight : Alignment.centerLeft,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.72,
          height: (mess.length / 2).round() *
              (MediaQuery.of(context).size.width * 0.72 / 2),
          child: GridView.count(
            primary: false,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 2,
            children: [
              ...mess.map(
                (e) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(e),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
