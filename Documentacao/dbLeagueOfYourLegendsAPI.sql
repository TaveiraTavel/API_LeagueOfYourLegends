DROP DATABASE if EXISTS dbLeagueOfYourLegends;
CREATE DATABASE if NOT exists dbLeagueOfYourLegends;
USE dbLeagueOfYourLegends;

# TABELA FEITIÇOS
CREATE TABLE tbSpell(
	idSpell smallint primary key auto_increment,
    nomSpell varchar(16) not null unique,
    keySpell varchar(16) not null unique,
    imgSpell varchar(24) not null unique
);

INSERT INTO tbSpell(nomSpell, keySpell, imgSpell)
	values ('Curar', 'Heal', 'SummonerHeal'),
		   ('Fantasma', 'Ghost', 'SummonerHaste'),
		   ('Barreira', 'Barrier', 'SummonerBarrier'),
		   ('Exaustão', 'Exhaust', 'SummonerExhaust'),
		   ('Flash', 'Flash', 'SummonerFlash'),
		   ('Teleporte', 'Teleport', 'SummonerTeleport'),
		   ('Golpear', 'Smite', 'SummonerSmite'),
		   ('Purificar', 'Cleanse', 'SummonerBoost'),
		   ('Incendiar', 'Ignite', 'SummonerDot');
           
# TABELA PAR DE FEITIÇOS PARA CAMPEÃO
CREATE TABLE tbPairSpells(
	idPairSpells smallint primary key auto_increment,
    idPrimSpell smallint not null,
    idSecSpell smallint not null,
    
    foreign key(idPrimSpell) references tbSpell(idSpell),
    foreign key(idSecSpell) references tbSpell(idSpell)
);

# TABELA ITENS
CREATE TABLE tbItem(
	idItem smallint primary key auto_increment,
    nomItem varchar(48) not null unique,
    keyItem varchar(48) not null unique,
    imgItem smallint not null unique
);

