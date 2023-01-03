Trait {
	#name : #MOManageBindingPolicy,
	#instVars : [
		'bindingKind'
	],
	#category : #'Moxing-MicroBuilders-invocables'
}

{ #category : #accessing }
MOManageBindingPolicy >> bindingKind [

	bindingKind ifNil: [ self setDefaultBinding ].
	^ bindingKind
]

{ #category : #accessing }
MOManageBindingPolicy >> bindingKind: aString [ 

	bindingKind := aString
	
]

{ #category : #accessing }
MOManageBindingPolicy >> setDefaultBinding [

	^ self error: 'MustBeImplemented'
]

{ #category : #accessing }
MOManageBindingPolicy >> setDynamicBinding [

	self bindingKind: #dynamic
]

{ #category : #accessing }
MOManageBindingPolicy >> setStaticBinding [

	self bindingKind: #static
]
