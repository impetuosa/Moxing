Class {
	#name : #MOAngularComponentTemplateWriter,
	#superclass : #Object,
	#instVars : [
		'xmlStream'
	],
	#category : #'Moxing-CodeWritingHtml'
}

{ #category : #accessing }
MOAngularComponentTemplateWriter >> configuration [

	^ MOCasinoAngularMapper default
]

{ #category : #generated }
MOAngularComponentTemplateWriter >> template [

	^ MOAngularProtoComponentTemplate new
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
