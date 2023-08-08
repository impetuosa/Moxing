Class {
	#name : #MOModelClassFunctionBuilder,
	#superclass : #MOModelFunctionBuilder,
	#category : #'Moxing-Language-MicroBuilders-invocables'
}

{ #category : #asserting }
MOModelClassFunctionBuilder >> buildsType [

	^ MOClassFunction
]

{ #category : #asserting }
MOModelClassFunctionBuilder >> setDefaultBinding [

	self setDynamicBinding
]
