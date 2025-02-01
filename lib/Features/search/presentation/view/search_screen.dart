// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:laza_e_commerce/Core/functions/api_service.dart';
// import 'package:laza_e_commerce/Features/search/data/data_source/search_remote_data_source.dart';
// import 'package:laza_e_commerce/Features/search/data/repo/search_repo_impl.dart';
// import 'package:laza_e_commerce/Features/search/domain/use_case/search_use_case.dart';
// import 'package:laza_e_commerce/Features/search/presentation/view_manager/search_cubit.dart';
// import 'package:laza_e_commerce/Features/search/presentation/view_manager/search_state.dart';
// import 'package:laza_e_commerce/Features/search/presentation/view/widget/grid_view_search_result.dart';
// import 'package:laza_e_commerce/Features/search/presentation/view/widget/build_custom_search.dart';
//
// class SearchScreen extends StatelessWidget {
//   SearchScreen({super.key});
//
//   static const String routeName = "SearchScreen";
//   final TextEditingController searchController = TextEditingController();
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => SearchCubit(SearchUseCase(SearchRepoImpl(
//         searchRemoteDataSource: SearchRemoteDataSourceImpl(ApiService(Dio())),
//       ))),
//       child: BlocConsumer<SearchCubit, SearchState>(
//         listener: (context, state) {
//           if (state is SearchFailure) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(state.errMessage),
//                 backgroundColor: Colors.red,
//               ),
//             );
//           }
//         },
//         builder: (BuildContext context, SearchState state) {
//           return Scaffold(
//             appBar: AppBar(
//               leading: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.grey.withOpacity(0.8),
//                     shape: BoxShape.circle,
//                   ),
//                   child: IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: const Icon(Icons.arrow_back),
//                   ),
//                 ),
//               ),
//               centerTitle: true,
//               title: const Text(
//                 "Search Product",
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
//               ),
//             ),
//             body: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Form(
//                 key: formKey,
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.02,
//                     ),
//                     BuildCustomSearch(
//                       controller: searchController,
//                       name: "Search....",
//                       iconData: Icons.search,
//                       onSubmitted: (query) {
//                         if (query.isNotEmpty) {
//                           BlocProvider.of<SearchCubit>(context)
//                               .searchProduct(query: query);
//                         }
//                       },
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.02,
//                     ),
//                     // عرض نتائج البحث
//                     Expanded(
//                       child: BlocBuilder<SearchCubit, SearchState>(
//                         builder: (context, state) {
//                           if (state is SearchLoading) {
//                             return Center(child: CircularProgressIndicator());
//                           } else if (state is SearchSuccess) {
//                             print(state.product);
//                             return GridViewSearchResult(); // تمرير المنتجات
//                           } else {
//                             return Center(child: Text("No results found"));
//                           }
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:laza_e_commerce/Features/search/presentation/view/widget/build_search_result.dart';
import 'package:laza_e_commerce/Features/search/presentation/view_manager/api_manger.dart';
import '../../data/model/search_model.dart';

class SearchScreen extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(onPressed: ()
    {
      buildResults(context);
    }, icon: const Icon(Icons.search),color: Colors.black54);
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: ()
    {
      Navigator.pop(context);
    }, icon: const Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: ApiManger.searchProduct(query),
        builder: (context, snapshot) {
          if(snapshot.connectionState== ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }if(snapshot.hasData){
            var searchModel = snapshot.data!;
            return buildGridView(searchModel);
          } return const Center(child: Text('No data available.'));
        },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: ApiManger.searchProduct(query),
      builder: (context, snapshot) {
        if(snapshot.connectionState== ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }if(snapshot.hasData){
          var searchModel = snapshot.data!;
          return buildGridView(searchModel);
        } return const Center(child: Text('No data available.'));
      },
    );
  }
  Widget buildGridView(List<SearchModel> model){
    return GridView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 2.1/ 4.0,
      ),
      itemCount: model.length,
      itemBuilder: (context, index) {
        return BuildSearchResult(
          image: model[index].productImage,
          name: model[index].productName,
          description: model[index].productDescription,
          price: model[index].productPrice.toString() ?? "0.0", // Ensure to convert price to String
        );
      },
    );
  }

}