Class {
	#name : #MOPermissiveConstraint,
	#superclass : #MOLanguageConstraint,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #testing }
MOPermissiveConstraint >> can: anObject beDescribedBy: anOtherObject with: aSlot [

	^ true
]

{ #category : #testing }
MOPermissiveConstraint >> can: anObject beParentedBy: anOtherObject with: aSlot [

	^ true
]

{ #category : #testing }
MOPermissiveConstraint >> can: anObject declare: anOtherObject with: aSlot [

	^ true
]

{ #category : #testing }
MOPermissiveConstraint >> can: anObject express: anOtherObject with: aSlot [

	^ true
]

{ #category : #testing }
MOPermissiveConstraint >> can: anObject refer: anOtherObject with: aSlot [

	^ true
]

{ #category : #testing }
MOPermissiveConstraint >> can: aMOBlock state: aMOStatementExpression with: aMOStatesSlot [

	^ true
]

{ #category : #testing }
MOPermissiveConstraint >> can: anObject useAsReferee: anOtherObject with: aSlot [

	^ true
]
