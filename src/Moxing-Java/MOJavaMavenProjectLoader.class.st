Class {
	#name : #MOJavaMavenProjectLoader,
	#superclass : #Object,
	#instVars : [
		'workingDirectory',
		'model',
		'writer',
		'pom'
	],
	#classInstVars : [
		'northwind'
	],
	#category : #'Moxing-Java-Loader'
}

{ #category : #'as yet unclassified' }
MOJavaMavenProjectLoader class >> northwind [

	^ northwind ifNil: [ 
		  northwind := self new
			               workingDirectory:
				               '/Users/sbragagn/git/jnorthwind/jnorthwind';
			               loadNamed: #java ]
]

{ #category : #load }
MOJavaMavenProjectLoader >> catalog [

	^ MOJavaTarCatalogLoader new
		  pom: pom;
		  load
]

{ #category : #configuration }
MOJavaMavenProjectLoader >> javaFiles [

	^ workingDirectory allFiles select: [ :a | a extension = #java ]
]

{ #category : #accessing }
MOJavaMavenProjectLoader >> link: aMOModel [

	MOModelLinker new link: aMOModel
]

{ #category : #load }
MOJavaMavenProjectLoader >> loadNamed: aString [

	model := MOModel newJava
		         name: aString;
		         anchor: (MOAnchor on: #/);
		         catalog: self catalog;
		         yourself.

	writer := model writer.

	self javaFiles
		collect: [ :j | JavaParser parse: j readStream upToEnd ]
		thenDo: [ :ast | 
			ast acceptVisitor: (MOJavaFileLoader new
					 writer: writer;
					 yourself) ].
	self link: model.
	^ model
]

{ #category : #configuration }
MOJavaMavenProjectLoader >> workingDirectory: aString [

	workingDirectory := aString asFileReference.
	pom := workingDirectory / #'pom.xml'.
	self assert: pom exists. 
]
