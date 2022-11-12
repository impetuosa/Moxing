Class {
	#name : #MOAlceReport,
	#superclass : #MOClass,
	#category : #'Moxing-Access-Declaration'
}

{ #category : #visiting }
MOAlceReport >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitReport: self
]

{ #category : #visiting }
MOAlceReport >> canBeReferredAsVariable [

	^ true
]

{ #category : #visiting }
MOAlceReport >> isWidget [ 
 	 ^ true 
]

{ #category : #visiting }
MOAlceReport >> object [

	^ self model objectsSelect: [ :a | 
		  a type class = MOAlceReport and: [ a type name = name ] ]
]

{ #category : #visiting }
MOAlceReport >> symbolicName [

	^ self name copyFrom: 'Report_' size + 1 to: name size
]
