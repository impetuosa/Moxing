Class {
	#name : #MOTypescriptModelReader,
	#superclass : #MOModelReader,
	#category : #'Moxing-Typescript'
}

{ #category : #visiting }
MOTypescriptModelReader >> instantiateLangAware: aClass [

	^ aClass newForTypescriptIn: model
]

{ #category : #visiting }
MOTypescriptModelReader >> read: anEntity [
	read := anEntity copy
]
