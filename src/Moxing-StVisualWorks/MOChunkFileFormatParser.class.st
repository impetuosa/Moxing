Class {
	#name : #MOChunkFileFormatParser,
	#superclass : #ChunkFileFormatParser,
	#category : #'Moxing-StVisualWorks-chunk importer'
}

{ #category : #parsing }
MOChunkFileFormatParser >> parseClassOrganization: classOrganizationPreamble [
	"The comment preable is an array with the following structure:
	If instance side method:
	#(#CodeImportTestCaseTestClass #reorganize)
	
	if class side:
	
	#(#CodeImportTestCaseTestClass #class #reorganize)
	"

	| behaviorName isMeta |
	self halt.
	behaviorName := classOrganizationPreamble first.
	isMeta := classOrganizationPreamble second ~= self reorganizeSelector.
	self
		addDeclaration:
			(self classOrganisationChunkClass
				contents: readStream next
				behaviorName: behaviorName
				isMeta: isMeta)
]

{ #category : #parsing }
MOChunkFileFormatParser >> parseCommentDeclaration: commentPreamble [
	"The comment preable is an array with the following structure:
	If instance side method:
	#(#CodeImportTestCaseTestClass #commentStamp: '<historical>' #prior: 0)
	
	if class side:
	
	#(#CodeImportTestCaseTestClass #class #commentStamp: '<historical>' #prior: 0)
	allButFirst:
	"
	| behaviorName isMeta stamp |
	self halt. 
	self asCollectionElement.
	behaviorName := commentPreamble first asSymbol.
	isMeta := commentPreamble second ~= self commentStampSelector.
	stamp := isMeta
		ifTrue: [ commentPreamble at: 4 ]
		ifFalse: [ commentPreamble at: 3 ].
	self
		addDeclaration:
			(self classCommentChunkClass
				contents: readStream next
				behaviorName: behaviorName
				isMeta: isMeta
				stamp: stamp)
]

{ #category : #parsing }
MOChunkFileFormatParser >> parseMethodDeclarations: methodsPreamble [

	| packageName behaviorName isMeta category stamp methodSource |
	"The method preable is an array with the following structure:
	If instance side method:
	
	#(#CodeImportTestCaseTestClass #methodsFor: 'some protocol' #stamp: 'GuillermoPolito 5/2/2012 13:35')
	
	if class side:
	
	#(#CodeImportTestCaseTestClass #class #methodsFor: 'some protocol' #stamp: 'GuillermoPolito 5/2/2012 13:35')
	
	Sometimes there is no timestamp:
	
	#(#CodeImportTestCaseTestClass #methodsFor: 'some protocol')
	
	"
	methodsPreamble second = '.' ifFalse: [ 
		^ super parseMethodDeclarations: methodsPreamble ].

	packageName := methodsPreamble first.

	behaviorName := methodsPreamble third.
	isMeta := methodsPreamble fourth = self classSelector or: [ 
		          methodsPreamble fourth = self classTraitSelector ].
	category := isMeta
		            ifTrue: [ methodsPreamble sixth ]
		            ifFalse: [ methodsPreamble fifth ].
	stamp := ''.
	methodsPreamble size > 6 ifTrue: [ 
		stamp := isMeta
			         ifTrue: [ methodsPreamble at: 8 ]
			         ifFalse: [ methodsPreamble at: 7 ] ].
	[ 
	methodSource := readStream next.
	methodSource notEmpty ] whileTrue: [ 
		self addDeclaration: (self methodChunkClass
				 contents: methodSource
				 packageName: packageName
				 behaviorName: behaviorName asSymbol
				 isMeta: isMeta
				 category: category
				 stamp: stamp) ]
]

{ #category : #parsing }
MOChunkFileFormatParser >> parseNextDeclaration [
	| isMetadata nextChunk |
	readStream skipSeparators.
	readStream isNextStyleChunk
		ifTrue:
			[ 
			self addDeclaration: (self styleChunkClass contents: readStream readUpToEndOfStyleChunk).
			^ self ].
	isMetadata := readStream isNextChunkMetaData.
	nextChunk := readStream next.
	isMetadata
		ifFalse: [ self addDeclaration: (self doItChunkClass contents: nextChunk) ]
		ifTrue:
			[ 
			| substrings |

			substrings := nextChunk parseLiterals.
			(substrings includes: self methodsForSelector asString)
				ifTrue: [ ^ self parseMethodDeclarations: substrings ].
			(substrings includes: self commentStampSelector asString)
				ifTrue: [ ^ self parseCommentDeclaration: substrings ].
			(substrings includes: self reorganizeSelector asString)
				ifTrue: [ ^ self parseClassOrganization: substrings ] ]
]
