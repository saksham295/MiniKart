import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // Catalog Field
  CatalogModel _catalog = CatalogModel();

// Collections of IDs - Store IDs of each Item
  final List<int> _itemIds = [];

// Set Catalog
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

// Get Items In The Cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

// Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStore> {
  late final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  late final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}
