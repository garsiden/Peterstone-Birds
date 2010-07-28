--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: birds; Type: TABLE; Schema: public; Owner: garsiden; Tablespace: 
--

CREATE TABLE birds (
    bto_code character(2) NOT NULL,
    name character varying(50) NOT NULL,
    taxonomic_name character varying(75) NOT NULL,
    is_migrant boolean DEFAULT false
);


ALTER TABLE public.birds OWNER TO garsiden;

--
-- Name: observations; Type: TABLE; Schema: public; Owner: garsiden; Tablespace: 
--

CREATE TABLE observations (
    user_id character(2) NOT NULL,
    bto_code character(2) NOT NULL,
    first_date date NOT NULL,
    note text
);


ALTER TABLE public.observations OWNER TO garsiden;

--
-- Name: sightings; Type: TABLE; Schema: public; Owner: garsiden; Tablespace: 
--

CREATE TABLE sightings (
    bto_code character varying(2) NOT NULL,
    user_id character varying(2) NOT NULL,
    first_date date,
    note character varying(255)
);


ALTER TABLE public.sightings OWNER TO garsiden;

--
-- Name: users; Type: TABLE; Schema: public; Owner: garsiden; Tablespace: 
--

CREATE TABLE users (
    user_id character(2) NOT NULL,
    login character varying(40) NOT NULL,
    name character varying(40) NOT NULL,
    openid character varying(40),
    crypted_password character varying(40),
    salt character varying(40),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    is_admin boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO garsiden;

--
-- Data for Name: birds; Type: TABLE DATA; Schema: public; Owner: garsiden
--

COPY birds (bto_code, name, taxonomic_name, is_migrant) FROM stdin;
AA	Black-browed Albatross	Diomedea melanophris	f
AB	Sabine's Gull	Larus sabini	f
AC	Arctic Skua	Stercorarius parasiticus	f
AD	American Redstart	Setophaga ruticilla	f
AE	Arctic Tern	Sterna paradisaea	t
AF	Little Tern	Sterna albifrons	t
AI	Alpine Swift	Apus melba	f
AK	Spotted Crake	Porzana porzana	f
AL	Arctic Redpoll	Carduelis hornemanni	f
AM	American Bittern	Botaurus lentiginosus	f
AN	Common Crane	Grus grus	f
AP	Arctic Warbler	Phylloscopus borealis	f
AQ	Aquatic Warbler	Acrocephalus paludicola	f
AR	American Robin	Turdus migratorius	f
AV	Avocet	Recurvirostra avosetta	f
AW	American Wigeon	Anas americana	f
AY	Lesser Scaup	Aythya affinis	f
B 	Blackbird	Turdus merula	f
BA	Bar-tailed Godwit	Limosa lapponica	f
BB	Black Brant	Branta bernicla nigricans	f
BC	Blackcap	Sylvia atricapilla	t
BD	Black Duck	Anas rubripes	f
BE	Bean Goose	Anser fabalis	f
BF	Bullfinch	Pyrrhula pyrrhula	f
BG	Brent Goose	Branta bernicla	f
BH	Black-headed Gull	Larus ridibundus	f
BI	Bittern	Botaurus stellaris	f
BJ	Black Tern	Chlidonias niger	t
BK	Black Grouse	Tetrao tetrix	f
BL	Brambling	Fringilla montifringilla	t
BN	Black-necked Grebe	Podiceps nigricollis	f
BO	Barn Owl	Tyto alba	f
BP	Baird's Sandpiper	Calidris bairdii	f
BQ	Buff-breasted Sandpiper	Tryngites subruficollis	f
BR	Bearded Tit	Panurus biarmicus	f
BS	Bewick's Swan	Cygnus columbianus	f
BT	Blue Tit	Parus caeruleus	f
BU	Bluethroat	Luscinia svecica	f
BV	Black-throated Diver	Gavia arctica	f
BW	Black-tailed Godwit	Limosa limosa	f
BX	Black Redstart	Phoenicurus ochruros	f
BY	Barnacle Goose	Branta leucopsis	f
BZ	Buzzard	Buteo buteo	f
C 	Carrion Crow	Corvus corone corone	f
CA	Cormorant	Phalacrocorax carbo	f
CB	Corn Bunting	Miliaria calandra	f
CC	Chiffchaff	Phylloscopus collybita	t
CD	Collared Dove	Streptopelia decaocto	f
CE	Corn Crake	Crex crex	f
CF	Chough	Pyrrhocorax pyrrhocorax	f
CG	Canada Goose	Branta canadensis	f
CH	Chaffinch	Fringilla coelebs	f
CI	Crested Tit	Parus cristatus	f
CJ	Caspian Tern	Sterna caspia	f
CK	Cuckoo	Cuculus canorus	t
CL	Cirl Bunting	Emberiza cirlus	f
CM	Common Gull	Larus canus	f
CN	Common Tern	Sterna hirundo	t
CO	Coot	Fulica atra	f
CP	Capercaillie	Tetrao urogallus	f
CQ	Cory's Shearwater	Calonectris diomedea	f
CR	Crossbill	Loxia curvirostra	f
CS	Common Sandpiper	Actitis hypoleucos	t
CT	Coal Tit	Parus ater	f
CU	Curlew	Numenius arquata	f
CV	Curlew Sandpiper	Calidris ferruginea	t
CW	Cetti's Warbler	Cettia cetti	f
CX	Common Scoter	Melanitta nigra	f
CY	Scottish Crossbill	Loxia scotica	f
D 	Dunnock	Prunella modularis	f
DB	Dark-bellied Brent Goose	Branta bernicla bernicla	f
DI	Dipper	Cinclus cinclus	f
DN	Dunlin	Calidris alpina	f
DO	Dotterel	Charadrius morinellus	t
DP	Greater Sand Plover	Charadrius leschenaultii	f
DR	Spotted Redshank	Tringa erythropus	f
DS	Great Snipe	Gallinago media	f
DT	Penduline Tit	Remiz pendulinus	f
DV	Rock Dove	Columba livia	f
DW	Dartford Warbler	Sylvia undata	f
E 	Eider	Somateria mollissima	f
EA	Golden Eagle	Aquila chrysaetos	f
EB	Red-breasted Goose	Branta ruficollis	f
EC	Cattle Egret	Bubulcus ibis	f
ED	Red-backed Shrike	Lanius collurio	f
EG	Egyptian Goose	Alopochen aegyptiacus	f
EI	Slender-billed Gull	Larus genei	f
EL	Pine Bunting	Emberiza leucocephalos	f
ER	Western Sandpiper	Calidris mauri	f
ES	Steller's Eider	Polysticta stelleri	f
ET	Little Egret	Egretta garzetta	f
EV	Red-eyed Vireo	Vireo olivaceus	f
EW	European White-fronted Goose	Anser albifrons albifrons	f
F 	Fulmar	Fulmarus glacialis	f
FC	Firecrest	Regulus ignicapillus	f
FD	Ferruginous Duck	Aythya nyroca	f
FF	Fieldfare	Turdus pilaris	t
FG	Franklin's Gull	Larus pipixcan	f
FL	Greater Flamingo	Phoenicopterus ruber	f
FN	Thrush Nightingale	Luscinia luscinia	f
FO	Forster's Tern	Sterna forsteri	f
FP	Feral Pigeon	Columba livia x	f
FS	Surf Scoter	Melanitta perspicillata	f
FT	Falcated Duck	Anas falcata	f
FV	Red-footed Falcon	Falco vespertinus	f
FY	Red-breasted Flycatcher	Ficedula parva	f
G 	Green Woodpecker	Picus viridis	f
GA	Gadwall	Anas strepera	f
GB	Great Black-backed Gull	Larus marinus	f
GC	Goldcrest	Regulus regulus	f
GD	Goosander	Mergus merganser	f
GE	Green Sandpiper	Tringa ochropus	f
GF	Golden Pheasant	Chrysolophus pictus	f
GG	Great Crested Grebe	Podiceps cristatus	f
GH	Grasshopper Warbler	Locustella naevia	t
GI	Goshawk	Accipiter gentilis	f
GJ	Greylag Goose	Anser anser	f
GK	Greenshank	Tringa nebularia	t
GL	Grey Wagtail	Motacilla cinerea	f
GM	Oriental Pratincole	Glareola maldivarum	f
GN	Goldeneye	Bucephala clangula	f
GO	Goldfinch	Carduelis carduelis	f
GP	Golden Plover	Pluvialis apricaria	f
GQ	Great Shearwater	Puffinus gravis	f
GR	Greenfinch	Carduelis chloris	f
GS	Great Spotted Woodpecker	Dendrocopos major	f
GT	Great Tit	Parus major	f
GU	Guillemot	Uria aalge	f
GV	Grey Plover	Pluvialis squatarola	f
GW	Garden Warbler	Sylvia borin	t
GX	Gannet	Morus bassanus	f
GY	Garganey	Anas querquedula	t
GZ	Glaucous Gull	Larus hyperboreus	f
H 	Grey Heron	Ardea cinerea	f
HC	Hooded Crow	Corvus corone cornix	f
HD	Bar-headed Goose	Anser indicus	f
HF	Hawfinch	Coccothraustes coccothraustes	f
HG	Herring Gull	Larus argentatus	f
HH	Hen Harrier	Circus cyaneus	f
HM	House Martin	Delichon urbica	t
HO	Hooded Merganser	Lophodytes cucullatus	f
HP	Hoopoe	Upupa epops	f
HQ	Harlequin Duck	Histrionicus histrionicus	f
HR	Green Heron	Butorides virescens	f
HS	House Sparrow	Passer domesticus	f
HU	Hudsonian Godwit	Limosa haemastica	f
HW	Great White Egret	Ardea alba	f
HY	Hobby	Falco subbuteo	t
HZ	Honey Buzzard	Pernis apivorus	f
I 	Solitary Sandpiper	Tringa solitaria	f
IB	Glossy Ibis	Plegadis falcinellus	f
IC	Icterine Warbler	Hippolais icterina	f
ID	American Golden Plover	Pluvialis dominica	f
IF	Pacific Golden Plover	Pluvialis fulva	f
IG	Iceland Gull	Larus glaucoides	f
IK	Baikal Teal	Anas formosa	f
IL	Isabelline Shrike	Lanius isabellinus	f
IN	Ring-billed Gull	Larus delawarensis	f
IP	Sociable Plover	Vanellus gregarius	f
IS	Italian Sparrow	Passer domesticus italiae	f
IT	Black-winged Stilt	Himantopus himantopus	f
IV	Ivory Gull	Pagophila eburnea	f
IW	Bonelli's Warbler	Phylloscopus bonelli	f
J 	Jay	Garrulus glandarius	f
JC	Little Crake	Porzana parva	f
JD	Jackdaw	Corvus monedula	f
JF	Saker Falcon	Falco cherrug	f
JH	Allen's Gallinule	Porphyrula alleni	f
JS	Jack Snipe	Lymnocryptes minimus	f
JU	Dark-eyed Junco	Junco hyemalis	f
K 	Kestrel	Falco tinnunculus	f
KB	Black Kite	Milvus migrans	f
KE	King Eider	Somateria spectabilis	f
KF	Kingfisher	Alcedo atthis	f
KG	Kumlien's Gull	Larus glaucoides kumlieni	f
KI	Kittiwake	Rissa tridactyla	f
KL	Killdeer	Charadrius vociferus	f
KN	Knot	Calidris canutus	f
KP	Kentish Plover	Charadrius alexandrinus	f
KT	Red Kite	Milvus milvus	f
L 	Lapwing	Vanellus vanellus	f
LA	Lapland Bunting	Calcarius lapponicus	f
LB	Lesser Black-backed Gull	Larus fuscus	f
LC	Lesser White-fronted Goose	Anser erythropus	f
LD	Long-billed Dowitcher	Limnodromus scolopaceus	f
LE	Long-eared Owl	Asio otus	f
LF	Laughing Gull	Larus atricilla	f
LG	Little Grebe	Tachybaptus ruficollis	f
LI	Linnet	Carduelis cannabina	f
LJ	Little Bunting	Emberiza pusilla	f
LK	Little Auk	Alle alle	f
LL	Little Bittern	Ixobrychus minutus	f
LM	Lady Amherst's Pheasant	Chrysolophus amherstiae	f
LN	Long-tailed Duck	Clangula hyemalis	f
LO	Little Owl	Athene noctua	f
LP	Little Ringed Plover	Charadrius dubius	t
LR	Lesser Redpoll	Carduelis flammea cabaret	f
LS	Lesser Spotted Woodpecker	Dendrocopos minor	f
LT	Long-tailed Tit	Aegithalos caudatus	f
LU	Little Gull	Larus minutus	f
LW	Lesser Whitethroat	Sylvia curruca curruca	t
LX	Little Stint	Calidris minuta	t
LY	Lesser Yellowlegs	Tringa flavipes	f
LZ	Greater Yellowlegs	Tringa melanoleuca	f
M 	Mistle Thrush	Turdus viscivorus	f
MA	Mallard	Anas platyrhynchos	f
MD	Marsh Sandpiper	Tringa stagnatilis	f
ME	Melodious Warbler	Hippolais polyglotta	f
MG	Magpie	Pica pica	f
MH	Moorhen	Gallinula chloropus	f
ML	Merlin	Falco columbarius	f
MN	Mandarin	Aix galericulata	f
MO	Montagu's Harrier	Circus pygargus	f
MP	Meadow Pipit	Anthus pratensis	f
MR	Marsh Harrier	Circus aeruginosus	f
MS	Mute Swan	Cygnus olor	f
MT	Marsh Tit	Parus palustris	f
MU	Mediterranean Gull	Larus melanocephalus	f
MW	Marsh Warbler	Acrocephalus palustris	f
MX	Manx Shearwater	Puffinus puffinus	f
MZ	Bee-eater	Merops apiaster	f
N 	Nightingale	Luscinia megarhynchos	t
NB	Spoonbill	Platalea leucorodia	f
NC	Nutcracker	Nucifraga caryocatactes	f
ND	Great Northern Diver	Gavia immer	f
NG	Ring-necked Duck	Aythya collaris	f
NH	Nuthatch	Sitta europaea	f
NJ	Nightjar	Caprimulgus europaeus	t
NK	Red-necked Phalarope	Phalaropus lobatus	f
NP	Greenish Warbler	Phylloscopus trochiloides	f
NS	Serin	Serinus serinus	f
NT	Night Heron	Nycticorax nycticorax	f
NW	Greenland White-fronted Goose	Anser albifrons flavirostris	f
NX	Great Skua	Catharacta skua	f
OA	Broad-billed Sandpiper	Limicola falcinellus	f
OB	Ortolan Bunting	Emberiza hortulana	f
OC	Oystercatcher	Haematopus ostralegus	f
OD	Wood Sandpiper	Tringa glareola	t
OE	Rose-coloured Starling	Sturnus roseus	f
OG	Long-tailed Skua	Stercorarius longicaudus	f
OL	Golden Oriole	Oriolus oriolus	f
ON	Bonaparte's Gull	Larus philadelphia	f
OO	Woodchat Shrike	Lanius senator	f
OP	Osprey	Pandion haliaetus	t
OR	White Stork	Ciconia ciconia	f
OS	Black Stork	Ciconia nigra	f
OT	Sooty Shearwater	Puffinus griseus	f
OV	Olive-backed Pipit	Anthus hodgsoni	f
P 	Grey Partridge	Perdix perdix	f
PA	Pallas's Warbler	Phylloscopus proregulus	f
PB	Pale-bellied Brent Goose	Branta bernicla hrota	f
PC	Parrot Crossbill	Loxia pytyopsittacus	f
PD	Two-barred Crossbill	Loxia leucoptera	f
PE	Peregrine	Falco peregrinus	f
PF	Pied Flycatcher	Ficedula hypoleuca	t
PG	Pink-footed Goose	Anser brachyrhynchus	f
PH	Pheasant	Phasianus colchicus	f
PI	Pied Wheatear	Oenanthe pleschanka	f
PJ	Pied-billed Grebe	Podilymbus podiceps	f
PK	Pomarine Skua	Stercorarius pomarinus	f
PL	Grey Phalarope	Phalaropus fulicarius	f
PM	Ptarmigan	Lagopus mutus	f
PO	Pochard	Aythya ferina	f
PP	Pectoral Sandpiper	Calidris melanotos	f
PQ	Spotted Sandpiper	Actitis macularia	f
PR	Richard's Pipit	Anthus novaeseelandiae	f
PS	Purple Sandpiper	Calidris maritima	f
PT	Pintail	Anas acuta	f
PU	Puffin	Fratercula arctica	f
PW	Pied Wagtail	Motacilla alba yarrellii	f
PY	Paddyfield Warbler	Acrocephalus agricola	f
PZ	Semipalmated Sandpiper	Calidris pusilla	f
Q 	Quail	Coturnix coturnix	f
QG	Ross's Gull	Rhodostethia rosea	f
QH	Squacco Heron	Ardeola ralloides	f
QT	Royal Tern	Sterna maxima	f
QW	Great Reed Warbler	Acrocephalus arundinaceus	f
R 	Robin	Erithacus rubecula	f
RA	Razorbill	Alca torda	f
RB	Reed Bunting	Emberiza schoeniclus	f
RC	Rock Pipit	Anthus petrosus	f
RE	Redwing	Turdus iliacus	t
RF	Rough-legged Buzzard	Buteo lagopus	f
RG	Red Grouse	Lagopus lagopus	f
RH	Red-throated Diver	Gavia stellata	f
RI	Ring-necked Parakeet	Psittacula krameri	f
RK	Redshank	Tringa totanus	f
RL	Red-legged Partridge	Alectoris rufa	f
RM	Red-breasted Merganser	Mergus serrator	f
RN	Raven	Corvus corax	f
RO	Rook	Corvus frugilegus	f
RP	Ringed Plover	Charadrius hiaticula	f
RQ	Red-crested Pochard	Netta rufina	f
RR	Barred Warbler	Sylvia nisoria	f
RS	Roseate Tern	Sterna dougallii	f
RT	Redstart	Phoenicurus phoenicurus	t
RU	Ruff	Philomachus pugnax	f
RW	Reed Warbler	Acrocephalus scirpaceus	t
RX	Red-necked Grebe	Podiceps grisegena	f
RY	Ruddy Duck	Oxyura jamaicensis	f
RZ	Ring Ouzel	Turdus torquatus	t
S 	Sky Lark	Alauda arvensis	f
SA	Shag	Phalacrocorax aristotelis	f
SB	Snow Bunting	Plectrophenax nivalis	f
SC	Stonechat	Saxicola torquata	f
SD	Stock Dove	Columba oenas	f
SE	Short-eared Owl	Asio flammeus	f
SF	Spotted Flycatcher	Muscicapa striata	t
SG	Starling	Sturnus vulgaris	f
SH	Sparrowhawk	Accipiter nisus	f
SI	Swift	Apus apus	t
SJ	Snow Goose	Anser caerulescens	f
SK	Siskin	Carduelis spinus	f
SL	Swallow	Hirundo rustica	t
SM	Sand Martin	Riparia riparia	t
SN	Common Snipe	Gallinago gallinago	f
SO	Snowy Owl	Nyctea scandiaca	f
SP	Scaup	Aythya marila	f
SQ	Common Rosefinch	Carpodacus erythrinus	f
SR	Great Grey Shrike	Lanius excubitor	f
SS	Sanderling	Calidris alba	f
ST	Song Thrush	Turdus philomelos	f
SU	Shelduck	Tadorna tadorna	f
SV	Shoveler	Anas clypeata	f
SW	Sedge Warbler	Acrocephalus schoenobaenus	t
SX	Shore Lark	Eremophila alpestris	f
SY	Smew	Mergellus albellus	f
SZ	Slavonian Grebe	Podiceps auritus	f
T 	Teal	Anas crecca	f
TA	Green-winged Teal	Anas crecca carolinensis	f
TB	Blue-winged Teal	Anas discors	f
TC	Treecreeper	Certhia familiaris	f
TD	Turtle Dove	Streptopelia turtur	t
TE	Sandwich Tern	Sterna sandvicensis	t
TF	Lesser Crested Tern	Sterna bengalensis	f
TH	Short-toed Treecreeper	Certhia brachydactyla	f
TI	Tawny Pipit	Anthus campestris	f
TK	Temminck's Stint	Calidris temminckii	f
TL	Leach's Petrel	Oceanodroma leucorhoa	f
TM	Storm Petrel	Hydrobates pelagicus	f
TN	Stone-curlew	Burhinus oedicnemus	f
TO	Tawny Owl	Strix aluco	f
TP	Tree Pipit	Anthus trivialis	t
TR	Terek Sandpiper	Xenus cinereus	f
TS	Tree Sparrow	Passer montanus	f
TT	Turnstone	Arenaria interpres	f
TU	Tufted Duck	Aythya fuligula	f
TW	Twite	Carduelis flavirostris	f
TY	Black Guillemot	Cepphus grylle	f
TZ	Brunnich's Guillemot	Uria lomvia	f
UA	Australian Shelduck	Tadorna tadornoides	f
UD	Ruddy Shelduck	Tadorna ferruginea	f
UK	Great Spotted Cuckoo	Clamator glandarius	f
UP	Upland Sandpiper	Bartramia longicauda	f
UR	Purple Heron	Ardea purpurea	f
US	Great Bustard	Otis tarda	f
UY	Dusky Warbler	Phylloscopus fuscatus	f
VI	Savi's Warbler	Locustella luscinioides	f
VL	Short-toed Lark	Calandrella brachydactyla	f
VP	Red-throated Pipit	Anthus cervinus	f
VR	Red-rumped Swallow	Hirundo daurica	f
VS	Velvet Scoter	Melanitta fusca	f
VT	Varied Thrush	Zoothera naevia	f
VW	River Warbler	Locustella fluviatilis	f
W 	Wheatear	Oenanthe oenanthe	t
WA	Water Rail	Rallus aquaticus	f
WB	White Wagtail	Motacilla alba alba	f
WC	Whinchat	Saxicola rubetra	t
WD	Whiskered Tern	Chlidonias hybridus	f
WE	White-tailed Eagle	Haliaeetus albicilla	f
WF	Wilson's Phalarope	Phalaropus tricolor	f
WG	White-fronted Goose	Anser albifrons	f
WH	Whitethroat	Sylvia communis	t
WI	Water Pipit	Anthus spinoletta	f
WJ	White-winged Black Tern	Chlidonias leucopterus	f
WK	Woodcock	Scolopax rusticola	f
WL	Wood Lark	Lullula arborea	f
WM	Whimbrel	Numenius phaeopus	t
WN	Wigeon	Anas penelope	f
WO	Wood Warbler	Phylloscopus sibilatrix	t
WP	Woodpigeon	Columba palumbus	f
WR	Wren	Troglodytes troglodytes	f
WS	Whooper Swan	Cygnus cygnus	f
WT	Willow Tit	Parus montanus	f
WU	White-rumped Sandpiper	Calidris fuscicollis	f
WV	White-billed Diver	Gavia adamsii	f
WW	Willow Warbler	Phylloscopus trochilus	t
WX	Waxwing	Bombycilla garrulus	f
WY	Wryneck	Jynx torquilla	f
WZ	Whistling Swan	Cygnus columbianus columbianus	f
XC	Dark-throated Thrush	Turdus ruficollis	f
Y 	Yellowhammer	Emberiza citrinella	f
YB	Yellow-browed Warbler	Phylloscopus inornatus	f
YF	Gyrfalcon	Falco rusticolus	f
YG	Yellow-legged Gull	Larus cachinnans michahellis	f
YT	Grey-tailed Tattler	Heteroscelus brevipes	f
YW	Yellow Wagtail	Motacilla flava flavissima	t
\.


--
-- Data for Name: observations; Type: TABLE DATA; Schema: public; Owner: garsiden
--

COPY observations (user_id, bto_code, first_date, note) FROM stdin;
EW	DR	2004-01-01	\N
NG	PE	2005-01-01	My umpteenth note.\r\nAdd other line.\r\nWith a line-feed!\r\nAnd another.
\.


--
-- Data for Name: sightings; Type: TABLE DATA; Schema: public; Owner: garsiden
--

COPY sightings (bto_code, user_id, first_date, note) FROM stdin;
DR	EW	2004-01-01	\N
PE	NG	2004-01-01	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: garsiden
--

COPY users (user_id, login, name, openid, crypted_password, salt, created_at, updated_at, is_admin) FROM stdin;
EW	wange	Eddie Wang	\N	bf53b503b376010384c50bd1d798f3fb8b78c701	f2cea8c8794710b07d9a01d8bb62a0bdc17b7151	2010-07-22 13:33:17.869167	2010-07-22 13:33:17.873143	t
NG	garsiden	Nigel Garside	\N	022c12ecb6d5fd812233899d750d07bd463692bc	a1aa8324cb6a710ca64582447547adc23dfd4a3c	2010-07-22 13:33:16.855658	2010-07-22 13:33:17.23693	t
\.


--
-- Name: birds_pkey; Type: CONSTRAINT; Schema: public; Owner: garsiden; Tablespace: 
--

ALTER TABLE ONLY birds
    ADD CONSTRAINT birds_pkey PRIMARY KEY (bto_code);


--
-- Name: observations_pkey; Type: CONSTRAINT; Schema: public; Owner: garsiden; Tablespace: 
--

ALTER TABLE ONLY observations
    ADD CONSTRAINT observations_pkey PRIMARY KEY (user_id, bto_code);


--
-- Name: sightings_pkey; Type: CONSTRAINT; Schema: public; Owner: garsiden; Tablespace: 
--

ALTER TABLE ONLY sightings
    ADD CONSTRAINT sightings_pkey PRIMARY KEY (bto_code, user_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: garsiden; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: idx_observations_bto_code; Type: INDEX; Schema: public; Owner: garsiden; Tablespace: 
--

CREATE INDEX idx_observations_bto_code ON observations USING btree (bto_code);


--
-- Name: idx_observations_user_id; Type: INDEX; Schema: public; Owner: garsiden; Tablespace: 
--

CREATE INDEX idx_observations_user_id ON observations USING btree (user_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

