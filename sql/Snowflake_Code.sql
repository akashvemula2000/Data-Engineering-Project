Create or replace Database Movies;
Create or replace schema movies.harry_potter;

-- Creating Tables in movies.harry_potter Schema

-- 1. Movies Table
CREATE OR REPLACE TABLE movies.harry_potter.MoviesList (
    Movie_ID INT PRIMARY KEY,
    Movie_Title STRING,
    Release_Year INT,
    Runtime INT,
    Budget STRING,
    Box_Office STRING
);

-- 2. Characters Table
CREATE OR REPLACE TABLE movies.harry_potter.Characters (
    Character_ID INT PRIMARY KEY,
    Character_Name STRING,
    Species STRING,
    Gender STRING,
    House STRING,
    Patronus STRING,
    Wand_Wood STRING,
    Wand_Core STRING
);

-- 3. Dialogue Table
CREATE OR REPLACE TABLE movies.harry_potter.Dialogue (
    Dialogue_ID INT PRIMARY KEY,
    Chapter_ID INT,
    Place_ID INT,
    Character_ID INT,
    Dialogue STRING
);

-- 4. Spells Table
CREATE OR REPLACE TABLE movies.harry_potter.Spells (
    Spell_ID INT PRIMARY KEY,
    Incantation STRING,
    Spell_Name STRING,
    Effect STRING,
    Light STRING
);

-- 5. Places Table
CREATE OR REPLACE TABLE movies.harry_potter.Places (
    Place_ID INT PRIMARY KEY,
    Place_Name STRING,
    Place_Category STRING
);

-- 6. Chapters Table
CREATE OR REPLACE TABLE movies.harry_potter.Chapters (
    Chapter_ID INT PRIMARY KEY,
    Chapter_Name STRING,
    Movie_ID INT,
    Movie_Chapter INT
);

CREATE OR REPLACE STORAGE INTEGRATION s3_integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = 'S3'
  ENABLED = TRUE
  STORAGE_AWS_ROLE_ARN = 'STORAGE_AWS_ROLE_ARN'
  STORAGE_ALLOWED_LOCATIONS = ('s3://harrypotter-de-project/');

DESC STORAGE INTEGRATION s3_integration;

CREATE OR REPLACE STAGE movies.harry_potter.blob_stage
URL = 's3://harrypotter-de-project/'
STORAGE_INTEGRATION = s3_integration
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER=1);

LIST @movies.harry_potter.blob_stage;


select * from movies.harry_potter.MOVIESLIST;
select * from movies.harry_potter.chapters;
select * from movies.harry_potter.characters;
select * from movies.harry_potter.spells;
select * from movies.harry_potter.places;
select * from movies.harry_potter.dialogue;


create schema analytics.dbt_akashvemula2000;
