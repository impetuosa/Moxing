Class {
	#name : #MOJinDAMTypeReferenceVisitor,
	#superclass : #MOTypeReferenceVisitor,
	#category : #'Moxing-Access'
}

{ #category : #visiting }
MOJinDAMTypeReferenceVisitor >> visitAccessModule: aJinDAMAccessModule [

	^ writer artefactReferenceNamed: aJinDAMAccessModule name
]

{ #category : #visiting }
MOJinDAMTypeReferenceVisitor >> visitAlias: aJinDAMAlias [ 
	^ writer typeReferenceNamed: aJinDAMAlias name
]

{ #category : #visiting }
MOJinDAMTypeReferenceVisitor >> visitAttribute: aJinDAMAttribute [ 
	self assert: aJinDAMAttribute name asLowercase = 'null'.
	^ writer primitiveTypeReferenceNamed: #null 
]

{ #category : #visiting }
MOJinDAMTypeReferenceVisitor >> visitClass: aJinDAMClass [

	^ writer typeReferenceNamed: aJinDAMClass name
]

{ #category : #visiting }
MOJinDAMTypeReferenceVisitor >> visitDBType: aJinDAMDBType [

	^ writer primitiveTypeReferenceNamed: aJinDAMDBType name
]

{ #category : #visiting }
MOJinDAMTypeReferenceVisitor >> visitEnum: aJinDAMEnum [

	^ writer typeReferenceNamed: aJinDAMEnum name
]

{ #category : #visiting }
MOJinDAMTypeReferenceVisitor >> visitForm: aJinDAMForm [

	^ writer typeReferenceNamed: aJinDAMForm name
]

{ #category : #visiting }
MOJinDAMTypeReferenceVisitor >> visitLibrary: aJinDAMLibrary [

	^ writer artefactReferenceNamed: aJinDAMLibrary name
]

{ #category : #visiting }
MOJinDAMTypeReferenceVisitor >> visitLibraryReference: aJinDAMLibraryReference [

	self assert: aJinDAMLibraryReference referee isArtefact.
	^ aJinDAMLibraryReference referee
		  ifNil: [ 
		  writer artefactReferenceNamed: aJinDAMLibraryReference name ]
		  ifNotNil: [ aJinDAMLibraryReference referee acceptVisitor: self ]
]

{ #category : #visiting }
MOJinDAMTypeReferenceVisitor >> visitMemberReference: aJinDAMMemberReference [

	aJinDAMMemberReference name = #ParamArray ifTrue: [ 
		writer mapsToVariableArguments.
		^ writer primitiveTypeReferenceNamed: #Variant ].

	^ writer typeReferenceNamed: aJinDAMMemberReference name
]

{ #category : #visiting }
MOJinDAMTypeReferenceVisitor >> visitModule: aJinDAMModule [ 

	^ writer typeReferenceNamed: aJinDAMModule name
]

{ #category : #visiting }
MOJinDAMTypeReferenceVisitor >> visitMultipleTypeReference: aJinDAMMultipleTypeReference [

	self assert: aJinDAMMultipleTypeReference referee isNil.
	^ writer typeReferenceNamed: aJinDAMMultipleTypeReference typeName
]

{ #category : #visiting }
MOJinDAMTypeReferenceVisitor >> visitPrimitiveType: aJinDAMPrimitiveType [ 
	^ writer primitiveTypeReferenceNamed: aJinDAMPrimitiveType name
]

{ #category : #visiting }
MOJinDAMTypeReferenceVisitor >> visitTypeReference: aJinDAMTypeReference [

	^ aJinDAMTypeReference candidate
		  ifNil: [ 
			  writer typeReferenceNamed: aJinDAMTypeReference typeName ]
		  ifNotNil: [ :candidate | candidate acceptVisitor: self ]
]

{ #category : #visiting }
MOJinDAMTypeReferenceVisitor >> visitUserType: aJinDAMUserType [ 
	
	^ writer typeReferenceNamed: aJinDAMUserType name
]
