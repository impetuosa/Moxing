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
		'northwind',
		'egrc',
		'paperJava'
	],
	#category : #'Moxing-Java-Loader'
}

{ #category : #'as yet unclassified' }
MOJavaMavenProjectLoader class >> egrc [

	^ egrc ifNil: [ 
		  egrc := self new
			               workingDirectory:
				               '/Users/sbragagn/git/jegrc';
			               loadNamed: #java ]
]

{ #category : #'as yet unclassified' }
MOJavaMavenProjectLoader class >> northwind [

	^ self egrc
	"
	^ northwind ifNil: [ 
		  northwind := self new
			               workingDirectory:
				               '/Users/sbragagn/git/jnorthwind/jnorthwind';
			               loadNamed: #java ]"
]

{ #category : #'as yet unclassified' }
MOJavaMavenProjectLoader class >> paperJava [
	^ paperJava ifNil: [  
		  paperJava := self new
			               workingDirectory:
				               '/Users/sbragagn/workspace/paperJava';
			               loadNamed: #PaperJava ]
]

{ #category : #'as yet unclassified' }
MOJavaMavenProjectLoader class >> reset [

	<script>
	northwind := nil.
	egrc := nil
]

{ #category : #load }
MOJavaMavenProjectLoader >> catalog [

	^ MOJavaTarCatalogLoader loadSingleCatalogFor: pom
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

	| loader entry ast |
	model := MOModel newJava
		         name: aString;
		         fileReference: workingDirectory asFileReference;
		         anchor: (MOAnchor on: #/);
		         catalog: self catalog;
		         yourself.

	writer := model writer.
	writer writePackage: [ :p | 
		p name: 'RuntimePrimitiveTypes'.
		#( void byte short int long float double boolean char ) do: [ :tname | 
			p writePrimitiveType: [ :type | type name: tname ] ] ].


	self javaFiles do: [ :file | 
		ast := JavaParser parse: file readStream upToEnd.
		loader := MOJavaFileLoader new
			          writer: writer;
			          yourself.
		entry := loader load: ast.
		entry fileReference: (file relativeTo: workingDirectory).
		entry types do: [ :t | t fileReference: entry fileReference ].
		entry ].
	writer populateAnchorOn: model root.
	self link: model.
	^ model
]

{ #category : #configuration }
MOJavaMavenProjectLoader >> workingDirectory: aString [

	workingDirectory := aString asFileReference.
	pom := workingDirectory / #'pom.xml'.
	self assert: pom exists. 
]
