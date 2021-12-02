Class {
	#name : #MOTypescriptTypeReferenceLoader,
	#superclass : #MOTypescriptAbstractLoader,
	#category : #'Moxing-Typescript-Loader'
}

{ #category : #generated }
MOTypescriptTypeReferenceLoader >> loadArtefact: aJSTypeReferenceNode [

	^ aJSTypeReferenceNode
		  ifNil: [ self any ]
		  ifNotNil: [ aJSTypeReferenceNode acceptVisitor: self ]
]

{ #category : #generated }
MOTypescriptTypeReferenceLoader >> visitTypeReference: aRef [

	^ aRef typeArguments
		  ifNil: [ writer typeReferenceNamed: aRef type source ]
		  ifNotNil: [ 
			  writer
				  parametrizedTypeReferenceNamed: aRef type source
				  arguments: (self visitCollection: aRef typeArguments arguments) ]
]
