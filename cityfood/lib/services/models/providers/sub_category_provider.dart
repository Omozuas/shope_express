import 'package:cityfood/services/models/providers/category_provider.dart';

class SubCategorymodel {
  late String id;
  late String title;
  final Categorymodel categorymodel;

  SubCategorymodel({
    required this.id,
    required this.title,
    required this.categorymodel,
  });
}
