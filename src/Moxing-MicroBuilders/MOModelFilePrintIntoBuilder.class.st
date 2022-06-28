Class {
	#name : #MOModelFilePrintIntoBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'fileDescriptorReference',
		'printingReferences'
	],
	#category : #'Moxing-MicroBuilders-statements'
}

{ #category : #asserting }
MOModelFilePrintIntoBuilder >> buildsType [

	^ MOAlceFilePrintInto
]

{ #category : #accessing }
MOModelFilePrintIntoBuilder >> fileDescriptorReference [

	^ fileDescriptorReference
]

{ #category : #accessing }
MOModelFilePrintIntoBuilder >> fileDescriptorReference: anObject [

	fileDescriptorReference := anObject
]

{ #category : #accessing }
MOModelFilePrintIntoBuilder >> printingReferences [

	^ printingReferences ifNil: [ 
		  printingReferences := OrderedCollection new ]
]

{ #category : #accessing }
MOModelFilePrintIntoBuilder >> printingReferences: anObject [

	printingReferences := anObject
]

{ #category : #asserting }
MOModelFilePrintIntoBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  fileDescriptorReference: self fileDescriptorReference;
		  printingReferences: self printingReferences;
		  yourself
]
