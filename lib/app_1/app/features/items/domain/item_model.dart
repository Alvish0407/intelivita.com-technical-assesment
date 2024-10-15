// In real app, I use [freezed] to generate models.

class Item {
  final String name;
  final String imageUrl;
  final List<String> options;

  Item({
    required this.name,
    required this.options,
    required this.imageUrl,
  });

  @override
  String toString() => 'Item(name: $name, imageUrl: $imageUrl, options: $options)';
}
