Extension { #name : #MOExpressionWriter }

{ #category : #'*Moxing-Access' }
MOExpressionWriter >> foreignRelation: aFromTableAccessBlock to: aToTableAccessBlock matches: aMatchesBlock [

	^ builder foreignRelationBuilder
		  tableFrom: (self writeExpression: aFromTableAccessBlock);
		  tableTo: (self writeExpression: aToTableAccessBlock);
		  matches: (self writeExpression: aMatchesBlock);
		  build
]

{ #category : #'*Moxing-Access' }
MOExpressionWriter >> matchPrimaryKey: aMOPk foreignKey: aMOFk [

	^ builder foreignRelationMatchBuilder
		  primaryKey: aMOPk;
		  foreignKey: aMOFk;
		  build
]
