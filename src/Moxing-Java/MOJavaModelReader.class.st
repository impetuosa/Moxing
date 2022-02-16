Class {
	#name : #MOJavaModelReader,
	#superclass : #MOModelReader,
	#category : #'Moxing-Java-Writer'
}

{ #category : #'meta-object-protocol' }
MOJavaModelReader >> read: anEntity [

	read := writer shallowCopy: anEntity.
	^ read
]
