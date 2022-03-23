Class {
	#name : #MOJinDAMImporter,
	#superclass : #MOJinDAMModelReader,
	#instVars : [
		'model'
	],
	#classInstVars : [
		'northwind'
	],
	#category : #'Moxing-Alce'
}

{ #category : #accessing }
MOJinDAMImporter class >> loadNorthwind [

	| reader morwind |
	reader := self new.
	morwind := MOModel newMicrosoftAccess.
	reader model: morwind.
	reader import: JinDAMModel northwind.
	^ morwind
]

{ #category : #accessing }
MOJinDAMImporter class >> northwind [ 
	^ northwind ifNil: [ northwind := self loadNorthwind  ]
]

{ #category : #accessing }
MOJinDAMImporter class >> northwind: aVal [ 
	^ northwind := aVal
]

{ #category : #accessing }
MOJinDAMImporter class >> reset [ 
	<script> 
	northwind := nil
]

{ #category : #'as yet unclassified' }
MOJinDAMImporter >> anchorFromToInstall [

	traces keysAndValuesDo: [ :origin :moco | 
		origin anchor ifNotNil: [ 
			origin anchor containsSource ifTrue: [ 
				moco do: [ :mo | 
					mo anchor from: origin anchor srcFrom to: origin anchor srcTo ] ] ] ]
]

{ #category : #'as yet unclassified' }
MOJinDAMImporter >> createDefaultObject: aJinDAMObject [ 

	| obj |
	obj := model instantiate: MOObject.
	obj holder: (traces at: aJinDAMObject type) first .
	obj type: (traces at: aJinDAMObject type) first .


	aJinDAMObject state keysAndValuesDo: [ :k :v | 
		(v isKindOf: JinDAMObject)
			ifTrue: [ obj state at: k put: (self createObject: v) ]
			ifFalse: [ obj state at: k put: v ] ]
]

{ #category : #'as yet unclassified' }
MOJinDAMImporter >> createObject: aJinDAMObject [

	| obj |
	obj := model instantiate: MOObject.
	obj holder: (traces at: aJinDAMObject type) first.
	obj type: (traces at: aJinDAMObject type typeReference) first.


	aJinDAMObject state keysAndValuesDo: [ :k :v | 
		(v isKindOf: JinDAMObject)
			ifTrue: [ obj at: k put: (self createObject: v) ]
			ifFalse: [ obj state at: k put: v ] ].
	^ obj
]

{ #category : #'as yet unclassified' }
MOJinDAMImporter >> createObject: aJinDAMObject type: aJinDAMReport [

	| obj |
	obj := model instantiate: MOObject.
	obj holder: (traces at: aJinDAMReport) first .
	obj type: (traces at: aJinDAMReport).


	aJinDAMObject state keysAndValuesDo: [ :k :v | 
		(v isKindOf: JinDAMObject)
			ifTrue: [ obj at: k put: (self createObject: v) ]
			ifFalse: [ obj state at: k put: v ] ]
]

{ #category : #visiting }
MOJinDAMImporter >> createObjects: aJinDAMObject [ 
	| instance | 
	instance := model instantiate: MOObject.
	instance 
]

{ #category : #visiting }
MOJinDAMImporter >> import: aJinDamModel [

	jindamModel := aJinDamModel.
	self read: aJinDamModel.
	self linkWith: aJinDamModel.
	self anchorFromToInstall
]

{ #category : #'as yet unclassified' }
MOJinDAMImporter >> linkWith: aJinDAMModel [

	| candidate |

	aJinDAMModel references
		select: [ :ref | traces includesKey: ref ]
		thenDo: [ :ref | 
			ref candidate ifNotNil: [ 
				(ref candidate isKindOf: JinDAMDBType) ifFalse: [ 
					candidate := ref candidate isCollection
						             ifTrue: [ 
						             ref candidate collect: [ :r | traces at: r ] ]
						             ifFalse: [ traces at: ref candidate ].
					self assert: candidate size > 0.
					candidate := candidate size = 1
						             ifTrue: [ candidate first ]
						             ifFalse: [ candidate ].
					(traces at: ref) do: [ :destRef | destRef candidate: candidate ] ] ] ]
]

{ #category : #visiting }
MOJinDAMImporter >> model: aModel [

	model := aModel.
	super model: aModel
]

{ #category : #visiting }
MOJinDAMImporter >> visitForm: aJinDAMForm [

	| form |
	form := super visitForm: aJinDAMForm.
	self createDefaultObject: aJinDAMForm defaultInstance.
	^ form
]

{ #category : #visiting }
MOJinDAMImporter >> visitReport: aJinDAMReport [

	| form |
	form := super visitReport: aJinDAMReport.
	self createDefaultObject: aJinDAMReport defaultInstance.

	^ form
]
