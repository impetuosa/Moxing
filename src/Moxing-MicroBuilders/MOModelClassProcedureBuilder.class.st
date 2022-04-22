Class {
	#name : #MOModelClassProcedureBuilder,
	#superclass : #MOModelProcedureBuilder,
	#category : #'Moxing-MicroBuilders-invocables'
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
