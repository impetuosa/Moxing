Class {
	#name : #MOInvocation,
	#superclass : #MOTypedReference,
	#instVars : [
		'#selector => MOPropertySlot',
		'#arguments => MOExpressionSlot many'
	],
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #accessing }
MOInvocation >> acceptVisitor: aMOTransformationApplier [

	^ aMOTransformationApplier visitInvocation: self
]

{ #category : #accessing }
MOInvocation >> arguments [
	^ arguments ifNil: [  arguments := OrderedCollection new ]
]

{ #category : #'as yet unclassified' }
MOInvocation >> arguments: aCollection [ 
	arguments := aCollection
]

{ #category : #initialization }
MOInvocation >> initialize [

	super initialize.
]

{ #category : #accessing }
MOInvocation >> isInvocation [
	^ true 
]

{ #category : #accessing }
MOInvocation >> name [

	^ selector
]

{ #category : #accessing }
MOInvocation >> printOn: aStream [

	aStream
		nextPutAll: 'CALL ';
		nextPutAll: selector;
		nextPutAll: '\';
		nextPutAll: arguments size asString
]

{ #category : #'as yet unclassified' }
MOInvocation >> refersToObjectsLike: aMOFunction [

	^ aMOFunction ifNil: [ true ] ifNotNil: [ 
		  { 
			  MOVariableAccessor.
			  MOFunction.
			  MOProcedure } includes: aMOFunction species ]
]

{ #category : #accessing }
MOInvocation >> selector [
	^ selector
]

{ #category : #accessing }
MOInvocation >> selector: aString [ 
	selector := aString
]
