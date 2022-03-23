Class {
	#name : #MOModelAccessReader,
	#superclass : #MOModelReader,
	#category : #'Moxing-Alce'
}

{ #category : #accessing }
MOModelAccessReader >> read: anEntity [

	read := writer shallowCopy: anEntity.
	^ read
]