INSERT INTO tbItem(nomItem, keyitem, imgItem)
	values  ('Botas', 'botas', 1001),
			('Amuleto da Fada', 'amuletodafada', 1004),
			('Pérola do Rejuvenescimento', 'peroladorejuvenescimento', 1006),
			('Cinto do Gigante', 'cintodogigante', 1011),
			('Capa da Agilidade', 'capadaagilidade', 1018),
			('Varinha Explosiva', 'varinhaexplosiva', 1026),
			('Cristal de Safira', 'cristaldesafira', 1027),
			('Cristal de Rubi', 'cristalderubi', 1028),
			('Couraça de Pano', 'couracadepano', 1029),
			('Cota de Malha', 'cotademalha', 1031),
			('Manto Anula-Magia', 'mantoanula-magia', 1033),
			('Lâmina Cálida', 'laminacalida', 1035),
			('Espada Longa', 'espadalonga', 1036),
			('Picareta', 'picareta', 1037),
			('Espada G. p. C.', 'espadag.p.c.', 1038),
			('Lâmina Álgida', 'laminaalgida', 1039),
			('Lâmina de Obsidiana', 'laminadeobsidiana', 1040),
			('Adaga', 'adaga', 1042),
			('Arco Recurvo', 'arcorecurvo', 1043),
			('Tomo Amplificador', 'tomoamplificador', 1052),
			('Cetro Vampírico', 'cetrovampirico', 1053),
			('Escudo de Doran', 'escudodedoran', 1054),
			('Lâmina de Doran', 'laminadedoran', 1055),
			('Anel de Doran', 'aneldedoran', 1056),
			('Capa Negatron', 'capanegatron', 1057),
			('Bastão Desnecessariamente Grande', 'bastaodesnecessariamentegrande', 1058),
			('Lacre Sombrio', 'lacresombrio', 1082),
			('Abatedora', 'abatedora', 1083),
			('Projétil Perfurante', 'projetilperfurante', 1500),
			('Fortificação', 'fortificacao', 1501),
			('Olho do Vigia', 'olhodovigia', 1503),
			('Vanguarda', 'vanguarda', 1504),
			('Bastão Eletrizante', 'bastaoeletrizante', 1505),
			('Armadura Reforçada', 'armadurareforcada', 1506),
			('Sobrecarga', 'sobrecarga', 1507),
			('Meias Antitorre', 'meiasantitorre', 1508),
			('Entusiasmo', 'entusiasmo', 1509),
			('Entusiasmo Sem Noção', 'entusiasmosemnocao', 1510),
			('Armadura Super Mech', 'armadurasupermech', 1511),
			('Campo de Força Super Mech', 'campodeforcasupermech', 1512),
			('Barricada da Torre', 'barricadadatorre', 1515),
			('Recompensa de estrutura', 'recompensadeestrutura', 1516),
			('Poção de Vida', 'pocaodevida', 2003),
			('Biscoito Total da Determinação Eterna', 'biscoitototaldadeterminacaoeterna', 2010),
			('Estilhaço de Kircheis', 'estilhacodekircheis', 2015),
			('Poção com Refil', 'pocaocomrefil', 2031),
			('Poção Corrupta', 'pocaocorrupta', 2033),
			('Berrante do Guardião', 'berrantedoguardiao', 2051),
			('Poritos', 'poritos', 2052),
			('Sentinela de Controle', 'sentineladecontrole', 2055),
			('Hino Bélico de Shurelya', 'hinobelicodeshurelya', 2065),
			('Elixir de Ferro', 'elixirdeferro', 2138),
			('Elixir da Feitiçaria', 'elixirdafeiticaria', 2139),
			('Elixir da Ira', 'elixirdaira', 2140),
			('Pulverizador de Tropas', 'pulverizadordetropas', 2403),
			('Cronômetro Inicial', 'cronometroinicial', 2419),
			('Cronômetro', 'cronometro', 2420),
			('Botas Levemente Mágicas', 'botaslevementemagicas', 2422),
			('Cronômetro Perfeitamente Calculado', 'cronometroperfeitamentecalculado', 2423),
			('Cronômetro Quebrado', 'cronometroquebrado', 2424),
			('Proteção Imutável', 'protecaoimutavel', 3001),
			('Cajado do Arcanjo', 'cajadodoarcanjo', 3003),
			('Manamune', 'manamune', 3004),
			('Grevas do Berserker', 'grevasdoberserker', 3006),
			('Botas da Rapidez', 'botasdarapidez', 3009),
			('Putrificador Quimtec', 'putrificadorquimtec', 3011),
			('Sapatos do Feiticeiro', 'sapatosdofeiticeiro', 3020),
			('Broquel Glacial', 'broquelglacial', 3024),
			('Anjo Guardião', 'anjoguardiao', 3026),
			('Gume do Infinito', 'gumedoinfinito', 3031),
			('Lembrete Mortal', 'lembretemortal', 3033),
			('Último Sussurro', 'ultimosussurro', 3035),
			('Lembranças do Lorde Dominik', 'lembrancasdolordedominik', 3036),
			('Abraço de Seraph', 'abracodeseraph', 3040),
			('Ladrão de Almas de Mejai', 'ladraodealmasdemejai', 3041),
			('Muramana', 'muramana', 3042),
			('Fago', 'fago', 3044),
			('Dançarina Fantasma', 'dancarinafantasma', 3046),
			('Botas Galvanizadas de Aço', 'botasgalvanizadasdeaco', 3047),
			('Convergência de Zeke', 'convergenciadezeke', 3050),
			('Machado Termestre', 'machadotermestre', 3051),
			('Sinal de Sterak', 'sinaldesterak', 3053),
			('Fulgor', 'fulgor', 3057),
			('Semblante Espiritual', 'semblanteespiritual', 3065),
			('Couraça Lunar Alada', 'couracalunaralada', 3066),
			('Gema Ardente', 'gemaardente', 3067),
			('Égide de Fogo Solar', 'egidedefogosolar', 3068),
			('Lágrima da Deusa', 'lagrimadadeusa', 3070),
			('Cutelo Negro', 'cutelonegro', 3071),
			('Sedenta por Sangue', 'sedentaporsangue', 3072),
			('Hidra Raivosa', 'hidraraivosa', 3074),
			('Armadura de Espinhos', 'armaduradeespinhos', 3075),
			('Colete Espinhoso', 'coleteespinhoso', 3076),
			('Tiamat', 'tiamat', 3077),
			('Força da Trindade', 'forcadatrindade', 3078),
			('Carapaça do Vigia', 'carapacadovigia', 3082),
			('Armadura de Warmog', 'armaduradewarmog', 3083),
			('Furacão de Runaan', 'furacaoderunaan', 3085),
			('Zelo', 'zelo', 3086),
			('Capuz da Morte de Rabadon', 'capuzdamortederabadon', 3089),
			('Limite da Razão', 'limitedarazao', 3091),
			('Canhão Fumegante', 'canhaofumegante', 3094),
			('Chuva de Canivete', 'chuvadecanivete', 3095),
			('Perdição de Lich', 'perdicaodelich', 3100),
			('Véu da Banshee', 'veudabanshee', 3102),
			('Égide da Legião', 'egidedalegiao', 3105),
			('Redenção', 'redencao', 3107),
			('Códex Demoníaco', 'codexdemoniaco', 3108),
			('Juramento do Cavaleiro', 'juramentodocavaleiro', 3109),
			('Coração Congelado', 'coracaocongelado', 3110),
			('Passos de Mercúrio', 'passosdemercurio', 3111),
			('Orbe do Guardião', 'orbedoguardiao', 3112),
			('Cintilação Etérea', 'cintilacaoeterea', 3113),
			('Ídolo Proibido', 'idoloproibido', 3114),
			('Dente de Na\'Shor', 'b"dentedenashor"', 3115),
			('Cetro de Cristal de Rylai', 'cetrodecristalderylai', 3116),
			('Botas da Mobilidade', 'botasdamobilidade', 3117),
			('Aproximação Invernal', 'aproximacaoinvernal', 3119),
			('Fimbulwinter', 'fimbulwinter', 3121),
			('Chamado do Carrasco', 'chamadodocarrasco', 3123),
			('Lâmina da Fúria de Guinsoo', 'laminadafuriadeguinsoo', 3124),
			('Martelo de Guerra de Caulfield', 'martelodeguerradecaulfield', 3133),
			('Punhal Serrilhado', 'punhalserrilhado', 3134),
			('Cajado do Vazio', 'cajadodovazio', 3135),
			('Cimitarra Mercurial', 'cimitarramercurial', 3139),
			('Bandana de Mercúrio', 'bandanademercurio', 3140),
			('Lâmina Fantasma de Youmuu', 'laminafantasmadeyoumuu', 3142),
			('Presságio de Randuin', 'pressagioderanduin', 3143),
			('Alternador Hextec', 'alternadorhextec', 3145),
			('Explocinturão Hextec', 'explocinturaohextec', 3152),
			('Espada do Rei Destruído', 'espadadoreidestruido', 3153),
			('Hexdrinker', 'hexdrinker', 3155),
			('Mandíbula de Malmortius', 'mandibulademalmortius', 3156),
			('Ampulheta de Zhonya', 'ampulhetadezhonya', 3157),
			('Botas Ionianas da Lucidez', 'botasionianasdalucidez', 3158),
			('Morellonomicon', 'morellonomicon', 3165),
			('Lâmina do Guardião', 'laminadoguardiao', 3177),
			('Glaive Sombria', 'glaivesombria', 3179),
			('Quebracascos', 'quebracascos', 3181),
			('Martelo do Guardião', 'martelodoguardiao', 3184),
			('Medalhão dos Solari de Ferro', 'medalhaodossolarideferro', 3190),
			('Armaguarda da Caçadora', 'armaguardadacacadora', 3191),
			('Placa Gargolítica', 'placagargolitica', 3193),
			('Capuz do Espectro', 'capuzdoespectro', 3211),
			('Bênção de Mikael', 'bencaodemikael', 3222),
			('Efígie do Espantalho', 'efigiedoespantalho', 3330),
			('Sentinela Invisível', 'sentinelainvisivel', 3340),
			('Alteração Vidente', 'alteracaovidente', 3363),
			('Lente do Oráculo', 'lentedooraculo', 3364),
			('Sua Parte', 'suaparte', 3400),
			('Turíbulo Ardente', 'turibuloardente', 3504),
			('Colhedor de Essência', 'colhedordeessencia', 3508),
			('Olho do Arauto', 'olhodoarauto', 3513),
			('Lança Negra da Kalista', 'lancanegradakalista', 3600),
			('Couraça do Defunto', 'couracadodefunto', 3742),
			('Hidra Titânica', 'hidratitanica', 3748),
			('Braçadeira Cristalina', 'bracadeiracristalina', 3801),
			('Capítulo Perdido', 'capituloperdido', 3802),
			('Limiar da Noite', 'limiardanoite', 3814),
			('Gume do Ladrão Arcano', 'gumedoladraoarcano', 3850),
			('Presas Gélidas', 'presasgelidas', 3851),
			('Estilhaço de Gelo Verdadeiro', 'estilhacodegeloverdadeiro', 3853),
			('Guarda-ombros de Aço', 'guarda-ombrosdeaco', 3854),
			('Espaldeiras de Aço Rúnico', 'espaldeirasdeacorunico', 3855),
			('Ombreiras de Pedralva', 'ombreirasdepedralva', 3857),
			('Escudo Relicário', 'escudorelicario', 3858),
			('Broquel de Targon', 'broqueldetargon', 3859),
			('Bastião da Montanha', 'bastiaodamontanha', 3860),
			('Foice Espectral', 'foiceespectral', 3862),
			('Tormento Crescente', 'tormentocrescente', 3863),
			('Foice da Névoa Negra', 'foicedanevoanegra', 3864),
			('Orbe do Oblívio', 'orbedooblivio', 3916),
			('Mandato Imperial', 'mandatoimperial', 4005),
			('Força da Natureza', 'forcadanatureza', 4401),
			('A Espátula Dourada', 'aespatuladourada', 4403),
			('Foco do Horizonte', 'focodohorizonte', 4628),
			('Ímpeto Cósmico', 'impetocosmico', 4629),
			('Joia da Ruína', 'joiadaruina', 4630),
			('Barreira Verdejante', 'barreiraverdejante', 4632),
			('Criafendas', 'criafendas', 4633),
			('Olhar Sanguessuga', 'olharsanguessuga', 4635),
			('Colhedor Noturno', 'colhedornoturno', 4636),
			('Abraço Demoníaco', 'abracodemoniaco', 4637),
			('Pedra-vigia Observadora', 'pedra-vigiaobservadora', 4638),
			('Pedra-vigia Inspiradora', 'pedra-vigiainspiradora', 4641),
			('Espelho de Bandópolis', 'espelhodebandopolis', 4642),
			('Pedra-vigia Vigilante', 'pedra-vigiavigilante', 4643),
			('Coroa da Rainha Despedaçada', 'coroadarainhadespedacada', 4644),
			('Chama Sombria', 'chamasombria', 4645),
			('Chicote Ferrifarpo', 'chicoteferrifarpo', 6029),
			('Alvorada de Pratânia', 'alvoradadepratania', 6035),
			('Dança da Morte', 'dancadamorte', 6333),
			('Serrespada Quimiopunk', 'serrespadaquimiopunk', 6609),
			('Cajado Aquafluxo', 'cajadoaquafluxo', 6616),
			('Regenerador de Pedra Lunar', 'regeneradordepedralunar', 6617),
			('Hemodrenário', 'hemodrenario', 6630),
			('Quebrapassos', 'quebrapassos', 6631),
			('Ruptor Divino', 'ruptordivino', 6632),
			('Angústia de Liandry', 'angustiadeliandry', 6653),
			('Tormenta de Luden', 'tormentadeluden', 6655),
			('Glacieterno', 'glacieterno', 6656),
			('Brasa de Bami', 'brasadebami', 6660),
			('Manopla do Raio de Gelo', 'manopladoraiodegelo', 6662),
			('Quimiotanque Turbo', 'quimiotanqueturbo', 6664),
			('Aljava Vespertina', 'aljavavespertina', 6670),
			('Força do Vendaval', 'forcadovendaval', 6671),
			('Mata-Cráquens', 'mata-craquens', 6672),
			('Arco-escudo Imortal', 'arco-escudoimortal', 6673),
			('Adagas Rápidas Navori', 'adagasrapidasnavori', 6675),
			('A Coletora', 'acoletora', 6676),
			('Faca da Fúria', 'facadafuria', 6677),
			('Crepúsculo de Draktharr', 'crepusculodedraktharr', 6691),
			('Eclipse', 'eclipse', 6692),
			('Garra do Espreitador', 'garradoespreitador', 6693),
			('Rancor de Serylda', 'rancordeserylda', 6694),
			('Presa da Serpente', 'presadaserpente', 6695),
			('Arco do Axioma', 'arcodoaxioma', 6696),
			('Garra da Ave de Areia', 'garradaavedeareia', 7000),
			('Sizígia', 'sizigia', 7001),
			('Escultor Sombrio de Draktharr', 'escultorsombriodedraktharr', 7002),
			('Hexperimento Turbocarregado', 'hexperimentoturbocarregado', 7003),
			('Insígnia da Fornalha', 'insigniadafornalha', 7004),
			('Sufocamento Gélido', 'sufocamentogelido', 7005),
			('Tufão', 'tufao', 7006),
			('Sacrifício da Serpente', 'sacrificiodaserpente', 7007),
			('Sentinela Sanguinária', 'sentinelasanguinaria', 7008),
			('Maldição de Icathia', 'maldicaodeicathia', 7009),
			('Vesperal', 'vesperal', 7010),
			('Aeropropulsor Aprimorado', 'aeropropulsoraprimorado', 7011),
			('Lamento de Liandry', 'lamentodeliandry', 7012),
			('Olho de Luden', 'olhodeluden', 7013),
			('Inverno Eterno', 'invernoeterno', 7014),
			('Fome Incessante', 'fomeincessante', 7015),
			('Assolador de Sonhos', 'assoladordesonhos', 7016),
			('Deicídio', 'deicidio', 7017),
			('Força do Infinito', 'forcadoinfinito', 7018),
			('Relicário do Alvorecer Dourado', 'relicariodoalvorecerdourado', 7019),
			('Réquiem de Shurelya', 'requiemdeshurelya', 7020),
			('Conjurador Estelar', 'conjuradorestelar', 7021),
			('Centro de Comando', 'centrodecomando', 7022),
			('Equinócio', 'equinocio', 7023),
			('Cesura', 'cesura', 7024),
			('Gangplank Placeholder', 'gangplankplaceholder', 7050),
			('Correntes de Anátema', 'correntesdeanatema', 8001),
			('Máscara Abissal', 'mascaraabissal', 8020);

