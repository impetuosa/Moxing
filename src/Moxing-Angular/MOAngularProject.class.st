Class {
	#name : #MOAngularProject,
	#superclass : #MOAngularEntry,
	#instVars : [
		'projectType',
		'anchoredToUrlSegment',
		'modules',
		'prefix'
	],
	#category : #'Moxing-Angular-Model'
}

{ #category : #visiting }
MOAngularProject >> acceptVisitor: aJinInspectorBuilder [ 
	aJinInspectorBuilder visitAngularProject: self 
]

{ #category : #'as yet unclassified' }
MOAngularProject >> contentFileReference [
	^ fileReference / prefix 
]

{ #category : #'brick-modules' }
MOAngularProject >> modules [

	^ modules
]

{ #category : #'brick-modules' }
MOAngularProject >> modules: md [

	modules := md
]

{ #category : #accessing }
MOAngularProject >> prefix: aString [ 
	prefix := aString
]

{ #category : #'as yet unclassified' }
MOAngularProject >> projectType: aString [

	projectType := aString
]
