import 'package:bmi_calculator_001/config/calculator.dart';
import 'package:bmi_calculator_001/enum.dart';
import 'package:flutter/material.dart';

//Severe Thinness < 16
//Moderate Thinness 16 - 17
//Mild Thinness 17 - 18.5
//normal 18.5 - 25
//Overweight 25 - 30
//Obese Class I 30 - 35
//Obese Class II 35 - 40
//Obese Class III > 40

class ProviderManager with ChangeNotifier {
  int _age = 25;
  int _height = 175;
  int _weight = 65;
  double _minWeight = calculateMinNormalWeight(height: 175);
  double _maxWeight = calculateMaxNormalWeight(height: 175);
  GenderType _gender;
  double _bmi;
  Status _status;

  int get getAge => _age;
  int get getHeight => _height;
  int get getWeight => _weight;
  GenderType get getGender => _gender;
  double get getBMI => _bmi;
  double get getMinWeight => _minWeight;
  double get getMaxWeight => _maxWeight;
  Status get getStatus => _status;

  void setAge(int value) {
    if (value >= 18 && value < 99) {
      _age = value;
      notifyListeners();
    }
  }

  void setHeight(int value) {
    if (value > 50 && value < 220) {
      _height = value;
      _minWeight = calculateMinNormalWeight(height: _height);
      _maxWeight = calculateMaxNormalWeight(height: _height);
      notifyListeners();
    }
  }

  void setWeight(int value) {
    if (value > 10 && value < 120) {
      _weight = value;
      notifyListeners();
    }
  }

  void setGender(GenderType value) {
    _gender = value;
    notifyListeners();
  }

  void setBmi() {
    _bmi = calculateBMI(height: _height, weight: _weight);
    if (_bmi < 16)
      _status = Status.Severe_Thinness;
    else if (_bmi > 16 && _bmi <= 17)
      _status = Status.Moderate_Thinness;
    else if (_bmi > 17 && _bmi <= 18.5)
      _status = Status.Mild_Thinness;
    else if (_bmi > 18.5 && _bmi <= 25)
      _status = Status.Normal;
    else if (_bmi > 25 && _bmi <= 30)
      _status = Status.Over_Weight;
    else if (_bmi > 30 && _bmi <= 35)
      _status = Status.Obese_Class_I;
    else if (_bmi > 35 && _bmi <= 40)
      _status = Status.Obese_Class_II;
    else
      _status = Status.Obese_Class_III;
    notifyListeners();
  }
}
