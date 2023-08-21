"
I export a project updating.
I modify any preexisting project. 
"
Class {
	#name : #MOModelUpdateExporter,
	#superclass : #Object,
	#instVars : [
		'model',
		'entites'
	],
	#category : #'Moxing-Core'
}

{ #category : #actions }
MOModelUpdateExporter >> calculateEntities: aCollection [

	| produces workingOn |
	entites := OrderedCollection new.
	workingOn := aCollection flatCollect: [ :a | 
		             a containsSourceCodeEntities
			             ifTrue: [ a allContainments ]
			             ifFalse: [ { a } ] ].
	workingOn do: [ :a | 
		produces := a.
		[ 
		produces isModelOrDerivative or: [ produces producesParseableCode ] ] 
			whileFalse: [ produces := produces parent ].
		produces producesParseableCode ifTrue: [ entites add: produces ] ].
	entites := entites collect: [ :a | 
		           produces := a.
		           [ 
		           produces parent producesParseableCode and: [ 
			           produces parent fileReference = a fileReference ] ] 
			           whileTrue: [ produces := produces parent ].
		           produces ].
	entites removeDuplicates
]

{ #category : #'as yet unclassified' }
MOModelUpdateExporter >> doExportEntities [

	| codes fileRef |
	codes := entites collect: [ :a | model produceCode: a ].

	entites with: codes do: [ :entity :code | 
		fileRef := model resolveFileReferenceFor: entity.
		(self undoFile: fileRef) ensureDelete.
		(self redoFile: fileRef) ensureDelete.
		fileRef exists ifTrue: [ 
			fileRef copyTo: (self undoFile: fileRef).
			fileRef ensureDelete ].
		fileRef ensureCreateFile.
		fileRef writeStream
			nextPutAll: code;
			close ]
]

{ #category : #actions }
MOModelUpdateExporter >> export: aCollection [

	self calculateEntities: aCollection.
	self doExportEntities
]

{ #category : #accessing }
MOModelUpdateExporter >> model: aMOModelDerivative [ 
	model := aMOModelDerivative
]

{ #category : #'as yet unclassified' }
MOModelUpdateExporter >> redoFile: fileRef [

	^ fileRef parent / '.redo' , fileRef basenameWithoutExtension
	  , '.fylgja'
]

{ #category : #actions }
MOModelUpdateExporter >> undoExport: aCollection [

		| produces |
	entites := OrderedCollection new.

	aCollection do: [ :a | 
		produces := a.
		[ 
		produces isModelOrDerivative or: [ produces producesParseableCode ] ] 
			whileFalse: [ produces := produces parent ].
		produces producesParseableCode ifTrue: [ entites add: produces ] ].
	entites := entites collect: [ :a | 
		           produces := a.
		           [ 
		           produces parent producesParseableCode and: [ 
			           produces parent fileReference = a fileReference ] ] 
			           whileTrue: [ produces := produces parent ].
		           produces ].

	self undoExportEntities
]

{ #category : #'as yet unclassified' }
MOModelUpdateExporter >> undoExportEntities [

	| codes fileRef |
	self assert: (entites allSatisfy: [ :e | e fileReference isNotNil ]).
	codes := entites collect: [ :a | model produceCode: a ].

	entites with: codes do: [ :entity :code | 
		fileRef := model resolveFileReferenceFor: entity.
		(self undoFile: fileRef) exists ifTrue: [ 
			fileRef copyTo: (self redoFile: fileRef).
			fileRef ensureDelete.
			(self undoFile: fileRef) copyTo: fileRef.
			(self undoFile: fileRef) ensureDelete ] ]
]

{ #category : #'as yet unclassified' }
MOModelUpdateExporter >> undoFile: fileRef [

	^ fileRef parent / '.undo' , fileRef basenameWithoutExtension
	  , '.fylgja'
]
