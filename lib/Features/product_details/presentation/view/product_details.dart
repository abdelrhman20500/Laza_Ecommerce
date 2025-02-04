import 'package:flutter/material.dart';
import 'package:laza_e_commerce/Features/product_details/presentation/view/widget/review_card.dart';
import 'package:laza_e_commerce/Features/product_details/presentation/view/widget/sized_selection.dart';
import 'package:laza_e_commerce/Features/sign_up_screen/presentation/view/widget/custom_button.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});
  static const String routeName ="ProductDetails";

  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                        height: MediaQuery.of(context).size.height*0.5,
                        child:const Image(image: AssetImage("assets/images/shirt.png"),
                        fit: BoxFit.fill,)
                    ),
                    const Positioned(
                      top: 20,
                      left: 10,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                    const Positioned(
                      top: 20,
                      right: 10,
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ],
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Nike Club Fleece", style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),),
                    Text("122\$", style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),),
                  ],
                ),
                SizedBox(height: height*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(image: const AssetImage("assets/images/shirt.png"),
                      fit: BoxFit.fill,height: height*0.1,width: width*0.2,),
                    Image(image: const AssetImage("assets/images/shirt.png"),
                      fit: BoxFit.fill,height: height*0.1,width: width*0.2,),
                    Image(image: const AssetImage("assets/images/shirt.png"),
                      fit: BoxFit.fill,height: height*0.1,width: width*0.2,),
                    Image(image: const AssetImage("assets/images/shirt.png"),
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
                const Text("The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with Read More..",
                maxLines: 3,overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, color: Colors.grey),),
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
                      onTap: (){},
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
                const ReviewCard(),
                SizedBox(height: height*0.02,),
                const Text("The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with Read More..",
                  maxLines: 3,overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, color: Colors.grey),),
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

