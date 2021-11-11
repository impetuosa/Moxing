Class {
	#name : #MOAngularPrebuiltMethodFactory,
	#superclass : #Object,
	#category : #'Moxing-Angular-Model'
}

{ #category : #'as yet unclassified' }
MOAngularPrebuiltMethodFactory >> addElementsMethod: aType url: anUrlVariable [
	| method |
	method := MOTemplatedMethod new
		selector: ('add{1}' format: {aType name});
		addParameter:
			(MOVariable new
				name: 'object';
				type: aType);
		body:
			('
  return this.http.post<{1}>(this.{2}, object, this.httpOptions).pipe(
		catchError(this.handleError<{1}>("add{1}"))
  );
'
				format:
					{aType.
					anUrlVariable});
		type: (self observable: aType).
	method
		dependsOn: MOTypescriptPrebuiltTypeReferenceFactory default catchError.
	^ method
]

{ #category : #'as yet unclassified' }
MOAngularPrebuiltMethodFactory >> deleteElementsMethod: aType url: anUrlVariable [
	| method |
	method := MOTemplatedMethod new
		selector: ('delete{1}' format: {aType name});
		addParameter:
			(MOVariable new
				name: 'object';
				type: aType);
		body:
			(' 
 const id = object.getId();
 const url = `$\{this.{2}\}/$\{id\}`;
 return this.http.delete<{1}>(url, this.httpOptions).pipe(
     catchError(this.handleError<{1}>("delete{1}"))
 );
			'
				format:
					{aType name .
					anUrlVariable});
		type: (self observable: aType).
	method
		dependsOn: MOTypescriptPrebuiltTypeReferenceFactory default catchError.
	^ method
]

{ #category : #'as yet unclassified' }
MOAngularPrebuiltMethodFactory >> editElementsMethod: aType url: anUrlVariable [
	| method |
	method := MOTemplatedMethod new
		selector: ('update{1}' format: {aType name});
		addParameter:
			(MOVariable new
				name: 'object';
				type: aType);
		body:
			(' 
return this.http.put(this.{2}, object, this.httpOptions).pipe(
  catchError(this.handleError<any>("update{1}"))
);'
				format:
					{aType name.
					anUrlVariable});
		type: self observableAny.
	method
		dependsOn: MOTypescriptPrebuiltTypeReferenceFactory default catchError.
	^ method
]

{ #category : #'as yet unclassified' }
MOAngularPrebuiltMethodFactory >> emptyConstructorArguments: aCollection [
	^ MOTemplatedConstructor new
		parameters: aCollection;
		body: ' ';
		yourself
]

{ #category : #'as yet unclassified' }
MOAngularPrebuiltMethodFactory >> filterElementsMethod: aType url: anUrlVariable [
	| method |
	method := MOTemplatedMethod new
		selector: ('search{1}' format: {aType name});
		addParameter:
			(MOVariable new
				name: 'filter';
				type: MOTypescriptPrebuiltTypeReferenceFactory default string);
		body:
			(' 
if (!filter.trim()) \{
   return of([]);
\}
return this.http.get<{1}[]>(`$\{this.{2}\}/?filter=$\{filter\}`).pipe(
  catchError(this.handleError<{1}[]>("search{1}", []))
);
			'
				format:
					{aType name.
					anUrlVariable});
		type: (self observableArrayOf: aType).
	method
		dependsOn: MOTypescriptPrebuiltTypeReferenceFactory default catchError.
	method dependsOn: MOTypescriptPrebuiltTypeReferenceFactory default of.
	^ method
]

{ #category : #'as yet unclassified' }
MOAngularPrebuiltMethodFactory >> getElementsMethod: aType url: anUrlVariable [
	| obtainElementsMethod |
	obtainElementsMethod := MOTemplatedMethod new
		selector: ('getAll{1}' format: {aType name});
		body:
			(' 
return this.http.get<{1}[]>(this.{2}).pipe(
   catchError(this.handleError<{1}[]>("getAll{1}", []))
);'
				format:
					{aType name.
					anUrlVariable});
		type: (self observableArrayOf: aType).
	^ obtainElementsMethod
]

{ #category : #'as yet unclassified' }
MOAngularPrebuiltMethodFactory >> getter: aName property: aProperty [
	| obtainElementsMethod |
	obtainElementsMethod := MOTemplatedMethod new
		selector: ('get{1}' format: {aName});
		body:
			(' 
return this.{1}; 
' format: {aProperty name});
		type: aProperty type.
	^ obtainElementsMethod
]

{ #category : #'as yet unclassified' }
MOAngularPrebuiltMethodFactory >> getter: aName type: aType [
	| obtainElementsMethod |
	obtainElementsMethod := MOTemplatedMethod new
		selector: ('get{1}' format: {aName});
		body:
			(' 
return this.{1}; 
' format: {aType name});
		type: aType.
	^ obtainElementsMethod
]

{ #category : #'as yet unclassified' }
MOAngularPrebuiltMethodFactory >> handleError [
	| handleErrorMethod |
	handleErrorMethod := MOTemplatedMethod new
		visibility: #private;
		selector: 'handleError<T>';
		yourself.
	handleErrorMethod
		addParameter:
			(MOVariable new
				name: 'operation';
				type: MOTypescriptPrebuiltTypeReferenceFactory default string;
				defaultValue:
					(MOLiteral new
						literal: '"operation"';
						yourself);
				yourself);
		addParameter:
			(MOVariable new
				name: 'result?';
				type: MOTypescriptPrebuiltTypeReferenceFactory default T;
				yourself).
	handleErrorMethod
		body:
			' 
  return (error: any): Observable<T> => {

      // TODO: send the error to remote logging infrastructure
      console.error(error); // log to console instead
      // Let the app keep running by returning an empty result.
      return of(result as T);
    };
'.
	^ handleErrorMethod
]

{ #category : #'as yet unclassified' }
MOAngularPrebuiltMethodFactory >> observable: aType [
	^ MOTypescriptPrebuiltTypeReferenceFactory default observable: aType
]

{ #category : #'as yet unclassified' }
MOAngularPrebuiltMethodFactory >> observableAny [
	^ MOTypescriptPrebuiltTypeReferenceFactory default observableAny
]

{ #category : #'as yet unclassified' }
MOAngularPrebuiltMethodFactory >> observableArrayOf: aType [
	^ MOTypescriptPrebuiltTypeReferenceFactory default observableArrayOf: aType
]
