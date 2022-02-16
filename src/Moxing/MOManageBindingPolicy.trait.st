Trait {
	#name : #MOManageBindingPolicy,
	#instVars : [
		'bindingKind'
	],
	#category : #'Moxing-MicroWriters'
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
	 bindingKind := #dynamic.
]

{ #category : #accessing }
MOManageBindingPolicy >> setStaticBinding [
	 bindingKind := #static.
]
