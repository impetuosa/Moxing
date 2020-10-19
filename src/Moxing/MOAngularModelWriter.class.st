Class {
	#name : #MOAngularModelWriter,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'Moxing-CodeWritingTypescript'
}

{ #category : #'as yet unclassified' }
MOAngularModelWriter >> typeReferenceFor: aType [
	| destinationTypeName |
	destinationTypeName := {
	('dbLong' -> 'bigint').
	('dbBoolean' -> 'boolean').
	('dbInteger' -> 'bigint').
	('dbDate' -> 'Date').
	('dbCurrency' -> 'number').
	('dbText' -> 'string').
	('dbMemo' -> 'string') . 
('dbAttachment' -> 'Array<byte>') . 
	('dbComplexLong' -> 'Array<bigint>')} asDictionary at: aType.
	^ MOTypescriptPrebuiltTypeReferenceFactory default
		typeReference: destinationTypeName
]

{ #category : #'as yet unclassified' }
MOAngularModelWriter >> visitColumn: aMDColumn [
	model
		addProperty:
			(MOTypescriptVariable new
				name: aMDColumn compilableIdentifier;
				type: (self typeReferenceFor: aMDColumn type);
				yourself)
]

{ #category : #'as yet unclassified' }
MOAngularModelWriter >> visitDataBinding: aMODataBindingAttribute [
	aMODataBindingAttribute binding entity accept: self
]

{ #category : #'as yet unclassified' }
MOAngularModelWriter >> visitRelationalTable: aMDRelationalTable [
	model := MOTypescriptClass new.
	model name: aMDRelationalTable compilableTypeIdentifier.
	aMDRelationalTable elements do: [ :e | e accept: self ]
]

{ #category : #'as yet unclassified' }
MOAngularModelWriter >> visitRelationalView: aMDRelationalView [ 
	model := MOTypescriptClass new.
	model name: aMDRelationalView compilableTypeIdentifier .
	aMDRelationalView elements do: [ : e | e accept: self ]
]

{ #category : #writing }
MOAngularModelWriter >> writeModelFor: aMDDataBinding [
	aMDDataBinding accept: self.
	^ MOAngularProtoClass new
		setClass: model;
		yourself
]
