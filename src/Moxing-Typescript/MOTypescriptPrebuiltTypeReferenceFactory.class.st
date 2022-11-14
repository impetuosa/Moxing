Class {
	#name : #MOTypescriptPrebuiltTypeReferenceFactory,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#classInstVars : [
		'default'
	],
	#category : #'Moxing-Typescript-Writting'
}

{ #category : #'as yet unclassified' }
MOTypescriptPrebuiltTypeReferenceFactory class >> defaultFor: aMOModel [

	^ self defaultMap at: aMOModel ifAbsentPut: [ 
		  self new
			  model: aMOModel;
			  yourself ]
]

{ #category : #'as yet unclassified' }
MOTypescriptPrebuiltTypeReferenceFactory class >> defaultMap [

	^ default ifNil: [ default := Dictionary new ]
]

{ #category : #'as yet unclassified' }
MOTypescriptPrebuiltTypeReferenceFactory >> T [
	^ self typeReference: 'T'
]

{ #category : #'native types' }
MOTypescriptPrebuiltTypeReferenceFactory >> arrayOf: aString [
	^ MOArrayTypeReference new
		innerType: (self typeReference: aString);
		yourself
]

{ #category : #'native types' }
MOTypescriptPrebuiltTypeReferenceFactory >> bigint [
	^ self typeReference: #bigint
]

{ #category : #'contenient - rxjs' }
MOTypescriptPrebuiltTypeReferenceFactory >> catchError [
	^ self typeReference: 'catchError' definedAt: 'rxjs/operators'
]

{ #category : #'as yet unclassified' }
MOTypescriptPrebuiltTypeReferenceFactory >> component [
	^ self component: Dictionary new
]

{ #category : #'convenient - decorators' }
MOTypescriptPrebuiltTypeReferenceFactory >> component: attributes [
	^ self
		decorator: 'Component'
		definedAt: '@angular/core'
		attributes: attributes
]

{ #category : #'native types' }
MOTypescriptPrebuiltTypeReferenceFactory >> date [
	^ self typeReference: #Date
]

{ #category : #'building methods' }
MOTypescriptPrebuiltTypeReferenceFactory >> decorator: aName definedAt: aRef attributes: attrs [

	^ (MODecorator newForTypescriptIn: model)
		  name: aName;
		  definedAt: aRef;
		  attributes: attrs;
		  yourself
]

{ #category : #'as yet unclassified' }
MOTypescriptPrebuiltTypeReferenceFactory >> dependencies [
	self shouldBeImplemented.
]

{ #category : #'building methods' }
MOTypescriptPrebuiltTypeReferenceFactory >> genericType: aTypeName definedAt: aRef argumentType: aParameter [
	^ self genericType: aTypeName definedAt: aRef  argumentTypes: { aParameter }.
	
]

{ #category : #'building methods' }
MOTypescriptPrebuiltTypeReferenceFactory >> genericType: aTypeName definedAt: aRef argumentTypes: arguments [
	^ MOParametrizedTypeReference new
		name: aTypeName;
		definedAt: aRef;
		argumentTypeReferences: (arguments collect: [ :p | self typeReference: p ]);
		yourself
]

{ #category : #'convenient - decorators' }
MOTypescriptPrebuiltTypeReferenceFactory >> httpClient [
	^ self typeReference: #HttpClient definedAt: '@angular/common/http'
]

{ #category : #'convenient - decorators' }
MOTypescriptPrebuiltTypeReferenceFactory >> httpHeaders [
	^ self typeReference: #HttpHeaders definedAt: '@angular/common/http'
]

{ #category : #'convenient - decorators' }
MOTypescriptPrebuiltTypeReferenceFactory >> injectable: attributes [
	^ self
		decorator: 'Injectable'
		definedAt: '@angular/core'
		attributes: attributes
]

{ #category : #'convenient - decorators' }
MOTypescriptPrebuiltTypeReferenceFactory >> injectableProvidedAtRoot [
	^ self
		decorator: 'Injectable'
		definedAt: '@angular/core'
		attributes: {(#providedIn -> 'root')} asDictionary
]

{ #category : #accessing }
MOTypescriptPrebuiltTypeReferenceFactory >> model: aMOModel [ 
	model := aMOModel
]

{ #category : #'native types' }
MOTypescriptPrebuiltTypeReferenceFactory >> number [
	^ self typeReference: #number
]

{ #category : #'as yet unclassified' }
MOTypescriptPrebuiltTypeReferenceFactory >> object [
	^ self typeReference: #Object
]

{ #category : #'convenient - types' }
MOTypescriptPrebuiltTypeReferenceFactory >> observable: aType [
	^ self genericType: #Observable definedAt: 'rxjs' argumentType: aType
]

{ #category : #'convenient - types' }
MOTypescriptPrebuiltTypeReferenceFactory >> observableAny [
	^ self observable: #any
]

{ #category : #'convenient - types' }
MOTypescriptPrebuiltTypeReferenceFactory >> observableArrayOf: aType [
	^ self observable: (self arrayOf: aType)
]

{ #category : #'contenient - rxjs' }
MOTypescriptPrebuiltTypeReferenceFactory >> of [
	^ self typeReference: 'of' definedAt: 'rxjs'
]

{ #category : #'as yet unclassified' }
MOTypescriptPrebuiltTypeReferenceFactory >> onDestroy [
	^ self typeReference: #OnDestroy definedAt: '@angular/core'
]

{ #category : #'as yet unclassified' }
MOTypescriptPrebuiltTypeReferenceFactory >> onInit [
	^ self typeReference: #OnInit definedAt: '@angular/core'
]

{ #category : #'native types' }
MOTypescriptPrebuiltTypeReferenceFactory >> string [
	^ self typeReference: #string
]

{ #category : #'building methods' }
MOTypescriptPrebuiltTypeReferenceFactory >> typeReference: aString [

	^ aString isString
		  ifTrue: [ 
			  (MOTypeReference newForTypescriptIn: model)
				  name: aString;
				  yourself ]
		  ifFalse: [ aString ]
]

{ #category : #'native types' }
MOTypescriptPrebuiltTypeReferenceFactory >> void [
	^ self typeReference: #void
]
