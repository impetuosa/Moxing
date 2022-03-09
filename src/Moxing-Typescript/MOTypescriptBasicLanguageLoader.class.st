Class {
	#name : #MOTypescriptBasicLanguageLoader,
	#superclass : #Object,
	#instVars : [
		'model',
		'typescript',
		'fileBase',
		'writer'
	],
	#category : #'Moxing-Typescript-Loader'
}

{ #category : #adding }
MOTypescriptBasicLanguageLoader >> addMethod: aSelector type: aReturningTType parameters: params into: aClassWriter [

	aClassWriter writeMethod: [ :method | 
		method selector: aSelector.
		method returnTypeReference:
			(aClassWriter typeReferenceNamed: aReturningTType).

		params do: [ :nameTypeAssoc | 
			method writeParameter: [ :param | 
				param name: nameTypeAssoc key.
				param typeReference:
					(aClassWriter typeReferenceNamed: nameTypeAssoc value) ] ] ]
]

{ #category : #adding }
MOTypescriptBasicLanguageLoader >> addProperty: aPropNAme type: aTypeName into: aMOClass [

	| var |
	var := model instantiate: MOLocalVariable.
	var name: aPropNAme.
	aMOClass addProperty: var.
	var parent: aMOClass.
	var typeReference:
		((MOTypescriptPrebuiltTypeReferenceFactory defaultFor: model) 
			 typeReference: aTypeName)
]

{ #category : #'as yet unclassified' }
MOTypescriptBasicLanguageLoader >> fileBase: aFileReference [ 
	fileBase :=  aFileReference 
]

{ #category : #accessing }
MOTypescriptBasicLanguageLoader >> load [

	typescript := model writer writePackage: [ :package | 
		              package name: #typescript.
		              package anchor: model anchor / #sdk / #typescript.
		              self use: package during: [ 
			              self loadPrimitiveTypes.
			              self loadPrimitiveObjects ] ]
]

{ #category : #'as yet unclassified' }
MOTypescriptBasicLanguageLoader >> loadPrimitiveObjects [
	self loadString.

]

{ #category : #'as yet unclassified' }
MOTypescriptBasicLanguageLoader >> loadPrimitiveTypes [

	self typeScriptBasicTypeNames do: [ :tn | 
		writer writePrimitiveType: [ :pt | pt name: tn ] ]
]

{ #category : #'as yet unclassified' }
MOTypescriptBasicLanguageLoader >> loadString [

	|  loadedClass |

	loadedClass := writer writeClass: [ :string | 
		               string name: #string.
		               string writeAttribute: [ :length | 
			               length name: #length.
			               length typeReference:
				               (string typeReferenceNamed: #number) ].
		               self
			               addMethod: #charAt
			               type: #string
			               parameters: { (#index -> #number) }
			               into: string.
		               self
			               addMethod: #charCodeAt
			               type: #number
			               parameters: { (#index -> #number) }
			               into: string.
		               self
			               addMethod: #concat
			               type: #string
			               parameters: { (#VarArg -> #number) }
			               into: string.
		               self
			               addMethod: #indexOf
			               type: #string
			               parameters: { 
					               (#search -> #string).
					               (#startingAt -> #number) }
			               into: string ]
]

{ #category : #accessing }
MOTypescriptBasicLanguageLoader >> model: aModel [
	model := aModel 
]

{ #category : #'as yet unclassified' }
MOTypescriptBasicLanguageLoader >> typeScriptBasicTypeNames [

	^ #( boolean number tuple enum unknown any void null undefined
	     never object bigint )
]

{ #category : #evaluating }
MOTypescriptBasicLanguageLoader >> use: aWriter during: aBlock [

	| prev |
	prev := writer.
	writer := aWriter.
	^ aBlock ensure: [ writer := prev ]
]
