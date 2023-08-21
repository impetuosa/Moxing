Class {
	#name : #MOModelClassProcedureBuilder,
	#superclass : #MOModelProcedureBuilder,
	#category : #'Moxing-Language-MicroBuilders-Invocables'
}

{ #category : #asserting }
MOModelClassProcedureBuilder >> buildsType [

	<generated>
	^ MOClassProcedure
]

{ #category : #asserting }
MOModelClassProcedureBuilder >> setDefaultBinding [

	self setDynamicBinding
]
