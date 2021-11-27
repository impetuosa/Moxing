Class {
	#name : #MOModelTypeLinker,
	#superclass : #Object,
	#instVars : [
		'model',
		'resolving'
	],
	#category : #'Moxing-Core'
}

{ #category : #'as yet unclassified' }
MOModelTypeLinker >> lookIntoPackage: aPackage [

	self registerPossibles:
		(aPackage types select: [ :t | t name = resolving name ])
]

{ #category : #accessing }
MOModelTypeLinker >> model: aMOModel [ 
	model := aMOModel
]

{ #category : #'as yet unclassified' }
MOModelTypeLinker >> processTypeReference: aMOTypeReference [

	resolving := aMOTypeReference.

	aMOTypeReference acceptVisitor: self.
	resolving candidate ifNil: [ self resolveWellKnown ].
	resolving candidate ifNil: [ self resolveAsUnknown ]
]

{ #category : #'as yet unclassified' }
MOModelTypeLinker >> registerPossibles: aCollection [

	aCollection ifNotEmpty: [ 
		self assert: aCollection size = 1.
		self assert: aCollection isNotNil.
		resolving candidate: aCollection first ]
]

{ #category : #'as yet unclassified' }
MOModelTypeLinker >> resolveWellKnown [
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
MOModelTypeLinker >> typeHasBeenResolved [
	^ resolving candidate isNotNil 
]

{ #category : #'as yet unclassified' }
MOModelTypeLinker >> unknownType [
	^ model unknownType 
]

{ #category : #visiting }
MOModelTypeLinker >> visitAnnotation: aMOAnnotationInstance [

	aMOAnnotationInstance parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeLinker >> visitAttribute: aMOAttribute [

	^ aMOAttribute parent acceptVisitor: self
]

{ #category : #visiting }
MOModelTypeLinker >> visitClass: aMOClass [

	| possible |
	possible := aMOClass imports select: [ :im | 
		            im resolvesType: resolving name ].

	self registerPossibles:
		(possible collect: [ :i | i typeNamed: resolving name ]).

	self typeHasBeenResolved ifFalse: [ 
		aMOClass parent acceptVisitor: self ]
]

{ #category : #visiting }
MOModelTypeLinker >> visitPackageReference: aMOPackageReference [

	self assert: aMOPackageReference candidate isNotNil.
	self lookIntoPackage: aMOPackageReference candidate.
	self typeHasBeenResolved ifTrue: [ ^ self ].

	aMOPackageReference parent ifNotNil: [ :p | p acceptVisitor: self ]
]

{ #category : #visiting }
MOModelTypeLinker >> visitTypeReference: aMOTypeReference [

	aMOTypeReference candidate ifNotNil: [ ^ self ].
	aMOTypeReference parent acceptVisitor: self.
	
]