# TABELA BUILD INICIAL
CREATE TABLE tbBuildInicial(
	idBuildInicial smallint primary key auto_increment,
    idItem1 smallint not null,
    idItem2 smallint,
    idItem3 smallint,
    
    foreign key(idItem1) references tbItem(idItem),
    foreign key(idItem2) references tbItem(idItem),
    foreign key(idItem3) references tbItem(idItem)
);

# TABELA BUILD GERAL
CREATE TABLE tbBuildGeral(
	idBuildGeral smallint primary key auto_increment,
    idItem1 smallint not null,
    idItem2 smallint not null,
    idItem3 smallint not null,
    idItem4 smallint not null,
    idItem5 smallint not null,
    idItem6 smallint not null,
    
    foreign key(idItem1) references tbItem(idItem),
    foreign key(idItem2) references tbItem(idItem),
    foreign key(idItem3) references tbItem(idItem),
    foreign key(idItem4) references tbItem(idItem),
    foreign key(idItem5) references tbItem(idItem),
    foreign key(idItem6) references tbItem(idItem)
);

# TABELA BUILD SITUACIONAL
CREATE TABLE tbBuildSituacional(
	idBuildSituacional smallint primary key auto_increment,
    idItem1 smallint not null,
    idItem2 smallint not null,
    idItem3 smallint,
    
    foreign key(idItem1) references tbItem(idItem),
    foreign key(idItem2) references tbItem(idItem),
    foreign key(idItem3) references tbItem(idItem)
);

# TABELA BUILD PARA CAMPEÃO
CREATE TABLE tbBuild(
	idBuild smallint primary key auto_increment,
    idBuildInicial smallint not null,
    idBuildGeral smallint not null,
    idBuildSituacional smallint not null,
    
    foreign key(idBuildInicial) references tbBuildInicial(idBuildInicial),
    foreign key(idBuildGeral) references tbBuildGeral(idBuildGeral),
    foreign key(idBuildSituacional) references tbBuildSituacional(idBuildSituacional)
);

# TABELA ÁRVORES DE RUNAS
CREATE TABLE tbTree(
	idTree smallint primary key auto_increment,
    nomTree varchar(16) not null unique,
    keyTree varchar(24) not null unique
);

INSERT INTO tbTree(nomTree, keyTree)
	values ('Dominação', 'Domination'),
		   ('Inspiração', 'Inspiration'),
		   ('Precisão', 'Precision'),
		   ('Feitiçaria', 'Resolve'),
		   ('Determinação', 'Determination');

# TABELA RUNAS
CREATE TABLE tbRune(
	idRune smallint primary key auto_increment,
    nomRune varchar(32) not null unique,
    keyRune varchar(32) not null unique,
    imgRune varchar(32) not null unique
);

