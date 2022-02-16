"
I do write decorators! typescript style 
"
Class {
	#name : #MODecoratorWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MODecoratorWriter >> initializeWriteBuilder [
	writeBuilder := builder decoratorBuilder
]

{ #category : #accessing }
MODecoratorWriter >> name: aString [ 

	writeBuilder name: aString
]

{ #category : #initialization }
MODecoratorWriter >> privateSetAnchor: anEntity [ 
	anEntity anchor: surface anchor / #decorator / anEntity name
]

{ #category : #initialization }
MODecoratorWriter >> privateWriteToSurface: anEntity [

	surface setAsParentOf: anEntity.
	surface addDecorator: anEntity
]

{ #category : #'as yet unclassified' }
MODecoratorWriter >> property: aString value: aString2 [

	writeBuilder property: aString value: aString2
]
