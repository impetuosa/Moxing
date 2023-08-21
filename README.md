# Moxing - ReadMe
## Manifest
Moxing is model implemented responding to the modelling discussions contributed by the thesis of Santiago Bragagnolo [https://hal.science/tel-04132315v1](https://hal.science/tel-04132315v1).
Moxing is an Heterogeneous Unified Meta-Models (HUMM) with the computational representation known as Abstract Semantic Graph (ASG).
## Modelling 
 A heterogeneous meta-model represents common concepts only once, allowing developers to define unique extensions for each language
### ASG 
Let us suppose the factorial function. 
Visual Basic Applications version 
```vba
Function factorial (i as Integer) as Integer
 If i = 0 Then
 return 1
 Else
 return i * (factorial( i - 1))
 End If
 End Function
```
Java version
```java
Class MyClass {
 static int factorial (int i) {
 if (i == 0) {
 return 1
 } else {
 return i * (MyClass.factorial( i − 1))
 }
}
```
Given these two pieces of code, we can consider the figures:
 1- ASG of the VBA version of the source code.
 
![ASG-VBA](https://github.com/impetuosa/Moxing/blob/master/resources/asg-vba.jpg?raw=true).
 
 2- ASG of the Java version of the source code. 
 
![ASG-JAVA](https://github.com/impetuosa/Moxing/blob/master/resources/asg-java.jpg?raw=true).
 Both ASGs are highly similar. Each node in the graph
is represented as a box; its composition is represented by including a box inside
another box. Each pattern used for drawing the box indicates a different kind of
object in terms of role. The only arrows drawn are the ones that turn it into an ASG.

### Concepts 
The basic structuring concepts From a grammatical and syntactical point of
view, we often find three main concepts: Declarations, Statements and Expressions.
A **Declaration** is any construction that structures and names an artefact. e.g. Type, Class, Module, Function, etc. 
A **Statement** is any construction that structures and carry on some behaviour. e.g. control flow structures such as if, while, etc. 
An **Expression** is any construction that carries out some behaviour and yields a value. e.g. Assignment, built-in operators, primitive call, function invocations, etc.
Since we add the linking dimension to jump into ASG structure, we take into
account a fourth concept: the Reference.
A **Reference** is any construction that refers to some artefact defined elsewhere.
e.g. Function invocation, message-send, typed variable declarations, etc. In contrast with the reference, we add Grammatical, any construction that bases its behaviour on its grammatical structure instead of a referred artefact.
In this meta-model, we find each of these core elements. 
All the core elements inherit from LanguageObject. LanguageObject class defines default
behaviours and minimal structures: All entities in our model have a parent and
a language. The parent indicates where the node was declared. It reinforces the
hierarchical nature of our structure. The language is used to declare the element’s
language and is used by the element as an oracle to know if a relation between this
and another object is incorrect.
We also find the meta-model entities required to represent the
factorial ASG in Java and Microsoft Access. We observe that a large majority of
meta-model entities are used for both languages, but some of the entities are only
used in one language.
### Relations 
In our model, we typify the relations to understand the nature of the relation between concepts. We recognise seven kinds of relations: Parent, Declares, States, Express, Refers, Referee and Property. None of these relations entangles any static typing.
**Parent** This relation is expected to relate an object with the object where the
first exists: defined, declared, used, etc. For example, a method can have a class as
a parent. A binary expression is the parent of the left-hand and right-hand expressions.
**Declares** Describes the relation between a “declarer” entity (often a declaration
that works as scope) and a “declared” entity. A class declares methods. It is the
opposite relation to the parent relation.
**States** Describes the relation between a “stating” entity (often a declaration that
works as scope) and a “stated” entity. A function states a while statement. It is the
opposite relation to the parent relation.
**Expresses** Describes the relationship between an “expressing” entity and an
“expressed” entity. e.g. an “if statement” expresses a condition. It is the opposite
relation to the parent relation.
**Refers** Describes the relation between a “referrer” entity and a “referring” entity. A variable declaration refers to a type reference.
**Referee** Describes the relation between a “referring” entity and a “referred”
entity. A type reference “referee” a type. A function invokation “referee” a function.
**Property** Describes the relation between an entity and any other terminal object.
e.g. A class has a property “name” with the name of the class. A function has a
selector.

## Languages
The current state of the Moxing model covers all code in Microsoft Access.
An almost complete cover of the Java language. 
A complete cover of the smalltalk languages Pharo and Cincom Visual Works. 
A reduced cover of Typescript and Angular framework.

## Main features
Moxing is a relation based model, where the relations are probably the most important concept. 
Moxing provides a complete suit of writers and builders that allow to write and build models. 
Moxing also provides copy mechanisms, which allows to regenerate a part of a source model within a specific target model enitity. 

## Importers 
Moxing currently has few importers:
 * JinDAM importer for importing Microsoft Access projects (MOJinDAMImporter).
 * Maven-Java importer for importing Java maven managed projects (MOJavaMavenProjectLoader).
 * Chunk-Visualworks importer for importing packages extracted in chunck format from Visual Works (MOVisualWorksChunkImporter).
 * Pharo reflective API importer for importing packages defined in the Pharo running image (MORBPharoImporter). 
 * Angular Typescript importer for importing projects defined with Angular and Typescript projects (MOAngularLoader) .


















## Load
```smalltalk
loadAddBaseline
	| spec |
	spec
		baseline: 'Moxing'
		with: [ 
		spec repository: 'github://impetuosa/Moxing:v1.x.x/src' ]
```
```smalltalk
loadMetacello
	  Metacello new
    	githubUser: 'Impetuosa' project: 'Moxing' commitish: 'v1.x.x' path: 'src';
    	baseline: 'Moxing';
    	onWarningLog;
    	load
	
```

## Project Examples
```smalltalk
exampleLoadPharoProject
	| calypso phary |
	"Pharo importer is based on the reflective features of Pharo. We use largely the RefactoringBrowser AST "
	
	" 
		The following example loads strictly the package Calypso. It does not include any Kernel object. 
		As pharo is not typed, it would be extremely hard to infer which dependencies are to be loaded. So you are expected to load them manually, by listing them in the importPackages method's parameter. 
		
		We note that the importPackages method can be executed multiple times. 
	"
	
	"1- Create model for pharo "
	calypso := MOModel newPharo.
	calypso name: #Calypso.
	"2- Create model importer for pharo "
	phary := MORBPharoImporter new.
	
	"3- The importer requires a model writer instead of a model"
	phary writer: calypso writer.
	phary importPackages:
		((RPackageOrganizer default packageNames select: [ :a | 
			  a beginsWith: #Calypso ]) collect: #asPackageOrTag).
		
		
	^ calypso
```
```smalltalk
exampleTransverseRelations
 
```
```smalltalk
exampleLoadNorthwind
	| dam moxing importer |
	
	"1- To load a Microsoft Access project into a Moxing model we need a DAM model. "
	dam := self northwindDAM.
	
	"2- Instanciate an DAM importer. "
	importer := MOJinDAMImporter new.
	"3- Create an instance of a MOModel, configured to deal with Microsoft Access language details . "
	moxing := MOModel newMicrosoftAccess.
	moxing name: #Northwind. 
	"4- Configure the importer with the model to use for importing. "
	importer model: moxing.
	"5- Import the DAM model. "
	importer import: dam.
	"6- Now the model is filled up with the Northwind project information. "
	moxing inspect.
	
	^ moxing
```
```smalltalk
exampleHandWriteSimpleModel
	| model variable method parameter |
	model := MOModel newPharo.
	
	model name: #Example.
   	 "
		1- Get a model writer. This writer allows the user to create any of the main root elements such as package.
	 "
	model writer
		writePackage: [ :pack | 
		"
			2- The pack variable points to a package writer instance. which allows not only to configurate the package, but also to write sub elements.  
		"
			pack name: 'Example'.
			pack writeStClass: [ :class | 
		" 
			3- class variable points to a smalltalk class writer. Once this block is finished, the class writer will tell to the package writer to add this just created class to it.
		"
					class name: #Example.
		" 
			4- As we are writting a smalltalk class, the writer allows to write a metaclass. 
		"
					class writeMetaclass: [ :mclass | 
							mclass name: 'Example class'.
		" 
			5- Metaclasses are also classes. Can have attributes.
		"
							mclass writeAttribute: [ :classSideVariable | 
									classSideVariable name: 'variable' ] ].
		" 
			6- a write message (such as writeAttribute or writeMethod) yields an actual object (not a writer) which can be used. 
		"
					variable := class writeAttribute: [ :attribute | 
							            attribute name: 'value' ].
					method := class writeMethod: [ :m | 
							          m selector: #value:.
							          parameter := m writeParameter: [ :p | 
									                       p name: #aValue ].
							          m writeBlock: [ :block | 
		" 
			7- Please note that the statement writen in the next writer is an assignment. 
		"
									          block writeStatement: [ :st | 
											          st
												          let: [ :expr | 
													          (expr variableReferenceNamed: variable name) 
														          referee: variable ]
												          beAssignedWith: [ :expr | 
													          (expr variableReferenceNamed: parameter name) 
														          referee: parameter ] ] ] ] ] ];
		" 
			8- the populateAnchorOn: will connect all elements with their parents. 
		"
		populateAnchorOn: model root.
	model inspect.
	^ model
```
```smalltalk
exampleLoadAngularTsSimpleProject
	
	| importer moxing |
	
	" 
	This importer is an Angular TS importer. 
	It imports the Angular meta data and simultaneously uses it to load and link the different artefacts (either angular or ts)
	"
	importer := MOAngularLoader  new.
	importer workingDirectory: self angularProjectPath.
	moxing := importer loadNamed: #AngularProject.
	moxing inspect.
	^ moxing
```
```smalltalk
exampleLoadJavaMavenProject
	| importer moxing |
	
	" 
		This loader requires maven and java installed. 
		The loader will use maven to query all the dependencies. 
		The loader will use the java compiler to export the API/ABI of all the dependencies
		
	"
	importer := MOJavaMavenProjectLoader new.
	importer workingDirectory: self javaProjectPath.
	moxing := importer loadNamed: #JavaProject.
	moxing inspect.
	^ moxing
	
```
```smalltalk
exampleLoadNorthwindFromFile
	| moxing |
	" This recipy works for any model, regardless the language. "
	moxing := MOModel loadFrom: self northwindModelPath.
	moxing inspect.
	^ moxing
```
```smalltalk
exampleCopySimpleModel
```



