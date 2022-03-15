Class {
	#name : #MOPackageReference,
	#superclass : #MOReference,
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #accessing }
MOPackageReference >> acceptVisitor: aMOModelLinker [

	^ aMOModelLinker visitPackageReference: self
]

{ #category : #adding }
MOPackageReference >> addClass: aMOClass [

	candidate addType: aMOClass
]

{ #category : #adding }
MOPackageReference >> addPackage: aMOPackage [

	candidate addPackage: aMOPackage
]

{ #category : #accessing }
MOPackageReference >> mapSpaceAnchor [
	^ candidate mapSpaceAnchor
]

{ #category : #accessing }
MOPackageReference >> parent: aParent [ 
	" dont care about parents "
]

{ #category : #accessing }
MOPackageReference >> path [

	^ '.' split: name
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

{ #category : #'as yet unclassified' }
MOPackageReference >> refersToObjectsLike: aDeclaration [ 
	 ^ aDeclaration species = MOPackage
]

{ #category : #accessing }
MOPackageReference >> types [

	^ candidate types
]
