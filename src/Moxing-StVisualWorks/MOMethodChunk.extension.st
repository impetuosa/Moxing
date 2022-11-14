Extension { #name : #MOMethodChunk }

{ #category : #'*Moxing-StVisualWorks' }
MOMethodChunk class >> contents: someContents packageName: packageName behaviorName: behaviorName isMeta: isMeta category: categoryName stamp: stamp [

	^ self new
		  contents: someContents;
		  behaviorName: behaviorName;
		  packageName: packageName;
		  isMeta: isMeta;
		  category: categoryName;
		  stamp: stamp;
		  yourself
]
