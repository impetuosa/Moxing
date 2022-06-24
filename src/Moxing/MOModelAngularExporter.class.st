Class {
	#name : #MOModelAngularExporter,
	#superclass : #MOModelDraftExporter,
	#category : #'Moxing-Core'
}

{ #category : #visiting }
MOModelAngularExporter >> visitAngularClass: aMOAngularClass [

	self visitCollection: { aMOAngularClass classRepresentation }
]

{ #category : #visiting }
MOModelAngularExporter >> visitAngularComponent: aMOAngularComponent [

	self visitCollection: { 
			aMOAngularComponent behavior.
			aMOAngularComponent template.
			aMOAngularComponent css }
]

{ #category : #visiting }
MOModelAngularExporter >> visitAngularCssDocument: aMOAngularCssDocument [

	(destinationDirectory
	 /
		 ('{1}.component.css ' format: { aMOAngularCssDocument parent name }))
		ensureCreateFile writeStream
		nextPutAll: aMOAngularCssDocument produceCode;
		flush;
		close
]

{ #category : #visiting }
MOModelAngularExporter >> visitAngularModule: aMOAngularModule [

	^ aMOAngularModule isDefinedInLibrary ifFalse: [ 
		  self useDirectoryFor: aMOAngularModule name during: [ 
			  self visitCollection: aMOAngularModule declarationUnits.
			  self visitCollection: aMOAngularModule types ] ]
]

{ #category : #visiting }
MOModelAngularExporter >> visitAngularProject: aMOAngularProject [

	self
		useDirectoryFor: aMOAngularProject fileReference basename
		during: [ 
			aMOAngularProject fileReference / #assets copyTo:
				destinationDirectory / #assets.
			aMOAngularProject fileReference / #environments copyTo:
				destinationDirectory / #environments.
			aMOAngularProject fileReference / #app copyTo:
				destinationDirectory / #app.
			aMOAngularProject fileReference files do: [ :f | 
				f copyTo: destinationDirectory / f basename ].
			self
				useDirectoryFor: aMOAngularProject prefix
				during: [ self visitCollection: aMOAngularProject packages ] ]
]

{ #category : #visiting }
MOModelAngularExporter >> visitAngularScheme: aMOAngularScheme [

	(aMOAngularScheme fileReference entries
		 reject: [ :a | a basename = #src ]
		 thenCollect: #asFileReference) do: [ :f | 
		f copyTo: destinationDirectory / f basename ].


	self visitCollection: aMOAngularScheme projects
]

{ #category : #visiting }
MOModelAngularExporter >> visitAngularService: aMOAngularService [

	self visitCollection: { aMOAngularService behavior }
]

{ #category : #visiting }
MOModelAngularExporter >> visitAngularTemplateDocument: aMOAngularTemplateDocument [

	(destinationDirectory / ('{1}.component.html ' format:
				  { aMOAngularTemplateDocument parent name })) ensureCreateFile
		writeStream
		nextPutAll: aMOAngularTemplateDocument produceCode;
		flush;
		close
]
