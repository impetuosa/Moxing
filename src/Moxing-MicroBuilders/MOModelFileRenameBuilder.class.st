Class {
	#name : #MOModelFileRenameBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'oldNameReference',
		'newNameReference'
	],
	#category : #'Moxing-MicroBuilders-statements'
}

{ #category : #'as yet unclassified' }
MOModelFileRenameBuilder >> buildsType [

	^ MOAlceFileRename
]

{ #category : #accessing }
MOModelFileRenameBuilder >> newNameReference [

	^ newNameReference
]

{ #category : #accessing }
MOModelFileRenameBuilder >> newNameReference: anObject [

	newNameReference := anObject
]

{ #category : #accessing }
MOModelFileRenameBuilder >> oldNameReference [

	^ oldNameReference
]

{ #category : #accessing }
MOModelFileRenameBuilder >> oldNameReference: anObject [

	oldNameReference := anObject
]

{ #category : #accessing }
MOModelFileRenameBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  newNameReference: self newNameReference;
		  oldNameReference: self oldNameReference;
		  yourself
]
