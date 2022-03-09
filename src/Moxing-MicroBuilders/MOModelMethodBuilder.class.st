"
I build methods
"
Class {
	#name : #MOModelMethodBuilder,
	#superclass : #MOModelFunctionBuilder,
	#category : #'Moxing-MicroBuilders-invocables'
}

{ #category : #'as yet unclassified' }
MOModelMethodBuilder >> buildsType [

	<generated>
	^ MOMethod
]

{ #category : #'as yet unclassified' }
MOModelMethodBuilder >> setDefaultBinding [

	self setDynamicBinding
]
