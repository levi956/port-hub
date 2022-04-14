import 'package:flutter/material.dart';

class SetUserImage extends StatelessWidget {
  final Function()? onClicked;
  final String? imagePath;
  const SetUserImage({Key? key, @required this.imagePath, this.onClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          ClipOval(
            child: Container(
              // color: Colors.blue,
              padding: const EdgeInsets.all(12),
              child: ClipOval(
                child: Material(
                  color: Colors.transparent,
                  child: Ink.image(
                    image: NetworkImage(imagePath!),
                    fit: BoxFit.cover,
                    width: 78,
                    height: 78,
                    child: InkWell(
                      onTap: onClicked,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 4,
            child: ClipOval(
              child: Container(
                padding: const EdgeInsets.all(6),
                color: Colors.white,
                child: ClipOval(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    color: Colors.blue,
                    child: editIcon(Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget editIcon(Color color) {
    return Icon(Icons.camera, size: 20, color: color);
  }
}
