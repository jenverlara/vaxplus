class Inventory {
  int? id;
  String? vaccine;

  InventoryMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id ?? null;
    mapping['vaccine'] = vaccine!;
    return mapping;
  }
}
