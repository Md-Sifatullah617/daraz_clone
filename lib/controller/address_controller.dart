import 'package:daraz_clone/model/area_model.dart';
import 'package:daraz_clone/model/districts_model.dart';
import 'package:daraz_clone/model/division_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddressController extends GetxController {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController fullAreaController = TextEditingController();
  final TextEditingController landMarkController = TextEditingController();
  var isLoading = false.obs;
  final TextEditingController divisionController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  List<Division> divisionList = [];
  List<Districts> districtList = [];
  List<Datum> areaList = [];

  @override
  void onInit() {
    getDivisionList();
    getDistrictsList();
    getAreasList();
    super.onInit();
  }

  @override
  void onClose() {
    fullNameController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    super.onClose();
  }

  Future<void> getDivisionList() async {
    try {
      isLoading.value = true;
      final http.Response response = await http.get(
        Uri.parse('https://api.picky.com.bd/api/user/v2/customer/get-states'),
      );
      if (response.statusCode == 200) {
        final GetDivisionModel getDivisionModel =
            getDivisionModelFromJson(response.body.toString());
        divisionList = getDivisionModel.data!;
        isLoading.value = false;
        update();
      } else {
        debugPrint("Error: ${response.statusCode}");
        isLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error: $e");
      isLoading.value = false;
    }
  }

  Future<void> getDistrictsList() async {
    try {
      isLoading.value = true;
      final http.Response response = await http.get(
        Uri.parse(
            'https://api.picky.com.bd/api/user/v2/customer/get-districts'),
      );
      if (response.statusCode == 200) {
        final GetDistrictsModel getDistrictsModel =
            getDistrictsModelFromJson(response.body.toString());
        districtList = getDistrictsModel.data!;
        isLoading.value = false;
        update();
      } else {
        debugPrint("Error: ${response.statusCode}");
        isLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error: $e");
      isLoading.value = false;
    }
  }

  Future<void> getAreasList() async {
    try {
      isLoading.value = true;
      final http.Response response = await http.get(
        Uri.parse('https://api.picky.com.bd/api/user/v2/customer/get-areas'),
      );
      if (response.statusCode == 200) {
        final GetAreaModel getAreaModel =
            getAreaModelFromJson(response.body.toString());
        areaList = getAreaModel.data!;
        isLoading.value = false;
        update();
      } else {
        debugPrint("Error: ${response.statusCode}");
        isLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error: $e");
      isLoading.value = false;
    }
  }
}
