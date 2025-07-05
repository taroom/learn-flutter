import 'package:flutter/material.dart';
import 'package:helloworld/provider/imagepick_provider.dart';
import 'package:provider/provider.dart';

class ImagePickWidget extends StatefulWidget {
  const ImagePickWidget({super.key});

  @override
  State<ImagePickWidget> createState() => _ImagePickWidgetState();
}

class _ImagePickWidgetState extends State<ImagePickWidget> {
  @override
  Widget build(BuildContext context) {
    var loadPickImg = Provider.of<ImagepickProvider>(context);
    var getImage = loadPickImg.pickedImageFile;

    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          foregroundImage: getImage != null ? FileImage(getImage) : null,
        ),
        TextButton.icon(
          onPressed: () {
            loadPickImg.pickImage();
          },
          icon: Icon(Icons.image),
          label: Text("Upload Image"),
        )
      ],
    );
  }
}
