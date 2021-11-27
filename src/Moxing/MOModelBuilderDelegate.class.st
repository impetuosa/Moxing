Class {
	#name : #MOModelBuilderDelegate,
	#superclass : #Object,
	#instVars : [
		'parentBuilder',
		'baseAnchor'
	],
	#category : #'Moxing-MicroBuilders'
}

{ #category : #accessing }
MOModelBuilderDelegate >> afteBuild: aBuild [
	^ aBuild 
]

{ #category : #accessing }
MOModelBuilderDelegate >> baseAnchor: anAnchor [

	baseAnchor := anAnchor
]

{ #category : #accessing }
MOModelBuilderDelegate >> build [

	^ self afteBuild: self privateBuild
]

{ #category : #accessing }
MOModelBuilderDelegate >> classBuilder [
	^ parentBuilder classBuilder
]

{ #category : #'instance creation' }
MOModelBuilderDelegate >> instantiate: aClass [

	^ parentBuilder instantiate: aClass
]

{ #category : #testing }
MOModelBuilderDelegate >> isReference: aMOModelBuilder [ 
	^ aMOModelBuilder isKindOf: MOReference 
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
MOModelBuilderDelegate >> parentBuilder: aParentBuilder [ 
	parentBuilder := aParentBuilder 
]

{ #category : #accessing }
MOModelBuilderDelegate >> privateBuild [
	self subclassResponsibility 
]

{ #category : #accessing }
MOModelBuilderDelegate >> typeReferenceBuilder [
	^ parentBuilder typeReferenceBuilder
]

{ #category : #'as yet unclassified' }
MOModelBuilderDelegate >> variableReferenceBuilder [
	^ parentBuilder variableReferenceBuilder 
]
