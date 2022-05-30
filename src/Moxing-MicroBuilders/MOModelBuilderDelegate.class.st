"
A builder delegate is a builder with a parent. 
The parent is normally the one in charge of providing a model where to instantiate the different objects. 
I require the implementation of 
  privateBuild (method that builds the required element). 
     privateBuild MUST use instantiate: to create the new object. This allows not only the creation of new elements but also the updating. 
  loadBuilderWithEntity: 
    this method must configurate the builder with the elements of an entity. This is required in the context of updating an existing element. 

"
Class {
	#name : #MOModelBuilderDelegate,
	#superclass : #Object,
	#instVars : [
		'parentBuilder',
		'baseAnchor',
		'isUpdating',
		'updatingEntity'
	],
	#category : #'Moxing-MicroBuilders-core'
}

{ #category : #accessing }
MOModelBuilderDelegate >> afteBuild: aBuild [
	^ aBuild 
]

{ #category : #accessing }
MOModelBuilderDelegate >> baseAnchor [

	^ baseAnchor
]

{ #category : #accessing }
MOModelBuilderDelegate >> baseAnchor: anAnchor [

	baseAnchor := anAnchor
]

{ #category : #accessing }
MOModelBuilderDelegate >> build [

	^ self afteBuild: self privateBuild
]

{ #category : #'as yet unclassified' }
MOModelBuilderDelegate >> buildsType [

	^ self subclassResponsibility
]

{ #category : #accessing }
MOModelBuilderDelegate >> classBuilder [
	^ parentBuilder classBuilder
]

{ #category : #'as yet unclassified' }
MOModelBuilderDelegate >> contextReferenceBuilder [
	^ parentBuilder contextReferenceBuilder 
]

{ #category : #'as yet unclassified' }
MOModelBuilderDelegate >> contextleReferenceBuilder [
	^ parentBuilder contextReferenceBuilder 
]

{ #category : #accessing }
MOModelBuilderDelegate >> fileReference: anUndefinedObject [

	self assert: anUndefinedObject isNil
]

{ #category : #'as yet unclassified' }
MOModelBuilderDelegate >> findInModel: aFullBlockClosure ifNone: aFullBlockClosure2 [

	^ parentBuilder
		  findInModel: aFullBlockClosure
		  ifNone: aFullBlockClosure2
]

{ #category : #'as yet unclassified' }
MOModelBuilderDelegate >> forUpdate: anEntity [

	isUpdating := true.
	updatingEntity := anEntity.
	self loadBuilderWithEntity: updatingEntity
]

{ #category : #'instance creation' }
MOModelBuilderDelegate >> instantiate: aClass [

	self isUpdating ifTrue: [ 
		self assert: updatingEntity class = self buildsType.
		^ updatingEntity ].
	^ parentBuilder instantiate: aClass
]

{ #category : #'instance creation' }
MOModelBuilderDelegate >> instantiateSubClass: aClass [
	
	^ parentBuilder instantiate: aClass
]

{ #category : #testing }
MOModelBuilderDelegate >> isReference: aMOModelBuilder [ 
	^ aMOModelBuilder isKindOf: MOReference 
]

{ #category : #'as yet unclassified' }
MOModelBuilderDelegate >> isUpdating [

	^ isUpdating ifNil: [ false ]
]

{ #category : #accessing }
MOModelBuilderDelegate >> isUpdating: anObject [

	isUpdating := anObject
]

{ #category : #accessing }
MOModelBuilderDelegate >> loadBuilderWithEntity: anEntity [ 
	self subclassResponsibility 
]

{ #category : #copying }
MOModelBuilderDelegate >> modelCopyHelper [

	^ parentBuilder modelCopyHelper
]

{ #category : #accessing }
MOModelBuilderDelegate >> name: aString [ 

]

{ #category : #accessing }
MOModelBuilderDelegate >> packageBuilder [ 
	^ parentBuilder packageBuilder
]

{ #category : #accessing }
MOModelBuilderDelegate >> packageReferenceBuilder [ 
	^ parentBuilder packageReferenceBuilder
]

{ #category : #accessing }
MOModelBuilderDelegate >> parentBuilder [

	^ parentBuilder
]

{ #category : #accessing }
MOModelBuilderDelegate >> parentBuilder: aParentBuilder [ 
	parentBuilder := aParentBuilder 
]

{ #category : #accessing }
MOModelBuilderDelegate >> privateBuild [

	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
MOModelBuilderDelegate >> referenceToSelf [

	^ self contextReferenceBuilder
		  forSelf;
		  build
]

{ #category : #'as yet unclassified' }
MOModelBuilderDelegate >> referenceToThisContext [

	^ self contextReferenceBuilder
		  forThisContext;
		  build
]

{ #category : #'as yet unclassified' }
MOModelBuilderDelegate >> shallowCopy: aMOBlock [

	^ parentBuilder shallowCopy: aMOBlock
]

{ #category : #'as yet unclassified' }
MOModelBuilderDelegate >> shallowRelationCopy: aMOBlock [

	^ parentBuilder shallowRelationCopy: aMOBlock
]

{ #category : #accessing }
MOModelBuilderDelegate >> typeReferenceBuilder [
	^ parentBuilder typeReferenceBuilder
]

{ #category : #accessing }
MOModelBuilderDelegate >> updatingEntity [

	^ updatingEntity
]

{ #category : #accessing }
MOModelBuilderDelegate >> updatingEntity: anObject [

	updatingEntity := anObject
]

{ #category : #'as yet unclassified' }
MOModelBuilderDelegate >> variableReferenceBuilder [
	^ parentBuilder variableReferenceBuilder 
]
