import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intelivita_technical_assesment/app_1/app/features/items/data/fake_items_repository.dart';
import 'package:intelivita_technical_assesment/app_1/app/features/items/domain/item_model.dart';

class ItemsGridScreen extends StatefulWidget {
  const ItemsGridScreen({super.key});

  @override
  State<ItemsGridScreen> createState() => _ItemsGridScreenState();
}

class _ItemsGridScreenState extends State<ItemsGridScreen> {
  final List<Item> items = [];

  // As mentioned in the task, we need to use any state management except SetState().
  // In real app, I use [riverpod] most of the times for the state management.
  // Here, I didn't see any need for it and didn't want to make it complex.
  // So, I am using ValueNotifier to handle the focused item.
  ValueNotifier<int?> focusedItem = ValueNotifier<int?>(null);

  @override
  void initState() {
    super.initState();
    // If we are not using any state managements then API calles generally go here.
    // In the case of the state managements, they have their own way of handling API calls.
    items.addAll(FakeItemsRepository().getItems());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Items')),
      body: ValueListenableBuilder(
        valueListenable: focusedItem,
        builder: (context, value, _) {
          return StaggeredGridView.countBuilder(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            padding: const EdgeInsets.all(8),
            itemCount: focusedItem.value != null ? items.length + 1 : items.length,
            staggeredTileBuilder: (index) {
              // Decides the index, where to display the options of the particular item.
              int? focusedItemOptionDisplayIndex;
              if (focusedItem.value != null) {
                focusedItemOptionDisplayIndex = (((focusedItem.value! ~/ 3) + 1) * 3);
              }

              // Show the options iff the user has tapped on the item.
              if (focusedItemOptionDisplayIndex == index) {
                return const StaggeredTile.count(3, 1.4);
              } else {
                return const StaggeredTile.count(1, 1);
              }
            },
            itemBuilder: (context, index) {
              // Checks if the item is focused or not.
              final isFocused = focusedItem.value == index;

              // Decides the index, where to display the options of the particular item.
              int? focusedItemOptionDisplayIndex;
              if (focusedItem.value != null) {
                focusedItemOptionDisplayIndex = (((focusedItem.value! ~/ 3) + 1) * 3);
              }

              // if user has tapped on the item, then we need to re-calculate the index.
              // Since the options are displayed between the first and second row.
              // So, after that [focusedItemOptionDisplayIndex], we need to decrement the index by 1.
              final resolvedIndex = index -
                  (focusedItemOptionDisplayIndex != null
                      ? focusedItemOptionDisplayIndex < index
                          ? 1
                          : 0
                      : 0 //
                  );

              // Show the options iff the user has tapped on the item.
              return focusedItemOptionDisplayIndex == index
                  ? Container(
                      color: Colors.grey[200],
                      padding: const EdgeInsets.all(8),
                      child: ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: items[focusedItem.value!].options.length,
                        itemBuilder: (context, index) {
                          return Text(items[focusedItem.value!].options[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider();
                        },
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        if (isFocused) {
                          focusedItem.value = null;
                        } else {
                          focusedItem.value = resolvedIndex;
                        }
                      },
                      child: _ItemCard(item: items[resolvedIndex], isFocused: isFocused),
                    );
            },
          );
        },
      ),
    );
  }
}

class _ItemCard extends StatelessWidget {
  const _ItemCard({required this.item, required this.isFocused});

  final Item item;
  final bool isFocused;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(item.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  item.name,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                isFocused
                    ? Icons.keyboard_arrow_up_outlined //
                    : Icons.keyboard_arrow_down_outlined,
              )
            ],
          ),
        ),
      ),
    );
  }
}
