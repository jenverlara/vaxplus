import 'package:vaxplus/JsonModels/crud_inventory.dart';
import 'package:vaxplus/services/inventory_service.dart';
import 'package:flutter/material.dart';

class AddInventory extends StatefulWidget {
  const AddInventory({Key? key,}) : super(key: key);

  @override
  State<AddInventory> createState() => _AddInventoryState();
}

class _AddInventoryState extends State<AddInventory> {
  var _inventoryController = TextEditingController();
  
  bool _validateInventory = false;

  var _inventoryService=InventoryService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inventory"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add Inventory',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _inventoryController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Vaccine',
                    labelText: 'Vaccine',
                    errorText:
                        _validateInventory ? 'Name Value Can\'t Be Empty' : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
             
              Row(
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors.teal,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () async {
                        setState(() {
                          _inventoryController.text.isEmpty
                              ? _validateInventory = true
                              : _validateInventory = false;
                        

                        });
                        if (_validateInventory == false) {
                         // print("Good Data Can Save");
                         
                          var _inventory = Inventory();
                          
                          _inventory.vaccine = _inventoryController.text;
                          
                          var result=await _inventoryService.SaveInventory(_inventory);
                         Navigator.pop(context,result);
                        }
                      },
                      child: const Text('Save Details')),
                  const SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors.red,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () {
                        _inventoryController.text = '';
                      
                      },
                      child: const Text('Clear Details'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

