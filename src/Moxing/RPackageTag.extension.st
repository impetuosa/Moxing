Extension { #name : #RPackageTag }

{ #category : #'*Moxing-Pharo' }
RPackageTag >> definedClasses [ 
	| definedClasses |
	definedClasses := Set new.
	classNames do: [:each | 
		Smalltalk globals 
			at: each 
			ifPresent: [:aClass| definedClasses add: aClass ]].
	^ definedClasses
	
]
