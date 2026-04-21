USE seed_bank;

-- plants table
CREATE TABLE plants (
    -- seed basic info
    plant_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    variety VARCHAR(150),
    category VARCHAR(50),
    seed_type VARCHAR(50),
    
    -- size full grown
    height_cm INT,
    spread_cm INT,
    spacing_cm INT,
    
    -- seed saving 
    can_save_seeds BOOLEAN NOT NULL DEFAULT FALSE,
    seed_saving_notes TEXT,
    seed_saving_link VARCHAR(255),
    
    -- notes -- check TEXT data type as longer space good, but check conventions and constraints
    general_notes TEXT
    
);
    
-- where seed stored
CREATE TABLE locations (
    location_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    location_name VARCHAR(150) NOT NULL,
    location_type VARCHAR(50),
    notes TEXT
);

-- inventory
CREATE TABLE SeedPackets (
    packet_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    plant_id INT NOT NULL,
    location INT NOT NULL,
    
    source VARCHAR(150),
    product_url VARCHAR(150),
    
    purchase_date DATE,
    expiry_date DATE,
    quantity_estimate INT,
    
    quantity_unit VARCHAR(50),
    quantity_level VARCHAR(20),
    
    opened BOOLEAN NOT NULL DEFAULT FALSE,
    shareable BOOLEAN NOT NULL DEFAULT FALSE,
    
    notes TEXT,
    
    FOREIGN KEY (plant_id) REFERENCES plants(plant_id),
    FOREIGN KEY (location) REFERENCES locations(location_id)
);
    
    
-- SowingInstructions
CREATE TABLE SowingInstructions (
    instruction_id INT PRIMARY KEY AUTO_INCREMENT,
    plant_id INT NOT NULL,

    sow_indoors_from TINYINT,
    sow_indoors_to TINYINT,

    sow_outdoors_from TINYINT,
    sow_outdoors_to TINYINT,
    
    plant_out_from TINYINT,
    plant_out_to TINYINT,

    germination_days_min INT,
    germination_days_max INT,

    weeks_to_first_flowering INT,
    weeks_to_first_fruiting INT,
    weeks_to_first_harvest INT,
    weeks_to_peak_harvest INT,

    days_to_maturity INT,

    instructions_notes TEXT,

    FOREIGN KEY (plant_id) REFERENCES Plants(plant_id)
    
    CHECK (sow_indoors_from BETWEEN 1 AND 12 OR sow_indoors_from IS NULL),
    CHECK (sow_indoors_to BETWEEN 1 AND 12 OR sow_indoors_to IS NULL),

    CHECK (sow_outdoors_from BETWEEN 1 AND 12 OR sow_outdoors_from IS NULL),
    CHECK (sow_outdoors_to BETWEEN 1 AND 12 OR sow_outdoors_to IS NULL),

    CHECK (plant_out_from BETWEEN 1 AND 12 OR plant_out_from IS NULL),
    CHECK (plant_out_to BETWEEN 1 AND 12 OR plant_out_to IS NULL)
);
    

-- PacketImages
CREATE TABLE PacketImages (
    image_id INT PRIMARY KEY AUTO_INCREMENT,
    packet_id INT NOT NULL,

    -- store image url 
    image_type VARCHAR(50),
    image_path VARCHAR(255) NOT NULL,
    caption VARCHAR(255),

    uploaded_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (packet_id) REFERENCES SeedPackets(packet_id)
);
    
    
-- GrowingResults
CREATE TABLE GrowingResults (
    result_id INT PRIMARY KEY AUTO_INCREMENT,
    packet_id INT NOT NULL,

    year_grown YEAR NOT NULL,

    germination_rating INT,
    growth_rating INT,
    yield_or_flowering_rating INT,

    would_grow_again VARCHAR(10),
    seeds_collected BOOLEAN NOT NULL DEFAULT FALSE,

    notes TEXT,
    date_recorded DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (packet_id) REFERENCES SeedPackets(packet_id),

    CHECK (germination_rating IS NULL OR germination_rating BETWEEN 1 AND 10),
    CHECK (growth_rating IS NULL OR growth_rating BETWEEN 1 AND 10),
    CHECK (yield_or_flowering_rating IS NULL OR yield_or_flowering_rating BETWEEN 1 AND 10),
    CHECK (would_grow_again IS NULL OR would_grow_again IN ('yes','no','maybe'))
);

