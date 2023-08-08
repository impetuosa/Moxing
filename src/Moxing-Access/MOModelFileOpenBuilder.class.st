Class {
	#name : #MOModelFileOpenBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'fileDescriptorReference',
		'filePathReference',
		'kind'
	],
	#category : #'Moxing-Access-MicroBuilder'
}

{ #category : #asserting }
MOModelFileOpenBuilder >> buildsType [

	^ MOAlceFileOpen
]

{ #category : #accessing }
MOModelFileOpenBuilder >> fileDescriptorReference [

	^ fileDescriptorReference
]

{ #category : #accessing }
MOModelFileOpenBuilder >> fileDescriptorReference: anObject [

	fileDescriptorReference := anObject
]

{ #category : #accessing }
MOModelFileOpenBuilder >> filePathReference [

	^ filePathReference
]

{ #category : #accessing }
MOModelFileOpenBuilder >> filePathReference: anObject [

	filePathReference := anObject
]

{ #category : #accessing }
MOModelFileOpenBuilder >> kind [

	^ kind
]

{ #category : #accessing }
MOModelFileOpenBuilder >> kind: anObject [

	kind := anObject
]

{ #category : #asserting }
MOModelFileOpenBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  fileDescriptorReference: self fileDescriptorReference;
		  filePathReference: self filePathReference;
		  kind: self kind;
		  yourself
]
