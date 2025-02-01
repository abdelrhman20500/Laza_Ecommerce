import 'package:flutter/material.dart';
import '../../../../../../../search/presentation/view/search_screen.dart';
import '../../../../../../../search/presentation/view/widget/build_custom_search.dart';

class BuildHomeSearch extends StatelessWidget {
  const BuildHomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              showSearch(context: context, delegate: SearchScreen());
            },
            child: const AbsorbPointer(
              child: BuildCustomSearch(name: "Search .....",iconData: Icons.search,),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 8.0),
          height: MediaQuery.of(context).size.height * 0.066,
          width: MediaQuery.of(context).size.width * 0.14,
          decoration: BoxDecoration(
            color: const Color(0xff9775FA),
            borderRadius: BorderRadius.circular(16),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.keyboard_voice, color: Colors.white, size: 32),
          ),
        ),
      ],
    );
  }
}