INSERT INTO tbRune(nomRune, keyRune, imgRune)
	values ('Eletrocutar', 'eletrocutar', 'Electrocute'),
		   ('Predador', 'predador', 'Predator'),
		   ('Colheita Sombria', 'colheitasombria', 'DarkHarvest'),
		   ('Chuva de Lâminas', 'chuvadelaminas', 'HailOfBlades'),
           
		   ('Golpe Desleal', 'golpedesleal', 'CheapShot'),
		   ('Gosto de Sangue', 'gostodesangue', 'TasteOfBlood'),
		   ('Impacto Repentino', 'impactorepentino', 'SuddenImpact'),
           
		   ('Sentinela Zumbi', 'sentinelazumbi', 'ZombieWard'),
		   ('Poro Fantasma', 'porofantasma', 'GhostPoro'),
		   ('Globos Oculares', 'globosoculares', 'EyeballCollection'),
           
		   ('Caçador de Tesouros', 'cacadordetesouros', 'TreasureHunter'),
		   ('Caça Ardilosa', 'cacaardilosa', 'IngeniousHunter'),
		   ('Caça Incansável', 'cacaincansavel', 'RelentlessHunter'),
		   ('Caça Suprema', 'cacasuprema', 'UltimateHunter'),
           ####################
		   ('Aprimoramento Glacial', 'aprimoramentoglacial', 'GlacialAugment'),
		   ('Livro de Feitiços Deslacrado', 'livrodefeiticosdeslacrado', 'UnsealedSpellbook'),
		   ('Primeiro Ataque', 'primeiroataque', 'FirstStrike'),
           
		   ('Flashtração Hextec', 'flashtracaohextec', 'HextechFlashtraption'),
		   ('Calçados Mágicos', 'calcadosmagicos', 'MagicalFootwear'),
		   ('Sincronia Perfeita', 'sincroniaperfeita', 'PerfectTiming'),
           
		   ('Mercado do Futuro', 'mercadodofuturo', 'FuturesMarket'),
		   ('Pulverizador de Tropas', 'pulverizadordetropas', 'MinionDematerializer'),
		   ('Entrega de Biscoitos', 'entregadebiscoitos', 'BiscuitDelivery'),
           
		   ('Perspicácia Cósmica', 'perspicaciacosmica', 'CosmicInsight'),
		   ('Velocidade de Aproximação', 'velocidadedeaproximacao', 'ApproachVelocity'),
		   ('Tônico de Distorção no Tempo', 'tonicodedistorcaonotempo', 'TimeWarpTonic'),
           ####################
		   ('Pressione o Ataque', 'pressioneoataque', 'PressTheAttack'),
		   ('Ritmo Fatal', 'ritmofatal', 'LethalTempo'),
		   ('Agilidade nos Pés', 'agilidadenospes', 'FleetFootwork'),
		   ('Conquistador', 'conquistador', 'Conqueror'),
           
		   ('Cura Excessiva', 'curaexcessiva', 'Overheal'),
		   ('Triunfo', 'triunfo', 'Triumph'),
		   ('Presença de Espírito', 'presencadeespirito', 'PresenceOfMind'),
           
		   ('Lenda: Espontaneidade', 'lendaespontaneidade', 'LegendAlacrity'),
		   ('Lenda: Tenacidade', 'lendatenacidade', 'LegendTenacity'),
		   ('Lenda: Linhagem', 'lendalinhagem', 'LegendBloodline'),
           
		   ('Golpe de Misericórdia', 'golpedemisericordia', 'CoupDeGrace'),
		   ('Dilacerar', 'dilacerar', 'CutDown'),
		   ('Até a Morte', 'ateamorte', 'LastStand'),
           ####################
		   ('Invocar Aery', 'invocaraery', 'SummonAery'),
		   ('Cometa Arcano', 'cometaarcano', 'ArcaneComet'),
		   ('Ímpeto Gradual', 'impetogradual', 'PhaseRush'),
           
		   ('Orbe Anulador', 'orbeanulador', 'NullifyingOrb'),
		   ('Faixa de Fluxo de Mana', 'faixadefluxodemana', 'ManaflowBand'),
		   ('Manto de Nimbus', 'mantodenimbus', 'NimbusCloak'),
           
		   ('Transcendência', 'transcendencia', 'Transcendence'),
		   ('Celeridade', 'celeridade', 'Celerity'),
		   ('Foco Absoluto', 'focoabsoluto', 'AbsoluteFocus'),
           
		   ('Chamuscar', 'chamuscar', 'Scorch'),
		   ('Caminhar Sobre as Águas', 'caminharsobreasaguas', 'Waterwalking'),
		   ('Tempestade Crescente', 'tempestadecrescente', 'GatheringStorm'),
           ####################
		   ('Aperto dos Mortos-Vivos', 'apertodosmortos-vivos', 'GraspOfTheUndying'),
		   ('Pós-choque', 'pos-choque', 'Aftershock'),
		   ('Guardião', 'guardiao', 'Guardian'),
           
		   ('Demolir', 'demolir', 'Demolish'),
		   ('Fonte da Vida', 'fontedavida', 'FontOfLife'),
		   ('Golpe de Escudo', 'golpedeescudo', 'ShieldBash'),
           
		   ('Condicionamento', 'condicionamento', 'Conditioning'),
		   ('Ventos Revigorantes', 'ventosrevigorantes', 'SecondWind'),
		   ('Osso Revestido', 'ossorevestido', 'BonePlating'),
           
		   ('Crescimento Excessivo', 'crescimentoexcessivo', 'Overgrowth'),
		   ('Revitalizar', 'revitalizar', 'Revitalize'),
		   ('Inabalável', 'inabalavel', 'Unflinching');

# TABELA ÁRVORE PRIMÁRIA
CREATE TABLE tbPrimTree(
	idPrimTree smallint primary key auto_increment,
    idTree smallint not null,
    idRunePrincipal smallint not null,
    idRunePrim smallint not null,
    idRuneSec smallint not null,
    idRuneTerc smallint not null,
    
    foreign key(idTree) references tbTree(idTree),
    foreign key(idRunePrincipal) references tbRune(idRune),
    foreign key(idRunePrim) references tbRune(idRune),
    foreign key(idRuneSec) references tbRune(idRune),
    foreign key(idRuneTerc) references tbRune(idRune)
);

# TABELA ÁRVORE SECUNDÁRIA
CREATE TABLE tbSecTree(
	idSecTree smallint primary key auto_increment,
    idTree smallint not null,
    idRunePrim smallint not null,
    idRuneSec smallint not null,
    
    foreign key(idTree) references tbTree(idTree),
    foreign key(idRunePrim) references tbRune(idRune),
    foreign key(idRuneSec) references tbRune(idRune)
);

# TABELA CONJUNTO DE RUNAS PARA O CAMPEÃO
CREATE TABLE tbConjRunes(
	idConjRunes smallint primary key auto_increment,
	idPrimTree smallint not null,
    idSecTree smallint not null,
    
    foreign key(idPrimTree) references tbPrimTree(idPrimTree),
    foreign key(idSecTree) references tbSecTree(idSecTree)
);

# TABELA CAMPEÃO
CREATE TABLE tbChampion(
	idChampion smallint primary key auto_increment,
    nomChampion varchar(36) not null,
    keyChampion varchar(36) not null,
    idPairSpells smallint not null,
    idBuild smallint not null,
    idConjRunes smallint not null,
    
    foreign key(idPairSpells) references tbPairSpells(idPairSpells),
    foreign key(idBuild) references tbBuild(idBuild),
    foreign key(idConjRunes) references tbConjRunes(idConjRunes)
);

