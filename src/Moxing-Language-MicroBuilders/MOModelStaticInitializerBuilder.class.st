Class {
	#name : #MOModelStaticInitializerBuilder,
	#superclass : #MOModelInvocableBuilder,
	#category : #'Moxing-Language-MicroBuilders-Invocables'
}

{ #category : #'as yet unclassified' }
MOModelStaticInitializerBuilder >> addModifier: aString [ 
	^ self error: 'Static initializer does not have modifiers '
]

{ #category : #'as yet unclassified' }
MOModelStaticInitializerBuilder >> addParameter: aString [ 
	^ self error: 'Static initializer does not have params '
]

{ #category : #'as yet unclassified' }
MOModelStaticInitializerBuilder >> addThrownTypeReference: aRef [
	 self error: ' Static initializer does not handle excpeitons .'
]

{ #category : #'as yet unclassified' }
MOModelStaticInitializerBuilder >> buildsType [

	^ MOStaticInitializer
]
