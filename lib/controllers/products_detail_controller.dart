import 'package:dee_pee_ink/common_widgets/app_snack_bar.dart';
import 'package:dee_pee_ink/model/product_details_response.dart';
import 'package:dee_pee_ink/repositories/products_repository.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:flutter/cupertino.dart';

class ProductDetailScreenController extends ChangeNotifier {
  String name = '';

  bool get isLoading => _isLoading;
  final bool _isLoading = true;
  final ProductsRepository _productsDetailRepository = ProductsRepository();

  String _procductName = "";

  String get procductName => _procductName;

  double _approxPrice = 0.0;

  double get approxPrice => _approxPrice;

  String _unitName = "";

  String get unitName => _unitName;

  String _brandName = "";

  String get brandName => _brandName;

  String _productCode = "";

  String get productCode => _productCode;

  String _productHighlight = "";

  String get productHighlight => _productHighlight;

  String _productDescription = "";

  String get productDescription => _productDescription;

  List<String> _productColors = [];

  List<String> get productColors => _productColors;

  List<String> _productColorsID = [];

  List<String> get productColorsID => _productColorsID;

  int _procductID = 0;

  int get procductID => _procductID;

  int _selectColorPosition = 0;

  int get selectColorPosition => _selectColorPosition;

  String _selectColorID = "";

  String get selectColorID => _selectColorID;

  double _total = 0;

  double get total => _total;
  final TextEditingController _qtyController = TextEditingController();

  TextEditingController get qtyController => _qtyController;

  List<Pictures> pictures = [];

  Future<void> init(BuildContext context, int id) async {
    ProductDetailResponse? _productsDetailResponse =
        (await _productsDetailRepository.getProductDetails(
            context, id.toString()));
    pictures = (_productsDetailResponse?.data?.pictures)!;
    print(_productsDetailResponse);
    if (_productsDetailResponse != null) {
      _procductName = _productsDetailResponse.data?.name as String;
      _approxPrice = _productsDetailResponse.data?.approxPrice as double;
      _unitName = _productsDetailResponse.data?.unit?.name as String;
      _brandName = _productsDetailResponse.data?.brand?.name as String;
      _productCode = _productsDetailResponse.data?.code as String;
      _productHighlight = _productsDetailResponse.data?.highlight as String;
      _productDescription = _productsDetailResponse.data?.description as String;
      _procductID = _productsDetailResponse.data?.id as int;
      var responseColours =
          _productsDetailResponse.data?.colors as List<AUIColors>;
      for (int i = 0; i < responseColours.length; i++) {
        AUIColors performanceData = AUIColors(name: responseColours[i].name);
        _productColors.add(responseColours[i].name.toString());
        _productColorsID.add(responseColours[i].id.toString());
        print(_productColors.toString());
        notifyListeners();
      }
      updateQty();
      print(_procductName.toString());
    }
    notifyListeners();
  }

  void incrementQty() {
    int currentValue = int.parse(_qtyController.text);
    if (currentValue != 999)
    {
      currentValue++;
      _qtyController.text = (currentValue).toString();
      _total = (currentValue.toDouble() * _approxPrice.toDouble());
      print(_total);
      notifyListeners();
    }
  }

  void decrementQty() {
    int currentValue = int.parse(_qtyController.text);
    if (currentValue != 1) {
      currentValue--;
      _qtyController.text = (currentValue >= 0 ? currentValue : 0).toString();
      _total = (currentValue.toDouble() * _approxPrice.toDouble());
      print(_total);
      notifyListeners();
    }
  }

  void updateQty() {
    int currentValue = int.parse(_qtyController.text);
    if (currentValue >= 1) {
      _total = (currentValue.toDouble() * _approxPrice.toDouble());
      print(_total);
      notifyListeners();
    } else if(currentValue==1) {
      int currentValue = 1;
      _qtyController.text = "1";
      _total = (currentValue.toDouble() * _approxPrice.toDouble());
    } else if(currentValue.isNaN){
      _qtyController.text.isEmpty;
      const AppSnackBar(message: "Invalid Quantity",color: UIColors.redColor);
    }
  }

  void selectedColorPosition(String value) {
    _selectColorPosition = _productColors.indexOf(value);
    print("_selectColorPosition " + _selectColorPosition.toString());
    _selectColorID = _productColorsID[_selectColorPosition];
    print("_productColorsID " +
        _productColorsID[_selectColorPosition].toString());
    notifyListeners();
  }
}
