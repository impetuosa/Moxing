Class {
	#name : #MOMethod,
	#superclass : #MOInvocable,
	#instVars : [
		'#selector => MOPropertySlot',
		'#returnTypeReference => MORefersSlot one',
		'#thrownTypeReferences => MORefersSlot many',
		'#annotationInstances => MORefersSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOMethod >> acceptVisitor: aJinInspectorBuilder [ 
		^ aJinInspectorBuilder visitMethod: self 
]

{ #category : #'as yet unclassified' }
MOMethod >> annotationInstances [

	^ annotationInstances
]

{ #category : #accessing }
MOMethod >> annotationInstances: aCollection [

	annotationInstances := aCollection
]

{ #category : #'as yet unclassified' }
MOMethod >> canBeReferredAsMethod [
	 ^ true
]

{ #category : #accessing }
MOMethod >> dependencies [

	^ super dependencies
	  ,
	  (returnTypeReference
		   ifNotNil: [ :t | t dependencies ]
		   ifNil: [ {  } ]) , (annotationInstances
		   ifNotNil: [ :t | annotationInstances flatCollect: #dependencies ]
		   ifNil: [ {  } ]) , block dependencies
]

{ #category : #accessing }
MOMethod >> isMethod [

	^ true
]

{ #category : #accessing }
MOMethod >> isSameEntity: anOther [

	^ (super isSameEntity: anOther) and: [ 
		  (self returnTypeReference isNil and: [ 
			   anOther returnTypeReference isNil ]) or: [ 
			  (self returnTypeReference isNotNil and: [ 
				   anOther returnTypeReference isNotNil ]) and: [ 
				  self returnTypeReference name = anOther returnTypeReference name ] ] ]
]

{ #category : #accessing }
MOMethod >> isStaticBinding [

	^ super isStaticBinding or: [ modifiers includes: #static ]
]

{ #category : #'as yet unclassified' }
MOMethod >> name [
	 ^ selector
]

{ #category : #'as yet unclassified' }
MOMethod >> name: aSelector [

 selector := aSelector 
]

{ #category : #accessing }
MOMethod >> printOn: aStream [

	aStream
		nextPutAll: self parentName;
		nextPutAll: '>>';
		nextPutAll: 'Method: ';
		nextPutAll: selector;
		nextPutAll: '/';
		nextPutAll: parameters size asString;
		nextPutAll: '=>'.

	returnTypeReference
		ifNil: [ aStream nextPutAll: 'UNKNOWN' ]
		ifNotNil: [ :t | returnTypeReference printOn: aStream ]
]

{ #category : #accessing }
MOMethod >> returnTypeReference [

	^ returnTypeReference
]

{ #category : #accessing }
MOMethod >> returnTypeReference: aMOTypeReference [ 
	returnTypeReference := aMOTypeReference
]

{ #category : #'as yet unclassified' }
MOMethod >> selector [

	^ selector
]

{ #category : #'as yet unclassified' }
MOMethod >> selector: aSelector [

	selector := aSelector
]

{ #category : #accessing }
MOMethod >> thrownTypeReferences [
	^ thrownTypeReferences
]

{ #category : #'as yet unclassified' }
MOMethod >> thrownTypeReferences: aCollection [

	thrownTypeReferences := aCollection
]
