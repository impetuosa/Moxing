Class {
	#name : #MOModelAssignmentBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'write',
		'read'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #building }
MOModelAssignmentBuilder >> build [

	^ (self instantiate: MOAssignment)
		  read: read;
		  write: write;
		  yourself
]

{ #category : #'meta-object-protocol' }
MOModelAssignmentBuilder >> read: aMOVariableReference [

	read := aMOVariableReference
]

{ #category : #writing }
MOModelAssignmentBuilder >> write: aMOVariableReference [ 
	write := aMOVariableReference 
]