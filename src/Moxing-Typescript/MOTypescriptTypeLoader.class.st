Class {
	#name : #MOTypescriptTypeLoader,
	#superclass : #MOTypescriptAbstractLoader,
	#category : #'Moxing-Typescript-Loader'
}

{ #category : #generated }
MOTypescriptTypeLoader >> any [ 
	^ self typeNamed: #any 
]

{ #category : #generated }
MOTypescriptTypeLoader >> typeNamed: aTypeName [

	^ result := types values
		          detect: [ :t | t name = aTypeName ]
		          ifNone: [ 
			          types
				          at: aTypeName
				          put:
					          ((MOTypescriptPrebuiltTypeReferenceFactory defaultFor:
						            model) typeReference: aTypeName) ]
]

{ #category : #generated }
MOTypescriptTypeLoader >> visitNameExpression: aName [
	self typeNamed: aName name value
]

{ #category : #generated }
MOTypescriptTypeLoader >> visitTypeReference: aReference [

	super visitTypeReference: aReference
]

{ #category : #generated }
MOTypescriptTypeLoader >> visitVoidType: aType [
	self typeNamed: #void
]

{ #category : #generated }
MOTypescriptTypeLoader >> void [ 
	^ self void
]
