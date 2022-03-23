Class {
	#name : #MOUnaryArithmeticOperation,
	#superclass : #MOUnaryOperation,
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #accessing }
MOUnaryArithmeticOperation >> acceptVisitor: aMOModelWriteTypeBasedCopyResolver [

	^ aMOModelWriteTypeBasedCopyResolver visitUnaryArithmeticExpression: self
]
