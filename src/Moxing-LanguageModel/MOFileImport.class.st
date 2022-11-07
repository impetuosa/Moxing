Class {
	#name : #MOFileImport,
	#superclass : #MOStatement,
	#instVars : [
		'#from => MOPropertySlot',
		'#typeReferences => MORefersSlot many'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #'as yet unclassified' }
MOFileImport >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitFileImport: self
]

{ #category : #'as yet unclassified' }
MOFileImport >> from [
	^ from
]

{ #category : #'as yet unclassified' }
MOFileImport >> from: aFileReference [
	(aFileReference isKindOf: FileReference)
		ifTrue: [ self halt ].
	from := aFileReference
]

{ #category : #'as yet unclassified' }
MOFileImport >> fromString [
	^ from ifNil: [ 'ERROR! FROM IS EMPTTY' ] ifNotNil: [ from ]
]

{ #category : #'as yet unclassified' }
MOFileImport >> printOn: aStream [
	aStream
		nextPutAll: ' import { ';
		nextPutAll: (',' join: (typeReferences collect: [ :t | t name ]));
		nextPutAll: ' } from ';
		nextPutAll: self fromString
]

{ #category : #accessing }
MOFileImport >> typeReferences: aCollection [ 
	typeReferences := aCollection
]
