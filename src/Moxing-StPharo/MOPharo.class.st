Class {
	#name : #MOPharo,
	#superclass : #MOSmalltalk,
	#category : #'Moxing-StPharo-Language'
}

{ #category : #accessing }
MOPharo >> expressionTypeResolvingStrategy [

	^ MOPhExpressionTypeResolver
]

{ #category : #accessing }
MOPharo >> isPharo [

	^ true
]

{ #category : #accessing }
MOPharo >> link: aMOModelDerivative [
""
]

{ #category : #accessing }
MOPharo >> name [

	^ #Pharo
]

{ #category : #accessing }
MOPharo >> newCodeTextWriter [

	^ MOPharoCodeGenerator new
]

{ #category : #accessing }
MOPharo >> parser [

	^ StParser 
	
]
