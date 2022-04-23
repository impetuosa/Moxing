Class {
	#name : #MOProjectTree,
	#superclass : #AlceTreeWidget,
	#instVars : [
		'children'
	],
	#category : #'Moxing-Java-Widgets'
}

{ #category : #'instance creation' }
MOProjectTree class >> newFor: aProject [

	^ (aProject isKindOf: MOJavaProject)
		  ifTrue: [ 
			  MOJavaProjectTree new
				  selectEntity: aProject;
				  yourself ]
		  ifFalse: [ 
			  MOAngularProjectTree new
				  selectEntity: aProject;
				  yourself ]
]

{ #category : #accessing }
MOProjectTree >> canFollowEntity: anEntity [

	^ { 
		  MOProject.
		  MOPackage.
		  MORootDeclaration } anySatisfy: [ :c | anEntity isKindOf: c ]
]

{ #category : #initialization }
MOProjectTree >> childrenFor: anEntry [
	anEntry accept: self .
	^ children
]

{ #category : #opening }
MOProjectTree >> followAction [

	tree items: (self childrenFor: toSelect)
]

{ #category : #visiting }
MOProjectTree >> initializePresenters [

	super initializePresenters.

	tree := self newTreeTable.
	tree beMultipleSelection.
	tree
		contextMenu: [ self rootCommandsGroup asMenuPresenter ];
		whenSelectionChangedDo: [ :e | self selection: e ].
	tree
		addColumn: (SpCompositeTableColumn new
				 title: '';
				 addColumn:
					 ((SpImageTableColumn evaluated: [ :each | self iconFor: each ])
						  width: 20;
						  yourself);
				 addColumn: (SpStringTableColumn evaluated: [ :each | MOToString new toString: each.    ]);
				 yourself);
		children: [ :entry | self childrenFor: entry ]
]
