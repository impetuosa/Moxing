Class {
	#name : #MOAngularJsSchema,
	#superclass : #MOAnchoredDeclaration,
	#instVars : [
		'#projects => MODeclaresSlot many',
		'#directory => MOPropertySlot',
		'#metadata => MOPropertySlot'
	],
	#category : #'Moxing-AngularJS-Declarations'
}

{ #category : #accessing }
MOAngularJsSchema >> acceptVisitor: aVisitor [

	^ aVisitor visitAngularJsSchema: self
]
