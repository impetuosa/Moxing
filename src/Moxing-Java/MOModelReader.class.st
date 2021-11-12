Class {
	#name : #MOModelReader,
	#superclass : #Object,
	#instVars : [
		'mapper',
		'model',
		'context'
	],
	#category : #'Moxing-Java-Writer'
}

{ #category : #accessing }
MOModelReader >> mapper: aMOMapper [
	mapper := aMOMapper 
]

{ #category : #'as yet unclassified' }
MOModelReader >> read: anAlcixFunction [ 
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
MOModelReader >> read: anAlcixFunction context: aMOClass of: aMOModel [
	model := aMOModel derivative.
	mapper
		destinationContext: aMOClass;
		destinationModel: aMOModel.
	^ self read: anAlcixFunction
]
