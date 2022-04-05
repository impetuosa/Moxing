"
I build references to special variables such as this, self, super, me, etc. 
"
Class {
	#name : #MOModelContextReferenceBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'selectedKind'
	],
	#category : #'Moxing-MicroBuilders-variable-reference'
}

{ #category : #accessing }
MOModelContextReferenceBuilder >> forSelf [

	selectedKind := MOSelfReference
]

{ #category : #'as yet unclassified' }
MOModelContextReferenceBuilder >> forSuper [
		selectedKind := MOSuperReference  
]

{ #category : #'as yet unclassified' }
MOModelContextReferenceBuilder >> forThisContext [

	selectedKind := MOThisContextReference
]

{ #category : #accessing }
MOModelContextReferenceBuilder >> privateBuild [

	^ self instantiate: self selectedKind 
]

{ #category : #accessing }
MOModelContextReferenceBuilder >> selectedKind [

	^ selectedKind ifNil: [ self error: 'a kind of contextual refernece must be provided (self, super, thisContext ) ' ]
]
