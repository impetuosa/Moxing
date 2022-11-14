Class {
	#name : #MOVariableAccessor,
	#superclass : #MOFunction,
	#instVars : [
		'#kind => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #printing }
MOVariableAccessor >> acceptVisitor: aVisitor [

	^ aVisitor visitVariableAccessor: self
]

{ #category : #accessing }
MOVariableAccessor >> canBeReferredAsFunction [
	^ true
]

{ #category : #accessing }
MOVariableAccessor >> kind [
	^ kind
]

{ #category : #accessing }
MOVariableAccessor >> kind: aString [

	kind := aString 
]

{ #category : #printing }
MOVariableAccessor >> printOn: aStream [

	aStream
		nextPutAll: 'Variable Accessor: ';
		nextPutAll: selector;
		nextPutAll: '/';
		nextPutAll: parameters size asString.

	returnTypeReference
		ifNil: [ aStream nextPutAll: 'UNKNOWN' ]
		ifNotNil: [ :t | returnTypeReference printOn: aStream ]
]
