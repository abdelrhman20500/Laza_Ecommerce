import 'package:flutter/material.dart';
import '../../../../../../../product_by_category_id/presentation/view/product_by_category_id.dart';

class BuildHomeCategory extends StatelessWidget {
  const BuildHomeCategory({super.key, required this.title, required this.image, required this.id,});

  final String title;
  final String image;
  final String id;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>
        ProductByCategoryId(categoryId: id,image: image,)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width * 0.35,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.7),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.046,
                width: MediaQuery.of(context).size.width * 0.1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image(
                    image: AssetImage(image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
