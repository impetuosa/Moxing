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

{ #category : #'*Moxing' }
String >> caseNotSensitiveCopyReplaceAll: oldSubstring with: newSubstring [

	"Answer a copy of the receiver in which all occurrences of oldSubstring have been replaced by newSubstring"

	"('ab cd ab ef ab' copyReplaceAll: 'ab' with: 'zk') >>> 'zk cd zk ef zk'"

	| idx |
	self = oldSubstring ifTrue: [ ^ newSubstring copy ].
	oldSubstring isEmpty ifTrue: [ ^ self copy ].
	idx := 1.
	^ self species new: self size streamContents: [ :stream | 
		  | foundIdx |
		  [ 
		  (foundIdx := self
			               findString: oldSubstring
			               startingAt: idx
			               caseSensitive: false) isZero ] whileFalse: [ 
			  stream
				  next: foundIdx - idx putAll: self startingAt: idx;
				  nextPutAll: newSubstring.
			  idx := foundIdx + oldSubstring size ].
		  idx <= self size ifTrue: [ 
			  stream next: self size - idx + 1 putAll: self startingAt: idx ] ]
]

{ #category : #'*Moxing' }
String >> toPG [

	| copy str pos |
	copy := self readStream upTo: $;.
	copy := copy copyReplaceAll: '"' with: ''''.
	copy := copy copyReplaceAll: '[' with: '"'.
	copy := copy copyReplaceAll: ']' with: '"'.
	copy := copy caseNotSensitiveCopyReplaceAll: 'DISTINCTROW' with: 'DISTINCT'.
	str := copy asLowercase findString: ' top ' startingAt: 1.
	str = 0 ifFalse: [
		pos := str +	' top '	 size. 
		(copy at: pos) isDigit ifFalse: [ ^ copy ].
		
		[ (copy at: pos ) isDigit ] whileTrue: [ pos := pos +1  ].
		copy := (copy copyFrom: 1 to: str), (copy copyFrom: pos to: copy size )
	  ].
	
	^ copy
]
