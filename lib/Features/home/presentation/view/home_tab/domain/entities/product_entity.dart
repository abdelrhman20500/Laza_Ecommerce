import 'package:hive/hive.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/home_tab/data/models/image_model.dart';
part 'product_entity.g.dart';

@HiveType(typeId: 0)
class ProductEntity {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  final double? price;
  @HiveField(5)
  final List<Images>? images;


  ProductEntity(
      {required this.id,
      required this.image,
      required this.name,
      required this.description,
      required this.price,
      required this.images,
      });
}

