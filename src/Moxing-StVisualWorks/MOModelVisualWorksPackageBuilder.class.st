Class {
	#name : #MOModelVisualWorksPackageBuilder,
	#superclass : #MOModelPackageBuilder,
	#instVars : [
		'parcelDependancies',
		'comment',
		'parcelName',
		'version',
		'sharedVariables'
	],
	#category : #'Moxing-StVisualWorks-Builder'
}

{ #category : #adding }
MOModelVisualWorksPackageBuilder >> addSharedVariable: aMOSharedVariable [

	self sharedVariables add: aMOSharedVariable
]

{ #category : #accessing }
MOModelVisualWorksPackageBuilder >> buildsType [

	^ MOVisualWorksPackage
]

{ #category : #accessing }
MOModelVisualWorksPackageBuilder >> comment [
	^ comment
]

{ #category : #accessing }
MOModelVisualWorksPackageBuilder >> comment: aString [ 
	comment := aString 
]

{ #category : #accessing }
MOModelVisualWorksPackageBuilder >> loadBuilderWithEntity: anEntity [

	super loadBuilderWithEntity: anEntity.
	parcelDependancies := anEntity parcelDependancies.
	comment := anEntity comment.
	parcelName := anEntity parcelName.
	version := anEntity version.
	self sharedVariables: anEntity sharedVariables
]

{ #category : #accessing }
MOModelVisualWorksPackageBuilder >> parcelDependancies [

	^ parcelDependancies ifNil: [ 
		  parcelDependancies := OrderedCollection new ]
]

{ #category : #accessing }
MOModelVisualWorksPackageBuilder >> parcelDependancies: aCollection [ 
	parcelDependancies := aCollection
]

{ #category : #accessing }
MOModelVisualWorksPackageBuilder >> parcelName [
	^ parcelName
]

{ #category : #'as yet unclassified' }
MOModelVisualWorksPackageBuilder >> parcelName: aString [ 
	parcelName := aString 
]

{ #category : #accessing }
MOModelVisualWorksPackageBuilder >> privateBuild [

	^ super privateBuild
		  parcelDependancies: self parcelDependancies;
		  comment: self comment;
		  parcelName: self parcelName;
		  version: self version;
		  sharedVariables: self sharedVariables;
		  yourself
]

{ #category : #accessing }
MOModelVisualWorksPackageBuilder >> sharedVariables [

	^ sharedVariables ifNil: [ sharedVariables := OrderedCollection new ]
]

{ #category : #accessing }
MOModelVisualWorksPackageBuilder >> sharedVariables: aCollection [

	sharedVariables := aCollection
]

{ #category : #accessing }
MOModelVisualWorksPackageBuilder >> version [

	^ version
]

{ #category : #versions }
MOModelVisualWorksPackageBuilder >> version: aString [

	version := aString
]
