Class {
	#name : #MOAngularModelWriter,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'Moxing-Angular-Model'
}

{ #category : #'as yet unclassified' }
MOAngularModelWriter >> typeReferenceFor: aType [
	| destinationTypeName |
	destinationTypeName := {('dbLong' -> 'bigint').
	('dbDecimal' -> 'bigint').
	('dbDouble' -> 'bigint').
	('dbBoolean' -> 'boolean').
	('dbInteger' -> 'bigint').
	('dbDate' -> 'Date').
	('dbCurrency' -> 'number').
	('dbText' -> 'string').
	('dbMemo' -> 'string').
	('dbAttachment' -> 'Int8Array').
	('dbComplexLong' -> 'BigInt64Array')} asDictionary at: aType.
	^ MOTypescriptPrebuiltTypeReferenceFactory default
		typeReference: destinationTypeName
]

{ #category : #'as yet unclassified' }
MOAngularModelWriter >> visitColumn: aMDColumn [
	model
		addProperty:
			(MOLocalVariable new
				name: aMDColumn compilableIdentifier;
				type: (self typeReferenceFor: aMDColumn type);
				yourself)
]

{ #category : #'as yet unclassified' }
MOAngularModelWriter >> visitDataBinding: aMODataBindingAttribute [
	aMODataBindingAttribute binding entity accept: self
]

{ #category : #'as yet unclassified' }
MOAngularModelWriter >> visitIndex: anIndex [
	| id |
	anIndex kind = #PrimaryKey
		ifFalse: [ ^ self ].

	id := anIndex elements
		collect:
			[ :e | model properties detect: [ :p | p name = e compilableIdentifier ] ].
	self assert: id size = 1.
	model
		addMethod:
			((MOAngularPrebuiltMethodFactory new getter: 'Id' property: id first)
				setOwnerClass: model;
				yourself)
]

{ #category : #'as yet unclassified' }
MOAngularModelWriter >> visitRelationalTable: aMDRelationalTable [
	model := MOClass new.
	model name: aMDRelationalTable compilableTypeIdentifier.
	aMDRelationalTable elements do: [ :e | e accept: self ].
	aMDRelationalTable indexes do: [ :i | i accept: self ].
	
]

{ #category : #'as yet unclassified' }
MOAngularModelWriter >> visitRelationalView: aMDRelationalView [ 
	model := MOClass new.
	model name: aMDRelationalView compilableTypeIdentifier .
	aMDRelationalView elements do: [ : e | e accept: self ]
]

{ #category : #writing }
MOAngularModelWriter >> writeModelFor: aMDDataBinding [
	aMDDataBinding accept: self.
	^ MOAngularTransientClass new
		setClass: model;
		yourself
]
