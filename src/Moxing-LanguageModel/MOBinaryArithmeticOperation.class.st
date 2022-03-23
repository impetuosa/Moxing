Class {
	#name : #MOBinaryArithmeticOperation,
	#superclass : #MOBinaryOperation,
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #accessing }
MOBinaryArithmeticOperation >> acceptVisitor: aMOModelWriteTypeBasedResolver [

	^ aMOModelWriteTypeBasedResolver visitBinaryArithmeticOperation: self
]

{ #category : #accessing }
MOBinaryArithmeticOperation >> kindOfOp [
	^ 'arithmetic'
]
