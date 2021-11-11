Class {
	#name : #MOJavaProjectTree,
	#superclass : #MOProjectTree,
	#category : #'Moxing-Java-Widgets'
}

{ #category : #commands }
MOJavaProjectTree class >> buildCommandsGroupWith: presenterInstance forRoot: rootCommandGroup [

	super
		buildCommandsGroupWith: presenterInstance
		forRoot: rootCommandGroup.


	FylgjaCommands allSubclasses do: [ :sc | 
		rootCommandGroup register: (sc forSpecContext: presenterInstance) ]
]

{ #category : #visiting }
MOJavaProjectTree >> visitAttribute: aFamixAttribute [ 
	children := {  }
]

{ #category : #visiting }
MOJavaProjectTree >> visitMOJavaClass: aMOClass [

	children := aMOClass attributes , aMOClass annotations
	            , aMOClass methods
]

{ #category : #visiting }
MOJavaProjectTree >> visitMOJavaInterface: aMOJavaMavenFile [ 
	self halt. 
]

{ #category : #visiting }
MOJavaProjectTree >> visitMOJavaMavenFile: aMOJavaMavenFile [ 
	children := {  }
]

{ #category : #visiting }
MOJavaProjectTree >> visitMOJavaPackage: aMOJavaPackage [ 
	children := aMOJavaPackage types 
]

{ #category : #visiting }
MOJavaProjectTree >> visitMOJavaProject: aMOJavaProject [

	children := aMOJavaProject packages , aMOJavaProject dependencies
	            , { aMOJavaProject mvn }
]

{ #category : #visiting }
MOJavaProjectTree >> visitMOJavaTransientClass: aMOClass [

	self visitMOJavaClass: aMOClass
]

{ #category : #visiting }
MOJavaProjectTree >> visitMethod: aFamixAttribute [ 
	children := {  }
]
