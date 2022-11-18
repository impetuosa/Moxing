Class {
	#name : #MOMethodChunk,
	#superclass : #MethodChunk,
	#instVars : [
		'packageName'
	],
	#category : #'Moxing-StVisualWorks-CodeImport'
}

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

{ #category : #accessing }
MOMethodChunk >> packageName [

	^ packageName
]

{ #category : #accessing }
MOMethodChunk >> packageName: anObject [

	packageName := anObject
]
