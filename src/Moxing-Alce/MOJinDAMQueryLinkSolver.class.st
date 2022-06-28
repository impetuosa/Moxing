Class {
	#name : #MOJinDAMQueryLinkSolver,
	#superclass : #Object,
	#instVars : [
		'relations',
		'tables',
		'queries',
		'query',
		'from',
		'selectedCols',
		'writer'
	],
	#category : #'Moxing-Alce'
}

{ #category : #'instance creation' }
MOJinDAMQueryLinkSolver >> applyOn: aMOProject [

	tables := aMOProject allTypes select: [ :a | a isTable ].
	queries := aMOProject allTypes select: [ :a | a isQuery ].
	self visitCollection: queries.
	self visitCollection: relations.
]

{ #category : #'as yet unclassified' }
MOJinDAMQueryLinkSolver >> detectColumnFor: anObject [

	^ from flatCollect: [ :f | 
		  f attributes
			  select: [ :a | 
				  anObject isWildCard or: [ 
					  a name asLowercase = (self readIdentifier: anObject) ] ]
			  thenCollect: [ :a | f -> a ] ]
]

{ #category : #'as yet unclassified' }
MOJinDAMQueryLinkSolver >> detectColumnFor: anObject inTableNamed: aString [

	aString ifNil: [ ^ self detectColumnFor: anObject ].
	(from at: aString ifAbsent: [ nil ]) ifNil: [ ^ {  } ].
	^ (from at: aString) attributes
		  select: [ :a | 
			  anObject isWildCard or: [ 
				  a name asLowercase = (self readIdentifier: anObject) ] ]
		  thenCollect: [ :a | (from at: aString) -> a ]
]

{ #category : #'as yet unclassified' }
MOJinDAMQueryLinkSolver >> readIdentifier: aPSQLASTIdentifier [

	^ (aPSQLASTIdentifier identifier copyReplaceAll: '"' with: '')
		  asLowercase
]

{ #category : #accessing }
MOJinDAMQueryLinkSolver >> relations: aCollection [

	relations := aCollection
]

{ #category : #visiting }
MOJinDAMQueryLinkSolver >> visitCollection: aCollection [

	^ aCollection collect: [ :a | a acceptVisitor: self ]
]

{ #category : #visiting }
MOJinDAMQueryLinkSolver >> visitPSQASTNull: aPSQLASTNull [

	^ {  }
]

{ #category : #visiting }
MOJinDAMQueryLinkSolver >> visitPSQLASTAggregateFunctionCall: aPSQLASTAggregateFunctionCall [

	^ {  }
]

{ #category : #visiting }
MOJinDAMQueryLinkSolver >> visitPSQLASTAliasDefinition: aPSQLASTAliasDefinition [

	| cols name |
	name := aPSQLASTAliasDefinition alias identifier.
	cols := aPSQLASTAliasDefinition definition acceptVisitor: self.
	self assert: cols size < 2.

	cols ifNotEmpty: [ 
		selectedCols removeKey: cols first value name.
		selectedCols at: name put: cols first ]
]

{ #category : #visiting }
MOJinDAMQueryLinkSolver >> visitPSQLASTAttributeAccess: aPSQLASTAttributeAccess [

	| cols |
	aPSQLASTAttributeAccess attributeIdentifier
		ifNil: [ 
		cols := self detectColumnFor: aPSQLASTAttributeAccess accessed ]
		ifNotNil: [ 
			cols := self
				        detectColumnFor:
				        aPSQLASTAttributeAccess attributeIdentifier
				        inTableNamed:
					        (aPSQLASTAttributeAccess accessed ifNotNil: [ :a | 
						         self readIdentifier: a ]) ].
	cols do: [ :a | selectedCols at: a value name put: a ].
	^ cols
]

{ #category : #visiting }
MOJinDAMQueryLinkSolver >> visitPSQLASTBinaryOperator: aPSQLASTBinaryOperator [

	^ {  }
]

{ #category : #visiting }
MOJinDAMQueryLinkSolver >> visitPSQLASTFromClause: aPSQLASTFromClause [ 
	self visitCollection: aPSQLASTFromClause items 
]

{ #category : #visiting }
MOJinDAMQueryLinkSolver >> visitPSQLASTFromClauseItemType1: aPSQLASTFromClauseItemType1 [

	from
		at: (self readIdentifier: (aPSQLASTFromClauseItemType1 hasAlias
					  ifTrue: [ aPSQLASTFromClauseItemType1 alias ]
					  ifFalse: [ aPSQLASTFromClauseItemType1 tableName ]))
		put: (tables
				 detect: [ :t | 
					 t name asLowercase
					 = (self readIdentifier: aPSQLASTFromClauseItemType1 tableName) ]
				 ifNone: [ 
					 queries
						 detect: [ :t | 
							 t name asLowercase
							 = (self readIdentifier: aPSQLASTFromClauseItemType1 tableName) ]
						 ifNone: [ nil ] ])
]

{ #category : #visiting }
MOJinDAMQueryLinkSolver >> visitPSQLASTFromClauseItemType2: aPSQLASTFromClauseItemType2 [

	^ {  }
]

{ #category : #visiting }
MOJinDAMQueryLinkSolver >> visitPSQLASTFromClauseItemType6: aPSQLASTFromClauseItemType6 [

	aPSQLASTFromClauseItemType6 rightFromItem acceptVisitor: self.
	aPSQLASTFromClauseItemType6 leftFromItem acceptVisitor: self
]

{ #category : #visiting }
MOJinDAMQueryLinkSolver >> visitPSQLASTFunctionCall: aPSQLASTFunctionCall [

	^ {  }
]

{ #category : #visiting }
MOJinDAMQueryLinkSolver >> visitPSQLASTNumericConstant: aPSQLASTNumericConstant [

	^ {  }
]

{ #category : #visiting }
MOJinDAMQueryLinkSolver >> visitPSQLASTParenthesedExpression: aPSQLASTParenthesedExpression [ 
	 ^ aPSQLASTParenthesedExpression expression acceptVisitor: self 
]

{ #category : #visiting }
MOJinDAMQueryLinkSolver >> visitPSQLASTPostfixOperator: aPSQLASTPostfixOperator [

	^ aPSQLASTPostfixOperator expression acceptVisitor: self
]

{ #category : #visiting }
MOJinDAMQueryLinkSolver >> visitPSQLASTPrefixOperator: aPSQLASTPrefixOperator [

	^ {  }
]

{ #category : #visiting }
MOJinDAMQueryLinkSolver >> visitPSQLASTSelectIntoQuery: aPSQLASTSelectIntoQuery [

	aPSQLASTSelectIntoQuery fromClause acceptVisitor: self.
	self visitCollection:
		aPSQLASTSelectIntoQuery columnsAndAliasesSelected.
	^ selectedCols
]

{ #category : #visiting }
MOJinDAMQueryLinkSolver >> visitPSQLASTSelectQuery: aPSQLASTSelectQuery [

	aPSQLASTSelectQuery fromClause ifNil: [ ^ {  } ].
	aPSQLASTSelectQuery fromClause acceptVisitor: self.
	self visitCollection: aPSQLASTSelectQuery columnsAndAliasesSelected.
	^ selectedCols
]

{ #category : #visiting }
MOJinDAMQueryLinkSolver >> visitPSQLASTStringConstant: aPSQLASTStringConstant [

	^ {  }
]

{ #category : #visiting }
MOJinDAMQueryLinkSolver >> visitPSQLASTWildCard: aPSQLASTWildCard [

	| cols |
	self assert: from size = 1.
	cols := self detectColumnFor: aPSQLASTWildCard.
	cols do: [ :a | selectedCols at: a value name put: a ].
	^ cols
]

{ #category : #visiting }
MOJinDAMQueryLinkSolver >> visitQuery: aMOAlceQuery [

	query := aMOAlceQuery.
	from := Dictionary new.
	selectedCols := Dictionary new.
	[ 
	(PostgreSQLParser parseSelectQuery: aMOAlceQuery sql toPG) 
		acceptVisitor: self.

	selectedCols ifNotEmpty: [ 
		writer updateQuery: aMOAlceQuery with: [ :modQuery | 
			selectedCols keysAndValuesDo: [ :key :value | 
				modQuery writeExpression: [ :exp | 
					(exp accessAttribute: key receiver: [ :er | 
							 (er typeReferenceNamed: value key name)
								 candidate: value key;
								 yourself ])
						candidate: value value;
						yourself ] ] ] ] ]
		on: PSQLParseError
		do: [ :e | "self halt""nothing " ]
]

{ #category : #visiting }
MOJinDAMQueryLinkSolver >> visitTableRelation: aJinDAMTableRelation [

	| relFrom relTo pairs |
	relFrom := tables detect: [ :t | 
		           t name asLowercase
		           = aJinDAMTableRelation sourceTable asLowercase ].
	relTo := tables detect: [ :t | 
		         t name asLowercase
		         = aJinDAMTableRelation foreignTable asLowercase ].
	pairs := aJinDAMTableRelation matches collect: [ :m | 
		         (relFrom attributes detect: [ :fa | 
			          fa name asLowercase = m first asLowercase ])
		         -> (relTo attributes detect: [ :fa | 
				          fa name asLowercase = m second asLowercase ]) ].

	writer updateTable: relFrom with: [ :modifyingTable | 
		modifyingTable writeExpression: [ :exp | 
			exp
				foreignRelation: [ :fr | 
					(fr typeReferenceNamed: relFrom name)
						candidate: relFrom;
						yourself ]
				to: [ :tr | 
					(tr typeReferenceNamed: relTo name)
						candidate: relTo;
						yourself ]
				matches: [ :m | 
					pairs collect: [ :assoc | 
						| pk fk |
						pk := assoc key.
						fk := assoc value.
						m
							matchPrimaryKey:
								((m accessAttribute: pk name receiver: [ :rex | 
										  (rex typeReferenceNamed: relFrom name)
											  candidate: relFrom;
											  yourself ])
									 candidate: pk;
									 yourself)
							foreignKey: ((m accessAttribute: fk name receiver: [ :rex | 
										  (rex typeReferenceNamed: relTo name)
											  candidate: relTo;
											  yourself ])
									 candidate: fk;
									 yourself) ] ] ] ].


	writer updateTable: relTo with: [ :modifyingTable | 
		modifyingTable writeExpression: [ :exp | 
			exp
				foreignRelation: [ :fr | 
					(fr typeReferenceNamed: relFrom name)
						candidate: relFrom;
						yourself ]
				to: [ :tr | 
					(tr typeReferenceNamed: relTo name)
						candidate: relTo;
						yourself ]
				matches: [ :m | 
					pairs collect: [ :assoc | 
						| pk fk |
						pk := assoc key.
						fk := assoc value.
						m
							matchPrimaryKey:
								((m accessAttribute: pk name receiver: [ :rex | 
										  (rex typeReferenceNamed: relFrom name)
											  candidate: relFrom;
											  yourself ])
									 candidate: pk;
									 yourself)
							foreignKey: ((m accessAttribute: fk name receiver: [ :rex | 
										  (rex typeReferenceNamed: relTo name)
											  candidate: relTo;
											  yourself ])
									 candidate: fk;
									 yourself) ] ] ] ]
]

{ #category : #accessing }
MOJinDAMQueryLinkSolver >> writer: aMOModelWriter [

	writer := aMOModelWriter
]
