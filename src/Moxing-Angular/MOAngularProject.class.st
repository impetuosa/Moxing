Class {
	#name : #MOAngularProject,
	#superclass : #MOProject,
	#instVars : [
		'#projectType => MOPropertySlot',
		'#prefix => MOPropertySlot'
	],
	#category : #'Moxing-Angular-Model'
}

{ #category : #visiting }
MOAngularProject >> acceptVisitor: aJinInspectorBuilder [ 
	^ aJinInspectorBuilder visitAngularProject: self 
]

{ #category : #'as yet unclassified' }
MOAngularProject >> contentFileReference [
	^ fileReference / prefix 
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
MOAngularProject >> prefix: aString [ 
	prefix := aString
]

{ #category : #'as yet unclassified' }
MOAngularProject >> projectType: aString [

	projectType := aString
]