DELIMITER $$
CREATE PROCEDURE spInsertChampion(
	in $nomChampion varchar(36),
    in $keyChampion varchar(36),
    
	in $keySpell1 varchar(16),
    in $keySpell2 varchar(16),
    
    in $keyItemInicial1 varchar(48),
    in $keyItemInicial2 varchar(48),
    in $keyItemInicial3 varchar(48),
    
    in $keyItemGeral1 varchar(48),
    in $keyItemGeral2 varchar(48),
    in $keyItemGeral3 varchar(48),
    in $keyItemGeral4 varchar(48),
    in $keyItemGeral5 varchar(48),
    in $keyItemGeral6 varchar(48),
    
    in $keyItemSituacional1 varchar(48),
    in $keyItemSituacional2 varchar(48),
    in $keyItemSituacional3 varchar(48),
    
    in $keyTree1 varchar(24),
    in $keyRunePrincipal1 varchar(32),
    in $keyRunePrim1 varchar(32),
    in $keyRuneSec1 varchar(32),
    in $keyRuneTerc1 varchar(32),
    
    in $keyTree2 varchar(24),
    in $keyRunePrim2 varchar(32),
    in $keyRuneSec2 varchar(32)
)
BEGIN
    DECLARE $idPairSpells smallint;
	DECLARE $idBuildInicial smallint;
	DECLARE $idBuildGeral smallint;
	DECLARE $idBuildSituacional smallint;
	DECLARE $idBuild smallint;
	DECLARE $idPrimTree smallint;
	DECLARE $idTree1 smallint;
	DECLARE $idSecTree smallint;
	DECLARE $idTree2 smallint;
	DECLARE $idConjRunes smallint;
    
	IF ($nomChampion or $keyChampion or 
		$keySpell1 or $keySpell2 or 
        $keyItemInicial1 or 
        $keyItemGeral1 or $keyItemGeral2 or $keyItemGeral3 or $keyItemGeral4 or $keyItemGeral5 or $keyItemGeral6 or
        $keyItemSituacional1 or $keyItemSituacional2 or
        $keyTree1 or $keyRunePrincipal1 or $keyRunePrim1 or $keyRuneSec1 or $keyRuneTerc1 or
        $keyTree2 or $keyRunePrim2 or $keyRuneSec2) is null THEN
			SIGNAL SQLSTATE '45000' set MESSAGE_TEXT = 'Valores obrigatórios não podem ser nulos.';
	END IF;
    
    # INSERT SPELL PAIR
    IF EXISTS(SELECT idSpell FROM tbSpell WHERE keySpell = $keySpell1) and 
	   EXISTS(SELECT idSpell FROM tbSpell WHERE keySpell = $keySpell2) THEN
		set $keySpell1 = (SELECT idSpell FROM tbSpell WHERE keySpell = $keySpell1);
		set $keySpell2 = (SELECT idSpell FROM tbSpell WHERE keySpell = $keySpell2);
        
        IF NOT EXISTS(SELECT idPairSpells FROM tbPairSpells WHERE idPrimSpell = $keySpell1 and idSecSpell = $keySpell2) THEN
			INSERT INTO tbPairSpells(idPrimSpell, idSecSpell)
				values ($keySpell1, $keySpell2);
		END IF;
        
        set $idPairSpells = (SELECT idPairSpells FROM tbPairSpells 
								WHERE idPrimSpell = $keySpell1 and 
									  idSecSpell = $keySpell2 LIMIT 1);
	ELSE
		SIGNAL SQLSTATE '45000' set MESSAGE_TEXT = 'Spell inválida.';
    END IF;
        
	# INSERT BUILD INICIAL
    IF EXISTS(SELECT idItem FROM tbItem WHERE keyItem = $keyItemInicial1) and 
	   (EXISTS(SELECT idItem FROM tbItem WHERE keyItem = $keyItemInicial2) or $keyItemInicial2 is null) and 
	   (EXISTS(SELECT idItem FROM tbItem WHERE keyItem = $keyItemInicial3) or $keyItemInicial3 is null) THEN
		set $keyItemInicial1 = (SELECT idItem FROM tbItem WHERE keyItem = $keyItemInicial1);
		set $keyItemInicial2 = (SELECT idItem FROM tbItem WHERE keyItem = $keyItemInicial2);
		set $keyItemInicial3 = (SELECT idItem FROM tbItem WHERE keyItem = $keyItemInicial3);
        
        IF NOT EXISTS(SELECT idBuildInicial FROM tbBuildInicial WHERE idItem1 = $keyItemInicial1 and (idItem2 = $keyItemInicial2 or $keyItemInicial2 is null) and (idItem3 = $keyItemInicial3 or $keyItemInicial3 is null)) THEN
			INSERT INTO tbBuildInicial(idItem1, idItem2, idItem3)
				values ($keyItemInicial1, $keyItemInicial2, $keyItemInicial3);
		END IF;
        
        set $idBuildInicial = (SELECT idBuildInicial FROM tbBuildInicial 
								WHERE idItem1 = $keyItemInicial1 and 
									  (idItem2 = $keyItemInicial2 or $keyItemInicial2 is null) and 
                                      (idItem3 = $keyItemInicial3 or $keyItemInicial3 is null) LIMIT 1);
	ELSE
		SIGNAL SQLSTATE '45000' set MESSAGE_TEXT = 'Item inicial inválido.';
    END IF;
    
    # INSERT BUILD GERAL
    IF EXISTS(SELECT idItem FROM tbItem WHERE keyItem = $keyItemGeral1) and 
	   EXISTS(SELECT idItem FROM tbItem WHERE keyItem = $keyItemGeral2) and 
	   EXISTS(SELECT idItem FROM tbItem WHERE keyItem = $keyItemGeral3) and 
	   EXISTS(SELECT idItem FROM tbItem WHERE keyItem = $keyItemGeral4) and 
	   EXISTS(SELECT idItem FROM tbItem WHERE keyItem = $keyItemGeral5) and 
	   EXISTS(SELECT idItem FROM tbItem WHERE keyItem = $keyItemGeral6) THEN
		set $keyItemGeral1 = (SELECT idItem FROM tbItem WHERE keyItem = $keyItemGeral1);
		set $keyItemGeral2 = (SELECT idItem FROM tbItem WHERE keyItem = $keyItemGeral2);
		set $keyItemGeral3 = (SELECT idItem FROM tbItem WHERE keyItem = $keyItemGeral3);
		set $keyItemGeral4 = (SELECT idItem FROM tbItem WHERE keyItem = $keyItemGeral4);
		set $keyItemGeral5 = (SELECT idItem FROM tbItem WHERE keyItem = $keyItemGeral5);
		set $keyItemGeral6 = (SELECT idItem FROM tbItem WHERE keyItem = $keyItemGeral6);
        
        IF NOT EXISTS(SELECT idBuildGeral FROM tbBuildGeral WHERE idItem1 = $keyItemGeral1 and idItem2 = $keyItemGeral2 and idItem3 = $keyItemGeral3 and idItem4 = $keyItemGeral4 and idItem5 = $keyItemGeral5 and idItem6 = $keyItemGeral6) THEN
			INSERT INTO tbBuildGeral(idItem1, idItem2, idItem3, idItem4, idItem5, idItem6)
				values ($keyItemGeral1, $keyItemGeral2, $keyItemGeral3, $keyItemGeral4, $keyItemGeral5, $keyItemGeral6);
		END IF;
        
        set $idBuildGeral = (SELECT idBuildGeral FROM tbBuildGeral 
								WHERE idItem1 = $keyItemGeral1 and 
									  idItem2 = $keyItemGeral2 and 
                                      idItem3 = $keyItemGeral3 and 
                                      idItem4 = $keyItemGeral4 and 
                                      idItem5 = $keyItemGeral5 and 
                                      idItem6 = $keyItemGeral6 LIMIT 1);
	ELSE
		SIGNAL SQLSTATE '45000' set MESSAGE_TEXT = 'Item geral inválido.';
    END IF;
    
    # INSERT BUILD SITUACIONAL
    IF EXISTS(SELECT idItem FROM tbItem WHERE keyItem = $keyItemSituacional1) and 
	   EXISTS(SELECT idItem FROM tbItem WHERE keyItem = $keyItemSituacional2) and 
	   (EXISTS(SELECT idItem FROM tbItem WHERE keyItem = $keyItemSituacional3) or $keyItemSituacional3 is null) THEN
		set $keyItemSituacional1 = (SELECT idItem FROM tbItem WHERE keyItem = $keyItemSituacional1);
		set $keyItemSituacional2 = (SELECT idItem FROM tbItem WHERE keyItem = $keyItemSituacional2);
		set $keyItemSituacional3 = (SELECT idItem FROM tbItem WHERE keyItem = $keyItemSituacional3);
        
        IF NOT EXISTS(SELECT idBuildSituacional FROM tbBuildSituacional WHERE idItem1 = $keyItemSituacional1 and idItem2 = $keyItemSituacional2 and (idItem3 = $keyItemSituacional3 or $keyItemSituacional3 is null)) THEN
			INSERT INTO tbBuildSituacional(idItem1, idItem2, idItem3)
			values ($keyItemSituacional1, $keyItemSituacional2, $keyItemSituacional3);
		END IF;
        
        set $idBuildSituacional = (SELECT idBuildSituacional FROM tbBuildSituacional 
								WHERE idItem1 = $keyItemSituacional1 and 
									  idItem2 = $keyItemSituacional2 and 
                                      (idItem3 = $keyItemSituacional3 or $keyItemSituacional3 is null) LIMIT 1);
	ELSE
		SIGNAL SQLSTATE '45000' set MESSAGE_TEXT = 'Item situacional inválido.';
    END IF;
    
    INSERT INTO tbBuild(idBuildInicial, idBuildGeral, idBuildSituacional)
		values ($idBuildInicial, $idBuildGeral, $idBuildSituacional);
	
    set $idBuild = (SELECT idBuild FROM tbBuild 
						WHERE idBuildInicial = $idBuildInicial and
							  idBuildGeral = $idBuildGeral and 
                              idBuildSituacional = $idBuildSituacional LIMIT 1);
    
    # INSERT ÁRVORE PRIMÁRIA
    IF EXISTS(SELECT idTree FROM tbTree WHERE keyTree = $keyTree1) and 
	   EXISTS(SELECT idRune FROM tbRune WHERE keyRune = $keyRunePrincipal1) and 
	   EXISTS(SELECT idRune FROM tbRune WHERE keyRune = $keyRunePrim1) and 
	   EXISTS(SELECT idRune FROM tbRune WHERE keyRune = $keyRuneSec1) and 
	   EXISTS(SELECT idRune FROM tbRune WHERE keyRune = $keyRuneTerc1) THEN
	    set $keyTree1 = (SELECT idTree FROM tbTree WHERE keyTree = $keyTree1);
		set $keyRunePrincipal1 = (SELECT idRune FROM tbRune WHERE keyRune = $keyRunePrincipal1);
		set $keyRunePrim1 = (SELECT idRune FROM tbRune WHERE keyRune = $keyRunePrim1);
		set $keyRuneSec1 = (SELECT idRune FROM tbRune WHERE keyRune = $keyRuneSec1);
		set $keyRuneTerc1 = (SELECT idRune FROM tbRune WHERE keyRune = $keyRuneTerc1);
        
        IF NOT EXISTS(SELECT idPrimTree FROM tbPrimTree WHERE idTree = $keyTree1 and idRunePrincipal = $keyRunePrincipal1 and idRunePrim = $keyRunePrim1 and idRuneSec = $keyRuneSec1 and idRuneTerc = $keyRuneTerc1) THEN
			INSERT INTO tbPrimTree(idTree, idRunePrincipal, idRunePrim, idRuneSec, idRuneTerc)
				values ($keyTree1, $keyRunePrincipal1, $keyRunePrim1, $keyRuneSec1, $keyRuneTerc1);
		END IF;
        
        set $idPrimTree = (SELECT idPrimTree FROM tbPrimTree 
								WHERE idRunePrincipal = $keyRunePrincipal1 and 
									  idRunePrim = $keyRunePrim1 and 
                                      idRuneSec = $keyRuneSec1 and 
                                      idRuneTerc = $keyRuneTerc1 LIMIT 1);
	ELSE
		SIGNAL SQLSTATE '45000' set MESSAGE_TEXT = 'Runa da árvore primária inválida.';
    END IF;
    
    # INSERT ÁRVORE SECUNDÁRIA
    IF EXISTS(SELECT idTree FROM tbTree WHERE keyTree = $keyTree2) and 
       EXISTS(SELECT idRune FROM tbRune WHERE keyRune = $keyRunePrim2) and 
	   EXISTS(SELECT idRune FROM tbRune WHERE keyRune = $keyRuneSec2) THEN
	    set $keyTree2 = (SELECT idTree FROM tbTree WHERE keyTree = $keyTree2);
		set $keyRunePrim2 = (SELECT idRune FROM tbRune WHERE keyRune = $keyRunePrim2);
		set $keyRuneSec2 = (SELECT idRune FROM tbRune WHERE keyRune = $keyRuneSec2);
        
        IF NOT EXISTS(SELECT idSecTree FROM tbSecTree WHERE idTree = $keyTree1 and idRunePrim = $keyRunePrim2 and idRuneSec = $keyRuneSec2) THEN
			INSERT INTO tbSecTree(idTree, idRunePrim, idRuneSec)
				values ($keyTree2, $keyRunePrim2, $keyRuneSec2);
		END IF;
        
        set $idSecTree = (SELECT idSecTree FROM tbSecTree 
								WHERE idRunePrim = $keyRunePrim2 and 
									  idRuneSec = $keyRuneSec2 LIMIT 1);
	ELSE
		SIGNAL SQLSTATE '45000' set MESSAGE_TEXT = 'Runa da árvore secundária inválida.';
    END IF;
    
    # INSERT CONJUNTO DE RUNAS
	IF NOT EXISTS(SELECT idConjRunes FROM tbConjRunes WHERE idPrimTree = $idPrimTree and idSecTree = $idSecTree) THEN 
		INSERT INTO tbConjRunes(idPrimTree, idSecTree)
			values ($idPrimTree, $idSecTree);
	END IF;
	
    set $idConjRunes = (SELECT idConjRunes FROM tbConjRunes 
							WHERE idPrimTree = $idPrimTree and 
								  idSecTree = $idSecTree LIMIT 1);
	
    INSERT INTO tbChampion(nomChampion, keyChampion, idPairSpells, idBuild, idConjRunes) 
		values ($nomChampion, $keyChampion, $idPairSpells, $idBuild, $idConjRunes);
