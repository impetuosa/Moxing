Class {
	#name : #MOTypescriptBasicLanguageLoader,
	#superclass : #Object,
	#instVars : [
		'model',
		'typescript',
		'fileBase'
	],
	#category : #'Moxing-Typescript-Loader'
}

{ #category : #adding }
MOTypescriptBasicLanguageLoader >> addMethod: aSelector type: aReturningTType parameters: params into: aMOClass [ 

	| var param  |
	var := model instantiate: MOMethod .
	var selector: aSelector.
	aMOClass addMethod: var.
	var parent: aMOClass.
	var type:
		((MOTypescriptPrebuiltTypeReferenceFactory defaultFor: model) 
			 typeReference: aReturningTType).
	params do: [ : m |  
		param := model instantiate: MOVariable. 
		param parent: var.
		param name: m key. 
		var addParameter: param. 
		param parent: var. 
		param type: ((MOTypescriptPrebuiltTypeReferenceFactory defaultFor: model) 
			 typeReference: m value).
	 ]
]

{ #category : #adding }
MOTypescriptBasicLanguageLoader >> addProperty: aPropNAme type: aTypeName into: aMOClass [

	| var |
	var := model instantiate: MOVariable.
	var name: aPropNAme.
	aMOClass addProperty: var.
	var parent: aMOClass.
	var type:
		((MOTypescriptPrebuiltTypeReferenceFactory defaultFor: model) 
			 typeReference: aTypeName)
]

{ #category : #'as yet unclassified' }
MOTypescriptBasicLanguageLoader >> fileBase: aFileReference [ 
	fileBase :=  aFileReference 
]

{ #category : #accessing }
MOTypescriptBasicLanguageLoader >> load [

	typescript := model instantiate: MOPackage.
	typescript name: #typescript.
	typescript anchor: model anchor / #sdk / #typescript.
	self loadPrimitiveTypes. 
	self loadPrimitiveObjects .
	
]

{ #category : #'as yet unclassified' }
MOTypescriptBasicLanguageLoader >> loadPrimitiveObjects [
	self loadString.
	"self loadSymbol. "
]

{ #category : #'as yet unclassified' }
MOTypescriptBasicLanguageLoader >> loadPrimitiveTypes [

	self typeScriptBasicTypeNames do: [ :tn | 
		typescript addType: ((model instantiate: MOPrimitiveType)
				 name: tn;
				 yourself) ]
]

{ #category : #'as yet unclassified' }
MOTypescriptBasicLanguageLoader >> loadString [
	| string |
	string := model instantiate: MOClass.
	string anchor: typescript anchor / #classes / #string. 
	string name: #string. 
	typescript addType: string. 
	self addProperty: #length type:#number into: string. 
	self addMethod: #charAt type:#string parameters: { #index -> #number } into: string. 
	self addMethod: #charCodeAt type:#number parameters: { #index -> #number } into: string.
	self addMethod: #concat type:#string parameters: { #VarArg -> #number } into: string.
	self addMethod: #indexOf type:#string parameters: { (#search -> #string).  (#startingAt -> #number) } into: string.
	
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
