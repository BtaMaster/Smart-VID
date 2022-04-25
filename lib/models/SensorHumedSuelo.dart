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


/** This is an auto generated class representing the SensorHumedSuelo type in your schema. */
@immutable
class SensorHumedSuelo extends Model {
  static const classType = const _SensorHumedSueloModelType();
  final String id;
  final String? _Tiempo;
  final String? _humedadSuelo;
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
  
  String get humedadSuelo {
    try {
      return _humedadSuelo!;
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
  
  const SensorHumedSuelo._internal({required this.id, required Tiempo, required humedadSuelo, createdAt, updatedAt}): _Tiempo = Tiempo, _humedadSuelo = humedadSuelo, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory SensorHumedSuelo({String? id, required String Tiempo, required String humedadSuelo}) {
    return SensorHumedSuelo._internal(
      id: id == null ? UUID.getUUID() : id,
      Tiempo: Tiempo,
      humedadSuelo: humedadSuelo);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SensorHumedSuelo &&
      id == other.id &&
      _Tiempo == other._Tiempo &&
      _humedadSuelo == other._humedadSuelo;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("SensorHumedSuelo {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("Tiempo=" + "$_Tiempo" + ", ");
    buffer.write("humedadSuelo=" + "$_humedadSuelo" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  SensorHumedSuelo copyWith({String? id, String? Tiempo, String? humedadSuelo}) {
    return SensorHumedSuelo._internal(
      id: id ?? this.id,
      Tiempo: Tiempo ?? this.Tiempo,
      humedadSuelo: humedadSuelo ?? this.humedadSuelo);
  }
  
  SensorHumedSuelo.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _Tiempo = json['Tiempo'],
      _humedadSuelo = json['humedadSuelo'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'Tiempo': _Tiempo, 'humedadSuelo': _humedadSuelo, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "sensorHumedSuelo.id");
  static final QueryField TIEMPO = QueryField(fieldName: "Tiempo");
  static final QueryField HUMEDADSUELO = QueryField(fieldName: "humedadSuelo");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "SensorHumedSuelo";
    modelSchemaDefinition.pluralName = "SensorHumedSuelos";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SensorHumedSuelo.TIEMPO,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: SensorHumedSuelo.HUMEDADSUELO,
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

class _SensorHumedSueloModelType extends ModelType<SensorHumedSuelo> {
  const _SensorHumedSueloModelType();
  
  @override
  SensorHumedSuelo fromJson(Map<String, dynamic> jsonData) {
    return SensorHumedSuelo.fromJson(jsonData);
  }
}