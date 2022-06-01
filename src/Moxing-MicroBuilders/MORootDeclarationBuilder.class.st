Class {
	#name : #MORootDeclarationBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'pacakages',
		'packages'
	],
	#category : #'Moxing-MicroBuilders-project'
}

{ #category : #'as yet unclassified' }
MORootDeclarationBuilder >> buildsType [

	^ MORootDeclaration
]

{ #category : #accessing }
MORootDeclarationBuilder >> loadBuilderWithEntity: anEntity [

	self packages: anEntity packages
]

{ #category : #'as yet unclassified' }
MORootDeclarationBuilder >> packages [
	^ packages
	
]

{ #category : #'as yet unclassified' }
MORootDeclarationBuilder >> packages: sp [

	packages := sp
]

{ #category : #'as yet unclassified' }
MORootDeclarationBuilder >> privateBuild [

	self
		assert: isUpdating
		description:
		' RootDeclaration cannot be created with a builder or writer. only modiffied'.

	^ updatingEntity
		  packages: self packages;
		  yourself
]
