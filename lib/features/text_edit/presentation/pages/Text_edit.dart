import 'package:flutter/material.dart';

import '/core/widgets/container_list_item.dart';
import '/features/edit_new_project/items_cubit/items_list_cubit.dart';
import '/features/edit_new_project/presentation/widgets/Icon_name.dart';
import '/features/text_edit/presentation/widgets/text_edit_items.dart';

class TextEdit extends StatelessWidget {
  TextEdit({
    super.key,
    this.itemsListCubit,
  });

  ItemsListCubit? itemsListCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContainerListItem(
          itemsListCubit: itemsListCubit!,
          childList: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return IconName(
                onTap: () {
                  print("TextEdit index $index");
                },
                name:
                    TextEditItems.textEditItemsList[index].textEditItemsName!,
                icon: TextEditItems
                    .textEditItemsList[index].textEditItemsAssets!,
              );
            },
          ),
        )
        //itemList(context),
      ],
    );
  }

/*  Widget itemList(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Container(
      height: size * 0.07,
      padding: const EdgeInsets.only(top: 5),
      color: AppColors.black,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: SharedStorage.getLanguage() == "en" ? 30.0 : 0.0,
              right: SharedStorage.getLanguage() == "ar" ? 30.0 : 0.0,
            ),
            child: ListView.builder(
              itemCount: 7,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return IconName(
                  onTap: () {},
                  index: index,
                  name:
                      TextEditItems.textEditItemsList[index].textEditItemsName!,
                  icon: index == 0
                      ? ""
                      : TextEditItems
                          .textEditItemsList[index].textEditItemsAssets!,
                );
              },
            ),
          ),
          ListBack(),
        ],
      ),
    );
  }*/
}
