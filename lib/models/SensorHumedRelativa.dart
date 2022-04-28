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


/** This is an auto generated class representing the SensorHumedRelativa type in your schema. */
@immutable
class SensorHumedRelativa extends Model {
  static const classType = const _SensorHumedRelativaModelType();
  final String id;
  final String? _Tiempo;
  final String? _humedadRelativa;
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
  
  String get humedadRelativa {
    try {
      return _humedadRelativa!;
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
  
  const SensorHumedRelativa._internal({required this.id, required Tiempo, required humedadRelativa, createdAt, updatedAt}): _Tiempo = Tiempo, _humedadRelativa = humedadRelativa, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory SensorHumedRelativa({String? id, required String Tiempo, required String humedadRelativa}) {
    return SensorHumedRelativa._internal(
      id: id == null ? UUID.getUUID() : id,
      Tiempo: Tiempo,
      humedadRelativa: humedadRelativa);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SensorHumedRelativa &&
      id == other.id &&
      _Tiempo == other._Tiempo &&
      _humedadRelativa == other._humedadRelativa;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("SensorHumedRelativa {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("Tiempo=" + "$_Tiempo" + ", ");
    buffer.write("humedadRelativa=" + "$_humedadRelativa" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  SensorHumedRelativa copyWith({String? id, String? Tiempo, String? humedadRelativa}) {
    return SensorHumedRelativa._internal(
      id: id ?? this.id,
      Tiempo: Tiempo ?? this.Tiempo,
      humedadRelativa: humedadRelativa ?? this.humedadRelativa);
  }
  
  SensorHumedRelativa.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _Tiempo = json['Tiempo'],
      _humedadRelativa = json['humedadRelativa'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'Tiempo': _Tiempo, 'humedadRelativa': _humedadRelativa, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "sensorHumedRelativa.id");
  static final QueryField TIEMPO = QueryField(fieldName: "Tiempo");
  static final QueryField HUMEDADRELATIVA = QueryField(fieldName: "humedadRelativa");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "SensorHumedRelativa";
    modelSchemaDefinition.pluralName = "SensorHumedRelativas";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SensorHumedRelativa.TIEMPO,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SensorHumedRelativa.HUMEDADRELATIVA,
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

class _SensorHumedRelativaModelType extends ModelType<SensorHumedRelativa> {
  const _SensorHumedRelativaModelType();
  
  @override
  SensorHumedRelativa fromJson(Map<String, dynamic> jsonData) {
    return SensorHumedRelativa.fromJson(jsonData);
  }
}