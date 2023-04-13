import 'package:flutter/material.dart';

class ComputerCardPage extends StatelessWidget {
  final String id;
  final String ip;
  final String model;
  final String computerName;
  final String serialNumber;
  final String macAddress;
  final String inventoryNumber;

  const ComputerCardPage({
    required this.id,
    required this.ip,
    required this.model,
    required this.computerName,
    required this.serialNumber,
    required this.macAddress,
    required this.inventoryNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Computer Details'),
      ),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ID: $id'),
              Text('IP: $ip'),
              Text('Model: $model'),
              Text('Computer Name: $computerName'),
              Text('Serial Number: $serialNumber'),
              Text('MAC Address: $macAddress'),
              Text('Inventory Number: $inventoryNumber'),
            ],
          ),
        ),
      ),
    );
  }
}