END $$

CALL spInsertChampion('Kalista', 'Kalista', 
					  'Exhaust', 'Flash', 
					  'laminadedoran', 'pocaodevida', 'lancanegradakalista', 
					  'arco-escudoimortal', 'grevasdoberserker', 'laminadafuriadeguinsoo', 'espadadoreidestruido', 'furacaoderunaan', 'limitedarazao',
					  'anjoguardiao', 'lembretemortal', 'lembrancasdolordedominik',
                      'Precision', 'ritmofatal', 'triunfo', 'lendaespontaneidade', 'golpedemisericordia',
                      'Domination' ,'gostodesangue', 'cacadordetesouros');

CALL spInsertChampion('Ezreal', 'Ezreal', 
					  'Heal', 'Flash', 
					  'lagrimadadeusa', 'pocaodevida', null, 
					  'forcadatrindade', 'botasionianasdalucidez', 'manamune', 'coracaocongelado', 'rancordeserylda', 'hidraraivosa',
					  'colhedordeessencia', 'ruptordivino', 'ampulhetadezhonya',
                      'Precision', 'pressioneoataque', 'presencadeespirito', 'lendalinhagem', 'golpedemisericordia',
                      'Inspiration', 'calcadosmagicos', 'entregadebiscoitos');

CALL spInsertChampion('Lucian', 'Lucian', 
					  'Heal', 'Flash', 
					  'laminadedoran', 'pocaodevida', null, 
					  'forcadovendaval', 'grevasdoberserker', 'colhedordeessencia', 'canhaofumegante', 'gumedoinfinito', 'acoletora',
					  'lembrancasdolordedominik', 'lembretemortal', 'anjoguardiao',
                      'Precision', 'pressioneoataque', 'presencadeespirito', 'lendalinhagem', 'golpedemisericordia',
                      'Inspiration', 'calcadosmagicos', 'entregadebiscoitos');

