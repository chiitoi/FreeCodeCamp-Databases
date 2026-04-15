--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(50) NOT NULL,
    mass numeric(10,2),
    composition text,
    planet_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    galaxy_type character varying(30)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance_from_earth numeric(10,2),
    planet_id integer,
    is_spherical boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    planet_type text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    star_type character varying(30),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Iron Claw', 5.20, 'iron', 1);
INSERT INTO public.asteroid VALUES (2, 'Dust Whisper', 1.10, 'rocky', 2);
INSERT INTO public.asteroid VALUES (3, 'Crimson Fragment', 3.80, 'rocky', 3);
INSERT INTO public.asteroid VALUES (4, 'Silver Shard', 2.50, 'metallic', 4);
INSERT INTO public.asteroid VALUES (5, 'Frozen Splinter', 0.90, 'ice', 5);
INSERT INTO public.asteroid VALUES (6, 'Obsidian Chip', 4.00, 'rocky', 6);
INSERT INTO public.asteroid VALUES (7, 'Golden Pebble', 6.70, 'metallic', 7);
INSERT INTO public.asteroid VALUES (8, 'Shadow Fragment', 2.20, 'rocky', 8);
INSERT INTO public.asteroid VALUES (9, 'Pale Spark', 1.50, 'rocky', 9);
INSERT INTO public.asteroid VALUES (10, 'Luminous Dust', 0.70, 'ice', 10);
INSERT INTO public.asteroid VALUES (11, 'Soot Clump', 3.30, 'rocky', 11);
INSERT INTO public.asteroid VALUES (12, 'Celestial Pebble', 5.50, 'iron', 12);
INSERT INTO public.asteroid VALUES (13, 'Ghost Splinter', 1.90, 'rocky', 13);
INSERT INTO public.asteroid VALUES (14, 'Aurora Fragment', 2.80, 'ice', 14);
INSERT INTO public.asteroid VALUES (15, 'Midnight Chip', 4.10, 'metallic', 15);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Scarlet Spiral', 'A spiral galaxy known for its deep red star clusters and dense dust lanes.', 6500, 'spiral');
INSERT INTO public.galaxy VALUES (2, 'Blossom Halo', 'An elliptical-like galaxy surrounded by a faint glowing halo of young stars.', 12500, 'elliptical');
INSERT INTO public.galaxy VALUES (3, 'Immaterial Ring', 'A rare galaxy formation characterized by a thin, nearly transparent ring of stars.', 1900, 'irregular');
INSERT INTO public.galaxy VALUES (4, 'Ember Veil', 'A spiral galaxy wrapped in glowing orange dust clouds, known for intense star-forming regions and fading outer arms.', 7200, 'spiral');
INSERT INTO public.galaxy VALUES (5, 'Hollow Prism', 'A fragmented galaxy with unstable structure, producing prism-like distortions of light across its scattered star clusters.', 6100, 'irregular');
INSERT INTO public.galaxy VALUES (6, 'Obsidian Bloom', 'A dense elliptical galaxy with a dark core and faint outer star clusters forming a slow, blooming cosmic structure.', 12800, 'elliptical');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Ashen Shard', 12.50, 1, NULL);
INSERT INTO public.moon VALUES (2, 'Silent Echo', 98.20, 2, NULL);
INSERT INTO public.moon VALUES (3, 'Crimson Pebble', 45.70, 3, NULL);
INSERT INTO public.moon VALUES (4, 'Hollow Gleam', 210.40, 4, NULL);
INSERT INTO public.moon VALUES (5, 'Frostbite Fragment', 305.90, 5, NULL);
INSERT INTO public.moon VALUES (6, 'Drift Lantern', 76.30, 6, NULL);
INSERT INTO public.moon VALUES (7, 'Aurora Speck', 520.10, 7, NULL);
INSERT INTO public.moon VALUES (8, 'Obsidian Chip', 33.80, 8, NULL);
INSERT INTO public.moon VALUES (9, 'Pale Whisper', 890.60, 9, NULL);
INSERT INTO public.moon VALUES (10, 'Storm Glass', 120.90, 10, NULL);
INSERT INTO public.moon VALUES (11, 'Ember Pebble', 64.20, 11, NULL);
INSERT INTO public.moon VALUES (12, 'Glacier Knot', 410.70, 12, NULL);
INSERT INTO public.moon VALUES (13, 'Null Fragment', 999.30, 13, NULL);
INSERT INTO public.moon VALUES (14, 'Cobalt Spark', 150.50, 14, NULL);
INSERT INTO public.moon VALUES (15, 'Wandering Dust', 275.80, 15, NULL);
INSERT INTO public.moon VALUES (16, 'Veil Shard', 38.60, 16, NULL);
INSERT INTO public.moon VALUES (17, 'Broken Halo', 610.40, 17, NULL);
INSERT INTO public.moon VALUES (18, 'Solar Chip', 84.90, 18, NULL);
INSERT INTO public.moon VALUES (19, 'Night Ember', 730.20, 19, NULL);
INSERT INTO public.moon VALUES (20, 'Frozen Tear', 15.30, 20, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Ashen Verge', false, true, 'rocky', 1);
INSERT INTO public.planet VALUES (2, 'Verdant Echo', true, true, 'terrestrial', 3);
INSERT INTO public.planet VALUES (3, 'Obsidian Tide', false, true, 'volcanic', 12);
INSERT INTO public.planet VALUES (4, 'Ember Shore', false, true, 'desert', 10);
INSERT INTO public.planet VALUES (5, 'Frost Lumen', false, true, 'ice', 4);
INSERT INTO public.planet VALUES (6, 'Storm Helix', false, true, 'gas giant', 2);
INSERT INTO public.planet VALUES (7, 'Pale Drift', false, false, 'barren', 5);
INSERT INTO public.planet VALUES (8, 'Lush Meridian', true, true, 'terrestrial', 11);
INSERT INTO public.planet VALUES (9, 'Null Horizon', false, true, 'rocky', 8);
INSERT INTO public.planet VALUES (10, 'Rift Fragment', false, false, 'fractured', 9);
INSERT INTO public.planet VALUES (11, 'Aurora Expanse', false, true, 'terrestrial', 13);
INSERT INTO public.planet VALUES (12, 'Hollow Point', false, true, 'barren', 10);
INSERT INTO public.planet VALUES (13, 'Cobalt Expanse', false, true, 'gas giant', 1);
INSERT INTO public.planet VALUES (14, 'Silent Meridian', false, true, 'rocky', 15);
INSERT INTO public.planet VALUES (15, 'Driftwater', true, true, 'oceanic', 3);
INSERT INTO public.planet VALUES (16, 'Pale Ember', false, true, 'rocky', 12);
INSERT INTO public.planet VALUES (17, 'Iron Hollow', false, true, 'metallic', 5);
INSERT INTO public.planet VALUES (18, 'Crystal Grave', false, true, 'rocky', 14);
INSERT INTO public.planet VALUES (19, 'Lumen Dune', false, true, 'desert', 10);
INSERT INTO public.planet VALUES (20, 'Claret Frost', false, true, 'ice', 4);
INSERT INTO public.planet VALUES (21, 'Emerald Garden', true, true, 'terrestrial', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Misdirection', 'A bright but erratic star known for irregular light patterns that confuse observational tracking systems.', 5500, 'variable', 1);
INSERT INTO public.star VALUES (2, 'Starbow Maze', 'A complex star system where shifting light refraction creates maze-like optical patterns in surrounding dust.', 4200, 'binary', 1);
INSERT INTO public.star VALUES (3, 'Wavering Light', 'A stable star with slight variability in brightness causing subtle luminosity fluctuations.', 5000, 'yellow dwarf', 1);
INSERT INTO public.star VALUES (4, 'Sparse Fog', 'A dim, long-lived star partially obscured by a thin surrounding nebular cloud.', 10500, 'red dwarf', 2);
INSERT INTO public.star VALUES (5, 'Purple Axis', 'A compact stellar remnant emitting unusual violet radiation aligned along a strong magnetic axis.', 12800, 'white dwarf', 2);
INSERT INTO public.star VALUES (6, 'Curved Spirit', 'A dense stellar remnant whose gravity bends surrounding light into curved visual arcs.', 11000, 'neutron', 2);
INSERT INTO public.star VALUES (7, 'Red Mist', 'A red giant star surrounded by a diffuse cloud of gas that gives it a mist-like appearance.', 9800, 'red giant', 2);
INSERT INTO public.star VALUES (8, 'Ghostly Butterfly', 'A faint, unstable star emitting symmetrical light flares resembling butterfly-like wings.', 1200, 'blue-white main sequence', 3);
INSERT INTO public.star VALUES (9, 'Poisonous Mesh', 'A highly energetic star emitting strong ionized radiation and unusual spectral signatures.', 300, 'O-type', 3);
INSERT INTO public.star VALUES (11, 'Solar Flicker', 'A medium-aged star with unstable energy output, causing periodic flickers in brightness across its outer layers.', 4900, 'variable', 4);
INSERT INTO public.star VALUES (12, 'Shattered Beam', 'A young, highly luminous star emitting fragmented beams of light caused by intense magnetic turbulence.', 1600, 'blue-white main sequence', 5);
INSERT INTO public.star VALUES (13, 'Fractured Light', 'A paired star system whose gravitational interaction distorts emitted light into fractured, shifting patterns.', 3800, 'binary', 5);
INSERT INTO public.star VALUES (14, 'Black Petal', 'An aging red giant surrounded by dark dust formations that spread outward like slowly unfolding petals.', 11200, 'red giant', 6);
INSERT INTO public.star VALUES (15, 'Silent Core', 'A dense stellar remnant with minimal radiation output, appearing almost completely still and silent in deep space.', 12900, 'white dwarf', 6);
INSERT INTO public.star VALUES (10, 'Cinder Drift', 'A long-lived, dim red dwarf star surrounded by faint drifting dust that slowly trails its weak stellar wind.', 7200, 'red dwarf', 4);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 15, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 21, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 15, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

