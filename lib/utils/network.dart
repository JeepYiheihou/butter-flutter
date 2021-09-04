import 'package:butter/models/butter.dart';
import 'package:butter/utils/constants.dart';
import 'package:path/path.dart' as p;

String generateImageUrl(Butter butter) {
  return p.join(IMAGE_URL, butter.imageName);
}