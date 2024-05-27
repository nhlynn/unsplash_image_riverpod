import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/image_provider.dart';

class TabBarWidget extends ConsumerWidget {
  const TabBarWidget({super.key,required this.imageSearch});

  final Function(String keyword) imageSearch;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabList = ref.watch(tabProvider);

    final selectedIndex = ref.watch(selectedIndexProvider);

    var size = MediaQuery.of(context).size;

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: tabList.length,
      itemBuilder: (context, index) => InkWell(
        onTap: (){
          ref.read(selectedIndexProvider.notifier).state = index;

          String searchKeyword = tabList[index];

          ref.read(searchKeywordProvider.notifier).state = searchKeyword;

          debugPrint(searchKeyword);
          imageSearch(searchKeyword.toLowerCase());
        },
        child: AnimatedContainer(
          margin: EdgeInsets.fromLTRB(index==0 ? 15 : 5, 0, 5, 0),
          width: size.width/3.5,
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(index == selectedIndex ? 15 : 9),
            ),
            color: index == selectedIndex
                ? const Color.fromARGB(255, 216, 1, 105)
                : Colors.grey[200],
          ),
          child: Center(
            child: Text(tabList[index],style: const TextStyle(color: Colors.black),),
          ),
        ),
      ),
    );
  }
}
