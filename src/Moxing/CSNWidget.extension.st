Extension { #name : #CSNWidget }

{ #category : #'*Moxing' }
CSNWidget >> dataBinding [
	^ attributes
		detect: [ :a | a isKindOf: MODataBindingAttribute ]
		ifFound: [ :a | a binding ]
		ifNone: [ nil ]
]

{ #category : #'*Moxing' }
CSNWidget >> dataBinding: aMDDataRead [
	aMDDataRead
		ifNotNil: [ ^ self
				addAttribute: (MODataBindingAttribute new binding: aMDDataRead) ]
]
