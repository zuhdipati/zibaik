import 'package:get/get.dart';
import 'package:manajemen_keuangan/models/submit_model.dart';

class SubmitController extends GetxController {
  RxBool isExpense = true.obs;
  RxInt isSelected = RxInt(-1);

  //  void setSelected(int index) {
  //   isSelected.value = index;
  // }

  final List<CategoryModel> listCategory = [
    CategoryModel(name: "Medicine", svgIcon: "assets/doctor.svg"),
    CategoryModel(name: "House", svgIcon: "assets/house-chimney.svg"),
    CategoryModel(name: "Shopping", svgIcon: "assets/doctor.svg"),
    CategoryModel(name: "Electric", svgIcon: "assets/bolt.svg"),
    CategoryModel(name: "Coffee", svgIcon: "assets/mug-hot-alt.svg"),
    CategoryModel(name: "Pet", svgIcon: "assets/dog.svg"),
    CategoryModel(name: "Haircut", svgIcon: "assets/barber-shop.svg"),
    CategoryModel(name: "Device", svgIcon: "assets/devices.svg"),
    CategoryModel(name: "Office", svgIcon: "assets/city.svg"),
  ];
}
