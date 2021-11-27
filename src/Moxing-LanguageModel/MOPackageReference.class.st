Class {
	#name : #MOPackageReference,
	#superclass : #MOReference,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOPackageReference >> acceptVisitor: aMOModelLinker [

	^ aMOModelLinker visitPackageReference: self
]

{ #category : #'as yet unclassified' }
MOPackageReference >> accessChain [

	| current chain |
	chain := OrderedCollection new.

	current := self .

	[ current isNil ] whileFalse: [ 
		chain add: current name.
		current := current parent ].
	^ chain reversed
]

{ #category : #'as yet unclassified' }
MOPackageReference >> accessChainString [

	^ '.' join: self accessChain
]

{ #category : #adding }
MOPackageReference >> addClass: aMOClass [

	candidate addType: aMOClass
]

{ #category : #adding }
MOPackageReference >> addPackage: aMOPackage [

	candidate addPackage: aMOPackage
]

{ #category : #adding }
MOPackageReference >> printOn: aStream [

	| str chain |
	chain := OrderedCollection new.
	str := self.
	aStream nextPutAll: '->'. 
	[ str isNil ] whileFalse: [ 
		chain add: str name.
		str := str parent ].
	aStream nextPutAll: ('.' join: chain reversed)
]
