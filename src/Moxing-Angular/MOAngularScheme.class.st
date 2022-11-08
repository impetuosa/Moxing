Class {
	#name : #MOAngularScheme,
	#superclass : #MOAnchoredDeclaration,
	#instVars : [
		'#projects => MODeclaresSlot many',
		'#metadata => MOPropertySlot'
	],
	#category : #'Moxing-Angular-Declaration'
}

{ #category : #'as yet unclassified' }
MOAngularScheme class >> onPath:  aFileReference [
 	 ^ self new anchor: aFileReference; yourself 
]

{ #category : #visiting }
MOAngularScheme >> acceptVisitor: aJinInspectorBuilder [ 
	^ aJinInspectorBuilder visitAngularScheme: self 
]

{ #category : #'as yet unclassified' }
MOAngularScheme >> defaultProject [

	^ self projects detect: [ :p | 
		  p name =( self metadata at: #defaultProject )]
]

{ #category : #accessing }
MOAngularScheme >> fileContents [

	^ self fileReference / 'angular.json' readStream upToEnd
]

{ #category : #accessing }
MOAngularScheme >> language [

	^ projects anyOne language
]

{ #category : #accessing }
MOAngularScheme >> language: aMOLanguage [ 

]

{ #category : #accessing }
MOAngularScheme >> metadata [

	metadata ifNotNil: [ ^ metadata ].

	(anchor / 'angular.json') exists ifFalse: [ 
		self error:
			' the path does not point to a valid angular project installation ' ].

	metadata := STONJSON fromStream: (anchor / 'angular.json') readStream.
	^ metadata
]

{ #category : #accessing }
MOAngularScheme >> metadata: aDict [ 

	metadata := aDict
]

{ #category : #accessing }
MOAngularScheme >> name [ 
	^ #scheme
]

{ #category : #accessing }
MOAngularScheme >> projects [

	^ projects
]

{ #category : #accessing }
MOAngularScheme >> projects: ps [

	 projects:= ps.   
]
