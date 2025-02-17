CREATE TABLE main_categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT
);


CREATE TABLE subcategories (
    id SERIAL PRIMARY KEY,
    main_category_id INTEGER NOT NULL REFERENCES main_categories(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    description TEXT
);


CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    content TEXT NOT NULL,
    subcategory_id INTEGER NOT NULL REFERENCES subcategories(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT NOW(),
    word_count INTEGER, 
    display_order INTEGER DEFAULT 0
);


CREATE TABLE media (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    media_type TEXT CHECK (media_type IN ('video', 'podcast', 'blog', 'book')), -- Optioneel type veld
    photo TEXT, -- Thumbnail of afbeelding
    link TEXT, -- URL naar video/podcast/blog/boek
    description TEXT,
    display_order INTEGER DEFAULT 0
);


CREATE TABLE media_links (
    id SERIAL PRIMARY KEY,
    media_id INTEGER NOT NULL REFERENCES media(id) ON DELETE CASCADE,
    link_name TEXT NOT NULL, -- "Bestel dit boek", "Bekijk op YouTube", etc.
    url TEXT NOT NULL
);



-- Inserting info
-- Inserting into main_categories
INSERT INTO main_categories (id, name, description) VALUES
(1, 'Elke verliessituatie is anders', 'Lorem'),
(2, 'Omgaan met verlies', 'Ipsum'),
(3, 'Omstandigheden rond het overlijden', 'Dolor'),
(4, 'Uw eigen laatje voor later', 'Sit'),
(5, 'Overige', 'Amet');

-- Inserting into subcategories
INSERT INTO subcategories (id, main_category_id, name, description) VALUES
(1, 1, 'Verlies van een partner', 'Lorem ipsum'),
(2, 1, 'Verlies van ouders', 'Lorem ipsum'),
(3, 1, 'Verlies van broer of zus', 'Lorem ipsum'),
(4, 1, 'Verlies van vrienden', 'Lorem ipsum'),
(5, 1, 'Verlies van een baby', 'Lorem ipsum'),
(6, 1, 'Stilgeboren', 'Lorem ipsum'),
(7, 1, 'Overige', 'Lorem ipsum'),
(8, 2, 'Eerder verlies en levenservaringen', 'Lorem ipsum'),
(9, 2, 'Kinderen helpen bij verlies', 'Lorem ipsum'),
(10, 2, 'Hulp bieden en hulp zoeken', 'Lorem ipsum'),
(11, 2, 'Dagboek blog', 'Lorem ipsum'),
(12, 3, 'Onverwacht', 'Lorem ipsum'),
(13, 3, 'Ziekte', 'Lorem ipsum'),
(14, 3, 'Euthanasie', 'Lorem ipsum'),
(15, 3, 'Zelfdoding', 'Lorem ipsum'),
(16, 3, 'Ongeval', 'Lorem ipsum'),
(17, 3, 'Overig', 'Lorem ipsum'),
(18, 4, 'Praten met je naasten', 'Lorem ipsum'),
(19, 4, 'Alles goed achterlaten', 'Lorem ipsum'),
(20, 4, 'Wensen vastleggen', 'Lorem ipsum');

-- Inserting into articles
INSERT INTO articles (id, name, content, subcategory_id, display_order) VALUES
(1, 'Veranderende relatie met je omgeving', '<b>Iedereen heeft zo zijn eigen automatische reactie op problemen. Psychologen noemen dat "copingsstijlen". Een copingsstijl werkt in de ene situatie beter dan in de andere. Hier lees je welke copingstijlen er zijn, en wanneer je ze het beste kunt inzetten.</b> <br><br> Stel, je opent ''s avonds je mail en ziet een boos bericht van een vriendin die zich door jou gekwetst voelt. Die mail roept een scala aan gevoelens op, varierend van boos, schuldig, verdrietig, angstig tot machteloos en somber. <br><br> Wat doe je? Schiet je in de ontkenning? Ga je het vermijden, zoek je afleiding, uit je je emoties, werk je er hard aan, relativeer je het met geruststellende gedachten of zoek je steun bij anderen? <br><br><h1>Welke van deze copingstijlen herken jij?</h1> <b>1. Je negeert het probleem of stelt het uit</b><br> Je blokkeert totaal, je gaat door naar het volgende mail alsof er niets aan de hand is. Dit is de copingstijl vermijden/uitstellen: je kunt het probleem nog niet aan. <br><br> Sommige mensen zijn zo goed in het negeren van slecht nieuws dat het lijkt alsof ze het niet hebben gehoord of dat ze het zijn vergeten. <br><br> Intussen gebeurt er toch wel iets: in je onderbewuste raak je langzaam gewend aan het slechte nieuws. Zodat je later, als je die mail opnieuw ziet, het probleem wel aankunt. <br><br> <b>2. Je doet niets, omdat alles zinloos is</b> <br> het kan ook zijn dat je de rest van de avond blijft piekeren over wat je verkeerd deed. Dat is de copingstijl machteloze passiviteit: ''Alles gaat mis, ik kan dit niet.'' <br><br> Dit getob lijkt weining constructief, maar deze overdrijving helpt wel om te accepteren dat er iets is misgegaan. Grote kans dat de boosheid van je vriendin blijkt mee te vallen als je de mail later opnieuw leest. <br><br> <b>3. Je pakt het probleem actief aan</b><br> Je grijpt de telefoon om de ruzie direct uit de wereld te helpen. Dat is de actieve aanpak. Daarmee kan de kwestie snel uit de wereld worden geholpen. <br><br> Er is wel een risico: misschien reageer je te defensief, te boos of te radicaal, omdat je niet de tijd nam om eerst even tot jezelf te komen.', 1, 0);
