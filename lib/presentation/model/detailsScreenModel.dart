import 'package:gallery_saver/gallery_saver.dart';
import 'package:task_josequal/presentation/Screen/detailsScreen.dart';

class detailsModel {
  detailsScreen details = detailsScreen();

  downloadImage() async {
    var picture_name = 'Pexels';
    await GallerySaver.saveImage(details.imgurl!, albumName: picture_name);
  }
}
