Extension { #name : #MOJinDAMModelReader }

{ #category : #'*Moxing-Access' }
MOJinDAMModelReader >> visitResumeNext: aJinDAMResumeNext [

	^ self
		  trace: aJinDAMResumeNext
		  with: writer builder resumeNextBuilder build
]
