Class {
	#name : #MOModelTypescriptClassBuilder,
	#superclass : #MOModelClassBuilder,
	#category : #'Moxing-MicroBuilders-types'
}

{ #category : #adding }
MOModelTypescriptClassBuilder >> addDecorator: aMODecorator [

	^ self decorators add: aMODecorator
]

{ #category : #asserting }
MOModelTypescriptClassBuilder >> buildsType [

	^ MOTypescriptClass
]

{ #category : #accessing }
MOModelTypescriptClassBuilder >> decorators [

	^ decorators ifNil: [ decorators := OrderedCollection new ]
]

{ #category : #asserting }
MOModelTypescriptClassBuilder >> loadBuilderWithEntity: anEntity [

	super loadBuilderWithEntity: anEntity.
	self decorators: anEntity decorators
]

{ #category : #asserting }
MOModelTypescriptClassBuilder >> privateBuild [

	^ super privateBuild
		  decorators: self decorators;
		  yourself
]
