Class {
	#name : #MOJavaCatalogModelInstaller,
	#superclass : #Object,
	#instVars : [
		'model',
		'parent',
		'package'
	],
	#category : #'Moxing-Java-Loader'
}

{ #category : #'as yet unclassified' }
MOJavaCatalogModelInstaller >> install: aMOInterface into: aMOModel [

	| instance |
	self assert: (aMOInterface isKindOf: MOType).
	model := aMOModel.

	aMOInterface parent acceptVisitor: self.

	instance := aMOInterface class newForJavaIn: model.
	instance modifiers: aMOInterface modifiers copy.
	instance name: aMOInterface name.
	instance parent: package.
	self assert: aMOInterface properties isEmpty.
	^ instance
]

{ #category : #visiting }
MOJavaCatalogModelInstaller >> visitPackage: aMOPackage [

	| new |
	aMOPackage parent ifNotNil: [ aMOPackage parent acceptVisitor: self ].
	package
		ifNil: [ 
			package := model rootPackages detect: [ :p | 
				           p name = aMOPackage name ] ]
		ifNotNil: [ 
			package := package subpackages
				           detect: [ :p | p name = aMOPackage name ]
				           ifNone: [ 
					           new := MOPackage newForJavaIn: model.
					           new name: aMOPackage name.
					           package addPackage: new.
					           new anchor: package anchor / #packages / new name.
					           new ] ]
]
