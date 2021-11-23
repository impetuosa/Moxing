Class {
	#name : #MOTypescriptModelReader,
	#superclass : #MOModelReader,
	#category : #'Moxing-Typescript'
}

{ #category : #visiting }
MOTypescriptModelReader >> instantiateLangAware: aClass [

	^ aClass newForTypescriptIn: model
]
