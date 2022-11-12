Extension { #name : #Path }

{ #category : #'*Moxing' }
Path >> basenameWithoutExtensions [

	"Returns the base of the basename but without its extensionsss, 
		i.e. 
		/foo/gloops.tar.gz basenameWithoutExtension is 'gloops'
		/ basenameWithoutExtension is '/'"

	^ (self extensionDelimiter split: self basename) first
]
