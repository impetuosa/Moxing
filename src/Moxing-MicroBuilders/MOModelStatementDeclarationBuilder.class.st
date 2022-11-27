Class {
	#name : #MOModelStatementDeclarationBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'declaration'
	],
	#category : #'Moxing-MicroBuilders-control flow'
}

{ #category : #'as yet unclassified' }
MOModelStatementDeclarationBuilder >> buildsType [

	^ MOStatementDeclaration
]

{ #category : #accessing }
MOModelStatementDeclarationBuilder >> declaration [

	^ declaration
]

{ #category : #accessing }
MOModelStatementDeclarationBuilder >> declaration: aDeclaration [

	declaration := aDeclaration
]

{ #category : #accessing }
MOModelStatementDeclarationBuilder >> loadBuilderWithEntity: anEntity [ 
	declaration := anEntity 
]

{ #category : #accessing }
MOModelStatementDeclarationBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  declaration: self declaration;
		  yourself
]
