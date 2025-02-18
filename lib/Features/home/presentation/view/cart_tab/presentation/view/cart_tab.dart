import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_e_commerce/Core/functions/api_service.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/cart_tab/data/data_source/get_cart_remote_data_source.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/cart_tab/data/repo/get_cart_repo_impl.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/cart_tab/domain/entities/cart_entity.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/cart_tab/domain/use_case/get_cart_use_case.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/cart_tab/presentation/view/widget/build_item_cart.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/cart_tab/presentation/view_manager/get_cart_cubit/get_cart_cubit.dart';
import 'package:laza_e_commerce/Features/home/presentation/view/cart_tab/presentation/view_manager/get_cart_cubit/get_cart_state.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key, this.cartEntity});

  final CartEntity? cartEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCartCubit(GetCartUseCAse(GetCartRepoImpl(
        getCartRemoteDataSource: GetCartRemoteDataSourceImplement(ApiService(Dio())),
      )))
        ..fetchCart(),
      child: BlocConsumer<GetCartCubit, GetCartState>(
        listener: (context, state) {
          if (state is GetCartLoading) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Loading...')),
            );
          } else if (state is GetCartFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errMessage)),
            );
          } else if (state is GetCartSuccess) {
            print(state.cartEntity);
          }
        },
        builder: (context, state) {
          if (state is GetCartSuccess) {
            final cart = state.cartEntity;
            double totalPrice = cart.items.fold(0, (sum, item) => sum + item.price);
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      return BuildItemCart(
                        price: cart.items[index].price.toDouble() ?? 0.0,
                        image: cart.items[index].img ?? "",
                        name: cart.items[index].name ?? "",
                        productId: cart.items[index].id ?? "",
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Total: \$${totalPrice.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}