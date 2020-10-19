Class {
	#name : #MOAngularServiceWriter,
	#superclass : #Object,
	#instVars : [
		'service',
		'binding',
		'dataEntity'
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
MOAngularServiceWriter >> visitRelationalTable: aMDRelationalTable [
	service := MOTypescriptClass new.
	service name: aMDRelationalTable compilableTypeIdentifier , 'Service'.
	service
		decorator:
			MOTypescriptPrebuiltTypeReferenceFactory default
				injectableProvidedAtRoot.
	service
		addProperty:
			(MOTypescriptVariable new
				visibility: #private;
				name: 'serviceUrl';
				type: MOTypescriptPrebuiltTypeReferenceFactory default string;
				defaultValue:
					(MOTypescriptLiteral new
						literal: '"api/heros"';
						yourself);
				yourself).
	service
		addMethod:
			((self methodFactory getElementsMethod: dataEntity url: 'serviceUrl')
				setOwnerClass: service;
				yourself).
	binding binding allowEdits
		ifTrue: [ service
				addMethod:
					((self methodFactory editElementsMethod: dataEntity url: 'serviceUrl')
						setOwnerClass: service;
						yourself) ].
	binding binding allowAdditions
		ifTrue: [ service
				addMethod:
					((self methodFactory addElementsMethod: dataEntity url: 'serviceUrl')
						setOwnerClass: service;
						yourself) ].
	binding binding allowDeletions
		ifTrue: [ service
				addMethod:
					((self methodFactory
						deleteElementsMethod: dataEntity
						url: 'serviceUrl')
						setOwnerClass: service;
						yourself) ].
	binding binding allowFilters
		ifTrue: [ service
				addMethod:
					((self methodFactory
						filterElementsMethod: dataEntity
						url: 'serviceUrl')
						setOwnerClass: service;
						yourself) ]
]

{ #category : #'as yet unclassified' }
MOAngularServiceWriter >> visitRelationalView: aMDRelationalView [
	service := MOTypescriptClass new.
	service name: aMDRelationalView compilableTypeIdentifier , 'Service'.
	service
		decorator:
			MOTypescriptPrebuiltTypeReferenceFactory default
				injectableProvidedAtRoot.
	service
		addProperty:
			(MOTypescriptVariable new
				visibility: #private;
				name: 'serviceUrl';
				type: MOTypescriptPrebuiltTypeReferenceFactory default string;
				defaultValue:
					(MOTypescriptLiteral new
						literal: '"api/heros"';
						yourself);
				yourself).
	service
		addMethod:
			((self methodFactory
				getElementsMethod: dataEntity
				url: 'serviceUrl')
				setOwnerClass: service;
				yourself).
	binding binding allowEdits
		ifTrue: [ service
				addMethod:
					((self methodFactory
						editElementsMethod: dataEntity
						url: 'serviceUrl')
						setOwnerClass: service;
						yourself) ].
	binding binding allowAdditions
		ifTrue: [ service
				addMethod:
					((self methodFactory
						addElementsMethod: dataEntity
						url: 'serviceUrl')
						setOwnerClass: service;
						yourself) ].
	binding binding allowDeletions
		ifTrue: [ service
				addMethod:
					((self methodFactory
						deleteElementsMethod: dataEntity
						url: 'serviceUrl')
						setOwnerClass: service;
						yourself) ].
	binding binding allowFilters
		ifTrue: [ service
				addMethod:
					((self methodFactory
						filterElementsMethod: dataEntity
						url: 'serviceUrl')
						setOwnerClass: service;
						yourself) ]
]

{ #category : #writing }
MOAngularServiceWriter >> writeServiceFor: aMDDataBinding for: aDataEntity [
	dataEntity := aDataEntity .
	binding := aMDDataBinding.
	aMDDataBinding accept: self.
	^ MOAngularProtoClass new
		setClass: service;
		yourself
]
