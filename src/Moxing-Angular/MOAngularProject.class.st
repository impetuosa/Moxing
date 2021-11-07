Class {
	#name : #MOAngularProject,
	#superclass : #MOAngularContainer,
	#instVars : [
		'projectType',
		'anchoredToUrlSegment',
		'modules'
	],
	#category : #'Moxing-Angular-Model'
}

{ #category : #visiting }
MOAngularProject >> acceptVisitor: aJinInspectorBuilder [ 
	aJinInspectorBuilder visitAngularProject: self 
]

{ #category : #'as yet unclassified' }
MOAngularProject >> anchoredToUrlSegment: aString [

	anchoredToUrlSegment := aString
]

{ #category : #testing }
MOAngularProject >> isWellKnownNotDirectory: aFileReference [

	^ { #environments. #assets   } includes: aFileReference basename
]

{ #category : #'brick-modules' }
MOAngularProject >> modules [

	^ modules ifNil: [ 
		  | directories |
		
		  directories := anchor directories reject: [ :d | 
			                 self isWellKnownNotDirectory: d ].
	
		  [ modules isEmptyOrNil and: [ directories isNotEmpty ] ] whileTrue: [
		  		modules := (directories flatCollect: #entries)
			             select: [ :e | e basename endsWith: 'module.ts' ]
			             thenCollect: [ :f | 
				             MOAngularModule new
					             anchor: f asFileReference parent;
					             name:
						             (f basename copyReplaceAll: '.module.ts' with: '') ].
				directories := (directories flatCollect:[ :e  | e directories collect:#asFileReference  ]).
			].
			modules ifNil: [modules := Array empty ]. 
		 ]. 
]

{ #category : #'as yet unclassified' }
MOAngularProject >> projectType: aString [

	projectType := aString
]