CALL spInsertChampion('Shen', 'Shen', 
					  'Teleport', 'Flash', 
					  'escudodedoran', 'pocaodevida', null, 
					  'manopladoraiodegelo', 'botasgalvanizadasdeaco', 'hidratitanica', 'armaduradeespinhos', 'forcadanatureza', 'placagargolitica',
					  'pressagioderanduin', 'egidedefogosolar', 'passosdemercurio',
                      'Determination', 'apertodosmortos-vivos', 'golpedeescudo', 'ventosrevigorantes', 'revitalizar',
                      'Domination', 'golpedesleal', 'cacasuprema');

CALL spInsertChampion('Veigar', 'Veigar', 
					  'Teleport', 'Flash', 
					  'aneldedoran', 'pocaodevida', null, 
					  'glacieterno', 'sapatosdofeiticeiro', 'ampulhetadezhonya', 'cajadodovazio', 'capuzdamortederabadon', 'morellonomicon',
					  'tormentadeluden', 'botasionianasdalucidez', 'veudabanshee',
                      'Domination', 'eletrocutar', 'gostodesangue', 'globosoculares', 'cacaardilosa',
                      'Resolve', 'faixadefluxodemana', 'transcendencia');

CALL spInsertChampion('Ashe', 'Ashe', 
					  'Heal', 'Flash', 
					  'laminadedoran', 'pocaodevida', null, 
					  'mata-craquens', 'grevasdoberserker', 'dancarinafantasma', 'gumedoinfinito', 'furacaoderunaan', 'espadadoreidestruido',
					  'arco-escudoimortal', 'lembretemortal', 'laminadafuriadeguinsoo',
                      'Precision', 'ritmofatal', 'presencadeespirito', 'lendaespontaneidade', 'golpedemisericordia',
                      'Inspiration' ,'entregadebiscoitos', 'velocidadedeaproximacao');

CALL spInsertChampion('Sivir', 'Sivir', 
					  'Heal', 'Flash', 
					  'laminadedoran', 'pocaodevida', null, 
					  'mata-craquens', 'grevasdoberserker', 'dancarinafantasma', 'gumedoinfinito', 'lembrancasdolordedominik', 'sedentaporsangue',
					  'forcadovendaval', 'lembretemortal', 'anjoguardiao',
                      'Precision', 'ritmofatal', 'presencadeespirito', 'lendalinhagem', 'golpedemisericordia',
                      'Inspiration' , 'calcadosmagicos', 'entregadebiscoitos');

CALL spInsertChampion('Tristana', 'Tristana', 
					  'Exhaust', 'Flash', 
					  'laminadedoran', 'pocaodevida', null, 
					  'mata-craquens', 'grevasdoberserker', 'dancarinafantasma', 'gumedoinfinito', 'lembrancasdolordedominik', 'canhaofumegante',
					  'forcadovendaval', 'chuvadecanivete', 'anjoguardiao',
                      'Domination', 'chuvadelaminas', 'gostodesangue', 'globosoculares', 'cacadordetesouros',
                      'Precision' , 'triunfo', 'lendalinhagem');



# SELECT SPELL PAIR
SELECT idPairSpells, s1.keySpell, s1.imgSpell, s2.keySpell, s2.imgSpell FROM tbPairSpells p 
	INNER JOIN tbSpell s1 on
		p.idPrimSpell = s1.idSpell
	INNER JOIN tbSpell s2 on
		p.idSecSpell = s2.idSpell;

# SELECT BUILD INICIAL
SELECT idBuildInicial, i1.nomItem, i1.imgItem, i2.nomItem, i2.imgItem, i3.nomItem, i3.imgItem  FROM tbBuildInicial bi 
	INNER JOIN tbItem i1 on
		bi.idItem1 = i1.idItem
	LEFT JOIN tbItem i2 on
		bi.idItem2 = i2.idItem
	LEFT JOIN tbItem i3 on
		bi.idItem3 = i3.idItem;

# SELECT BUILD GERAL
SELECT idBuildGeral, i1.keyItem, i1.imgItem, i2.keyItem, i2.imgItem, i3.keyItem, i3.imgItem, i4.keyItem, i4.imgItem, i5.keyItem, i5.imgItem, i6.keyItem, i6.imgItem FROM tbBuildGeral bg 
	INNER JOIN tbItem i1 on
		bg.idItem1 = i1.idItem
	LEFT JOIN tbItem i2 on
		bg.idItem2 = i2.idItem
	LEFT JOIN tbItem i3 on
		bg.idItem3 = i3.idItem
	LEFT JOIN tbItem i4 on
		bg.idItem4 = i4.idItem
	LEFT JOIN tbItem i5 on
		bg.idItem5 = i5.idItem
	LEFT JOIN tbItem i6 on
		bg.idItem6 = i6.idItem;

# SELECT BUILD SITUACIONAL
SELECT idBuildSituacional, i1.nomItem, i1.imgItem, i2.nomItem, i2.imgItem, i3.nomItem, i3.imgItem  FROM tbBuildSituacional bs 
	INNER JOIN tbItem i1 on
		bs.idItem1 = i1.idItem
	LEFT JOIN tbItem i2 on
		bs.idItem2 = i2.idItem
	LEFT JOIN tbItem i3 on
		bs.idItem3 = i3.idItem;

# SELECT BUILD
SELECT * FROM tbBuild;

# SELECT ÁRVORE PRIMÁRIA
SELECT * FROM tbPrimTree;

# SELECT ÁRVORE SECUNDÁRIA
SELECT * FROM tbSecTree;

# SELECT CONJUNTO DE RUNAS
SELECT * FROM tbConjRunes;

