Class {
	#name : #MOAngularComponentTemplateWriter,
	#superclass : #Object,
	#instVars : [
		'xmlStream'
	],
	#category : #Moxing
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
	aJinCasinoPage widgets do: [ : w | w accept: self  ]
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

	(self configuration brushFor: anElement) write: anElement into: xmlStream
]
