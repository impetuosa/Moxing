Class {
	#name : #MOAttributeAccessor,
	#superclass : #MOMethod,
	#instVars : [
		'#kind => MOPropertySlot'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOAttributeAccessor >> acceptVisitor: aJinInspectorBuilder [ 
		^ aJinInspectorBuilder visitAccessor: self 
]

{ #category : #accessing }
MOAttributeAccessor >> canBeReferredAsMethod [
	 ^ true
]

{ #category : #testing }
MOAttributeAccessor >> canBeReferredAsType [

	^ true
]

{ #category : #accessing }
MOAttributeAccessor >> kind [
	^ kind
]

{ #category : #accessing }
MOAttributeAccessor >> kind: aString [ 
	kind := aString
]

{ #category : #accessing }
MOAttributeAccessor >> printOn: aStream [

	aStream
		nextPutAll: 'Attribute Accessor: ';
		nextPutAll: selector;
		nextPutAll: '/';
		nextPutAll: parameters size asString;
		nextPutAll: '=>'.

	returnTypeReference
		ifNil: [ aStream nextPutAll: 'UNKNOWN' ]
		ifNotNil: [ :t | returnTypeReference printOn: aStream ]
]
