/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, file_names, unnecessary_new, prefer_if_null_operators, prefer_const_constructors, slash_for_doc_comments, annotate_overrides, non_constant_identifier_names, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, unnecessary_const, dead_code

import 'package:amplify_core/amplify_core.dart';
import 'SensorHumedRelativa.dart';
import 'SensorHumedSuelo.dart';
import 'SensorLuminosidad.dart';
import 'SensorTempRelativa.dart';
import 'SensorTempSuelo.dart';
import 'Todo.dart';
import 'ModelTodoConnection.dart';
import 'ReporteDashboard.dart';
import 'ReporteDashboardConnection.dart';
import 'SensorHumedRelativaConnection.dart';
import 'SensorHumedSueloConnection.dart';
import 'SensorLuminosidadConnection.dart';
import 'SensorTempRelativaConnection.dart';
import 'SensorTempSueloConnection.dart';

export 'ModelAttributeTypes.dart';
export 'ModelSortDirection.dart';
export 'ModelTodoConnection.dart';
export 'ReporteDashboard.dart';
export 'ReporteDashboardConnection.dart';
export 'SensorHumedRelativa.dart';
export 'SensorHumedRelativaConnection.dart';
export 'SensorHumedSuelo.dart';
export 'SensorHumedSueloConnection.dart';
export 'SensorLuminosidad.dart';
export 'SensorLuminosidadConnection.dart';
export 'SensorTempRelativa.dart';
export 'SensorTempRelativaConnection.dart';
export 'SensorTempSuelo.dart';
export 'SensorTempSueloConnection.dart';
export 'Todo.dart';

class ModelProvider implements ModelProviderInterface {
  @override
  String version = "4926aa2521fb5f0e41a333596e3f8e7a";
  @override
  List<ModelSchema> modelSchemas = [SensorHumedRelativa.schema, SensorHumedSuelo.schema, SensorLuminosidad.schema, SensorTempRelativa.schema, SensorTempSuelo.schema, Todo.schema];
  static final ModelProvider _instance = ModelProvider();
  @override
  List<ModelSchema> customTypeSchemas = [ModelTodoConnection.schema, ReporteDashboard.schema, ReporteDashboardConnection.schema, SensorHumedRelativaConnection.schema, SensorHumedSueloConnection.schema, SensorLuminosidadConnection.schema, SensorTempRelativaConnection.schema, SensorTempSueloConnection.schema];

  static ModelProvider get instance => _instance;
  
  ModelType getModelTypeByModelName(String modelName) {
    switch(modelName) {
      case "SensorHumedRelativa":
        return SensorHumedRelativa.classType;
      case "SensorHumedSuelo":
        return SensorHumedSuelo.classType;
      case "SensorLuminosidad":
        return SensorLuminosidad.classType;
      case "SensorTempRelativa":
        return SensorTempRelativa.classType;
      case "SensorTempSuelo":
        return SensorTempSuelo.classType;
      case "Todo":
        return Todo.classType;
      default:
        throw Exception("Failed to find model in model provider for model name: " + modelName);
    }
  }
}