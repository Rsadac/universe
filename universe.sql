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
-- Name: scientist; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.scientist (
    scientist_id integer NOT NULL,
    name character varying(30) NOT NULL,
    still_alive boolean
);


ALTER TABLE public.scientist OWNER TO freecodecamp;

--
-- Name: discovered_by_scientist_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.discovered_by_scientist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discovered_by_scientist_id_seq OWNER TO freecodecamp;

--
-- Name: discovered_by_scientist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.discovered_by_scientist_id_seq OWNED BY public.scientist.scientist_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    scientist_id integer NOT NULL,
    number_of_planets integer,
    age integer
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    scientist_id integer,
    distance_from_planet numeric
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
    nickname text NOT NULL,
    star_id integer,
    scientist_id integer,
    number_of_moons integer
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
    name character varying(30) NOT NULL,
    galaxy_id integer,
    scientist_id integer,
    visible_from_earth boolean NOT NULL
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
-- Name: scientist scientist_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scientist ALTER COLUMN scientist_id SET DEFAULT nextval('public.discovered_by_scientist_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1, 8500, 13610);
INSERT INTO public.galaxy VALUES (2, 'LMC', 2, 4000, 13610);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 2, 5000, 13610);
INSERT INTO public.galaxy VALUES (4, 'Cigar', 3, 4500, 13610);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 4, 4300, 13610);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 4, 3200, 13610);
INSERT INTO public.galaxy VALUES (7, 'Whirlpool', 5, 3250, 13610);
INSERT INTO public.galaxy VALUES (8, 'NGC 1300', 6, 2345, 13610);
INSERT INTO public.galaxy VALUES (9, 'Tadpole', 7, 8900, 13610);
INSERT INTO public.galaxy VALUES (10, 'Hoags Object', 8, 3200, 13610);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (22, 'Phobos', 2, 9, 40500);
INSERT INTO public.moon VALUES (23, 'Deimos', 2, 9, 40500);
INSERT INTO public.moon VALUES (24, 'Io', 3, 1, 40500);
INSERT INTO public.moon VALUES (25, 'Europa', 3, 1, 40500);
INSERT INTO public.moon VALUES (26, 'Ganymede', 3, 1, 40500);
INSERT INTO public.moon VALUES (27, 'Callisto', 3, 1, 40500);
INSERT INTO public.moon VALUES (28, 'Amalthea', 3, 10, 40500);
INSERT INTO public.moon VALUES (29, 'Himalia', 3, 11, 40500);
INSERT INTO public.moon VALUES (30, 'Elara', 3, 11, 40500);
INSERT INTO public.moon VALUES (31, 'Pasiphae', 3, 12, 40500);
INSERT INTO public.moon VALUES (32, 'Sinope', 3, 12, 40500);
INSERT INTO public.moon VALUES (33, 'Lysithea', 3, 13, 40500);
INSERT INTO public.moon VALUES (34, 'Carme', 3, 13, 40500);
INSERT INTO public.moon VALUES (35, 'Ananke', 3, 13, 40500);
INSERT INTO public.moon VALUES (36, 'Leda', 3, 14, 40500);
INSERT INTO public.moon VALUES (37, 'Thebe', 3, 15, 40500);
INSERT INTO public.moon VALUES (38, 'Adrastea', 3, 16, 40500);
INSERT INTO public.moon VALUES (39, 'Metis', 3, 15, 40500);
INSERT INTO public.moon VALUES (40, 'Callirrhoe', 3, 15, 40500);
INSERT INTO public.moon VALUES (21, 'Moon', 13, 1, 40500);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Earth', 'Home', 1, 17, 1);
INSERT INTO public.planet VALUES (14, 'Mars', 'Red Planet', 1, 18, 2);
INSERT INTO public.planet VALUES (15, 'Jupiter', 'Bigun', 1, 1, 92);
INSERT INTO public.planet VALUES (16, 'Mercury', 'Hot Hot Hot', 1, 1, 0);
INSERT INTO public.planet VALUES (17, 'Venus', 'Luv Planet', 1, 1, 1);
INSERT INTO public.planet VALUES (18, 'Saturn', 'Bling', 1, 1, 83);
INSERT INTO public.planet VALUES (19, 'Uranus', 'What', 1, 1, 27);
INSERT INTO public.planet VALUES (20, 'Neptune', 'Far Away', 1, 1, 14);
INSERT INTO public.planet VALUES (21, 'Proxima Centauri D', 'Farthest', 2, 1, 0);
INSERT INTO public.planet VALUES (22, 'Proxima Centauri B', 'Farthester', 2, 1, 0);
INSERT INTO public.planet VALUES (23, 'A Egir', 'Cant See', 3, 1, 0);
INSERT INTO public.planet VALUES (24, 'Ross 128b', 'Huh', 4, 1, 0);


--
-- Data for Name: scientist; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.scientist VALUES (1, 'Gallileo Galilei', false);
INSERT INTO public.scientist VALUES (2, 'Abd al-Rahman al-Sufi', false);
INSERT INTO public.scientist VALUES (3, 'Johan Elert Bode', false);
INSERT INTO public.scientist VALUES (4, 'Pierre Mechain', false);
INSERT INTO public.scientist VALUES (5, 'Charles Messier', false);
INSERT INTO public.scientist VALUES (6, 'John Herschel', false);
INSERT INTO public.scientist VALUES (7, 'Paul Hickson', true);
INSERT INTO public.scientist VALUES (8, 'Noah Brosch', true);
INSERT INTO public.scientist VALUES (9, 'Asaph Hall III', false);
INSERT INTO public.scientist VALUES (10, 'Edward Emerson Bernard', false);
INSERT INTO public.scientist VALUES (11, 'Charles Dillon Perrine', false);
INSERT INTO public.scientist VALUES (12, 'Philibert Jacques Melotte', false);
INSERT INTO public.scientist VALUES (13, 'Seth Barnes Nicholson', false);
INSERT INTO public.scientist VALUES (14, 'Charles T. Kowal', false);
INSERT INTO public.scientist VALUES (15, 'Stephen P. Synott', true);
INSERT INTO public.scientist VALUES (16, 'David Clifford Jewitt', true);
INSERT INTO public.scientist VALUES (17, 'Adam', false);
INSERT INTO public.scientist VALUES (18, 'Sumerians', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 2, true);
INSERT INTO public.star VALUES (3, 'Epsilon Eridani', 1, 3, true);
INSERT INTO public.star VALUES (4, 'Ross 128', 1, 4, true);
INSERT INTO public.star VALUES (5, 'Lynx', 1, 5, true);
INSERT INTO public.star VALUES (6, 'Eridanus', 1, 6, true);


--
-- Name: discovered_by_scientist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.discovered_by_scientist_id_seq', 18, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: scientist discovered_by_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scientist
    ADD CONSTRAINT discovered_by_name_key UNIQUE (name);


--
-- Name: scientist discovered_by_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scientist
    ADD CONSTRAINT discovered_by_pkey PRIMARY KEY (scientist_id);


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
