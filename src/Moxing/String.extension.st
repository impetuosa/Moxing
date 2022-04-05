Extension { #name : #String }

{ #category : #'*Moxing-Pharo' }
String >> asPackageOrTag [

	^ self asPackageIfAbsent: [ 
		  | pt pack tag |
		  pt := '-' split: self.
		  pt size = 2 ifFalse: [ self error: ' cannot infer tag ' ].
		  pack := pt first asPackage.
		  pack classTags detect: [ :a | a name = pt second ] ]
]
