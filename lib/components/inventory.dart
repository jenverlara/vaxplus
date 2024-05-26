import 'package:flutter/material.dart';
import 'package:vaxplus/JsonModels/crud_inventory.dart';
import 'package:vaxplus/Views/editInventory.dart';
import 'package:vaxplus/Views/addInventory.dart';
import 'package:vaxplus/Views/viewInventory.dart';
import 'package:vaxplus/services/inventory_service.dart';




class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryState();
}

class _InventoryState extends State<InventoryScreen> {
 late List<Inventory> _inventoryList = <Inventory>[];
  final _inventoryService = InventoryService();

  getAllUserDetails() async {
    var users = await _inventoryService.readAllInventory();
    _inventoryList = <Inventory>[];
    users.forEach((user) {
      setState(() {
        var inventoryModel = Inventory();
        inventoryModel.id = user['id'];
        inventoryModel.vaccine = user['name'];
        _inventoryList.add(inventoryModel);
      });
    });
  }

  @override
  void initState() {
    getAllUserDetails();
    super.initState();
  }

  _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  _deleteFormDialog(BuildContext context, userId) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            title: const Text(
              'Are You Sure to Delete',
              style: TextStyle(color: Colors.teal, fontSize: 20),
            ),
            actions: [
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.red),
                  onPressed: ()  async{
                     var result=await _inventoryService.deleteInventory(userId);
                     if (result != null) {
                       Navigator.pop(context);
                       getAllUserDetails();
                       _showSuccessSnackBar(
                           'User Detail Deleted Success');
                     }
                  },
                  child: const Text('Delete')),
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.teal),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inventory"),
      ),
      body: ListView.builder(
          itemCount: _inventoryList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => viewInventory(
                                inventory: _inventoryList[index],
                              )));
                },
                leading: const Icon(Icons.person),
                title: Text(_inventoryList[index].vaccine ?? ''),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditInventory(
                                        inventory: _inventoryList[index],
                                      ))).then((data) {
                            if (data != null) {
                              getAllUserDetails();
                              _showSuccessSnackBar(
                                  'User Detail Updated Success');
                            }
                          });
                          ;
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.teal,
                        )),
                    IconButton(
                        onPressed: () {
                          _deleteFormDialog(context, _inventoryList[index].id);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ))
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddInventory()))
              .then((data) {
            if (data != null) {
              getAllUserDetails();
              _showSuccessSnackBar('User Detail Added Success');
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
