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


/** This is an auto generated class representing the SensorTempRelativa type in your schema. */
@immutable
class SensorTempRelativa extends Model {
  static const classType = const _SensorTempRelativaModelType();
  final String id;
  final String? _Tiempo;
  final String? _temperaturaRelativa;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
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
  
  String get temperaturaRelativa {
    try {
      return _temperaturaRelativa!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const SensorTempRelativa._internal({required this.id, required Tiempo, required temperaturaRelativa, createdAt, updatedAt}): _Tiempo = Tiempo, _temperaturaRelativa = temperaturaRelativa, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory SensorTempRelativa({String? id, required String Tiempo, required String temperaturaRelativa}) {
    return SensorTempRelativa._internal(
      id: id == null ? UUID.getUUID() : id,
      Tiempo: Tiempo,
      temperaturaRelativa: temperaturaRelativa);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SensorTempRelativa &&
      id == other.id &&
      _Tiempo == other._Tiempo &&
      _temperaturaRelativa == other._temperaturaRelativa;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("SensorTempRelativa {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("Tiempo=" + "$_Tiempo" + ", ");
    buffer.write("temperaturaRelativa=" + "$_temperaturaRelativa" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  SensorTempRelativa copyWith({String? id, String? Tiempo, String? temperaturaRelativa}) {
    return SensorTempRelativa._internal(
      id: id ?? this.id,
      Tiempo: Tiempo ?? this.Tiempo,
      temperaturaRelativa: temperaturaRelativa ?? this.temperaturaRelativa);
  }
  
  SensorTempRelativa.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _Tiempo = json['Tiempo'],
      _temperaturaRelativa = json['temperaturaRelativa'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'Tiempo': _Tiempo, 'temperaturaRelativa': _temperaturaRelativa, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "sensorTempRelativa.id");
  static final QueryField TIEMPO = QueryField(fieldName: "Tiempo");
  static final QueryField TEMPERATURARELATIVA = QueryField(fieldName: "temperaturaRelativa");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "SensorTempRelativa";
    modelSchemaDefinition.pluralName = "SensorTempRelativas";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SensorTempRelativa.TIEMPO,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SensorTempRelativa.TEMPERATURARELATIVA,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _SensorTempRelativaModelType extends ModelType<SensorTempRelativa> {
  const _SensorTempRelativaModelType();
  
  @override
  SensorTempRelativa fromJson(Map<String, dynamic> jsonData) {
    return SensorTempRelativa.fromJson(jsonData);
  }
}