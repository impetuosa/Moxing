Class {
	#name : #MOJavaModelWriter,
	#superclass : #MOModelWriter,
	#category : #'Moxing-Java-Writer'
}

{ #category : #writing }
MOJavaModelWriter >> write: aMOFunction [
	self assert: destinationModel isNotNil.
	self assert: replace isNotNil.
	^ brush write: aMOFunction into: self
]
