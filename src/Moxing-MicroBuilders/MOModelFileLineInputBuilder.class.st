Class {
	#name : #MOModelFileLineInputBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'fileDescriptorReference',
		'inputReference'
	],
	#category : #'Moxing-MicroBuilders-statements'
}

{ #category : #'as yet unclassified' }
MOModelFileLineInputBuilder >> buildsType [

	^ MOAlceFileLineInput
]

{ #category : #accessing }
MOModelFileLineInputBuilder >> fileDescriptorReference [

	^ fileDescriptorReference
]

{ #category : #accessing }
MOModelFileLineInputBuilder >> fileDescriptorReference: anObject [

	fileDescriptorReference := anObject
]

{ #category : #accessing }
MOModelFileLineInputBuilder >> inputReference [

	^ inputReference
]

{ #category : #accessing }
MOModelFileLineInputBuilder >> inputReference: anObject [

	inputReference := anObject
]

{ #category : #accessing }
MOModelFileLineInputBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  fileDescriptorReference: self fileDescriptorReference;
		  inputReference: self inputReference;
		  yourself
]
