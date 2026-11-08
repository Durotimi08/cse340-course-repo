CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
    ('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
    ('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
    ('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');

CREATE TABLE project (
    project_id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL REFERENCES organization(organization_id),
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    project_date DATE NOT NULL
);

INSERT INTO project (organization_id, title, description, location, project_date)
VALUES
    (1, 'Playground Rebuild', 'Help rebuild a neighborhood playground with safe, sustainable materials.', 'Porter Park, Rexburg, ID', '2026-11-21'),
    (1, 'Home Repair Day', 'Make basic repairs to homes of elderly and disabled residents.', 'Rexburg, ID', '2026-12-05'),
    (1, 'Community Center Painting', 'Paint and refresh the interior of the local community center.', 'Madison County Community Center, Rexburg, ID', '2027-01-16'),
    (1, 'Wheelchair Ramp Build', 'Build wheelchair ramps for families who need accessible entrances.', 'Idaho Falls, ID', '2027-02-13'),
    (1, 'Park Bench Restoration', 'Sand, repair, and seal wooden benches in city parks.', 'Smith Park, Rexburg, ID', '2027-03-20'),
    (2, 'Community Garden Planting', 'Prepare beds and plant vegetables in the neighborhood garden.', 'Rexburg Community Garden, Rexburg, ID', '2026-11-14'),
    (2, 'Harvest Food Drive', 'Collect and sort fresh produce for local food pantries.', 'Idaho Falls, ID', '2026-12-12'),
    (2, 'Composting Workshop', 'Teach families how to start and maintain a home compost bin.', 'Rexburg Public Library, Rexburg, ID', '2027-01-23'),
    (2, 'Greenhouse Setup', 'Assemble a greenhouse for year-round community growing.', 'Rigby, ID', '2027-02-20'),
    (2, 'School Garden Day', 'Help elementary students plant and care for their school garden.', 'Kennedy Elementary, Rexburg, ID', '2027-03-27'),
    (3, 'Park Cleanup', 'Clean up local parks and make them beautiful for everyone.', 'Nature Park, Rexburg, ID', '2026-11-28'),
    (3, 'Holiday Meal Service', 'Serve holiday meals to families in need.', 'Idaho Falls, ID', '2026-12-19'),
    (3, 'Community Tutoring', 'Tutor students in reading, math, and science.', 'Madison High School, Rexburg, ID', '2027-01-09'),
    (3, 'Senior Center Visit', 'Spend time with residents at the senior center playing games and sharing stories.', 'Rexburg Senior Center, Rexburg, ID', '2027-02-06'),
    (3, 'Clothing Drive', 'Collect and organize donated clothing for local shelters.', 'St. Anthony, ID', '2027-03-13');

CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO category (name)
VALUES
    ('Environmental'),
    ('Educational'),
    ('Community Service'),
    ('Health and Wellness');

CREATE TABLE project_category (
    project_id INTEGER NOT NULL REFERENCES project(project_id),
    category_id INTEGER NOT NULL REFERENCES category(category_id),
    PRIMARY KEY (project_id, category_id)
);

INSERT INTO project_category (project_id, category_id)
VALUES
    (1, 3),
    (2, 3),
    (2, 4),
    (3, 3),
    (4, 3),
    (4, 4),
    (5, 1),
    (5, 3),
    (6, 1),
    (6, 4),
    (7, 3),
    (7, 4),
    (8, 1),
    (8, 2),
    (9, 1),
    (10, 1),
    (10, 2),
    (11, 1),
    (11, 3),
    (12, 3),
    (12, 4),
    (13, 2),
    (14, 3),
    (14, 4),
    (15, 3);
