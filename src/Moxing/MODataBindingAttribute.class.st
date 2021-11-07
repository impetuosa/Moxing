Class {
	#name : #MODataBindingAttribute,
	#superclass : #CSNAttribute,
	#instVars : [
		'binding'
	],
	#category : #'Moxing-CasinoBinding'
}

{ #category : #accessing }
MODataBindingAttribute >> accept: visitor [
	visitor visitDataBinding: self
]

{ #category : #accessing }
MODataBindingAttribute >> binding [
	^ binding
]

{ #category : #accessing }
MODataBindingAttribute >> binding: aBinding [
	binding := aBinding
]
