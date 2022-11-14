"
I build procedures. No returning value, only parameters. 
"
Class {
	#name : #MOModelProcedureBuilder,
	#superclass : #MOModelInvocableBuilder,
	#traits : 'MOManageBindingPolicy',
	#classTraits : 'MOManageBindingPolicy classTrait',
	#instVars : [
		'selector'
	],
	#category : #'Moxing-MicroBuilders-invocables'
}

{ #category : #'as yet unclassified' }
MOModelProcedureBuilder >> buildsType [

	<generated>
	^ MOProcedure
]

{ #category : #'as yet unclassified' }
MOModelProcedureBuilder >> loadBuilderWithEntity: anEntity [

	super loadBuilderWithEntity: anEntity.
	self bindingKind: anEntity bindingKind.
	self selector: anEntity selector
]

{ #category : #'as yet unclassified' }
MOModelProcedureBuilder >> privateBuild [

	^ super privateBuild
		  bindingKind: self bindingKind;
		  selector: self selector;
		  yourself
]

{ #category : #accessing }
MOModelProcedureBuilder >> selector [
	^ selector ifNil: [ self error: ' Selector is Nil ' ]
]

{ #category : #accessing }
MOModelProcedureBuilder >> selector: aString [ 
	selector := aString  
]

{ #category : #accessing }
MOModelProcedureBuilder >> setDefaultBinding [

	^ self setStaticBinding
]
