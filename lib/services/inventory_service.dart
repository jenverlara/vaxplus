import 'package:vaxplus/db_helper/repository.dart';
import 'package:vaxplus/JsonModels/crud_inventory.dart';

class InventoryService
{
  late Repository _repository;
  InventoryService(){
    _repository = Repository();
  }
  //Save Inventory
  SaveInventory(Inventory inventory) async{
    return await _repository.insertData('inventory', inventory.InventoryMap());
  }
  //Read All Inventory
  readAllInventory() async{
    return await _repository.readData('inventory');
  }
  //Edit Inventory
  UpdateInventory(Inventory inventory) async{
    return await _repository.updateData('inventory', inventory.InventoryMap());
  }

  deleteInventory(inventoryId) async {
    return await _repository.deleteDataById('inventory', inventoryId);
  }

}