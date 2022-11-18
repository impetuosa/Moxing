Class {
	#name : #PackageChunk,
	#superclass : #MessageSendBasedChunk,
	#instVars : [
		'elements',
		'packageName',
		'sharedVariables'
	],
	#category : #'Moxing-StVisualWorks-CodeImport'
}

{ #category : #accessing }
PackageChunk >> accept: aVisitor [

	^ aVisitor visitPackageChunk: self
]

{ #category : #adding }
PackageChunk >> add: aMessageSendBasedChunk [

	self elements add: aMessageSendBasedChunk
]

{ #category : #adding }
PackageChunk >> addSharedVariable: aSharedVariableChunk [

	^ self sharedVariables add: aSharedVariableChunk
]

{ #category : #accessing }
PackageChunk >> comment [

	^ self at: #comment or: nil
]

{ #category : #accessing }
PackageChunk >> elements [

	^ elements ifNil: [ elements := OrderedCollection new ]
]

{ #category : #accessing }
PackageChunk >> packageName: aName [

	packageName := aName
]

{ #category : #accessing }
PackageChunk >> parcelName [

	^ self at: #parcelName or: name
]

{ #category : #'as yet unclassified' }
PackageChunk >> prerequisiteParcels [

	^ self at: #prerequisiteParcels or: #(  )
]

{ #category : #accessing }
PackageChunk >> sharedVariables [

	^ sharedVariables ifNil: [ sharedVariables := OrderedCollection new ]
]

{ #category : #accessing }
PackageChunk >> symbolKind [

	^ #Package
]
