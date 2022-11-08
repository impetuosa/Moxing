Class {
	#name : #MOAngularProject,
	#superclass : #MOProject,
	#instVars : [
		'#projectType => MOPropertySlot',
		'#prefix => MOPropertySlot'
	],
	#category : #'Moxing-Angular-Declaration'
}

{ #category : #visiting }
MOAngularProject >> acceptVisitor: aJinInspectorBuilder [ 
	^ aJinInspectorBuilder visitAngularProject: self 
]

{ #category : #'as yet unclassified' }
MOAngularProject >> contentFileReference [
	^ self fileReference / prefix 
]

{ #category : #'brick-modules' }
MOAngularProject >> modules [

	^ self packages
]

{ #category : #'brick-modules' }
MOAngularProject >> modules: md [

	self packages: md
]

{ #category : #accessing }
MOAngularProject >> packages [

	^ packages
]

{ #category : #accessing }
MOAngularProject >> prefix [
	^ prefix
]

{ #category : #accessing }
MOAngularProject >> prefix: aString [ 
	prefix := aString
]

{ #category : #'as yet unclassified' }
MOAngularProject >> projectType: aString [

	projectType := aString
]
