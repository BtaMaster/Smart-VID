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
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the ReporteDashboard type in your schema. */
@immutable
class ReporteDashboard {
  final String? _Tiempo;
  final String? _payload;

  String get Tiempo {
    try {
      return _Tiempo!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get payload {
    try {
      return _payload!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const ReporteDashboard._internal({required Tiempo, required payload}): _Tiempo = Tiempo, _payload = payload;
  
  factory ReporteDashboard({required String Tiempo, required String payload}) {
    return ReporteDashboard._internal(
      Tiempo: Tiempo,
      payload: payload);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReporteDashboard &&
      _Tiempo == other._Tiempo &&
      _payload == other._payload;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ReporteDashboard {");
    buffer.write("Tiempo=" + "$_Tiempo" + ", ");
    buffer.write("payload=" + "$_payload");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ReporteDashboard copyWith({String? Tiempo, String? payload}) {
    return ReporteDashboard._internal(
      Tiempo: Tiempo ?? this.Tiempo,
      payload: payload ?? this.payload);
  }
  
  ReporteDashboard.fromJson(Map<String, dynamic> json)  
    : _Tiempo = json['Tiempo'],
      _payload = json['payload'];
  
  Map<String, dynamic> toJson() => {
    'Tiempo': _Tiempo, 'payload': _payload
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ReporteDashboard";
    modelSchemaDefinition.pluralName = "ReporteDashboards";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'Tiempo',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'payload',
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}