// In real app, I use dependency injection.

import 'package:intelivita_technical_assesment/app_1/app/features/items/domain/item_model.dart';

class FakeItemsRepository {
  List<Item> getItems() {
    return [
      Item(
        name: 'Natural Diamonds',
        imageUrl: 'https://i.ibb.co/HgjT1rt/Image.png',
        options: ['Option 1', 'Option 2', 'Option 3', 'Option 4', 'Option 5'],
      ),
      Item(
        name: 'Lab Grown Diamonds',
        imageUrl: 'https://i.ibb.co/HgjT1rt/Image.png',
        options: ['Option 6', 'Option 7', 'Option 8', 'Option 9', 'Option 10'],
      ),
      Item(
        name: 'Gemstones',
        imageUrl: 'https://i.ibb.co/HgjT1rt/Image.png',
        options: ['Option 11', 'Option 12', 'Option 13', 'Option 14', 'Option 15'],
      ),
      Item(
        name: 'Jewelry',
        imageUrl: 'https://i.ibb.co/HgjT1rt/Image.png',
        options: ['Collection', 'Best Selling', 'Seasonal Offers', 'Occasion Offer', "Deals"],
      ),
      Item(
        name: 'Education',
        imageUrl: 'https://i.ibb.co/HgjT1rt/Image.png',
        options: ['Option 1', 'Option 2', 'Option 3', 'Option 4', 'Option 5', 'Option 6'],
      ),
      Item(
        name: 'Services',
        imageUrl: 'https://i.ibb.co/HgjT1rt/Image.png',
        options: ['Option 7', 'Option 8', 'Option 9', 'Option 10', 'Option 11', 'Option 12'],
      ),
    ];
  }
}
