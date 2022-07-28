Class {
	#name : #MOJavaGenericProjectLoader,
	#superclass : #Object,
	#instVars : [
		'workingDirectory',
		'model',
		'writer'
	],
	#classInstVars : [
		'northwind',
		'egrc'
	],
	#category : #'Moxing-Java-Loader'
}

{ #category : #'as yet unclassified' }
MOJavaGenericProjectLoader class >> egrc [

	^ egrc ifNil: [ 
		  egrc := self new
			               workingDirectory:
				               '/Users/sbragagn/git/jegrc';
			               loadNamed: #java ]
]

{ #category : #'as yet unclassified' }
MOJavaGenericProjectLoader class >> northwind [

	^ northwind ifNil: [ 
		  northwind := self new
			               workingDirectory:
				               '/Users/sbragagn/git/jnorthwind/jnorthwind';
			               loadNamed: #java ]
]

{ #category : #'as yet unclassified' }
MOJavaGenericProjectLoader class >> reset [

	<script>
	northwind := nil.
	egrc := nil
]

{ #category : #load }
MOJavaGenericProjectLoader >> catalog [

	| catalog |
	catalog := MOCatalog new.
	catalog anchor: (MOAnchor on: #/) / #catalog.
	^ catalog
]

{ #category : #configuration }
MOJavaGenericProjectLoader >> javaFiles [

	^ workingDirectory allFiles select: [ :a | a extension = #java ]
]

{ #category : #accessing }
MOJavaGenericProjectLoader >> link: aMOModel [

	MOModelLinker new link: aMOModel
]

{ #category : #load }
MOJavaGenericProjectLoader >> loadNamed: aString [

	| loader entry ast |
	model := MOModel newJava
		         name: aString;
		         fileReference: workingDirectory asFileReference;
		         anchor: (MOAnchor on: #/);
		         catalog: self catalog;
		         yourself.

	writer := model writer.

	self javaFiles do: [ :file | 
		ast := JavaParser parse: file readStream upToEnd.
		loader := MOJavaFileLoader new
			          writer: writer;
			          yourself.
		entry := loader load: ast.
		entry fileReference: (file relativeTo: workingDirectory).
		entry types do: [ :t | t fileReference: entry fileReference ].
		entry ].
	self link: model.
	^ model
]

{ #category : #configuration }
MOJavaGenericProjectLoader >> workingDirectory: aString [

	workingDirectory := aString asFileReference.
]
