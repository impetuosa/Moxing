Class {
	#name : #MOModule,
	#superclass : #MOLanguageObject,
	#instVars : [
		'#invocables => MOContainmentSlot many',
		'#variables => MOContainmentSlot many',
		'#constants => MOContainmentSlot many',
		'#types => MOContainmentSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOModule >> acceptVisitor: aMOModelWriteTypeBasedCopyResolver [

	^ aMOModelWriteTypeBasedCopyResolver visitModule: self
]

{ #category : #accessing }
MOModule >> canBeReferredAsType [
	 ^ true 
]

{ #category : #accessing }
MOModule >> constants [
	^ constants
]

{ #category : #accessing }
MOModule >> constants: aCollection [ 
	constants := aCollection
]

{ #category : #generated }
MOModule >> imports [
	^ {  }
]

{ #category : #adding }
MOModule >> initialize [

	super initialize.
	invocables := OrderedCollection new
]

{ #category : #accessing }
MOModule >> invocables [
	^ invocables
]

{ #category : #accessing }
MOModule >> invocables: aCollection [ 
	invocables := aCollection
]

{ #category : #accessing }
MOModule >> isDeclaration [

	^ true
]

{ #category : #testing }
MOModule >> isDefinedInLibrary [
	^ parent isDefinedInLibrary 
]

{ #category : #accessing }
MOModule >> packageReference: aMOPackageReference [ 

]

{ #category : #accessing }
MOModule >> printOn: aStream [

	aStream
		nextPutAll: 'module: ';
		nextPutAll:self name
]

{ #category : #accessing }
MOModule >> producesParseableCode [

	^ true
]

{ #category : #accessing }
MOModule >> types [
	^ types
]

{ #category : #accessing }
MOModule >> types: aCollection [

	types := aCollection
]

{ #category : #accessing }
MOModule >> variables [
	^ variables
]

{ #category : #accessing }
MOModule >> variables: aCollection [ 
	variables := aCollection
]
