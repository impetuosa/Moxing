Class {
	#name : #MOAngularModule,
	#superclass : #MOAngularProject,
	#instVars : [
		'components'
	],
	#category : #'Moxing-Model'
}

{ #category : #accessing }
MOAngularModule >> acceptVisitor: aJinInspectorBuilder [ 
	aJinInspectorBuilder visitAngularModule: self 
]

{ #category : #accessing }
MOAngularModule >> components [

	^ components ifNil: [ 
		  components := path files
			                select: [ :e | e basename endsWith: 'component.ts' ]
			                thenCollect: [ :f | 
				                | ref |
				                ref := f asFileReference.
				                MOAngularComponent new
					                name:
						                (ref basename
							                 copyReplaceAll: '.component.ts'
							                 with: '');
					                path: ref parent;
					                yourself ].

		  components := components asOrderedCollection ]
]

{ #category : #accessing }
MOAngularModule >> path [
	^ path 
]
