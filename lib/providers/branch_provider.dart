import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kcb/models/branch.dart';
import 'package:kcb/services/branch_services.dart';

class BranchProvider with ChangeNotifier {
  List<Branch> branches = [];

  Future<void> getBranches() async {
    branches = await BranchServices().getBranches();
    notifyListeners();
  }
}
