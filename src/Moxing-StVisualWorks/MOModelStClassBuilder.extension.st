Extension { #name : #MOModelStClassBuilder }

{ #category : #'*Moxing-StVisualWorks' }
MOModelStClassBuilder >> addSharedConstant: aMOSharedVariable [

	self addConstantAttribute: aMOSharedVariable
]

{ #category : #'*Moxing-StVisualWorks' }
MOModelStClassBuilder >> addSharedVariable: aMOSharedVariable [

	self addAttribute: aMOSharedVariable
]