INSERT INTO location (location_name, location_type) VALUES
('Seed case in bench', 'outdoor'),
('Tin on kitchen shelf', 'indoor'),
('Jar on kitchen shelf', 'indoor'),
('Bag on kitchen shelf', 'indoor'),
('Window sill', 'indoor'),
('Fabric pouch in kitchen', 'indoor'),
('Dresser', 'indoor'),
('Kitchen table', 'indoor');

-- add seed data
INSERT INTO Plants (
    name,
    variety,
    category,
    seed_type,
    height_cm,
    spacing_cm,
    can_save_seeds,
    general_notes
)
VALUES (
    'Lupin',
    'Dieta',
    'vegetable',
    'open-pollinated',
    75,        -- 2–3 ft ≈ 60–90 cm → midpoint
    30,        -- estimated spacing (can refine later)
    TRUE,
    'Edible sweet lupin bred in the UK. High-protein crop. Flowers then produces edible seeds.'
);

INSERT INTO SeedPackets (
    plant_id,
    location,
    source,
    product_url,
    quantity_estimate,
    quantity_unit,
    quantity_level,
    opened,
    shareable
)
VALUES (
    1,
    1,
    'Real Seeds',
    'https://www.realseeds.co.uk/lupins.html#ludi',
    40,
    'seeds',
    'medium',
    FALSE,
    TRUE,
    'Sweet lupin variety Dieta. Germination can be erratic.'
);

INSERT INTO SowingInstructions (
    plant_id,
    sow_indoors_from,
    sow_indoors_to,
    plant_out_from,
    plant_out_to,
    germination_days_min,
    germination_days_max,
    weeks_to_first_flowering,
    weeks_to_first_harvest,
    instructions_notes
)
VALUES (
    1,
    4,
    6,
    5,
    7,
    7,
    21,
    10,
    14,
    'Sow in spring from April onwards in small pots. Transplant out when 4 to 5 inches tall. Germination can be erratic.'
);

SELECT p.name, p.variety, sp.quantity_estimate, l.location_name
FROM SeedPackets sp
JOIN Plants p ON sp.plant_id = p.plant_id
JOIN locations l ON sp.location = l.location_id
WHERE p.name = 'Lupin';

ALTER TABLE Plants
ADD life_cycle VARCHAR(50),
ADD hardiness VARCHAR(50),
ADD self_seeds BOOLEAN;

CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE PlantCategories (
    plant_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (plant_id, category_id),
    FOREIGN KEY (plant_id) REFERENCES Plants(plant_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

INSERT INTO Categories (category_name) VALUES
('edible'),
('flower'),
('fruit'),
('vegetable'),
('herb'),
('scent'),
('climber'),
('bush'),
('ground_cover'),
('tuber'),
('rhizome'),
('pollinator'),
('ornamental'),
('protein_crop'),
('cut_flower'),
('salad');

INSERT INTO Plants (
    name,
    variety,
    seed_type,
    height_cm,
    spacing_cm,
    life_cycle,
    hardiness,
    self_seeds,
    general_notes
)

VALUES (
    'Lupin',
    'Dieta',
    'open-pollinated',
    75,
    30,
    'annual',          -- or perennial depending how you treat it
    'hardy',
    FALSE,
    'Edible sweet lupin bred in the UK. High-protein seeds. Flowers then pods.'
);

SELECT * FROM Plants WHERE name = 'Lupin';

SELECT * FROM Categories;

INSERT INTO PlantCategories (plant_id, category_id) VALUES
(1, 1),  -- edible
(1, 2),  -- flower
(1, 14); -- protein_crop

SELECT * FROM locationS;

INSERT INTO SeedPackets (
    plant_id,
    location,
    source,
    product_url,
    quantity_estimate,
    quantity_unit,
    quantity_level,
    opened,
    shareable,
)
VALUES (
    1,
    2,
    'Real Seeds',
    'https://www.realseeds.co.uk/lupins.html#ludi',
    40,
    'seeds',
    'medium',
    FALSE,
    TRUE,
    'Germination can be erratic. Two seeds per pot recommended.'
);

INSERT INTO SowingInstructions (
    plant_id,
    sow_indoors_from,
    sow_indoors_to,
    plant_out_from,
    plant_out_to,
    germination_days_min,
    germination_days_max,
    weeks_to_first_flowering,
    weeks_to_first_harvest,
    instructions_notes
)
VALUES (
    1,
    4,
    6,
    5,
    7,
    7,
    21,
    10,
    14,
    'Sow in pots from April. Transplant when 4–5 inches tall.'
);

SELECT 
    p.name,
    p.variety,
    c.category_name,
    sp.quantity_estimate,
    l.location_name
FROM Plants p
JOIN PlantCategories pc ON p.plant_id = pc.plant_id
JOIN Categories c ON pc.category_id = c.category_id
JOIN SeedPackets sp ON sp.plant_id = p.plant_id
JOIN locationS l ON sp.location = l.location_id
WHERE p.name = 'Lupin';


DESCRIBE Plants;

-- bulk insert
INSERT INTO Plants (
    name,
    variety,
    seed_type,
    height_cm,
    spacing_cm,
    life_cycle,
    hardiness,
    self_seeds,
    general_notes
)
VALUES

-- Lupin
('Lupin', 'Dieta', 'open-pollinated', 75, 30, 'annual', 'hardy', FALSE,
 'Edible sweet lupin bred in the UK. High-protein seeds. Flowers then pods.'),

-- Breadseed Poppy
('Poppy', 'Sokol Breadseed', 'open-pollinated', 90, NULL, 'annual', 'hardy', TRUE,
 'Pale pink poppy with edible white seeds. Does not self-shatter.'),

-- Mixed Nasturtiums
('Nasturtium', 'Mixed', 'mixed', NULL, NULL, 'annual', 'half-hardy', TRUE,
 'Edible leaves, flowers and seed pods. Mixed colours including variegated leaves.'),

-- Edible Chrysanthemum
('Edible Chrysanthemum', 'Fine Leaved', 'open-pollinated', NULL, NULL, 'annual', 'half-hardy', TRUE,
 'Shungiku. Quick salad crop, edible leaves and flowers.'),

-- Ox-Eye Daisy
('Ox-Eye Daisy', NULL, 'wildflower', 60, 25, 'perennial', 'hardy', TRUE,
 'Pollinator-friendly daisy. Flowers year after year.'),

-- Nigella
('Nigella', 'Miss Jekyll', 'open-pollinated', NULL, NULL, 'annual', 'hardy', TRUE,
 'Love-in-a-mist. Sky-blue flowers. Good for cut and dried use.'),

-- Calendula
('Calendula', 'Pink Surprise', 'open-pollinated', NULL, NULL, 'annual', 'hardy', TRUE,
 'Easy edible flower. Good for pollinators and self-seeds well.'),

-- Pansy
('Pansy', 'Giant Black', 'heirloom', NULL, NULL, 'perennial', 'hardy', TRUE,
 'Edible black flowers. Short-lived perennial.'),

-- Viola
('Viola', 'Brush Strokes', 'open-pollinated', 15, NULL, 'perennial', 'hardy', TRUE,
 'Edible flowers with painted colour patterns.'),

-- Agastache
('Agastache', 'Peach Margarita', 'open-pollinated', 30, NULL, 'perennial', 'half-hardy', FALSE,
 'Perennial herb with edible flowers and leaves.'),

-- Nasturtium Peach Melba
('Nasturtium', 'Peach Melba', 'open-pollinated', NULL, NULL, 'annual', 'half-hardy', TRUE,
 'Compact edible nasturtium. Leaves, flowers and seeds edible.'),

-- Sunflower
('Sunflower', 'Floristan', 'heirloom', NULL, NULL, 'annual', 'half-hardy', FALSE,
 'Bi-colour sunflower. Edible seeds and good cut flower.'),

-- Wildflower mix
('Wildflower', 'Mixed', 'mixed', NULL, NULL, 'annual', 'hardy', TRUE,
 'Mixed wildflower seed for pollinators.');
 
 SELECT * FROM plants LIMIT 20;
