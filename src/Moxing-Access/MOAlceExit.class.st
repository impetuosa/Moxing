Class {
	#name : #MOAlceExit,
	#superclass : #MOStatement,
	#category : #'Moxing-Access-Statements'
}

{ #category : #accessing }
MOAlceExit >> acceptVisitor: aMOTransformationApplier [

	^ aMOTransformationApplier visitExit: self
]

{ #category : #accessing }
MOAlceExit >> invocableKind [

	| invocable |
	invocable := self parent.
	[ invocable isKindOf: MOInvocable ] whileFalse: [ 
		invocable := invocable parent ].
	^ invocable class
]
