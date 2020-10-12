Class {
	#name : #MOAngularServiceWriter,
	#superclass : #Object,
	#instVars : [
		'service',
		'binding'
	],
	#category : #'Moxing-CodeWritingTypescript'
}

{ #category : #'as yet unclassified' }
MOAngularServiceWriter >> methodFactory [
	^ MOAngularPrebuiltMethodFactory new 
]

{ #category : #'as yet unclassified' }
MOAngularServiceWriter >> visitDataBinding: aMODataBindingAttribute [
	aMODataBindingAttribute binding entity accept: self
]

{ #category : #'as yet unclassified' }
MOAngularServiceWriter >> visitRelationalView: aMDRelationalView [
	service := MOTypescriptClass new.
	service name: aMDRelationalView compilableTypeIdentifier , 'Service'.
	service
		addImport:
			(MOTypescriptImport new
				types: {(MOTypescriptTypeReference new name: 'Injectable')};
				from: '@angular/core' asFileReference).
	service decorator: MOTypescriptDecorator new.
	service decorator name: 'Injectable'.
	service decorator attributes at: #providedIn put: 'root'.
	service
		addProperty:
			(MOTypescriptVariable new
				visibility: #private;
				name: 'serviceUrl';
				type:
					(MOTypescriptTypeReference new
						name: 'string';
						yourself);
				defaultValue:
					(MOTypescriptLiteral new
						literal: '"api/heros"';
						yourself);
				yourself).
	service
		addMethod:
			((self methodFactory
				getElementsMethod: aMDRelationalView compilableTypeIdentifier
				url: 'serviceUrl')
				setOwnerClass: service;
				yourself).
	binding allowEdits
		ifTrue: [ service
				addMethod:
					((self methodFactory
						editElementsMethod: aMDRelationalView compilableTypeIdentifier
						url: 'serviceUrl')
						setOwnerClass: service;
						yourself) ].
	binding allowAdditions
		ifTrue: [ service
				addMethod:
					((self methodFactory
						addElementsMethod: aMDRelationalView compilableTypeIdentifier
						url: 'serviceUrl')
						setOwnerClass: service;
						yourself) ].
	binding allowDeletions
		ifTrue: [ service
				addMethod:
					((self methodFactory
						deleteElementsMethod: aMDRelationalView compilableTypeIdentifier
						url: 'serviceUrl')
						setOwnerClass: service;
						yourself) ].
	binding allowFilters
		ifTrue: [ service
				addMethod:
					((self methodFactory
						filterElementsMethod: aMDRelationalView compilableTypeIdentifier
						url: 'serviceUrl')
						setOwnerClass: service;
						yourself) ]
]

{ #category : #writing }
MOAngularServiceWriter >> writeServiceFor: aMDDataBinding [
	binding := aMDDataBinding.
	aMDDataBinding accept: self.
	^ MOAngularProtoClass new
		setClass: service;
		yourself
]
