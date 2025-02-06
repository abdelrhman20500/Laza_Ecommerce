import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:laza_e_commerce/Features/product_details/presentation/view/widget/review_card.dart';
import 'package:laza_e_commerce/Features/product_details/presentation/view/widget/sized_selection.dart';
import 'package:laza_e_commerce/Features/review/presentation/view/review_screen.dart';
import '../../../sign_up_screen/presentation/view/widget/custom_button.dart';


class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.image, required this.name, required this.description, required this.price, required this.id, required this.images,});

  static const String routeName = "ProductDetailsScreen";

  final String image;
  final String name;
  final String description;
  final String price;
  final String id;
  final List<String> images;
  final String baseUrl = 'https://laza.runasp.net/';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
            icon: const Icon(Icons.arrow_back, color: Colors.black,),),
        centerTitle: true,
        title: const Text("Product Details", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        actions: [
          IconButton(onPressed: (){},icon:const Icon(Icons.shopping_cart_outlined, color: Colors.black,),)
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height*0.5,
                    child:CachedNetworkImage(
                      imageUrl: "$baseUrl$image",
                      fit: BoxFit.cover,
                    ),
                ),
                SizedBox(height: height*0.02,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Men's Printed Pullover Hoodie", style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),),
                    Text("Price", style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),),
                  ],
                ),
                SizedBox(height: height*0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(name,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),),
                    ),
                    Text("\$$price", style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),),
                  ],
                ),
                SizedBox(height: height*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CachedNetworkImage(imageUrl:  "$baseUrl${images[0]}",
                      fit: BoxFit.fill,height: height*0.1,width: width*0.2,),
                    CachedNetworkImage(imageUrl:  "$baseUrl${images[1]}",
                      fit: BoxFit.fill,height: height*0.1,width: width*0.2,),
                    CachedNetworkImage(imageUrl:  "$baseUrl${images[2]}",
                      fit: BoxFit.fill,height: height*0.1,width: width*0.2,),
                    CachedNetworkImage(imageUrl:  "$baseUrl${images[3]}",
                      fit: BoxFit.fill,height: height*0.1,width: width*0.2,),
                  ],
                ),
                SizedBox(height: height*0.02,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Size", style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),),
                    Text("Size Guide", style: TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w600, color: Colors.grey),),
                  ],
                ),
                SizedBox(height: height*0.02,),
                const SizeSelection(),
                const Text("Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                SizedBox(height: height*0.02,),
                Text(description,
                  maxLines: 3,overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),),
                SizedBox(height: height*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Reviews',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: ()
                      {
                        print("id => $id");
                        Navigator.pushNamed(context, ReviewScreen.routeName,arguments: id);
                      },
                      child: const Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height*0.02,),
                const ReviewCard(userName: "",feedback: "",rating:  2.2,),
                SizedBox(height: height*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                            style: TextStyle(fontSize: 18),
                            children: [
                              TextSpan(
                                  text: 'Total Price\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.grey,
                                  )),
                              TextSpan(
                                  text: 'with VAT, SD',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14))
                            ])),
                    const Text('222 EGP',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height*0.02,),
                CustomButton(text: "Add to Cart",
                    height: height*0.1,
                    width: double.infinity,
                    color: const Color(0xff9775FA),
                    onPressed: (){}
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
