--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    discovered_by character varying(40),
    discovered_date date
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    constellation character varying(30),
    discovered_year integer NOT NULL,
    distance_from_earth_in_ly numeric(14,2),
    galaxy_type character varying(40) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    is_spherical boolean,
    magnitude numeric(10,4),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    no_of_moons integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth_in_ly numeric(14,2),
    age_in_billion_of_years numeric(12,4),
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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley''s Comet', 'Edmond Halley', '1758-01-01');
INSERT INTO public.comet VALUES (2, 'Comet West', 'Richard M.West ', '1975-08-10');
INSERT INTO public.comet VALUES (3, 'Hyakutake Comet', 'Yuji Hyakutake ', '1996-01-31');
INSERT INTO public.comet VALUES (4, 'Hale-Bopp Comet', 'Alan Hale & Thomas Bopp', '1995-07-23');
INSERT INTO public.comet VALUES (5, 'McNaught Comet', NULL, '2006-08-07');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, 'Sagittarius', 1610, 26000.00, 'Barred spiral galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', NULL, 'Andromeda', 1924, 2500000.00, 'Spiral galaxy');
INSERT INTO public.galaxy VALUES (3, 'Black Eye', NULL, 'Coma Berenices', 1779, 24010000.00, 'Spiral galaxy');
INSERT INTO public.galaxy VALUES (4, ' Bode''s ', NULL, 'Ursa Major', 1774, 12000000.00, 'Grand design spiral galaxy');
INSERT INTO public.galaxy VALUES (5, 'Cartwheel', NULL, 'Sculptor', 1941, 500000000.00, 'Lenticular galaxy');
INSERT INTO public.galaxy VALUES (6, 'Cigar', NULL, 'Ursa Major', 2007, 12000000.00, 'Starburst galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', true, -12.7400, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 11.8000, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 12.9000, 2);
INSERT INTO public.moon VALUES (4, 'Ganymede', true, 4.6000, 3);
INSERT INTO public.moon VALUES (5, 'Europa', true, 5.3000, 3);
INSERT INTO public.moon VALUES (6, 'Callisto', true, 5.6500, 3);
INSERT INTO public.moon VALUES (7, 'Io', true, 5.0000, 3);
INSERT INTO public.moon VALUES (8, 'Carme', false, 18.3000, 3);
INSERT INTO public.moon VALUES (9, 'Metis', false, 17.5000, 3);
INSERT INTO public.moon VALUES (10, 'Thebe', false, 15.7000, 3);
INSERT INTO public.moon VALUES (11, 'Titan', true, 8.2800, 4);
INSERT INTO public.moon VALUES (12, 'Rhea', true, 9.7000, 4);
INSERT INTO public.moon VALUES (13, 'Phoebe', false, 16.4500, 4);
INSERT INTO public.moon VALUES (14, 'Janus', false, 14.5000, 4);
INSERT INTO public.moon VALUES (15, 'Titania', true, 13.7300, 5);
INSERT INTO public.moon VALUES (16, 'Oberon', true, 13.9400, 5);
INSERT INTO public.moon VALUES (17, 'Triton', true, 13.4700, 6);
INSERT INTO public.moon VALUES (18, 'Proteus', false, 20.3000, 6);
INSERT INTO public.moon VALUES (19, 'Charon', true, 16.8000, 7);
INSERT INTO public.moon VALUES (20, 'Hydra', false, 22.9000, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 1, 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, 2, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', false, 92, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', false, 145, 1);
INSERT INTO public.planet VALUES (5, 'Uranus', false, 27, 1);
INSERT INTO public.planet VALUES (6, ' Neptune', false, 14, 1);
INSERT INTO public.planet VALUES (7, 'Pluto', false, 5, 1);
INSERT INTO public.planet VALUES (8, 'Mercury', false, 0, 1);
INSERT INTO public.planet VALUES (9, 'Venus', false, 0, 1);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', false, NULL, 1);
INSERT INTO public.planet VALUES (11, 'Luyten b', false, NULL, 1);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri b', false, NULL, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.58, 4.6030, 1);
INSERT INTO public.star VALUES (2, 'Alpha Andromedae', 96.87, 0.0600, 2);
INSERT INTO public.star VALUES (3, 'Epsilon Eridani', 10.46, 0.6000, 1);
INSERT INTO public.star VALUES (4, 'Polaris', 400.00, 0.0700, 1);
INSERT INTO public.star VALUES (5, 'Sirius', 8.61, 0.2420, 1);
INSERT INTO public.star VALUES (6, 'Alcor', 81.71, 1.5000, 6);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


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
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

