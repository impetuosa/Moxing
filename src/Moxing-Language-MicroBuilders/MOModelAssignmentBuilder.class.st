"
I build assignments. 
I require a reading and a writing part. 
writing <- reading. 

"
Class {
	#name : #MOModelAssignmentBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'write',
		'read'
	],
	#category : #'Moxing-Language-MicroBuilders-statements'
}

{ #category : #'as yet unclassified' }
MOModelAssignmentBuilder >> buildsType [
<generated>
	^MOAssignment
]

{ #category : #'as yet unclassified' }
MOModelAssignmentBuilder >> loadBuilderWithEntity: anEntity [ 
	self read: anEntity read. 
 self write: anEntity write. 
 
	
]

{ #category : #'as yet unclassified' }
MOModelAssignmentBuilder >> modelCopyHelper [
	^ MOModelCopyAssignmentBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'as yet unclassified' }
MOModelAssignmentBuilder >> privateBuild [

	^ (self instantiate: MOAssignment)
		  read: read;
		  write: write;
		  yourself
]

{ #category : #accessing }
MOModelAssignmentBuilder >> read [
	^ read
]

{ #category : #'meta-object-protocol' }
MOModelAssignmentBuilder >> read: aMOVariableReference [

	read := aMOVariableReference
]

{ #category : #accessing }
MOModelAssignmentBuilder >> write [
	^ write
]

{ #category : #writing }
MOModelAssignmentBuilder >> write: aMOVariableReference [ 
	write := aMOVariableReference 
]
