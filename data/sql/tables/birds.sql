BEGIN TRANSACTION;
DROP TABLE IF EXISTS "birds";
CREATE TABLE birds
(
	bto_code VARCHAR(2) NOT NULL CONSTRAINT BIRDS_PK PRIMARY KEY,
	name VARCHAR(50) NOT NULL CONSTRAINT BIRDS_NAME_UNIQ UNIQUE,
	taxonomic_name	VARCHAR(75) NOT NULL CONSTRAINT BIRDS_TAXONOMIC_NAME_UNIQ UNIQUE,
	is_migrant BOOLEAN DEFAULT 'f'
    CHECK(LENGTH(bto_code) BETWEEN 1 AND 2)
);
INSERT INTO "birds" VALUES('CO','Coot','Fulica atra','f');
INSERT INTO "birds" VALUES('AA','Black-browed Albatross','Diomedea melanophris','f');
INSERT INTO "birds" VALUES('AB','Sabine''s Gull','Larus sabini','f');
INSERT INTO "birds" VALUES('AC','Arctic Skua','Stercorarius parasiticus','f');
INSERT INTO "birds" VALUES('AD','American Redstart','Setophaga ruticilla','f');
INSERT INTO "birds" VALUES('AE','Arctic Tern','Sterna paradisaea','t');
INSERT INTO "birds" VALUES('AF','Little Tern','Sterna albifrons','t');
INSERT INTO "birds" VALUES('AI','Alpine Swift','Apus melba','f');
INSERT INTO "birds" VALUES('AK','Spotted Crake','Porzana porzana','f');
INSERT INTO "birds" VALUES('AL','Arctic Redpoll','Carduelis hornemanni','f');
INSERT INTO "birds" VALUES('AM','American Bittern','Botaurus lentiginosus','f');
INSERT INTO "birds" VALUES('AN','Common Crane','Grus grus','f');
INSERT INTO "birds" VALUES('AP','Arctic Warbler','Phylloscopus borealis','f');
INSERT INTO "birds" VALUES('AQ','Aquatic Warbler','Acrocephalus paludicola','f');
INSERT INTO "birds" VALUES('AR','American Robin','Turdus migratorius','f');
INSERT INTO "birds" VALUES('AV','Avocet','Recurvirostra avosetta','f');
INSERT INTO "birds" VALUES('AW','American Wigeon','Anas americana','f');
INSERT INTO "birds" VALUES('AY','Lesser Scaup','Aythya affinis','f');
INSERT INTO "birds" VALUES('B','Blackbird','Turdus merula','f');
INSERT INTO "birds" VALUES('BA','Bar-tailed Godwit','Limosa lapponica','f');
INSERT INTO "birds" VALUES('BB','Black Brant','Branta bernicla nigricans','f');
INSERT INTO "birds" VALUES('BC','Blackcap','Sylvia atricapilla','t');
INSERT INTO "birds" VALUES('BD','Black Duck','Anas rubripes','f');
INSERT INTO "birds" VALUES('BE','Bean Goose','Anser fabalis','f');
INSERT INTO "birds" VALUES('BF','Bullfinch','Pyrrhula pyrrhula','f');
INSERT INTO "birds" VALUES('BG','Brent Goose','Branta bernicla','f');
INSERT INTO "birds" VALUES('BH','Black-headed Gull','Larus ridibundus','f');
INSERT INTO "birds" VALUES('BI','Bittern','Botaurus stellaris','f');
INSERT INTO "birds" VALUES('BJ','Black Tern','Chlidonias niger','t');
INSERT INTO "birds" VALUES('BK','Black Grouse','Tetrao tetrix','f');
INSERT INTO "birds" VALUES('BL','Brambling','Fringilla montifringilla','t');
INSERT INTO "birds" VALUES('BN','Black-necked Grebe','Podiceps nigricollis','f');
INSERT INTO "birds" VALUES('BO','Barn Owl','Tyto alba','f');
INSERT INTO "birds" VALUES('BP','Baird''s Sandpiper','Calidris bairdii','f');
INSERT INTO "birds" VALUES('BQ','Buff-breasted Sandpiper','Tryngites subruficollis','f');
INSERT INTO "birds" VALUES('BR','Bearded Tit','Panurus biarmicus','f');
INSERT INTO "birds" VALUES('BS','Bewick''s Swan','Cygnus columbianus','f');
INSERT INTO "birds" VALUES('BT','Blue Tit','Parus caeruleus','f');
INSERT INTO "birds" VALUES('BU','Bluethroat','Luscinia svecica','f');
INSERT INTO "birds" VALUES('BV','Black-throated Diver','Gavia arctica','f');
INSERT INTO "birds" VALUES('BW','Black-tailed Godwit','Limosa limosa','f');
INSERT INTO "birds" VALUES('BX','Black Redstart','Phoenicurus ochruros','f');
INSERT INTO "birds" VALUES('BY','Barnacle Goose','Branta leucopsis','f');
INSERT INTO "birds" VALUES('BZ','Buzzard','Buteo buteo','f');
INSERT INTO "birds" VALUES('C','Carrion Crow','Corvus corone corone','f');
INSERT INTO "birds" VALUES('CA','Cormorant','Phalacrocorax carbo','f');
INSERT INTO "birds" VALUES('CB','Corn Bunting','Miliaria calandra','f');
INSERT INTO "birds" VALUES('CC','Chiffchaff','Phylloscopus collybita','t');
INSERT INTO "birds" VALUES('CD','Collared Dove','Streptopelia decaocto','f');
INSERT INTO "birds" VALUES('CE','Corn Crake','Crex crex','f');
INSERT INTO "birds" VALUES('CF','Chough','Pyrrhocorax pyrrhocorax','f');
INSERT INTO "birds" VALUES('CG','Canada Goose','Branta canadensis','f');
INSERT INTO "birds" VALUES('CH','Chaffinch','Fringilla coelebs','f');
INSERT INTO "birds" VALUES('CI','Crested Tit','Parus cristatus','f');
INSERT INTO "birds" VALUES('CJ','Caspian Tern','Sterna caspia','f');
INSERT INTO "birds" VALUES('CK','Cuckoo','Cuculus canorus','t');
INSERT INTO "birds" VALUES('CL','Cirl Bunting','Emberiza cirlus','f');
INSERT INTO "birds" VALUES('CM','Common Gull','Larus canus','f');
INSERT INTO "birds" VALUES('CN','Common Tern','Sterna hirundo','t');
INSERT INTO "birds" VALUES('CP','Capercaillie','Tetrao urogallus','f');
INSERT INTO "birds" VALUES('CQ','Cory''s Shearwater','Calonectris diomedea','f');
INSERT INTO "birds" VALUES('CR','Crossbill','Loxia curvirostra','f');
INSERT INTO "birds" VALUES('WS','Whooper Swan','Cygnus cygnus','f');
INSERT INTO "birds" VALUES('CT','Coal Tit','Parus ater','f');
INSERT INTO "birds" VALUES('CU','Curlew','Numenius arquata','f');
INSERT INTO "birds" VALUES('CV','Curlew Sandpiper','Calidris ferruginea','t');
INSERT INTO "birds" VALUES('CW','Cetti''s Warbler','Cettia cetti','f');
INSERT INTO "birds" VALUES('CX','Common Scoter','Melanitta nigra','f');
INSERT INTO "birds" VALUES('CY','Scottish Crossbill','Loxia scotica','f');
INSERT INTO "birds" VALUES('D','Dunnock','Prunella modularis','f');
INSERT INTO "birds" VALUES('DB','Dark-bellied Brent Goose','Branta bernicla bernicla','f');
INSERT INTO "birds" VALUES('DI','Dipper','Cinclus cinclus','f');
INSERT INTO "birds" VALUES('DN','Dunlin','Calidris alpina','f');
INSERT INTO "birds" VALUES('DO','Dotterel','Charadrius morinellus','t');
INSERT INTO "birds" VALUES('DP','Greater Sand Plover','Charadrius leschenaultii','f');
INSERT INTO "birds" VALUES('DR','Spotted Redshank','Tringa erythropus','f');
INSERT INTO "birds" VALUES('DS','Great Snipe','Gallinago media','f');
INSERT INTO "birds" VALUES('DT','Penduline Tit','Remiz pendulinus','f');
INSERT INTO "birds" VALUES('DV','Rock Dove','Columba livia','f');
INSERT INTO "birds" VALUES('DW','Dartford Warbler','Sylvia undata','f');
INSERT INTO "birds" VALUES('E','Eider','Somateria mollissima','f');
INSERT INTO "birds" VALUES('EA','Golden Eagle','Aquila chrysaetos','f');
INSERT INTO "birds" VALUES('EB','Red-breasted Goose','Branta ruficollis','f');
INSERT INTO "birds" VALUES('EC','Cattle Egret','Bubulcus ibis','f');
INSERT INTO "birds" VALUES('ED','Red-backed Shrike','Lanius collurio','f');
INSERT INTO "birds" VALUES('EG','Egyptian Goose','Alopochen aegyptiacus','f');
INSERT INTO "birds" VALUES('EI','Slender-billed Gull','Larus genei','f');
INSERT INTO "birds" VALUES('EL','Pine Bunting','Emberiza leucocephalos','f');
INSERT INTO "birds" VALUES('ER','Western Sandpiper','Calidris mauri','f');
INSERT INTO "birds" VALUES('ES','Steller''s Eider','Polysticta stelleri','f');
INSERT INTO "birds" VALUES('ET','Little Egret','Egretta garzetta','f');
INSERT INTO "birds" VALUES('EV','Red-eyed Vireo','Vireo olivaceus','f');
INSERT INTO "birds" VALUES('EW','European White-fronted Goose','Anser albifrons albifrons','f');
INSERT INTO "birds" VALUES('F','Fulmar','Fulmarus glacialis','f');
INSERT INTO "birds" VALUES('FC','Firecrest','Regulus ignicapillus','f');
INSERT INTO "birds" VALUES('WT','Willow Tit','Parus montanus','f');
INSERT INTO "birds" VALUES('FD','Ferruginous Duck','Aythya nyroca','f');
INSERT INTO "birds" VALUES('FF','Fieldfare','Turdus pilaris','t');
INSERT INTO "birds" VALUES('FG','Franklin''s Gull','Larus pipixcan','f');
INSERT INTO "birds" VALUES('FL','Greater Flamingo','Phoenicopterus ruber','f');
INSERT INTO "birds" VALUES('FN','Thrush Nightingale','Luscinia luscinia','f');
INSERT INTO "birds" VALUES('FO','Forster''s Tern','Sterna forsteri','f');
INSERT INTO "birds" VALUES('FP','Feral Pigeon','Columba livia x','f');
INSERT INTO "birds" VALUES('FS','Surf Scoter','Melanitta perspicillata','f');
INSERT INTO "birds" VALUES('FT','Falcated Duck','Anas falcata','f');
INSERT INTO "birds" VALUES('FV','Red-footed Falcon','Falco vespertinus','f');
INSERT INTO "birds" VALUES('FY','Red-breasted Flycatcher','Ficedula parva','f');
INSERT INTO "birds" VALUES('G','Green Woodpecker','Picus viridis','f');
INSERT INTO "birds" VALUES('GA','Gadwall','Anas strepera','f');
INSERT INTO "birds" VALUES('GB','Great Black-backed Gull','Larus marinus','f');
INSERT INTO "birds" VALUES('GC','Goldcrest','Regulus regulus','f');
INSERT INTO "birds" VALUES('GD','Goosander','Mergus merganser','f');
INSERT INTO "birds" VALUES('GE','Green Sandpiper','Tringa ochropus','f');
INSERT INTO "birds" VALUES('GF','Golden Pheasant','Chrysolophus pictus','f');
INSERT INTO "birds" VALUES('GG','Great Crested Grebe','Podiceps cristatus','f');
INSERT INTO "birds" VALUES('GH','Grasshopper Warbler','Locustella naevia','t');
INSERT INTO "birds" VALUES('GI','Goshawk','Accipiter gentilis','f');
INSERT INTO "birds" VALUES('GJ','Greylag Goose','Anser anser','f');
INSERT INTO "birds" VALUES('GK','Greenshank','Tringa nebularia','t');
INSERT INTO "birds" VALUES('GL','Grey Wagtail','Motacilla cinerea','f');
INSERT INTO "birds" VALUES('GM','Oriental Pratincole','Glareola maldivarum','f');
INSERT INTO "birds" VALUES('GN','Goldeneye','Bucephala clangula','f');
INSERT INTO "birds" VALUES('GO','Goldfinch','Carduelis carduelis','f');
INSERT INTO "birds" VALUES('GP','Golden Plover','Pluvialis apricaria','f');
INSERT INTO "birds" VALUES('GQ','Great Shearwater','Puffinus gravis','f');
INSERT INTO "birds" VALUES('GR','Greenfinch','Carduelis chloris','f');
INSERT INTO "birds" VALUES('GS','Great Spotted Woodpecker','Dendrocopos major','f');
INSERT INTO "birds" VALUES('GT','Great Tit','Parus major','f');
INSERT INTO "birds" VALUES('GU','Guillemot','Uria aalge','f');
INSERT INTO "birds" VALUES('GV','Grey Plover','Pluvialis squatarola','f');
INSERT INTO "birds" VALUES('GW','Garden Warbler','Sylvia borin','t');
INSERT INTO "birds" VALUES('GX','Gannet','Morus bassanus','f');
INSERT INTO "birds" VALUES('GY','Garganey','Anas querquedula','t');
INSERT INTO "birds" VALUES('GZ','Glaucous Gull','Larus hyperboreus','f');
INSERT INTO "birds" VALUES('H','Grey Heron','Ardea cinerea','f');
INSERT INTO "birds" VALUES('HC','Hooded Crow','Corvus corone cornix','f');
INSERT INTO "birds" VALUES('HF','Hawfinch','Coccothraustes coccothraustes','f');
INSERT INTO "birds" VALUES('HG','Herring Gull','Larus argentatus','f');
INSERT INTO "birds" VALUES('HH','Hen Harrier','Circus cyaneus','f');
INSERT INTO "birds" VALUES('HM','House Martin','Delichon urbica','t');
INSERT INTO "birds" VALUES('HO','Hooded Merganser','Lophodytes cucullatus','f');
INSERT INTO "birds" VALUES('HP','Hoopoe','Upupa epops','f');
INSERT INTO "birds" VALUES('HQ','Harlequin Duck','Histrionicus histrionicus','f');
INSERT INTO "birds" VALUES('HR','Green Heron','Butorides virescens','f');
INSERT INTO "birds" VALUES('HS','House Sparrow','Passer domesticus','f');
INSERT INTO "birds" VALUES('HU','Hudsonian Godwit','Limosa haemastica','f');
INSERT INTO "birds" VALUES('HW','Great White Egret','Ardea alba','f');
INSERT INTO "birds" VALUES('HY','Hobby','Falco subbuteo','t');
INSERT INTO "birds" VALUES('HZ','Honey Buzzard','Pernis apivorus','f');
INSERT INTO "birds" VALUES('I','Solitary Sandpiper','Tringa solitaria','f');
INSERT INTO "birds" VALUES('IB','Glossy Ibis','Plegadis falcinellus','f');
INSERT INTO "birds" VALUES('IC','Icterine Warbler','Hippolais icterina','f');
INSERT INTO "birds" VALUES('ID','American Golden Plover','Pluvialis dominica','f');
INSERT INTO "birds" VALUES('IF','Pacific Golden Plover','Pluvialis fulva','f');
INSERT INTO "birds" VALUES('IG','Iceland Gull','Larus glaucoides','f');
INSERT INTO "birds" VALUES('IK','Baikal Teal','Anas formosa','f');
INSERT INTO "birds" VALUES('IL','Isabelline Shrike','Lanius isabellinus','f');
INSERT INTO "birds" VALUES('IN','Ring-billed Gull','Larus delawarensis','f');
INSERT INTO "birds" VALUES('IP','Sociable Plover','Vanellus gregarius','f');
INSERT INTO "birds" VALUES('IS','Italian Sparrow','Passer domesticus italiae','f');
INSERT INTO "birds" VALUES('IT','Black-winged Stilt','Himantopus himantopus','f');
INSERT INTO "birds" VALUES('IV','Ivory Gull','Pagophila eburnea','f');
INSERT INTO "birds" VALUES('IW','Bonelli''s Warbler','Phylloscopus bonelli','f');
INSERT INTO "birds" VALUES('J','Jay','Garrulus glandarius','f');
INSERT INTO "birds" VALUES('JC','Little Crake','Porzana parva','f');
INSERT INTO "birds" VALUES('JD','Jackdaw','Corvus monedula','f');
INSERT INTO "birds" VALUES('JF','Saker Falcon','Falco cherrug','f');
INSERT INTO "birds" VALUES('JH','Allen''s Gallinule','Porphyrula alleni','f');
INSERT INTO "birds" VALUES('JS','Jack Snipe','Lymnocryptes minimus','f');
INSERT INTO "birds" VALUES('JU','Dark-eyed Junco','Junco hyemalis','f');
INSERT INTO "birds" VALUES('K','Kestrel','Falco tinnunculus','f');
INSERT INTO "birds" VALUES('KB','Black Kite','Milvus migrans','f');
INSERT INTO "birds" VALUES('KE','King Eider','Somateria spectabilis','f');
INSERT INTO "birds" VALUES('KF','Kingfisher','Alcedo atthis','f');
INSERT INTO "birds" VALUES('KG','Kumlien''s Gull','Larus glaucoides kumlieni','f');
INSERT INTO "birds" VALUES('KI','Kittiwake','Rissa tridactyla','f');
INSERT INTO "birds" VALUES('KL','Killdeer','Charadrius vociferus','f');
INSERT INTO "birds" VALUES('KN','Knot','Calidris canutus','f');
INSERT INTO "birds" VALUES('KP','Kentish Plover','Charadrius alexandrinus','f');
INSERT INTO "birds" VALUES('KT','Red Kite','Milvus milvus','f');
INSERT INTO "birds" VALUES('L','Lapwing','Vanellus vanellus','f');
INSERT INTO "birds" VALUES('LA','Lapland Bunting','Calcarius lapponicus','f');
INSERT INTO "birds" VALUES('LB','Lesser Black-backed Gull','Larus fuscus','f');
INSERT INTO "birds" VALUES('LC','Lesser White-fronted Goose','Anser erythropus','f');
INSERT INTO "birds" VALUES('LD','Long-billed Dowitcher','Limnodromus scolopaceus','f');
INSERT INTO "birds" VALUES('LE','Long-eared Owl','Asio otus','f');
INSERT INTO "birds" VALUES('LF','Laughing Gull','Larus atricilla','f');
INSERT INTO "birds" VALUES('LG','Little Grebe','Tachybaptus ruficollis','f');
INSERT INTO "birds" VALUES('LI','Linnet','Carduelis cannabina','f');
INSERT INTO "birds" VALUES('LJ','Little Bunting','Emberiza pusilla','f');
INSERT INTO "birds" VALUES('LK','Little Auk','Alle alle','f');
INSERT INTO "birds" VALUES('LL','Little Bittern','Ixobrychus minutus','f');
INSERT INTO "birds" VALUES('LM','Lady Amherst''s Pheasant','Chrysolophus amherstiae','f');
INSERT INTO "birds" VALUES('LN','Long-tailed Duck','Clangula hyemalis','f');
INSERT INTO "birds" VALUES('LO','Little Owl','Athene noctua','f');
INSERT INTO "birds" VALUES('LP','Little Ringed Plover','Charadrius dubius','t');
INSERT INTO "birds" VALUES('LR','Lesser Redpoll','Carduelis flammea cabaret','f');
INSERT INTO "birds" VALUES('LS','Lesser Spotted Woodpecker','Dendrocopos minor','f');
INSERT INTO "birds" VALUES('LT','Long-tailed Tit','Aegithalos caudatus','f');
INSERT INTO "birds" VALUES('LU','Little Gull','Larus minutus','f');
INSERT INTO "birds" VALUES('LW','Lesser Whitethroat','Sylvia curruca curruca','t');
INSERT INTO "birds" VALUES('LX','Little Stint','Calidris minuta','t');
INSERT INTO "birds" VALUES('LY','Lesser Yellowlegs','Tringa flavipes','f');
INSERT INTO "birds" VALUES('LZ','Greater Yellowlegs','Tringa melanoleuca','f');
INSERT INTO "birds" VALUES('M','Mistle Thrush','Turdus viscivorus','f');
INSERT INTO "birds" VALUES('MA','Mallard','Anas platyrhynchos','f');
INSERT INTO "birds" VALUES('MD','Marsh Sandpiper','Tringa stagnatilis','f');
INSERT INTO "birds" VALUES('ME','Melodious Warbler','Hippolais polyglotta','f');
INSERT INTO "birds" VALUES('MG','Magpie','Pica pica','f');
INSERT INTO "birds" VALUES('MH','Moorhen','Gallinula chloropus','f');
INSERT INTO "birds" VALUES('ML','Merlin','Falco columbarius','f');
INSERT INTO "birds" VALUES('MN','Mandarin','Aix galericulata','f');
INSERT INTO "birds" VALUES('MO','Montagu''s Harrier','Circus pygargus','f');
INSERT INTO "birds" VALUES('MP','Meadow Pipit','Anthus pratensis','f');
INSERT INTO "birds" VALUES('MR','Marsh Harrier','Circus aeruginosus','f');
INSERT INTO "birds" VALUES('MS','Mute Swan','Cygnus olor','f');
INSERT INTO "birds" VALUES('MT','Marsh Tit','Parus palustris','f');
INSERT INTO "birds" VALUES('MU','Mediterranean Gull','Larus melanocephalus','f');
INSERT INTO "birds" VALUES('MW','Marsh Warbler','Acrocephalus palustris','f');
INSERT INTO "birds" VALUES('MX','Manx Shearwater','Puffinus puffinus','f');
INSERT INTO "birds" VALUES('MZ','Bee-eater','Merops apiaster','f');
INSERT INTO "birds" VALUES('N','Nightingale','Luscinia megarhynchos','t');
INSERT INTO "birds" VALUES('NB','Spoonbill','Platalea leucorodia','f');
INSERT INTO "birds" VALUES('NC','Nutcracker','Nucifraga caryocatactes','f');
INSERT INTO "birds" VALUES('ND','Great Northern Diver','Gavia immer','f');
INSERT INTO "birds" VALUES('NG','Ring-necked Duck','Aythya collaris','f');
INSERT INTO "birds" VALUES('NH','Nuthatch','Sitta europaea','f');
INSERT INTO "birds" VALUES('NJ','Nightjar','Caprimulgus europaeus','t');
INSERT INTO "birds" VALUES('NK','Red-necked Phalarope','Phalaropus lobatus','f');
INSERT INTO "birds" VALUES('NP','Greenish Warbler','Phylloscopus trochiloides','f');
INSERT INTO "birds" VALUES('NS','Serin','Serinus serinus','f');
INSERT INTO "birds" VALUES('NT','Night Heron','Nycticorax nycticorax','f');
INSERT INTO "birds" VALUES('NW','Greenland White-fronted Goose','Anser albifrons flavirostris','f');
INSERT INTO "birds" VALUES('NX','Great Skua','Catharacta skua','f');
INSERT INTO "birds" VALUES('OA','Broad-billed Sandpiper','Limicola falcinellus','f');
INSERT INTO "birds" VALUES('OB','Ortolan Bunting','Emberiza hortulana','f');
INSERT INTO "birds" VALUES('OC','Oystercatcher','Haematopus ostralegus','f');
INSERT INTO "birds" VALUES('OD','Wood Sandpiper','Tringa glareola','t');
INSERT INTO "birds" VALUES('OE','Rose-coloured Starling','Sturnus roseus','f');
INSERT INTO "birds" VALUES('OG','Long-tailed Skua','Stercorarius longicaudus','f');
INSERT INTO "birds" VALUES('OL','Golden Oriole','Oriolus oriolus','f');
INSERT INTO "birds" VALUES('ON','Bonaparte''s Gull','Larus philadelphia','f');
INSERT INTO "birds" VALUES('OO','Woodchat Shrike','Lanius senator','f');
INSERT INTO "birds" VALUES('OP','Osprey','Pandion haliaetus','t');
INSERT INTO "birds" VALUES('OR','White Stork','Ciconia ciconia','f');
INSERT INTO "birds" VALUES('OS','Black Stork','Ciconia nigra','f');
INSERT INTO "birds" VALUES('OT','Sooty Shearwater','Puffinus griseus','f');
INSERT INTO "birds" VALUES('OV','Olive-backed Pipit','Anthus hodgsoni','f');
INSERT INTO "birds" VALUES('P','Grey Partridge','Perdix perdix','f');
INSERT INTO "birds" VALUES('PA','Pallas''s Warbler','Phylloscopus proregulus','f');
INSERT INTO "birds" VALUES('PB','Pale-bellied Brent Goose','Branta bernicla hrota','f');
INSERT INTO "birds" VALUES('PC','Parrot Crossbill','Loxia pytyopsittacus','f');
INSERT INTO "birds" VALUES('PD','Two-barred Crossbill','Loxia leucoptera','f');
INSERT INTO "birds" VALUES('PE','Peregrine','Falco peregrinus','f');
INSERT INTO "birds" VALUES('PF','Pied Flycatcher','Ficedula hypoleuca','t');
INSERT INTO "birds" VALUES('PG','Pink-footed Goose','Anser brachyrhynchus','f');
INSERT INTO "birds" VALUES('PH','Pheasant','Phasianus colchicus','f');
INSERT INTO "birds" VALUES('PI','Pied Wheatear','Oenanthe pleschanka','f');
INSERT INTO "birds" VALUES('PJ','Pied-billed Grebe','Podilymbus podiceps','f');
INSERT INTO "birds" VALUES('PK','Pomarine Skua','Stercorarius pomarinus','f');
INSERT INTO "birds" VALUES('PL','Grey Phalarope','Phalaropus fulicarius','f');
INSERT INTO "birds" VALUES('PM','Ptarmigan','Lagopus mutus','f');
INSERT INTO "birds" VALUES('PO','Pochard','Aythya ferina','f');
INSERT INTO "birds" VALUES('PP','Pectoral Sandpiper','Calidris melanotos','f');
INSERT INTO "birds" VALUES('PQ','Spotted Sandpiper','Actitis macularia','f');
INSERT INTO "birds" VALUES('PR','Richard''s Pipit','Anthus novaeseelandiae','f');
INSERT INTO "birds" VALUES('PS','Purple Sandpiper','Calidris maritima','f');
INSERT INTO "birds" VALUES('PT','Pintail','Anas acuta','f');
INSERT INTO "birds" VALUES('PU','Puffin','Fratercula arctica','f');
INSERT INTO "birds" VALUES('PW','Pied Wagtail','Motacilla alba yarrellii','f');
INSERT INTO "birds" VALUES('PY','Paddyfield Warbler','Acrocephalus agricola','f');
INSERT INTO "birds" VALUES('PZ','Semipalmated Sandpiper','Calidris pusilla','f');
INSERT INTO "birds" VALUES('Q','Quail','Coturnix coturnix','f');
INSERT INTO "birds" VALUES('QG','Ross''s Gull','Rhodostethia rosea','f');
INSERT INTO "birds" VALUES('QH','Squacco Heron','Ardeola ralloides','f');
INSERT INTO "birds" VALUES('QT','Royal Tern','Sterna maxima','f');
INSERT INTO "birds" VALUES('QW','Great Reed Warbler','Acrocephalus arundinaceus','f');
INSERT INTO "birds" VALUES('R','Robin','Erithacus rubecula','f');
INSERT INTO "birds" VALUES('RA','Razorbill','Alca torda','f');
INSERT INTO "birds" VALUES('RB','Reed Bunting','Emberiza schoeniclus','f');
INSERT INTO "birds" VALUES('RC','Rock Pipit','Anthus petrosus','f');
INSERT INTO "birds" VALUES('RE','Redwing','Turdus iliacus','t');
INSERT INTO "birds" VALUES('RF','Rough-legged Buzzard','Buteo lagopus','f');
INSERT INTO "birds" VALUES('RG','Red Grouse','Lagopus lagopus','f');
INSERT INTO "birds" VALUES('WR','Wren','Troglodytes troglodytes','f');
INSERT INTO "birds" VALUES('RH','Red-throated Diver','Gavia stellata','f');
INSERT INTO "birds" VALUES('RI','Ring-necked Parakeet','Psittacula krameri','f');
INSERT INTO "birds" VALUES('RK','Redshank','Tringa totanus','f');
INSERT INTO "birds" VALUES('RL','Red-legged Partridge','Alectoris rufa','f');
INSERT INTO "birds" VALUES('RM','Red-breasted Merganser','Mergus serrator','f');
INSERT INTO "birds" VALUES('RN','Raven','Corvus corax','f');
INSERT INTO "birds" VALUES('RO','Rook','Corvus frugilegus','f');
INSERT INTO "birds" VALUES('RP','Ringed Plover','Charadrius hiaticula','f');
INSERT INTO "birds" VALUES('RQ','Red-crested Pochard','Netta rufina','f');
INSERT INTO "birds" VALUES('RR','Barred Warbler','Sylvia nisoria','f');
INSERT INTO "birds" VALUES('RS','Roseate Tern','Sterna dougallii','f');
INSERT INTO "birds" VALUES('RT','Redstart','Phoenicurus phoenicurus','t');
INSERT INTO "birds" VALUES('RU','Ruff','Philomachus pugnax','f');
INSERT INTO "birds" VALUES('WU','White-rumped Sandpiper','Calidris fuscicollis','f');
INSERT INTO "birds" VALUES('RX','Red-necked Grebe','Podiceps grisegena','f');
INSERT INTO "birds" VALUES('RY','Ruddy Duck','Oxyura jamaicensis','f');
INSERT INTO "birds" VALUES('RZ','Ring Ouzel','Turdus torquatus','t');
INSERT INTO "birds" VALUES('S','Sky Lark','Alauda arvensis','f');
INSERT INTO "birds" VALUES('SA','Shag','Phalacrocorax aristotelis','f');
INSERT INTO "birds" VALUES('SB','Snow Bunting','Plectrophenax nivalis','f');
INSERT INTO "birds" VALUES('SC','Stonechat','Saxicola torquata','f');
INSERT INTO "birds" VALUES('SD','Stock Dove','Columba oenas','f');
INSERT INTO "birds" VALUES('SE','Short-eared Owl','Asio flammeus','f');
INSERT INTO "birds" VALUES('SF','Spotted Flycatcher','Muscicapa striata','t');
INSERT INTO "birds" VALUES('SG','Starling','Sturnus vulgaris','f');
INSERT INTO "birds" VALUES('SH','Sparrowhawk','Accipiter nisus','f');
INSERT INTO "birds" VALUES('WV','White-billed Diver','Gavia adamsii','f');
INSERT INTO "birds" VALUES('SJ','Snow Goose','Anser caerulescens','f');
INSERT INTO "birds" VALUES('SK','Siskin','Carduelis spinus','f');
INSERT INTO "birds" VALUES('SL','Swallow','Hirundo rustica','t');
INSERT INTO "birds" VALUES('SM','Sand Martin','Riparia riparia','t');
INSERT INTO "birds" VALUES('SN','Common Snipe','Gallinago gallinago','f');
INSERT INTO "birds" VALUES('SO','Snowy Owl','Nyctea scandiaca','f');
INSERT INTO "birds" VALUES('SP','Scaup','Aythya marila','f');
INSERT INTO "birds" VALUES('SQ','Common Rosefinch','Carpodacus erythrinus','f');
INSERT INTO "birds" VALUES('SR','Great Grey Shrike','Lanius excubitor','f');
INSERT INTO "birds" VALUES('SS','Sanderling','Calidris alba','f');
INSERT INTO "birds" VALUES('ST','Song Thrush','Turdus philomelos','f');
INSERT INTO "birds" VALUES('SU','Shelduck','Tadorna tadorna','f');
INSERT INTO "birds" VALUES('SV','Shoveler','Anas clypeata','f');
INSERT INTO "birds" VALUES('SW','Sedge Warbler','Acrocephalus schoenobaenus','t');
INSERT INTO "birds" VALUES('SX','Shore Lark','Eremophila alpestris','f');
INSERT INTO "birds" VALUES('SY','Smew','Mergellus albellus','f');
INSERT INTO "birds" VALUES('SZ','Slavonian Grebe','Podiceps auritus','f');
INSERT INTO "birds" VALUES('T','Teal','Anas crecca','f');
INSERT INTO "birds" VALUES('TA','Green-winged Teal','Anas crecca carolinensis','f');
INSERT INTO "birds" VALUES('TB','Blue-winged Teal','Anas discors','f');
INSERT INTO "birds" VALUES('TC','Treecreeper','Certhia familiaris','f');
INSERT INTO "birds" VALUES('TD','Turtle Dove','Streptopelia turtur','t');
INSERT INTO "birds" VALUES('TE','Sandwich Tern','Sterna sandvicensis','t');
INSERT INTO "birds" VALUES('TF','Lesser Crested Tern','Sterna bengalensis','f');
INSERT INTO "birds" VALUES('TH','Short-toed Treecreeper','Certhia brachydactyla','f');
INSERT INTO "birds" VALUES('TI','Tawny Pipit','Anthus campestris','f');
INSERT INTO "birds" VALUES('TK','Temminck''s Stint','Calidris temminckii','f');
INSERT INTO "birds" VALUES('TL','Leach''s Petrel','Oceanodroma leucorhoa','f');
INSERT INTO "birds" VALUES('TM','Storm Petrel','Hydrobates pelagicus','f');
INSERT INTO "birds" VALUES('TN','Stone-curlew','Burhinus oedicnemus','f');
INSERT INTO "birds" VALUES('TO','Tawny Owl','Strix aluco','f');
INSERT INTO "birds" VALUES('TP','Tree Pipit','Anthus trivialis','t');
INSERT INTO "birds" VALUES('TR','Terek Sandpiper','Xenus cinereus','f');
INSERT INTO "birds" VALUES('TS','Tree Sparrow','Passer montanus','f');
INSERT INTO "birds" VALUES('TT','Turnstone','Arenaria interpres','f');
INSERT INTO "birds" VALUES('TU','Tufted Duck','Aythya fuligula','f');
INSERT INTO "birds" VALUES('TW','Twite','Carduelis flavirostris','f');
INSERT INTO "birds" VALUES('TY','Black Guillemot','Cepphus grylle','f');
INSERT INTO "birds" VALUES('TZ','Brunnich''s Guillemot','Uria lomvia','f');
INSERT INTO "birds" VALUES('UD','Ruddy Shelduck','Tadorna ferruginea','f');
INSERT INTO "birds" VALUES('UK','Great Spotted Cuckoo','Clamator glandarius','f');
INSERT INTO "birds" VALUES('UP','Upland Sandpiper','Bartramia longicauda','f');
INSERT INTO "birds" VALUES('UR','Purple Heron','Ardea purpurea','f');
INSERT INTO "birds" VALUES('US','Great Bustard','Otis tarda','f');
INSERT INTO "birds" VALUES('UY','Dusky Warbler','Phylloscopus fuscatus','f');
INSERT INTO "birds" VALUES('VI','Savi''s Warbler','Locustella luscinioides','f');
INSERT INTO "birds" VALUES('VL','Short-toed Lark','Calandrella brachydactyla','f');
INSERT INTO "birds" VALUES('VP','Red-throated Pipit','Anthus cervinus','f');
INSERT INTO "birds" VALUES('VR','Red-rumped Swallow','Hirundo daurica','f');
INSERT INTO "birds" VALUES('VS','Velvet Scoter','Melanitta fusca','f');
INSERT INTO "birds" VALUES('VT','Varied Thrush','Zoothera naevia','f');
INSERT INTO "birds" VALUES('VW','River Warbler','Locustella fluviatilis','f');
INSERT INTO "birds" VALUES('W','Wheatear','Oenanthe oenanthe','t');
INSERT INTO "birds" VALUES('WA','Water Rail','Rallus aquaticus','f');
INSERT INTO "birds" VALUES('WB','White Wagtail','Motacilla alba alba','f');
INSERT INTO "birds" VALUES('WC','Whinchat','Saxicola rubetra','t');
INSERT INTO "birds" VALUES('WD','Whiskered Tern','Chlidonias hybridus','f');
INSERT INTO "birds" VALUES('WE','White-tailed Eagle','Haliaeetus albicilla','f');
INSERT INTO "birds" VALUES('WF','Wilson''s Phalarope','Phalaropus tricolor','f');
INSERT INTO "birds" VALUES('WG','White-fronted Goose','Anser albifrons','f');
INSERT INTO "birds" VALUES('WH','Whitethroat','Sylvia communis','t');
INSERT INTO "birds" VALUES('WI','Water Pipit','Anthus spinoletta','f');
INSERT INTO "birds" VALUES('WJ','White-winged Black Tern','Chlidonias leucopterus','f');
INSERT INTO "birds" VALUES('WK','Woodcock','Scolopax rusticola','f');
INSERT INTO "birds" VALUES('WL','Wood Lark','Lullula arborea','f');
INSERT INTO "birds" VALUES('WM','Whimbrel','Numenius phaeopus','t');
INSERT INTO "birds" VALUES('WN','Wigeon','Anas penelope','f');
INSERT INTO "birds" VALUES('WO','Wood Warbler','Phylloscopus sibilatrix','t');
INSERT INTO "birds" VALUES('WP','Woodpigeon','Columba palumbus','f');
INSERT INTO "birds" VALUES('WW','Willow Warbler','Phylloscopus trochilus','t');
INSERT INTO "birds" VALUES('WX','Waxwing','Bombycilla garrulus','f');
INSERT INTO "birds" VALUES('WY','Wryneck','Jynx torquilla','f');
INSERT INTO "birds" VALUES('WZ','Whistling Swan','Cygnus columbianus columbianus','f');
INSERT INTO "birds" VALUES('XC','Dark-throated Thrush','Turdus ruficollis','f');
INSERT INTO "birds" VALUES('Y','Yellowhammer','Emberiza citrinella','f');
INSERT INTO "birds" VALUES('YB','Yellow-browed Warbler','Phylloscopus inornatus','f');
INSERT INTO "birds" VALUES('YF','Gyrfalcon','Falco rusticolus','f');
INSERT INTO "birds" VALUES('YG','Yellow-legged Gull','Larus cachinnans michahellis','f');
INSERT INTO "birds" VALUES('YT','Grey-tailed Tattler','Heteroscelus brevipes','f');
INSERT INTO "birds" VALUES('YW','Yellow Wagtail','Motacilla flava flavissima','t');
INSERT INTO "birds" VALUES('HD','Bar-headed Goose','Anser indicus','f');
INSERT INTO "birds" VALUES('RW','Reed Warbler','Acrocephalus scirpaceus','t');
INSERT INTO "birds" VALUES('CS','Common Sandpiper','Actitis hypoleucos','t');
INSERT INTO "birds" VALUES('SI','Swift','Apus apus','t');
INSERT INTO "birds" VALUES('UA','Australian Shelduck','Tadorna tadornoides','f');
COMMIT;
