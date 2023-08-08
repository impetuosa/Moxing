Class {
	#name : #MOModelObjectBasedClassBuilder,
	#superclass : #MOModelClassTypeBuilder,
	#category : #'Moxing-Language-MicroBuilders-types'
}

{ #category : #adding }
MOModelObjectBasedClassBuilder >> addAttributeAccessor: aMOAccessor [

	self addMethod: aMOAccessor
]

{ #category : #adding }
MOModelObjectBasedClassBuilder >> addConstructor: aMOConstructor [

	self addMethod: aMOConstructor
]

{ #category : #'as yet unclassified' }
MOModelObjectBasedClassBuilder >> buildsType [

	<generated>
	^ MOObjectBasedClass
]
