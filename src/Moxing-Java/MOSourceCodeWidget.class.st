Class {
	#name : #MOSourceCodeWidget,
	#superclass : #AlceDraggableWidget,
	#instVars : [
		'viewport',
		'pagesObjectsMap'
	],
	#category : #'Moxing-Java-Widgets'
}

{ #category : #specs }
MOSourceCodeWidget class >> defaultSpec [
	^ super defaultSpec
		add: #viewport;
		yourself
]

{ #category : #specs }
MOSourceCodeWidget class >> menuCommandOn: aBuilder [
	<worldMenu>
	
	<miBrowsers>
	(aBuilder item: #alceSourceBrowser)
		parent:  AlcIDE alceBrowsers; 
		label: (self title);
		icon: (self iconNamed: #mooseTree);
		help: (self helpMessage);
		action: [ self runMe ]
]

{ #category : #specs }
MOSourceCodeWidget class >> runMe [
	<script>
	^ super runMe
]

{ #category : #specs }
MOSourceCodeWidget class >> title [

	^ 'Java Source Browser'
]

{ #category : #visiting }
MOSourceCodeWidget >> accept: aModel [

	^ (aModel isKindOf: MOJavaType) or: [ 
		  aModel isKindOf: MOJavaTransientClass ]
]

{ #category : #initialization }
MOSourceCodeWidget >> followAction [

	self visualizeSourcecode: toSelect
]

{ #category : #initialization }
MOSourceCodeWidget >> initializePresenters [
	super initializePresenters.
	pagesObjectsMap := Dictionary new.
	viewport := self newNotebook.
	viewport whenPageRemovedDo: [ :p | 
		pagesObjectsMap removeKey: p ifAbsent: [  ] ].
	viewport whenPagesChangedDo: [ :p | 
		pagesObjectsMap at: p ifPresent: [ :m | self selectEntity: m ] ]
]

{ #category : #initialization }
MOSourceCodeWidget >> newNotebookPageFor: aModule [

	| p |
	p := self newNotebookPage.
	pagesObjectsMap at: p put: aModule.
	^ p
]

{ #category : #initialization }
MOSourceCodeWidget >> selectSourceCodeInterval: anAnchor [

	viewport pages
		detect: [ :p | p title = anAnchor elementName ]
		ifFound: [ :p | 
			viewport selectPage: p.
			p activePresenter selectFrom: toSelect srcFrom to: toSelect srcTo ]
]

{ #category : #initialization }
MOSourceCodeWidget >> vbaStyleWith: aColoringStrategy [

	^ AlceVBAStyle new
		  useColorStrategy: aColoringStrategy;
		  yourself
]

{ #category : #initialization }
MOSourceCodeWidget >> visualizeSourcecode: aModule [

	| text page |
	viewport pages
		detect: [ :p | p title = aModule name ]
		ifFound: [ :p | 
			viewport selectPage: p.
			^ p ].
	toSelect sourceText ifNil: [ ^ self ].
	text := self newText.
	page := (self newNotebookPageFor: aModule)
		        title: aModule name;
		        presenterProvider: text;
		        icon: (self iconFor: aModule);
		        beCloseable.
	text whenTextChangedDo: [ :content | 
		aModule sourceText: content asString ].

	viewport addPage: page.
	viewport selectPage: page.

	text text: aModule sourceText


	" (FamixJavaTextComposer new
			 compose: toSelect stringContent
			 ast: (toSelect isAstLoaded
					  ifTrue: [ toSelect ast ]
					  ifFalse: [ nil ])
			 model: toSelect
			 style: (self vbaStyleWith: coloringStrategy)
			 browsingWith: self)"
]
