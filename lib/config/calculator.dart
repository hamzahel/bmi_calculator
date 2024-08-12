import 'dart:math' as math;

// /* age < 18 */
//Mild Thinness < 16
//Moderate Thinness 16 - 17
//Mild Thinness 17 - 18.5
//normal 18.5 - 25
//Overweight 25 - 30
//Obese Class I 30 - 35
//Obese Class II 35 - 40
//Obese Class III > 40

//age 2-20
// Underweight	< 5%
// Healthy weight 5% - 85%
// At risk of overweight 85% - 95%
// Overweight >95%

double calculateBMI({int height, int weight}) =>
    weight / _heightSquared(height);

double calculateMinNormalWeight({int height}) => 18.5 * _heightSquared(height);

double calculateMaxNormalWeight({int height}) => 25 * _heightSquared(height);

double _heightSquared(int height) => math.pow(height / 100, 2);
