Class {
	#name : #MOAngularScheme,
	#superclass : #MOAngularContainer,
	#instVars : [
		'projects',
		'metadata'
	],
	#category : #'Moxing-Angular-Model'
}

{ #category : #'as yet unclassified' }
MOAngularScheme class >> onPath:  aFileReference [
 	 ^ self new anchor: aFileReference; yourself 
]

{ #category : #visiting }
MOAngularScheme >> acceptVisitor: aJinInspectorBuilder [ 
	aJinInspectorBuilder visitAngularScheme: self 
]

{ #category : #'close and quit' }
MOAngularScheme >> closeAndQuit [
	" nothign to do yer "
]

{ #category : #'as yet unclassified' }
MOAngularScheme >> defaultProject [

	^ self projects detect: [ :p | 
		  p name =( self metadata at: #defaultProject )]
]

{ #category : #accessing }
MOAngularScheme >> metadata [

	metadata ifNotNil: [ ^ metadata ].

	(path / 'angular.json') exists ifFalse: [ 
		self error:
			' the path does not point to a valid angular project installation ' ].

	metadata := STONJSON fromStream: (path / 'angular.json') readStream.
	^ metadata
]

{ #category : #accessing }
MOAngularScheme >> projects [

	^ projects ifNil: [ 
		  projects :=( (self metadata at: #projects) associations collect: [  
			              :a | 
			              | instance projectMetadata |
								projectMetadata := a value. 
			              instance := MOAngularProject new.
							  instance name: a key. 
			              instance projectType:
				              (projectMetadata at: #projectType) asSymbol.
			              instance anchoredToUrlSegment:
				              (projectMetadata at: #root) asSymbol.
			              instance anchor:
				              anchor / (projectMetadata at: #sourceRoot).
				instance
						 ] )  ]
]
