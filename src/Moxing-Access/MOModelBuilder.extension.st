Extension { #name : #MOModelBuilder }

{ #category : #'*Moxing-Access' }
MOModelBuilder >> exitBuilder [ 
	^ MOModelExitBuilder  new
		  parentBuilder: self;
		  yourself
]

{ #category : #'*Moxing-Access' }
MOModelBuilder >> fileLineInputBuilder [

	^ MOModelFileLineInputBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'*Moxing-Access' }
MOModelBuilder >> fileOpenBuilder [

	^ MOModelFileOpenBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'*Moxing-Access' }
MOModelBuilder >> filePrintIntoBuilder [

	^ MOModelFilePrintIntoBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'*Moxing-Access' }
MOModelBuilder >> fileRenameBuilder [

	^ MOModelFileRenameBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'*Moxing-Access' }
MOModelBuilder >> foreignRelationBuilder [

	^ MOModelForeingRelationBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'*Moxing-Access' }
MOModelBuilder >> foreignRelationMatchBuilder [

	^ MOModelForeingRelationMatchBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'*Moxing-Access' }
MOModelBuilder >> formBuilder [

	^ MOModelFormBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'*Moxing-Access' }
MOModelBuilder >> goSubBuilder [

	^ MOModelGoSubBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'*Moxing-Access' }
MOModelBuilder >> onErrorResumeNextBuilder [

	^ MOModelOnErrorResumeNextBuilder new
		  parentBuilder: self;
		  baseAnchor: model anchor;
		  yourself
]

{ #category : #'*Moxing-Access' }
MOModelBuilder >> redimVariableBuilder [

	^ MOModelRedimVariableBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'*Moxing-Access' }
MOModelBuilder >> reportBuilder [

	^ MOModelReportBuilder new
		  parentBuilder: self;
		  yourself
]

{ #category : #'*Moxing-Access' }
MOModelBuilder >> resumeBuilder [
	^ MOModelResumeBuilder new
		  parentBuilder: self;
		  baseAnchor: model anchor;
		  yourself
]

{ #category : #'*Moxing-Access' }
MOModelBuilder >> resumeNextBuilder [

	^ MOModelResumeNextBuilder new
		  parentBuilder: self;
		  baseAnchor: model anchor;
		  yourself
]

{ #category : #'*Moxing-Access' }
MOModelBuilder >> tableBuilder [

	^ MOModelTableBuilder new
		  parentBuilder: self;
		  yourself
]
