Extension { #name : #RBAbstractClass }

{ #category : #'*Moxing' }
RBAbstractClass >> superclass [

	^ superclass == LookupSuperclass
		  ifTrue: [ 
			  self realClass superclass ifNil: [ ^ nil ].
			  model
				  ifNil: [ RBClass existingNamed: self realClass superclass name ]
				  ifNotNil: [ model classFor: self realClass superclass ] ]
		  ifFalse: [ superclass ]
]
