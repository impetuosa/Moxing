Class {
	#name : #MOModelAngularModuleBuilder,
	#superclass : #MOModelPackageBuilder,
	#category : #'Moxing-Angular-Building'
}

{ #category : #adding }
MOModelAngularModuleBuilder >> addAngularComponent: aMOAngularComponent [

	self addType: aMOAngularComponent
]

{ #category : #'as yet unclassified' }
MOModelAngularModuleBuilder >> buildsType [

	^ MOAngularModule
]
