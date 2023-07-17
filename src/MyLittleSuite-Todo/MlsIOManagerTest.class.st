Class {
	#name : #MlsIOManagerTest,
	#superclass : #TestCase,
	#instVars : [
		'filesystem',
		'emptyFilesystem',
		'file'
	],
	#category : #'MyLittleSuite-Todo-Model'
}

{ #category : #initialization }
MlsIOManagerTest >> fillUpTasksStonFile [
	
	^ self tasksStonFile 
			writeStreamDo: [ :stream | stream nextPutAll: self tasksStonFileContents ];
		yourself
]

{ #category : #initialization }
MlsIOManagerTest >> setUp [
	
	super setUp.
	filesystem := FileSystem memory.
	(filesystem workingDirectory / 'TodoFiles') ensureCreateDirectory.
	self fillUpTasksStonFile
	
]

{ #category : #tests }
MlsIOManagerTest >> tasksStonFile [

	^ (filesystem workingDirectory / 'TodoFiles' / 'tasks.ston') 
]

{ #category : #initialization }
MlsIOManagerTest >> tasksStonFileContents [
	"STON toStringPretty: MlsTaskDB tasks"
	
	^ 'OrderedCollection [
	MlsTask {
		#done : true,
		#title : ''Gitane''
	},
	MlsTask {
		#done : true,
		#title : ''gonflage pneus''
	},
	MlsTask {
		#done : true,
		#title : ''PMI: 106 rue pierre legrand''
	},
	MlsTask {
		#done : true,
		#title : ''Chercher mac''
	},
	MlsTask {
		#done : true,
		#title : ''98 euros dms -> devis''
	},
	MlsTask {
		#done : true,
		#title : ''Contact Quanteos''
	},
	MlsTask {
		#done : true,
		#title : ''Invitation''
	},
	MlsTask {
		#done : true,
		#title : ''CFP deadline for presentation''
	},
	MlsTask {
		#done : true,
		#title : ''Missing check for Quanteos''
	},
	MlsTask {
		#done : true,
		#title : ''Autre entreprise pour facade''
	},
	MlsTask {
		#done : true,
		#title : ''Trip at Brest'',
		#doneDate : Date [ ''2023-03-24+01:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''Check ESUG videos''
	},
	MlsTask {
		#done : true,
		#title : ''check esug description for the web''
	},
	MlsTask {
		#done : true,
		#title : ''Check gordana email''
	},
	MlsTask {
		#done : true,
		#title : ''Couper les pomponnettes''
	},
	MlsTask {
		#done : true,
		#title : ''Check gordana email about summer school'',
		#doneDate : Date [ ''2023-03-24+01:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''premiers troux pour rosiers''
	},
	MlsTask {
		#done : true,
		#title : ''second trous pour rosiers''
	},
	MlsTask {
		#done : true,
		#title : ''rosiers dehors''
	},
	MlsTask {
		#done : true,
		#title : ''chemin pave''
	},
	MlsTask {
		#done : true,
		#title : ''deraciner souche''
	},
	MlsTask {
		#done : true,
		#title : ''Cozy''
	},
	MlsTask {
		#done : false,
		#title : ''Take colored pattern theme de Cyril''
	},
	MlsTask {
		#done : false,
		#title : ''porte abri''
	},
	MlsTask {
		#done : true,
		#title : ''Send papers to Eric Jul''
	},
	MlsTask {
		#done : true,
		#title : ''HDR'',
		#doneDate : Date [ ''2023-03-09+01:00'' ]
	},
	MlsTask {
		#done : false,
		#title : ''Rosier names''
	},
	MlsTask {
		#done : false,
		#title : ''Osier''
	},
	MlsTask {
		#done : false,
		#title : ''Avocat''
	},
	MlsTask {
		#done : true,
		#title : ''Mousse'',
		#doneDate : Date [ ''2023-03-09+01:00'' ]
	},
	MlsTask {
		#done : false,
		#title : ''vigne''
	},
	MlsTask {
		#done : true,
		#title : ''check cleaning robot''
	},
	MlsTask {
		#done : true,
		#title : ''check calendar''
	},
	MlsTask {
		#done : false,
		#title : ''Photos''
	},
	MlsTask {
		#done : false,
		#title : ''Ask rh about jour de conges sur les lundi feries''
	},
	MlsTask {
		#done : false,
		#title : ''contact  ANSI''
	},
	MlsTask {
		#done : false,
		#title : ''new bds''
	},
	MlsTask {
		#done : true,
		#title : ''get machine'',
		#doneDate : Date [ ''2023-03-08+01:00'' ]
	},
	MlsTask {
		#done : false,
		#title : ''order new material''
	},
	MlsTask {
		#done : true,
		#title : ''contact ceramiste'',
		#doneDate : Date [ ''2023-03-09+01:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''hdr'',
		#doneDate : Date [ ''2023-03-07+01:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''mark done -> done date'',
		#doneDate : Date [ ''2023-03-07+01:00'' ]
	},
	MlsTask {
		#done : false,
		#title : ''porte abri''
	},
	MlsTask {
		#done : true,
		#title : ''bonde'',
		#doneDate : Date [ ''2023-03-09+01:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''contact ceramiste'',
		#doneDate : Date [ ''2023-03-08+01:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''Ranger la cave passe 3'',
		#doneDate : Date [ ''2023-03-07+01:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''Ranger la cave passe 4 et finale'',
		#doneDate : Date [ ''2023-03-09+01:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''Rose-Aquarelle'',
		#doneDate : Date [ ''2023-03-08+01:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''rose TahitianSunset'',
		#doneDate : Date [ ''2023-03-08+01:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''Rose bello roma'',
		#doneDate : Date [ ''2023-03-08+01:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''Finish HDR'',
		#doneDate : Date [ ''2023-03-09+01:00'' ]
	},
	MlsTask {
		#done : false,
		#title : ''Billy?''
	},
	MlsTask {
		#done : true,
		#title : ''New books sf in db'',
		#doneDate : Date [ ''2023-03-09+01:00'' ]
	},
	MlsTask {
		#done : false,
		#title : ''Mooc''
	},
	MlsTask {
		#done : false,
		#title : ''Mooc ask who is working on what''
	},
	MlsTask {
		#done : false,
		#title : ''Bloc move square''
	},
	MlsTask {
		#done : true,
		#title : ''RGChunk'',
		#doneDate : Date [ ''2023-03-10+01:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''List from esteban'',
		#doneDate : Date [ ''2023-03-10+01:00'' ]
	},
	MlsTask {
		#done : false,
		#title : ''MenuBar''
	},
	MlsTask {
		#done : true,
		#title : ''Release Pillar working'',
		#doneDate : Date [ ''2023-03-09+01:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''toiture'',
		#doneDate : Date [ ''2023-03-10+01:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''charges'',
		#doneDate : Date [ ''2023-03-10+01:00'' ]
	},
	MlsTask {
		#done : false,
		#title : ''lettre larisa''
	},
	MlsTask {
		#done : true,
		#title : ''prix innovation'',
		#doneDate : Date [ ''2023-03-10+01:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''Julia'',
		#doneDate : Date [ ''2023-03-10+01:00'' ]
	},
	MlsTask {
		#done : false,
		#title : ''Contact Sopra''
	},
	MlsTask {
		#done : false,
		#title : ''More list from esteban''
	},
	MlsTask {
		#done : true,
		#title : ''bds dans base'',
		#doneDate : Date [ ''2023-03-13+01:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''usine'',
		#doneDate : Date [ ''2023-03-11+01:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''paves'',
		#doneDate : Date [ ''2023-03-11+01:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''positionner paves'',
		#doneDate : Date [ ''2023-03-11+01:00'' ]
	},
	MlsTask {
		#done : false,
		#title : ''ancrer paves''
	},
	MlsTask {
		#done : true,
		#title : ''contact alain girault'',
		#doneDate : Date [ ''2023-03-11+01:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''ask nicolas for letter'',
		#doneDate : Date [ ''2023-03-11+01:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''fetch bd'',
		#doneDate : Date [ ''2023-03-11+01:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''sebastian'',
		#doneDate : Date [ ''2023-03-13+01:00'' ]
	},
	MlsTask {
		#done : false,
		#title : ''Contract ANSI''
	},
	MlsTask {
		#done : false,
		#title : ''Books fabresse''
	},
	MlsTask {
		#done : false,
		#title : ''Sync Canada''
	},
	MlsTask {
		#done : false,
		#title : ''Sync nicolas''
	},
	MlsTask {
		#done : false,
		#title : ''Select added task when added''
	},
	MlsTask {
		#done : true,
		#title : ''Bring machine to the lab + chargers'',
		#doneDate : Date [ ''2023-03-25+01:00'' ]
	},
	MlsTask {
		#done : false,
		#title : ''Truc a faire pour les impots''
	},
	MlsTask {
		#done : false,
		#title : ''Reply balsa''
	},
	MlsTask {
		#done : false,
		#title : ''ask mise a dispo''
	},
	MlsTask {
		#done : true,
		#title : ''relecture shit'',
		#doneDate : Date [ ''2023-03-13+01:00'' ]
	},
	MlsTask {
		#done : false,
		#title : ''DocumentHierarchyBuilder as default + example in template''
	},
	MlsTask {
		#done : false,
		#title : ''Innovation award''
	},
	MlsTask {
		#done : false,
		#title : ''Dossier pour valerie''
	},
	MlsTask {
		#done : false,
		#title : ''codeImporter''
	},
	MlsTask {
		#done : true,
		#title : ''Cut erable first pass'',
		#doneDate : Date [ ''2023-03-26+02:00'' ]
	},
	MlsTask {
		#done : false,
		#title : ''cut erable 2''
	},
	MlsTask {
		#done : false,
		#title : ''bois coupe''
	},
	MlsTask {
		#done : false,
		#title : ''cut saule phase 1''
	},
	MlsTask {
		#done : true,
		#title : ''pass on seb paper'',
		#doneDate : Date [ ''2023-03-26+02:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''pass on iona\''s paper'',
		#doneDate : Date [ ''2023-03-26+02:00'' ]
	},
	MlsTask {
		#done : false,
		#title : ''second pass on iona\''s paper''
	},
	MlsTask {
		#done : false,
		#title : ''Loop another step''
	},
	MlsTask {
		#done : false,
		#title : ''better template for class''
	},
	MlsTask {
		#done : true,
		#title : ''iwst 19 -> hal'',
		#doneDate : Date [ ''2023-04-01+02:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''description pour iwst 19'',
		#doneDate : Date [ ''2023-04-01+02:00'' ]
	},
	MlsTask {
		#done : false,
		#title : ''innoovation award''
	},
	MlsTask {
		#done : false,
		#title : ''paper iona''
	},
	MlsTask {
		#done : true,
		#title : ''Landreau prol;ongation'',
		#doneDate : Date [ ''2023-03-30+02:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''relance rodrigues'',
		#doneDate : Date [ ''2023-03-30+02:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''relance balmyleduc'',
		#doneDate : Date [ ''2023-03-30+02:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''train brest'',
		#doneDate : Date [ ''2023-03-30+02:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''haie'',
		#doneDate : Date [ ''2023-03-30+02:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''Lilas'',
		#doneDate : Date [ ''2023-04-06+02:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''esug summary'',
		#doneDate : Date [ ''2023-04-01+02:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''contact lusy -> Pierre'',
		#doneDate : Date [ ''2023-03-30+02:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''correct exam'',
		#doneDate : Date [ ''2023-04-01+02:00'' ]
	},
	MlsTask {
		#done : false,
		#title : ''Mooc''
	},
	MlsTask {
		#done : false,
		#title : ''Mooc games''
	},
	MlsTask {
		#done : true,
		#title : ''ESUg summary'',
		#doneDate : Date [ ''2023-04-01+02:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''esug sponsor check'',
		#doneDate : Date [ ''2023-04-01+02:00'' ]
	},
	MlsTask {
		#done : false,
		#title : ''teaser mooc''
	},
	MlsTask {
		#done : false,
		#title : ''send pitch -> helene''
	},
	MlsTask {
		#done : false,
		#title : ''Pitch -> mooc''
	},
	MlsTask {
		#done : true,
		#title : ''TOC + diagram'',
		#doneDate : Date [ ''2023-04-04+02:00'' ]
	},
	MlsTask {
		#done : false,
		#title : ''syllabus ''
	},
	MlsTask {
		#done : true,
		#title : ''description module'',
		#doneDate : Date [ ''2023-04-16+02:00'' ]
	},
	MlsTask {
		#done : false,
		#title : ''slides numbering''
	},
	MlsTask {
		#done : false,
		#title : ''P12-RGImporter''
	},
	MlsTask {
		#done : true,
		#title : ''Buy books CNV'',
		#doneDate : Date [ ''2023-04-04+02:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''Carte SNCF'',
		#doneDate : Date [ ''2023-04-04+02:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''Select last added entry'',
		#doneDate : Date [ ''2023-04-01+02:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''Lavande'',
		#doneDate : Date [ ''2023-04-01+02:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''himalaya'',
		#doneDate : Date [ ''2023-04-01+02:00'' ]
	},
	MlsTask {
		#done : false,
		#title : ''Robot UI''
	},
	MlsTask {
		#done : true,
		#title : ''Aurel'',
		#doneDate : Date [ ''2023-04-06+02:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''Balsa Money'',
		#doneDate : Date [ ''2023-04-06+02:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''course'',
		#doneDate : Date [ ''2023-04-06+02:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''students'',
		#doneDate : Date [ ''2023-04-16+02:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''Logo pdf from marie collin'',
		#doneDate : Date [ ''2023-04-21+02:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''check mail of marie'',
		#doneDate : Date [ ''2023-04-21+02:00'' ]
	},
	MlsTask {
		#done : false,
		#title : ''Check mooc web''
	},
	MlsTask {
		#done : true,
		#title : ''bilel mooc completion'',
		#doneDate : Date [ ''2023-04-16+02:00'' ]
	},
	MlsTask {
		#done : false,
		#title : ''Iona\''s paper''
	},
	MlsTask {
		#done : false,
		#title : ''nour\''s paper''
	},
	MlsTask {
		#done : true,
		#title : ''Jan proposal'',
		#doneDate : Date [ ''2023-04-21+02:00'' ]
	},
	MlsTask {
		#done : false,
		#title : ''Schedule meeting ronie / pierre''
	},
	MlsTask {
		#done : false,
		#title : ''alternance enzo''
	},
	MlsTask {
		#done : true,
		#title : ''balsa document'',
		#doneDate : Date [ ''2023-04-21+02:00'' ]
	},
	MlsTask {
		#done : true,
		#title : ''Naouel'',
		#doneDate : Date [ ''2023-04-21+02:00'' ]
	},
	MlsTask {
		#done : false,
		#title : ''Naouel''
	},
	MlsTask {
		#done : false,
		#title : ''Mooc''
	},
	MlsTask {
		#done : false,
		#title : ''Mooc yann''
	},
	MlsTask {
		#done : false,
		#title : ''Finish robot ui''
	}
]'  
]

{ #category : #tests }
MlsIOManagerTest >> testAssertFilesAreThere [

	self assert: (filesystem / 'TodoFiles') isDirectory.
	self assert:  (filesystem / 'TodoFiles' / 'tasks.ston') isFile.
	self assert: (filesystem  / 'TodoFiles') children size equals: 1
]

{ #category : #tests }
MlsIOManagerTest >> testStonToObjects [

	| objects |
	objects := STON fromString: self tasksStonFile contents.
	self assert: objects size equals: 149.
	self assert: objects first class equals: MlsTask 
]
