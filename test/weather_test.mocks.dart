// Mocks generated by Mockito 5.4.4 from annotations
// in weather_mobile_engineer_test_1/test/weather_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dio/dio.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:weather_mobile_engineer_test_1/models/weather_data_model.dart'
    as _i3;
import 'package:weather_mobile_engineer_test_1/repositories/weather_repository.dart'
    as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDio_0 extends _i1.SmartFake implements _i2.Dio {
  _FakeDio_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWeatherData_1 extends _i1.SmartFake implements _i3.WeatherData {
  _FakeWeatherData_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [WeatherRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherRepository extends _i1.Mock implements _i4.WeatherRepository {
  @override
  _i2.Dio get dio => (super.noSuchMethod(
        Invocation.getter(#dio),
        returnValue: _FakeDio_0(
          this,
          Invocation.getter(#dio),
        ),
        returnValueForMissingStub: _FakeDio_0(
          this,
          Invocation.getter(#dio),
        ),
      ) as _i2.Dio);

  @override
  set dio(_i2.Dio? _dio) => super.noSuchMethod(
        Invocation.setter(
          #dio,
          _dio,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Future<_i3.WeatherData> fetchWeatherData(
    double? lat,
    double? lon,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchWeatherData,
          [
            lat,
            lon,
          ],
        ),
        returnValue: _i5.Future<_i3.WeatherData>.value(_FakeWeatherData_1(
          this,
          Invocation.method(
            #fetchWeatherData,
            [
              lat,
              lon,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.WeatherData>.value(_FakeWeatherData_1(
          this,
          Invocation.method(
            #fetchWeatherData,
            [
              lat,
              lon,
            ],
          ),
        )),
      ) as _i5.Future<_i3.WeatherData>);
}
