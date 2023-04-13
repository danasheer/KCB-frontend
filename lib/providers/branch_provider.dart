import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kcb/models/branch.dart';
import 'package:kcb/models/department.dart';
import 'package:kcb/services/branch_services.dart';

class BranchProvider with ChangeNotifier {
  List<Branch> branches = [];
  Branch branch = Branch(id: 0, name: "", departments: []);
  Department department = Department(
    id: 0,
    name: "",
  );

  Future<void> getBranchesDetail() async {
    branches = await BranchServices().getBranches();
    notifyListeners();
  }

  Future<void> getBranchDepartment(id) async {
    branch = await BranchServices().getBranchDepartment(id);
    notifyListeners();
  }
}
