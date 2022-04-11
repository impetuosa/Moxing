Class {
	#name : #MOMethod,
	#superclass : #MOInvocable,
	#instVars : [
		'#selector => MOPropertySlot',
		'#returnTypeReference => MOReferenceSlot one',
		'#thrownTypeReferences => MOReferenceSlot many',
		'#annotationInstances => MOReferenceSlot many'
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
