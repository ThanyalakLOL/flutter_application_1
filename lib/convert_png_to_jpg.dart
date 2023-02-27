import 'dart:io';
import 'package:image/image.dart' as img;

Future<void> convertToJpg(String imagePath) async {
  // Load the image file into memory
  final bytes = await File(imagePath).readAsBytes();

  // Decode the image
  final image = img.decodeImage(bytes);

  // Convert the image to JPEG format
  final jpegImage = img.encodeJpg(image!);

  // Save the new JPEG image to disk
  final newImagePath = imagePath.replaceAll(RegExp(r'\.\w+$'), '.jpg');
  await File(newImagePath).writeAsBytes(jpegImage);
}
