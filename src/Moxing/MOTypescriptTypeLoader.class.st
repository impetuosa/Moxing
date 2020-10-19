Class {
	#name : #MOTypescriptTypeLoader,
	#superclass : #MOTypescriptAbstractLoader,
	#category : #'Moxing-ModelReading'
}

{ #category : #generated }
MOTypescriptTypeLoader >> typeNamed: aTypeName [
	result := types values
		detect: [ :t | t name = aTypeName ]
		ifNone: [ types
				at: aTypeName
				put:
					(MOTypescriptPrebuiltTypeReferenceFactory default
						typeReference: aTypeName) ]
]

{ #category : #generated }
MOTypescriptTypeLoader >> visitNameExpression: aName [
	self typeNamed: aName name value
]

{ #category : #generated }
MOTypescriptTypeLoader >> visitTypeReference: aReference [
	self halt.
	result := MOTypescriptTypeReference new.
	super visitTypeReference: aReference
]

{ #category : #generated }
MOTypescriptTypeLoader >> visitVoidType: aType [
	self typeNamed: #void
]
