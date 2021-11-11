Extension { #name : #AbstractFileReference }

{ #category : #'*Moxing' }
AbstractFileReference >> basenameWithoutExtensions [
	"Returns the basename, i.e. /foo/gloops.tar.gz basenameWithoutExtension is 'gloops'"
	^ self fullPath basenameWithoutExtensions
]
