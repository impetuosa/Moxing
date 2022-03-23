Class {
	#name : #MOClassFunction,
	#superclass : #MOFunction,
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOClassFunction >> acceptVisitor: aVisitor [

	^ aVisitor visitClassFunction: self
]

{ #category : #visiting }
MOClassFunction >> canBeReferredAsFunction [
	 ^ false 
]

{ #category : #visiting }
MOClassFunction >> canBeReferredAsMethod [
	 ^ true
]

{ #category : #visiting }
MOClassFunction >> printOn: aStream [

	aStream
		nextPutAll: 'Class Function: ';
		nextPutAll: selector;
		nextPutAll: '/';
		nextPutAll: parameters size asString.

	returnTypeReference
		ifNil: [ aStream nextPutAll: 'UNKNOWN' ]
		ifNotNil: [ :t | returnTypeReference printOn: aStream ]
]
