Class {
	#name : #MOJavaModelWriter,
	#superclass : #MOModelWriter,
	#category : #'Moxing-Java-Writer'
}

{ #category : #writing }
MOJavaModelWriter >> writeMethod: aMOMethod [

	surface addMethod: aMOMethod
]
