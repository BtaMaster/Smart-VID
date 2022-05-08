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

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the ReporteDashboardConnection type in your schema. */
@immutable
class ReporteDashboardConnection {
  final List<ReporteDashboard>? _items;
  final String? _nextToken;

  List<ReporteDashboard>? get items {
    return _items;
  }
  
  String? get nextToken {
    return _nextToken;
  }
  
  const ReporteDashboardConnection._internal({items, nextToken}): _items = items, _nextToken = nextToken;
  
  factory ReporteDashboardConnection({List<ReporteDashboard>? items, String? nextToken}) {
    return ReporteDashboardConnection._internal(
      items: items != null ? List<ReporteDashboard>.unmodifiable(items) : items,
      nextToken: nextToken);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReporteDashboardConnection &&
      DeepCollectionEquality().equals(_items, other._items) &&
      _nextToken == other._nextToken;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ReporteDashboardConnection {");
    buffer.write("items=" + (_items != null ? _items!.toString() : "null") + ", ");
    buffer.write("nextToken=" + "$_nextToken");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ReporteDashboardConnection copyWith({List<ReporteDashboard>? items, String? nextToken}) {
    return ReporteDashboardConnection._internal(
      items: items ?? this.items,
      nextToken: nextToken ?? this.nextToken);
  }
  
  ReporteDashboardConnection.fromJson(Map<String, dynamic> json)  
    : _items = json['items'] is List
        ? (json['items'] as List)
          .where((e) => e != null)
          .map((e) => ReporteDashboard.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _nextToken = json['nextToken'];
  
  Map<String, dynamic> toJson() => {
    'items': _items?.map((ReporteDashboard? e) => e?.toJson()).toList(), 'nextToken': _nextToken
  };

  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ReporteDashboardConnection";
    modelSchemaDefinition.pluralName = "ReporteDashboardConnections";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.embedded(
      fieldName: 'items',
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.embeddedCollection, ofCustomTypeName: 'ReporteDashboard')
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.customTypeField(
      fieldName: 'nextToken',
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}