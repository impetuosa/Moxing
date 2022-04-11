Class {
	#name : #MOAngularComponentTemplateWriter,
	#superclass : #Object,
	#instVars : [
		'xmlStream'
	],
	#category : #'Moxing-Angular-Writting'
}

{ #category : #accessing }
MOAngularComponentTemplateWriter >> configuration [

	^ MOCasinoAngularMapper default
]

{ #category : #generated }
MOAngularComponentTemplateWriter >> template [

	^ MOAngularTransientComponentTemplate new
		  contents: xmlStream contents;
		  yourself
]

{ #category : #visiting }
MOAngularComponentTemplateWriter >> visitCSNLAbsolutePositionLayout: aLayout [ 
	| layoutBrush |

	layoutBrush := (self configuration brushFor: aLayout) .

	layoutBrush write: aLayout into: xmlStream with: [ : entry | 
		 entry accept: self.
	 ].
	
]

{ #category : #visiting }
MOAngularComponentTemplateWriter >> visitCSNLCell: aCSNLCell [

	self assert: (aCSNLCell layoutOwner container = aCSNLCell widget) not.
	aCSNLCell widget accept: self
]

{ #category : #visiting }
MOAngularComponentTemplateWriter >> visitCSNLTabulateLayout: aLayout [ 
	| layoutBrush |

	layoutBrush := (self configuration brushFor: aLayout) .

	layoutBrush write: aLayout into: xmlStream with: [ : entry | 
		 entry accept: self.
	 ].
	
]

{ #category : #visiting }
MOAngularComponentTemplateWriter >> visitCSNLVerticalLayout: aCSNLVerticalLayout [

	self writeLayout: aCSNLVerticalLayout
]

{ #category : #visiting }
MOAngularComponentTemplateWriter >> visitCSNPage: aJinCasinoPage [ 
	aJinCasinoPage widgets do: [ : w | w accept: self  ].

]

{ #category : #'as yet unclassified' }
MOAngularComponentTemplateWriter >> visitCSNUIButton: aCSNUIButton [
	self writeLeafElement: aCSNUIButton
]

{ #category : #'as yet unclassified' }
MOAngularComponentTemplateWriter >> visitCSNUIFieldset: aCSNUIFieldset [
	(self configuration brushFor: aCSNUIFieldset)
		write: aCSNUIFieldset
		into: xmlStream
		with: [ aCSNUIFieldset widgets do: [ :w | w accept: self ] ]
]

{ #category : #'as yet unclassified' }
MOAngularComponentTemplateWriter >> visitCSNUIImage: aCSNUIImage [
	^ self writeLeafElement: aCSNUIImage
]

{ #category : #'as yet unclassified' }
MOAngularComponentTemplateWriter >> visitCSNUIInputCheckbox: aCSNUIInputCheckbox [
	self writeLeafElement: aCSNUIInputCheckbox
]

{ #category : #'as yet unclassified' }
MOAngularComponentTemplateWriter >> visitCSNUIInputFile: aCSNUIInputFile [
	^ self writeLeafElement: aCSNUIInputFile
]

{ #category : #visiting }
MOAngularComponentTemplateWriter >> visitCSNUIInputText: aCSNUIInputText [

	self writeLeafElement: aCSNUIInputText
]

{ #category : #'as yet unclassified' }
MOAngularComponentTemplateWriter >> visitCSNUIOrderedList: aCSNUIOrderedList [
	^ (self configuration brushFor: aCSNUIOrderedList)
		write: aCSNUIOrderedList
		into: xmlStream
		with: [ aCSNUIOrderedList widgets do: [ :w | w accept: self ] ]
]

{ #category : #visiting }
MOAngularComponentTemplateWriter >> visitCSNUIPanel: aCSNUIPanel [

	(self configuration brushFor: aCSNUIPanel) write: aCSNUIPanel into: xmlStream with: [ 
		aCSNUIPanel layout
			ifNil: [ aCSNUIPanel widgets do: [ :w | w accept: self ] ]
			ifNotNil: [ aCSNUIPanel layout accept: self ] ].
]

{ #category : #visiting }
MOAngularComponentTemplateWriter >> visitCSNUIParagraph: aCSNUIParagraph [ 
	self writeLeafElement: aCSNUIParagraph
]

{ #category : #'as yet unclassified' }
MOAngularComponentTemplateWriter >> visitCSNUISelect: aCSNUISelect [ 
	self writeLeafElement: aCSNUISelect
]

{ #category : #'as yet unclassified' }
MOAngularComponentTemplateWriter >> visitCSNUITab: aCSNUITab [
	(self configuration brushFor: aCSNUITab)
		write: aCSNUITab
		into: xmlStream
		with: [ aCSNUITab widgets do: [ :w | w accept: self ] ]
]

{ #category : #'as yet unclassified' }
MOAngularComponentTemplateWriter >> visitCSNUITabManager: aCSNUITabManager [
	(self configuration brushFor: aCSNUITabManager)
		write: aCSNUITabManager
		into: xmlStream
		with: [ aCSNUITabManager pages do: [ :w | w accept: self ] ]
]

{ #category : #'as yet unclassified' }
MOAngularComponentTemplateWriter >> visitDataRead: aMDDataRead [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
MOAngularComponentTemplateWriter >> visitJinCasinoWidgetUsage: aJinCasinoWidgetUsage [
	^ self writeLeafElement: aJinCasinoWidgetUsage
]

{ #category : #writing }
MOAngularComponentTemplateWriter >> writeHtmlFor: aCSNUIObject into: component [ 

	self assert: xmlStream isNil.
	xmlStream := XMLWriter new .
	xmlStream enablePrettyPrinting.
	aCSNUIObject accept: self.
	component template: self template.
]

{ #category : #writing }
MOAngularComponentTemplateWriter >> writeLayout: aCSNLLayout [

	aCSNLLayout container widgets , aCSNLLayout cell do: [ :widget | 
		widget accept: self ]
]

{ #category : #visiting }
MOAngularComponentTemplateWriter >> writeLayoutedElement: aCSNElement [ 

	(self configuration brushFor: aCSNElement) write: aCSNElement into: xmlStream with: [ 
		aCSNElement layout
			ifNil: [ aCSNElement  widgets do: [ :w | w accept: self ] ]
			ifNotNil: [ aCSNElement layout accept: self ] ].
]

{ #category : #writing }
MOAngularComponentTemplateWriter >> writeLeafElement: anElement [
	(self configuration brushFor: anElement)
		write: anElement
		into: xmlStream
]
