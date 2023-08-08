Extension { #name : #MOStatementWriter }

{ #category : #'*Moxing-Access' }
MOStatementWriter >> onErrorResumeNext [

	^ self registerStatement: builder onErrorResumeNextBuilder build
]

{ #category : #'*Moxing-Access' }
MOStatementWriter >> redimVariable: aString typeReference: aMOTypeReference redimText: aRedimText reference: aReference [

	^ self registerStatement: (builder redimVariableBuilder
			   name: aString;
			   typeReference: aMOTypeReference value;
			   redimText: aRedimText;
			   reference: aReference;
			   build)
]
