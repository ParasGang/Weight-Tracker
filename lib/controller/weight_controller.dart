import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeightController extends GetxController {
  RxList<String> weightsList = <String>[].obs;
  RxDouble averageWeight = 0.0.obs;
  Rx<TextEditingController> textEditingController = TextEditingController().obs;
  RxBool loading = false.obs;
  RxList<Rx<TextEditingController>> editingControllerList =
      <Rx<TextEditingController>>[].obs;

  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  void initialize() async {
    loading.value = true;
    List<String>? temp = await LocalDatabase().getValue();
    weightsList.addAll(temp!);
    for (var i in weightsList) {
      editingControllerList.add(TextEditingController().obs);
    }
    calculateAverageWeight();
    loading.value = false;
  }

  void addWeight() {
    if (textEditingController.value.text.isNotEmpty) {
      editingControllerList.add(TextEditingController().obs);
      weightsList.add(textEditingController.value.text);

      calculateAverageWeight();
      textEditingController.value.clear();
      LocalDatabase().setValue(weightsList);
    }
  }

  void updateWeight(int index) {
    if (editingControllerList[index].value.text.isNotEmpty) {
      weightsList[index] = editingControllerList[index].value.text;
      editingControllerList[index].value.clear();
      calculateAverageWeight();
    }
  }

  void calculateAverageWeight() {
    double sum = 0.0;
    if (weightsList.isNotEmpty) {
      for (int i = 0; i < weightsList.length; i++) {
        sum += double.parse(weightsList[i]);
      }
      averageWeight.value = (sum / weightsList.length).roundToDouble();
    }
  }
}

class LocalDatabase {
  SharedPreferences? _sharedPreferences;
  Future<List<String>?> getValue() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences!.getStringList('weight') ?? [];
  }

  void setValue(List<String> weightList) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences!.setStringList('weight', weightList);
  }
}
