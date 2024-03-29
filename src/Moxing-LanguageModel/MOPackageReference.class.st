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

	referee addType: aMOClass
]

{ #category : #adding }
MOPackageReference >> addPackage: aMOPackage [

	referee addPackage: aMOPackage
]

{ #category : #accessing }
MOPackageReference >> mapSpaceAnchor [
	^ referee mapSpaceAnchor
]

{ #category : #accessing }
MOPackageReference >> parent: aParent [ 
	" dont care about parents "
]

{ #category : #accessing }
MOPackageReference >> path [

	^ '.' split: self name
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

	^ { 
		  MOPackage.
		  MOVisualWorksPackage.
		  MOAngularModule } includes: aDeclaration species
]

{ #category : #accessing }
MOPackageReference >> types [

	^ referee types
]