# SELECT CHAMPION
CREATE VIEW vwChampion AS SELECT nomChampion, keyChampion, 
		s1.nomSpell as 'nomSpell1', s1.keySpell as 'keySpell1', s1.imgSpell as 'imgSpell1', s2.nomSpell as 'nomSpell2', s2.keySpell as 'keySpell2', s2.imgSpell as 'imgSpell2', 
        ii1.nomItem as 'nomItemInicial1', ii1.imgItem as 'imgItemInicial1', ii2.nomItem as 'nomItemInicial2', ii2.imgItem as 'imgItemInicial2', ii3.nomItem as 'nomItemInicial3', ii3.imgItem as 'imgItemInicial3', 
        ig1.nomItem as 'nomItemGeral1', ig1.imgItem as 'imgItemGeral1', ig2.nomItem as 'nomItemGeral2', ig2.imgItem as 'imgItemGeral2', ig3.nomItem as 'nomItemGeral3', ig3.imgItem as 'imgItemGeral3', ig4.nomItem as 'nomItemGeral4', ig4.imgItem as 'imgItemGeral4', ig5.nomItem as 'nomItemGeral5', ig5.imgItem as 'imgItemGeral5', ig6.nomItem as 'nomItemGeral6', ig6.imgItem as 'imgItemGeral6', 
        is1.nomItem as 'nomItemSituacional1', is1.imgItem as 'imgItemSituacional1', is2.nomItem as 'nomItemSituacional2', is2.imgItem as 'imgItemSituacional2', is3.nomItem as 'nomItemSituacional3', is3.imgItem as 'imgItemSituacional3' 
        FROM tbChampion c
	INNER JOIN tbPairSpells p on
		c.idPairSpells = p.idPairSpells
	INNER JOIN tbSpell s1 on
		p.idPrimSpell = s1.idSpell
	INNER JOIN tbSpell s2 on
		p.idSecSpell = s2.idSpell
    INNER JOIN tbBuild b on 
		b.idBuild = c.idBuild
	INNER JOIN tbBuildInicial bi on
		bi.idBuildInicial = b.idBuildInicial
	INNER JOIN tbItem ii1 on
		bi.idItem1 = ii1.idItem
	LEFT JOIN tbItem ii2 on
		bi.idItem2 = ii2.idItem
	LEFT JOIN tbItem ii3 on
		bi.idItem3 = ii3.idItem
	INNER JOIN tbBuildGeral bg on 
		bg.idBuildGeral = b.idBuildGeral
	INNER JOIN tbItem ig1 on
		bg.idItem1 = ig1.idItem
	LEFT JOIN tbItem ig2 on
		bg.idItem2 = ig2.idItem
	LEFT JOIN tbItem ig3 on
		bg.idItem3 = ig3.idItem
	LEFT JOIN tbItem ig4 on
		bg.idItem4 = ig4.idItem
	LEFT JOIN tbItem ig5 on
		bg.idItem5 = ig5.idItem
	LEFT JOIN tbItem ig6 on
		bg.idItem6 = ig6.idItem
	INNER JOIN tbBuildSituacional bs on
		bs.idBuildSituacional = b.idBuildSituacional
	INNER JOIN tbItem is1 on
		bs.idItem1 = is1.idItem
	LEFT JOIN tbItem is2 on
		bs.idItem2 = is2.idItem
	LEFT JOIN tbItem is3 on
		bs.idItem3 = is3.idItem;

# PROCEDURES PROCEDURES PROCEDURES PROCEDURES PROCEDURES PROCEDURES PROCEDURES PROCEDURES PROCEDURES PROCEDURES PROCEDURES #
# CEDURES PROCEDURES PROCEDURES PROCEDURES PROCEDURES PROCEDURES PROCEDURES PROCEDURES PROCEDURES PROCEDURES PROCEDURES PR #
# ES PROCEDURES PROCEDURES PROCEDURES PROCEDURES PROCEDURES PROCEDURES PROCEDURES PROCEDURES PROCEDURES PROCEDURES PROCEDU #
DELIMITER $$
CREATE PROCEDURE spGetItemById(
	in $idItem smallint
)
BEGIN
	SELECT nomItem, keyItem, imgItem FROM tbItem WHERE idItem = $idItem;
END $$

DELIMITER $$
CREATE PROCEDURE spGetSituacionalBuildById(
	in $idBuildSituacional smallint
)
BEGIN
	SELECT idItem1, idItem2, idItem3 FROM tbBuildSituacional WHERE idBuildSituacional = $idBuildSituacional;
END $$

DELIMITER $$
CREATE PROCEDURE spGetGeralBuildById(
	in $idBuildGeral smallint
)
BEGIN
	SELECT idItem1, idItem2, idItem3, idItem4, idItem5, idItem6 FROM tbBuildGeral WHERE idBuildGeral = $idBuildGeral;
END $$

DELIMITER $$
CREATE PROCEDURE spGetInicialBuildById(
	in $idBuildInicial smallint
)
BEGIN
	SELECT idItem1, idItem2, idItem3 FROM tbBuildInicial WHERE idBuildInicial = $idBuildInicial;
END $$

DELIMITER $$
CREATE PROCEDURE spGetBuildByChampionKey(
	in $keyChampion varchar(36)
)
BEGIN
	SELECT idBuildInicial, idBuildGeral, idBuildSituacional FROM tbBuild WHERE idBuild = (SELECT idBuild FROM tbChampion WHERE keyChampion = $keyChampion);
END $$

DELIMITER $$
CREATE PROCEDURE spGetRuneById(
	in $idRune smallint
)
BEGIN
	SELECT nomRune, keyRune, imgRune FROM tbRune WHERE idRune = $idRune;
END $$

DELIMITER $$
CREATE PROCEDURE spGetTreeById(
	in $idTree smallint
)
BEGIN
	SELECT nomTree, keyTree FROM tbTree WHERE idTree = $idTree;
END $$

DELIMITER $$
CREATE PROCEDURE spGetSecTreeById(
	in $idSecTree smallint
)
BEGIN
	SELECT idTree, idRunePrim, idRuneSec FROM tbSecTree WHERE idSecTree = $idSecTree;
END $$

DELIMITER $$
CREATE PROCEDURE spGetPrimTreeById(
	in $idPrimTree smallint
)
BEGIN
	SELECT idTree, idRunePrincipal, idRunePrim, idRuneSec, idRuneTerc FROM tbPrimTree WHERE idPrimTree = $idPrimTree;
END $$

DELIMITER $$
CREATE PROCEDURE spGetConjRunesByChampionKey(
	in $keyChampion varchar(36)
)
BEGIN
	SELECT idPrimTree, idSecTree FROM tbConjRunes WHERE idConjRunes = (SELECT idConjRunes FROM tbChampion WHERE keyChampion = $keyChampion);
END $$

DELIMITER $$
CREATE PROCEDURE spGetSpellByKey(
	in $keySpell varchar(16)
)
BEGIN
	SELECT nomSpell, keySpell, imgSpell FROM tbSpell WHERE keySpell = $keySpell;
END $$

DELIMITER $$
CREATE PROCEDURE spGetPairSpellByChampionKey(
	in $keyChampion varchar(36)
)
BEGIN
	SELECT keySpell1, keySpell2 FROM vwChampion WHERE keyChampion = $keyChampion;
END $$

DELIMITER $$
CREATE PROCEDURE spGetChampionByKey(
	in $keyChampion varchar(36)
)
BEGIN
	SELECT * FROM vwChampion WHERE nomChampion = (SELECT nomChampion FROM tbChampion WHERE keyChampion = $keyChampion);
END $$



CALL spGetChampionByKey("Veigar");