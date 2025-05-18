--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-05-15 20:51:20

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 16928)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 5099 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 17054)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE USER api_user_sitiorama WITH PASSWORD 'aJ7$!zPq9*wE4k&R';

--  Otorga permisos al api_user_sitiorama
GRANT CONNECT ON DATABASE sitiorama_db TO api_user_sitiorama;
GRANT USAGE ON SCHEMA public TO api_user_sitiorama;
GRANT SELECT, INSERT, DELETE, UPDATE ON ALL TABLES IN SCHEMA public TO api_user_sitiorama;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO api_user_sitiorama;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT, INSERT, DELETE, UPDATE ON TABLES TO api_user_sitiorama;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT USAGE, SELECT ON SEQUENCES TO api_user_sitiorama;


CREATE TABLE public.categories (
    id integer NOT NULL,
    name text,
    description text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17053)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- TOC entry 5101 (class 0 OID 0)
-- Dependencies: 219
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 228 (class 1259 OID 17112)
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id integer NOT NULL,
    place_id integer,
    name text,
    description text,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.events OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17111)
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.events_id_seq OWNER TO postgres;

--
-- TOC entry 5102 (class 0 OID 0)
-- Dependencies: 227
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- TOC entry 230 (class 1259 OID 17128)
-- Name: favorites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorites (
    id integer NOT NULL,
    user_id integer,
    place_id integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.favorites OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17127)
-- Name: favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.favorites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.favorites_id_seq OWNER TO postgres;

--
-- TOC entry 5103 (class 0 OID 0)
-- Dependencies: 229
-- Name: favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.favorites_id_seq OWNED BY public.favorites.id;


--
-- TOC entry 238 (class 1259 OID 17203)
-- Name: geometry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.geometry (
    id integer NOT NULL,
    place_id integer NOT NULL,
    lat numeric(10,7),
    lng numeric(10,7),
    viewport_ne_lat numeric(10,7),
    viewport_ne_lng numeric(10,7),
    viewport_sw_lat numeric(10,7),
    viewport_sw_lng numeric(10,7),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.geometry OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 17202)
-- Name: geometry_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.geometry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.geometry_id_seq OWNER TO postgres;

--
-- TOC entry 5104 (class 0 OID 0)
-- Dependencies: 237
-- Name: geometry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.geometry_id_seq OWNED BY public.geometry.id;


--
-- TOC entry 240 (class 1259 OID 17217)
-- Name: opening_hours; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opening_hours (
    id integer NOT NULL,
    place_id integer NOT NULL,
    open_now boolean,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.opening_hours OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 17216)
-- Name: opening_hours_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.opening_hours_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.opening_hours_id_seq OWNER TO postgres;

--
-- TOC entry 5105 (class 0 OID 0)
-- Dependencies: 239
-- Name: opening_hours_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.opening_hours_id_seq OWNED BY public.opening_hours.id;


--
-- TOC entry 224 (class 1259 OID 17083)
-- Name: payment_methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_methods (
    id integer NOT NULL,
    name text,
    description text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.payment_methods OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17082)
-- Name: payment_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_methods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_methods_id_seq OWNER TO postgres;

--
-- TOC entry 5106 (class 0 OID 0)
-- Dependencies: 223
-- Name: payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_methods_id_seq OWNED BY public.payment_methods.id;


--
-- TOC entry 242 (class 1259 OID 17231)
-- Name: photos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.photos (
    id integer NOT NULL,
    place_id integer NOT NULL,
    height integer,
    width integer,
    photo_reference text,
    html_attributions text[],
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.photos OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 17230)
-- Name: photos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.photos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.photos_id_seq OWNER TO postgres;

--
-- TOC entry 5107 (class 0 OID 0)
-- Dependencies: 241
-- Name: photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.photos_id_seq OWNED BY public.photos.id;


--
-- TOC entry 248 (class 1259 OID 17279)
-- Name: place_icons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.place_icons (
    id integer NOT NULL,
    place_id integer NOT NULL,
    icon_url text,
    background_color text,
    mask_base_uri text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.place_icons OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 17278)
-- Name: place_icons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.place_icons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.place_icons_id_seq OWNER TO postgres;

--
-- TOC entry 5108 (class 0 OID 0)
-- Dependencies: 247
-- Name: place_icons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.place_icons_id_seq OWNED BY public.place_icons.id;


--
-- TOC entry 226 (class 1259 OID 17094)
-- Name: place_payment_methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.place_payment_methods (
    id integer NOT NULL,
    place_id integer,
    payment_method_id integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.place_payment_methods OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17093)
-- Name: place_payment_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.place_payment_methods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.place_payment_methods_id_seq OWNER TO postgres;

--
-- TOC entry 5109 (class 0 OID 0)
-- Dependencies: 225
-- Name: place_payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.place_payment_methods_id_seq OWNED BY public.place_payment_methods.id;


--
-- TOC entry 246 (class 1259 OID 17263)
-- Name: place_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.place_types (
    id integer NOT NULL,
    place_id integer NOT NULL,
    type text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.place_types OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 17262)
-- Name: place_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.place_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.place_types_id_seq OWNER TO postgres;

--
-- TOC entry 5110 (class 0 OID 0)
-- Dependencies: 245
-- Name: place_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.place_types_id_seq OWNED BY public.place_types.id;


--
-- TOC entry 222 (class 1259 OID 17065)
-- Name: places; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.places (
    id integer NOT NULL,
    google_place_id text,
    name text,
    address text,
    latitude numeric(10,7),
    longitude numeric(10,7),
    category_id integer,
    rating_avg numeric(2,1),
    status text,
    reference text,
    scope text,
    user_ratings_total integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.places OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17064)
-- Name: places_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.places_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.places_id_seq OWNER TO postgres;

--
-- TOC entry 5111 (class 0 OID 0)
-- Dependencies: 221
-- Name: places_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.places_id_seq OWNED BY public.places.id;


--
-- TOC entry 244 (class 1259 OID 17247)
-- Name: plus_codes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plus_codes (
    id integer NOT NULL,
    place_id integer NOT NULL,
    compound_code text,
    global_code text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.plus_codes OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 17246)
-- Name: plus_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plus_codes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.plus_codes_id_seq OWNER TO postgres;

--
-- TOC entry 5112 (class 0 OID 0)
-- Dependencies: 243
-- Name: plus_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plus_codes_id_seq OWNED BY public.plus_codes.id;


--
-- TOC entry 236 (class 1259 OID 17181)
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    user_id integer,
    place_id integer,
    rating integer,
    comment text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT reviews_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 17180)
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reviews_id_seq OWNER TO postgres;

--
-- TOC entry 5113 (class 0 OID 0)
-- Dependencies: 235
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- TOC entry 234 (class 1259 OID 17162)
-- Name: route_places; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.route_places (
    id integer NOT NULL,
    route_id integer,
    place_id integer,
    "position" integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.route_places OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 17161)
-- Name: route_places_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.route_places_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.route_places_id_seq OWNER TO postgres;

--
-- TOC entry 5114 (class 0 OID 0)
-- Dependencies: 233
-- Name: route_places_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.route_places_id_seq OWNED BY public.route_places.id;


--
-- TOC entry 232 (class 1259 OID 17146)
-- Name: routes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.routes (
    id integer NOT NULL,
    user_id integer,
    name text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.routes OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 17145)
-- Name: routes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.routes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.routes_id_seq OWNER TO postgres;

--
-- TOC entry 5115 (class 0 OID 0)
-- Dependencies: 231
-- Name: routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.routes_id_seq OWNED BY public.routes.id;


--
-- TOC entry 218 (class 1259 OID 17041)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text,
    email text,
    password text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

-- TOC entry 217 (class 1259 OID 17040)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 5116 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
--
-- TOC entry 4820 (class 2604 OID 17057)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 4831 (class 2604 OID 17115)
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- TOC entry 4834 (class 2604 OID 17131)
-- Name: favorites id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites ALTER COLUMN id SET DEFAULT nextval('public.favorites_id_seq'::regclass);


--
-- TOC entry 4845 (class 2604 OID 17206)
-- Name: geometry id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geometry ALTER COLUMN id SET DEFAULT nextval('public.geometry_id_seq'::regclass);


--
-- TOC entry 4848 (class 2604 OID 17220)
-- Name: opening_hours id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opening_hours ALTER COLUMN id SET DEFAULT nextval('public.opening_hours_id_seq'::regclass);


--
-- TOC entry 4826 (class 2604 OID 17086)
-- Name: payment_methods id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_methods ALTER COLUMN id SET DEFAULT nextval('public.payment_methods_id_seq'::regclass);


--
-- TOC entry 4851 (class 2604 OID 17234)
-- Name: photos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photos ALTER COLUMN id SET DEFAULT nextval('public.photos_id_seq'::regclass);


--
-- TOC entry 4860 (class 2604 OID 17282)
-- Name: place_icons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.place_icons ALTER COLUMN id SET DEFAULT nextval('public.place_icons_id_seq'::regclass);


--
-- TOC entry 4829 (class 2604 OID 17097)
-- Name: place_payment_methods id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.place_payment_methods ALTER COLUMN id SET DEFAULT nextval('public.place_payment_methods_id_seq'::regclass);


--
-- TOC entry 4857 (class 2604 OID 17266)
-- Name: place_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.place_types ALTER COLUMN id SET DEFAULT nextval('public.place_types_id_seq'::regclass);


--
-- TOC entry 4823 (class 2604 OID 17068)
-- Name: places id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.places ALTER COLUMN id SET DEFAULT nextval('public.places_id_seq'::regclass);


--
-- TOC entry 4854 (class 2604 OID 17250)
-- Name: plus_codes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plus_codes ALTER COLUMN id SET DEFAULT nextval('public.plus_codes_id_seq'::regclass);


--
-- TOC entry 4842 (class 2604 OID 17184)
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- TOC entry 4839 (class 2604 OID 17165)
-- Name: route_places id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route_places ALTER COLUMN id SET DEFAULT nextval('public.route_places_id_seq'::regclass);


--
-- TOC entry 4836 (class 2604 OID 17149)
-- Name: routes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes ALTER COLUMN id SET DEFAULT nextval('public.routes_id_seq'::regclass);


--
-- TOC entry 4817 (class 2604 OID 17044)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 5065 (class 0 OID 17054)
-- Dependencies: 220
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, description, created_at, updated_at) FROM stdin;
13	Cafetería	Lugares para café, panadería y similares	2025-05-15 20:49:04.198526-04	2025-05-15 20:49:04.198526-04
14	Restaurante	Locales de comida, bares y servicios de alimentación	2025-05-15 20:49:04.198526-04	2025-05-15 20:49:04.198526-04
15	Transporte	Estaciones, aeropuertos, alquiler y servicios de transporte	2025-05-15 20:49:04.198526-04	2025-05-15 20:49:04.198526-04
16	Tienda	Tiendas, supermercados, centros comerciales y comercios varios	2025-05-15 20:49:04.198526-04	2025-05-15 20:49:04.198526-04
17	Salud	Hospitales, clínicas, farmacias y servicios relacionados con la salud	2025-05-15 20:49:04.198526-04	2025-05-15 20:49:04.198526-04
18	Educación	Instituciones educativas, universidades y escuelas	2025-05-15 20:49:04.198526-04	2025-05-15 20:49:04.198526-04
19	Servicio Básico	Servicios públicos, postales, bancos y similares	2025-05-15 20:49:04.198526-04	2025-05-15 20:49:04.198526-04
20	Servicio	Servicios profesionales y comerciales diversos	2025-05-15 20:49:04.198526-04	2025-05-15 20:49:04.198526-04
21	Museo y Cultura	Museos, galerías de arte y lugares culturales	2025-05-15 20:49:04.198526-04	2025-05-15 20:49:04.198526-04
22	Atracción Turística	Puntos turísticos y lugares de interés	2025-05-15 20:49:04.198526-04	2025-05-15 20:49:04.198526-04
23	Parque y Plaza	Parques, plazas y espacios públicos al aire libre	2025-05-15 20:49:04.198526-04	2025-05-15 20:49:04.198526-04
24	Alojamiento	Hoteles, campamentos y lugares para hospedaje	2025-05-15 20:49:04.198526-04	2025-05-15 20:49:04.198526-04
\.



ALTER TABLE public.users ADD COLUMN role TEXT NOT NULL DEFAULT 'user';

INSERT INTO public.users (name, email, password, role)
VALUES (
  'Admin',
  'admin@sitiorama.com',
  '$2b$12$Q9ym53zVzJNgkcbMSNdKCejCk1Pz6UMm0tQMjF6gUpwEaNxkBbrW.', 
  'admin'
);

--
-- TOC entry 5073 (class 0 OID 17112)
-- Dependencies: 228
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, place_id, name, description, start_date, end_date, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5075 (class 0 OID 17128)
-- Dependencies: 230
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorites (id, user_id, place_id, created_at) FROM stdin;
\.


--
-- TOC entry 5083 (class 0 OID 17203)
-- Dependencies: 238
-- Data for Name: geometry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.geometry (id, place_id, lat, lng, viewport_ne_lat, viewport_ne_lng, viewport_sw_lat, viewport_sw_lng, created_at, updated_at) FROM stdin;
499	500	-39.8133957	-73.2437957	-39.8120471	-73.2424443	-39.8147450	-73.2451423	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
500	501	-39.8160362	-73.2423436	-39.8146855	-73.2410087	-39.8173835	-73.2437067	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
501	502	-39.8137458	-73.2453665	-39.8123970	-73.2440168	-39.8150949	-73.2467147	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
502	503	-39.8140735	-73.2468765	-39.8127166	-73.2455700	-39.8154145	-73.2482679	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
503	504	-39.8137072	-73.2451660	-39.8123404	-73.2439278	-39.8150384	-73.2466257	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
504	505	-39.8143078	-73.2471427	-39.8129668	-73.2457471	-39.8156648	-73.2484451	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
505	506	-39.8136960	-73.2444585	-39.8123872	-73.2428472	-39.8150852	-73.2455451	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
506	507	-39.8154331	-73.2454880	-39.8140247	-73.2441244	-39.8167226	-73.2468223	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
507	508	-39.8129723	-73.2465456	-39.8115790	-73.2451848	-39.8142770	-73.2478828	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
508	509	-39.8132697	-73.2446341	-39.8118656	-73.2432714	-39.8145636	-73.2459694	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
509	510	-39.8139630	-73.2441400	-39.8126256	-73.2427152	-39.8153236	-73.2454131	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
510	511	-39.8148971	-73.2475008	-39.8135646	-73.2461570	-39.8162626	-73.2488549	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
511	512	-39.8152498	-73.2445624	-39.8139948	-73.2432366	-39.8166927	-73.2459345	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
512	513	-39.8133150	-73.2443510	-39.8119075	-73.2429885	-39.8146055	-73.2456865	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
513	514	-39.8137521	-73.2440596	-39.8124129	-73.2426471	-39.8151108	-73.2453451	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
514	515	-39.8149877	-73.2441985	-39.8136359	-73.2428722	-39.8163339	-73.2455702	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
515	516	-39.8154003	-73.2472290	-39.8140407	-73.2459413	-39.8167387	-73.2486393	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
516	517	-39.8135502	-73.2439998	-39.8122101	-73.2425908	-39.8149080	-73.2452887	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
517	518	-39.8132834	-73.2476732	-39.8119422	-73.2462755	-39.8146401	-73.2489735	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
518	519	-39.8141510	-73.2436904	-39.8129367	-73.2423737	-39.8156347	-73.2450717	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
519	520	-39.8158790	-73.2463860	-39.8145043	-73.2451833	-39.8172023	-73.2478812	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
520	521	-39.8132904	-73.2408267	-39.8118327	-73.2394525	-39.8145306	-73.2421504	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
521	522	-39.8104569	-73.2189273	-39.8091664	-73.2174818	-39.8118643	-73.2201798	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
522	523	-39.8153729	-73.2442968	-39.8140204	-73.2429713	-39.8167184	-73.2456692	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
523	524	-39.8146025	-73.2437211	-39.8131678	-73.2423516	-39.8158658	-73.2450495	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
524	525	-39.8238813	-73.2280234	-39.8224958	-73.2266224	-39.8251937	-73.2293204	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
525	526	-39.8122609	-73.2403427	-39.8108722	-73.2389486	-39.8135702	-73.2416465	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
526	527	-39.8162435	-73.2424288	-39.8148978	-73.2410524	-39.8175958	-73.2437504	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
527	528	-39.8154432	-73.2450862	-39.8140581	-73.2437283	-39.8167560	-73.2464263	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
528	529	-39.8226056	-73.2463805	-39.8212765	-73.2450878	-39.8239745	-73.2477857	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
529	530	-39.8133484	-73.2444988	-39.8119150	-73.2431303	-39.8146129	-73.2458283	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
530	531	-39.8155461	-73.2382780	-39.8141581	-73.2370653	-39.8168561	-73.2397633	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
531	532	-39.8136154	-73.2457221	-39.8123087	-73.2443838	-39.8150067	-73.2470818	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
532	533	-39.8266575	-73.2258872	-39.8253616	-73.2246050	-39.8280596	-73.2273030	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
533	534	-39.8134382	-73.2451923	-39.8120791	-73.2439064	-39.8147770	-73.2466043	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
534	535	-39.8160531	-73.2419522	-39.8146295	-73.2405782	-39.8173274	-73.2432762	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
535	536	-39.8160400	-73.2423600	-39.8146911	-73.2410099	-39.8173891	-73.2437079	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
536	537	-39.8148357	-73.2401464	-39.8135273	-73.2388082	-39.8162253	-73.2415062	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
537	538	-39.8202012	-73.2558823	-39.8187780	-73.2545346	-39.8214760	-73.2572325	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
538	539	-39.8151061	-73.2411762	-39.8135948	-73.2397790	-39.8162927	-73.2424770	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
539	540	-39.8137741	-73.2452469	-39.8124122	-73.2439786	-39.8151101	-73.2466766	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
540	541	-39.8129064	-73.2455144	-39.8116161	-73.2441818	-39.8143140	-73.2468797	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
541	542	-39.8137639	-73.2440466	-39.8124235	-73.2426418	-39.8151214	-73.2453398	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
542	543	-39.8154240	-73.2446120	-39.8140587	-73.2432575	-39.8167567	-73.2459555	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
543	544	-39.8145095	-73.2438456	-39.8131113	-73.2424848	-39.8158092	-73.2451828	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
544	545	-39.8160930	-73.2418545	-39.8146597	-73.2404773	-39.8173577	-73.2431752	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
545	546	-39.8262566	-73.2269598	-39.8248612	-73.2255472	-39.8275592	-73.2282452	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
546	547	-39.8375138	-73.2310131	-39.8363542	-73.2296932	-39.8390521	-73.2323911	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
547	548	-39.8500587	-73.2465596	-39.8487252	-73.2452582	-39.8514232	-73.2479561	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
548	549	-39.8146973	-73.2440702	-39.8133393	-73.2427734	-39.8160372	-73.2454714	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
549	550	-39.8145373	-73.2455429	-39.8131800	-73.2442436	-39.8158780	-73.2469416	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
550	551	-39.8130805	-73.2436684	-39.8117257	-73.2423619	-39.8144236	-73.2450598	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
551	552	-39.8144244	-73.2446213	-39.8130193	-73.2432589	-39.8157173	-73.2459568	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
552	553	-39.8145803	-73.2436252	-39.8131629	-73.2422598	-39.8158608	-73.2449578	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
553	554	-39.8136598	-73.2421786	-39.8122252	-73.2408093	-39.8149232	-73.2435072	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
554	555	-39.8139173	-73.2464622	-39.8125172	-73.2449610	-39.8152151	-73.2476590	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
555	556	-39.8143179	-73.2452574	-39.8129224	-73.2438977	-39.8156203	-73.2465956	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
556	557	-39.8137644	-73.2453789	-39.8124168	-73.2440223	-39.8151147	-73.2467202	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
557	558	-39.8147789	-73.2462749	-39.8133899	-73.2449153	-39.8160879	-73.2476132	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
558	559	-39.8103015	-73.2517715	-39.8090117	-73.2504500	-39.8117097	-73.2531479	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
559	560	-39.8145802	-73.2433635	-39.8131807	-73.2420024	-39.8158787	-73.2447004	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
560	561	-39.8138056	-73.2452772	-39.8124440	-73.2439986	-39.8151420	-73.2466965	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
561	562	-39.8148269	-73.2465545	-39.8134892	-73.2451309	-39.8161872	-73.2478289	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
562	563	-39.8137359	-73.2450770	-39.8123617	-73.2438851	-39.8150596	-73.2465831	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
563	564	-39.8132766	-73.2461128	-39.8119294	-73.2447419	-39.8146274	-73.2474399	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
564	565	-39.8133601	-73.2444145	-39.8119266	-73.2430460	-39.8146245	-73.2457439	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
565	566	-39.8153676	-73.2445968	-39.8140533	-73.2432564	-39.8167513	-73.2459543	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
566	567	-39.8157841	-73.2458310	-39.8144172	-73.2444068	-39.8171152	-73.2471048	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
567	568	-39.8158038	-73.2458100	-39.8144384	-73.2443918	-39.8171363	-73.2470897	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
568	569	-39.8159292	-73.2457538	-39.8145644	-73.2443382	-39.8172623	-73.2470361	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
569	570	-39.8158392	-73.2473434	-39.8144483	-73.2459829	-39.8171462	-73.2486808	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
570	571	-39.8129274	-73.2436363	-39.8115728	-73.2423280	-39.8142708	-73.2450260	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
571	572	-39.8127852	-73.2435795	-39.8114290	-73.2422827	-39.8141270	-73.2449806	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
572	573	-39.8127852	-73.2435795	-39.8114290	-73.2422827	-39.8141270	-73.2449806	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
573	574	-39.8129548	-73.2433744	-39.8116256	-73.2419245	-39.8143235	-73.2446224	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
574	575	-39.8135183	-73.2426217	-39.8121234	-73.2412622	-39.8148213	-73.2439602	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
575	576	-39.8167223	-73.2440388	-39.8154036	-73.2425372	-39.8181015	-73.2452351	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
576	577	-39.8162435	-73.2424288	-39.8148978	-73.2410524	-39.8175958	-73.2437504	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
577	578	-39.8130424	-73.2450741	-39.8117148	-73.2437298	-39.8144127	-73.2464278	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
578	579	-39.7998881	-73.2581992	-39.7985137	-73.2568442	-39.8012117	-73.2595421	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
579	580	-39.8303339	-73.2280572	-39.8288534	-73.2267334	-39.8315513	-73.2294313	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
580	581	-39.8142014	-73.2459131	-39.8128087	-73.2447181	-39.8155066	-73.2474161	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
581	582	-39.8125685	-73.2462130	-39.8112392	-73.2447204	-39.8139371	-73.2474183	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
582	583	-39.8123125	-73.2469531	-39.8108382	-73.2456612	-39.8135361	-73.2483592	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
583	584	-39.8174190	-73.2426102	-39.8160813	-73.2412219	-39.8187793	-73.2439199	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
584	585	-39.8173788	-73.2425333	-39.8160401	-73.2411913	-39.8187381	-73.2438893	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
585	586	-39.8134991	-73.2402214	-39.8119803	-73.2388340	-39.8146782	-73.2415319	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
586	587	-39.8090370	-73.2435409	-39.8077291	-73.2422249	-39.8104271	-73.2449229	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
587	588	-39.8116900	-73.2527965	-39.8103661	-73.2513665	-39.8130641	-73.2540645	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
588	589	-39.8197323	-73.2490299	-39.8183698	-73.2477817	-39.8210677	-73.2504797	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
589	590	-39.8205625	-73.2478619	-39.8191875	-73.2464319	-39.8218854	-73.2491299	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
590	591	-39.8153092	-73.2368652	-39.8139926	-73.2355940	-39.8166906	-73.2382920	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
591	592	-39.8223232	-73.2500205	-39.8209880	-73.2485721	-39.8236860	-73.2512700	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
592	593	-39.8099114	-73.2559109	-39.8085542	-73.2544278	-39.8112522	-73.2571257	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
593	594	-39.8106822	-73.2571273	-39.8092342	-73.2560406	-39.8119322	-73.2587386	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
594	595	-39.8137810	-73.2583027	-39.8124009	-73.2569360	-39.8150989	-73.2596339	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
595	596	-39.8060565	-73.2523491	-39.8045490	-73.2509346	-39.8072469	-73.2536326	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
596	597	-39.8189037	-73.2349682	-39.8174473	-73.2335405	-39.8201453	-73.2362385	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
597	598	-39.8133550	-73.2516954	-39.8119481	-73.2503438	-39.8146461	-73.2530417	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
598	599	-39.8140836	-73.2486019	-39.8127461	-73.2471825	-39.8154441	-73.2498804	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
599	600	-39.8163408	-73.2485734	-39.8150108	-73.2471244	-39.8177088	-73.2498223	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
600	601	-39.8204764	-73.2491521	-39.8191110	-73.2479262	-39.8218090	-73.2506242	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
601	602	-39.8311423	-73.2566325	-39.8297679	-73.2552597	-39.8324658	-73.2579576	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
602	603	-39.8139965	-73.2463257	-39.8126570	-73.2449121	-39.8153550	-73.2476101	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
603	604	-39.8143666	-73.2486140	-39.8130228	-73.2472238	-39.8157207	-73.2499218	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
604	605	-39.8132249	-73.2484651	-39.8118953	-73.2469961	-39.8145932	-73.2496941	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
605	606	-39.8121423	-73.2480302	-39.8108086	-73.2466061	-39.8135065	-73.2493040	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
606	607	-39.8156061	-73.2491697	-39.8142930	-73.2476332	-39.8169910	-73.2503312	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
607	608	-39.8160490	-73.2493002	-39.8146792	-73.2477611	-39.8173772	-73.2504591	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
608	609	-39.8111811	-73.2475642	-39.8098685	-73.2461393	-39.8125665	-73.2488372	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
609	610	-39.8110389	-73.2473396	-39.8097075	-73.2459540	-39.8124055	-73.2486519	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
610	611	-39.8126920	-73.2418164	-39.8114577	-73.2404951	-39.8141557	-73.2431931	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
611	612	-39.8106315	-73.2473174	-39.8093886	-73.2458258	-39.8120865	-73.2485238	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
612	613	-39.8135110	-73.2507316	-39.8120918	-73.2493670	-39.8147898	-73.2520649	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
613	614	-39.8114868	-73.2493773	-39.8100281	-73.2484704	-39.8127261	-73.2511684	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
614	615	-39.8179606	-73.2475820	-39.8165403	-73.2462108	-39.8192383	-73.2489087	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
615	616	-39.8142775	-73.2510826	-39.8129413	-73.2497400	-39.8156392	-73.2524380	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
616	617	-39.8252097	-73.2514152	-39.8238616	-73.2500549	-39.8265595	-73.2527529	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
617	618	-39.8089980	-73.2682084	-39.8078278	-73.2669681	-39.8105257	-73.2696660	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
618	619	-39.8128628	-73.2466435	-39.8115139	-73.2452938	-39.8142119	-73.2479917	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
619	620	-39.8068794	-73.2520294	-39.8055096	-73.2506608	-39.8082075	-73.2533588	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
620	621	-39.8316482	-73.2376823	-39.8303258	-73.2363063	-39.8330237	-73.2390042	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
621	622	-39.8066198	-73.2692170	-39.8052928	-73.2678919	-39.8079908	-73.2705898	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
622	623	-39.8502514	-73.2504845	-39.8489033	-73.2491336	-39.8516012	-73.2518315	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
623	624	-39.8522241	-73.2563129	-39.8508310	-73.2550316	-39.8535289	-73.2577295	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
624	625	-39.7951006	-73.2014322	-39.7937441	-73.2000945	-39.7964421	-73.2027925	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
625	626	-39.8539414	-73.2277286	-39.8526208	-73.2263320	-39.8553187	-73.2290300	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
626	627	-39.8569394	-73.2377493	-39.8555910	-73.2363744	-39.8582890	-73.2390724	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
627	628	-39.8149290	-73.2360880	-39.8135876	-73.2347168	-39.8162856	-73.2374148	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
628	629	-39.8139507	-73.2469815	-39.8126038	-73.2456215	-39.8153017	-73.2483194	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
629	630	-39.8132172	-73.2467508	-39.8118861	-73.2454172	-39.8145841	-73.2481151	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
630	631	-39.8151374	-73.2469010	-39.8137516	-73.2455392	-39.8164496	-73.2482372	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
631	632	-39.8154258	-73.2449806	-39.8140671	-73.2436292	-39.8167650	-73.2463272	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
632	633	-39.8131266	-73.2447016	-39.8117659	-73.2433500	-39.8144639	-73.2460479	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
633	634	-39.8156236	-73.2465631	-39.8142726	-73.2452260	-39.8169705	-73.2479239	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
634	635	-39.8153228	-73.2480598	-39.8139708	-73.2467315	-39.8166687	-73.2494294	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
635	636	-39.8163364	-73.2468098	-39.8149880	-73.2454574	-39.8176860	-73.2481554	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
636	637	-39.8119522	-73.2451093	-39.8105936	-73.2437581	-39.8132916	-73.2464561	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
637	638	-39.8118945	-73.2471263	-39.8105214	-73.2457721	-39.8132193	-73.2484701	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
638	639	-39.8163818	-73.2438406	-39.8150340	-73.2424930	-39.8177319	-73.2451909	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
639	640	-39.8121994	-73.2433364	-39.8108326	-73.2419837	-39.8135306	-73.2446817	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
640	641	-39.8158749	-73.2426792	-39.8144716	-73.2413147	-39.8171695	-73.2440127	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
641	642	-39.8134974	-73.2420087	-39.8121265	-73.2406546	-39.8148245	-73.2433525	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
642	643	-39.8134644	-73.2416654	-39.8121140	-73.2403273	-39.8148120	-73.2430253	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
643	644	-39.8176591	-73.2471907	-39.8163077	-73.2458557	-39.8190056	-73.2485536	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
644	645	-39.8125373	-73.2412523	-39.8111711	-73.2398917	-39.8138690	-73.2425896	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
645	646	-39.8176261	-73.2487947	-39.8162771	-73.2474454	-39.8189751	-73.2501434	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
646	647	-39.8177103	-73.2371435	-39.8163363	-73.2358504	-39.8190343	-73.2385484	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
647	648	-39.8160342	-73.2473901	-39.8147244	-73.2460533	-39.8174223	-73.2487512	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
648	649	-39.8130365	-73.2426507	-39.8115790	-73.2412764	-39.8142769	-73.2439743	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
649	650	-39.8145402	-73.2437734	-39.8131321	-73.2424102	-39.8158300	-73.2451082	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
650	651	-39.8179119	-73.2409554	-39.8164995	-73.2395981	-39.8191974	-73.2422961	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
651	652	-39.8114085	-73.2522213	-39.8100445	-73.2509547	-39.8127425	-73.2536526	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
652	653	-39.8156131	-73.2338185	-39.8142122	-73.2324012	-39.8169102	-73.2350992	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
653	654	-39.8304809	-73.2414510	-39.8292395	-73.2400158	-39.8319374	-73.2427138	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
654	655	-39.8313939	-73.2400389	-39.8300507	-73.2389149	-39.8327487	-73.2416128	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
655	656	-39.8183626	-73.2397338	-39.8167770	-73.2382670	-39.8194749	-73.2409650	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
656	657	-39.8163405	-73.2391875	-39.8150039	-73.2378062	-39.8177018	-73.2405041	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
657	658	-39.8136349	-73.2469245	-39.8122935	-73.2455296	-39.8149915	-73.2482276	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
658	659	-39.8135628	-73.2468984	-39.8122210	-73.2455063	-39.8149189	-73.2482043	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
659	660	-39.8136610	-73.2470608	-39.8123470	-73.2456198	-39.8150450	-73.2483177	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
660	661	-39.8130588	-73.2461601	-39.8117154	-73.2447417	-39.8144134	-73.2474396	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
661	662	-39.8145193	-73.2437962	-39.8131197	-73.2424351	-39.8158177	-73.2451330	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
662	663	-39.8163447	-73.2472688	-39.8148985	-73.2458896	-39.8175964	-73.2485876	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
663	664	-39.8166500	-73.2461400	-39.8153412	-73.2448299	-39.8180392	-73.2475278	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
664	665	-39.8114096	-73.2446136	-39.8100497	-73.2433335	-39.8127477	-73.2460314	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
665	666	-39.8172837	-73.2488152	-39.8159482	-73.2473954	-39.8186461	-73.2500933	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
666	667	-39.8146592	-73.2427235	-39.8132653	-73.2413637	-39.8159633	-73.2440617	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
667	668	-39.8277477	-73.2366322	-39.8265016	-73.2352513	-39.8291996	-73.2379493	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
668	669	-39.8162435	-73.2424288	-39.8148978	-73.2410524	-39.8175958	-73.2437504	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
669	670	-39.8163153	-73.2413609	-39.8148626	-73.2400616	-39.8175606	-73.2427596	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
670	671	-39.8142861	-73.2454745	-39.8128917	-73.2441150	-39.8155896	-73.2468130	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
671	672	-39.8141072	-73.2453963	-39.8127479	-73.2441047	-39.8154459	-73.2468026	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
672	673	-39.8135901	-73.2458206	-39.8122885	-73.2444834	-39.8149864	-73.2471814	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
673	674	-39.8144255	-73.2449477	-39.8129983	-73.2435807	-39.8156962	-73.2462786	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
674	675	-39.8135556	-73.2452235	-39.8121964	-73.2439379	-39.8148944	-73.2466359	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
675	676	-39.8144760	-73.2469664	-39.8131166	-73.2456781	-39.8158145	-73.2483761	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
676	677	-39.8141883	-73.2443062	-39.8129184	-73.2429755	-39.8156164	-73.2456734	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
677	678	-39.8130349	-73.2450242	-39.8117189	-73.2436825	-39.8144169	-73.2463804	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
678	679	-39.8127856	-73.2455321	-39.8115516	-73.2442152	-39.8142496	-73.2469132	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
679	680	-39.8147136	-73.2441047	-39.8133584	-73.2427918	-39.8160563	-73.2454898	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
680	681	-39.8146164	-73.2440519	-39.8132588	-73.2427525	-39.8159568	-73.2454505	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
681	682	-39.8152337	-73.2444217	-39.8138916	-73.2430295	-39.8165896	-73.2457274	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
682	683	-39.8153676	-73.2445968	-39.8140533	-73.2432564	-39.8167513	-73.2459543	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
683	684	-39.8153676	-73.2445968	-39.8140533	-73.2432564	-39.8167513	-73.2459543	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
684	685	-39.8150995	-73.2442305	-39.8137470	-73.2429032	-39.8164450	-73.2456011	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
685	686	-39.8323519	-73.2159091	-39.8311870	-73.2148148	-39.8338849	-73.2175127	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
686	687	-39.8134905	-73.2468920	-39.8121497	-73.2454933	-39.8148477	-73.2481913	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
687	688	-39.8146973	-73.2440702	-39.8133393	-73.2427734	-39.8160372	-73.2454714	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
688	689	-39.8129689	-73.2423356	-39.8115652	-73.2409738	-39.8142631	-73.2436718	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
689	690	-39.8179700	-73.2405160	-39.8166006	-73.2392459	-39.8192985	-73.2419438	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
690	691	-39.8301528	-73.2249105	-39.8287914	-73.2236417	-39.8314893	-73.2263396	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
691	692	-39.8360504	-73.2066750	-39.8346470	-73.2053988	-39.8373450	-73.2080968	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
692	693	-39.8305145	-73.2412489	-39.8291771	-73.2398482	-39.8318750	-73.2425461	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
693	694	-39.8305145	-73.2412489	-39.8291771	-73.2398482	-39.8318750	-73.2425461	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
694	695	-39.8136349	-73.2469245	-39.8122935	-73.2455296	-39.8149915	-73.2482276	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
695	696	-39.8136689	-73.2469830	-39.8123539	-73.2455817	-39.8150518	-73.2482797	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
696	697	-39.8130413	-73.2450434	-39.8117187	-73.2437002	-39.8144166	-73.2463982	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
697	698	-39.8156183	-73.2465123	-39.8142607	-73.2452126	-39.8169586	-73.2479106	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
698	699	-39.8146973	-73.2440702	-39.8133393	-73.2427734	-39.8160372	-73.2454714	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
699	700	-39.8147361	-73.2440495	-39.8133754	-73.2427680	-39.8160734	-73.2454659	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
700	701	-39.8154003	-73.2472290	-39.8140407	-73.2459413	-39.8167387	-73.2486393	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
701	702	-39.8154003	-73.2472290	-39.8140407	-73.2459413	-39.8167387	-73.2486393	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
702	703	-39.8270170	-73.2230700	-39.8257362	-73.2218165	-39.8284342	-73.2245144	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
703	704	-39.8195895	-73.2494220	-39.8182546	-73.2479678	-39.8209526	-73.2506658	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
704	705	-39.8065585	-73.2509488	-39.8053657	-73.2493795	-39.8080636	-73.2520774	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
705	706	-39.8319191	-73.2446037	-39.8306363	-73.2431710	-39.8333343	-73.2458690	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
706	707	-39.8175053	-73.2325093	-39.8163244	-73.2313333	-39.8190223	-73.2340313	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
707	708	-39.8296559	-73.2205572	-39.8282634	-73.2191498	-39.8309613	-73.2218478	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
708	709	-39.8171379	-73.2337577	-39.8158523	-73.2324658	-39.8185502	-73.2351638	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
709	710	-39.8036408	-73.2184476	-39.8022821	-73.2170981	-39.8049800	-73.2197961	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
710	711	-39.8127540	-73.2400886	-39.8114818	-73.2387765	-39.8141797	-73.2414744	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
711	712	-39.8120650	-73.2532525	-39.8107638	-73.2517016	-39.8134617	-73.2543996	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
712	713	-39.8223169	-73.2468264	-39.8209473	-73.2454171	-39.8236453	-73.2481151	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
713	714	-39.8246625	-73.2482509	-39.8232430	-73.2468796	-39.8259409	-73.2495776	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
714	715	-39.8260339	-73.2462519	-39.8247419	-73.2449191	-39.8274399	-73.2476170	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
715	716	-39.8286073	-73.2464939	-39.8272123	-73.2451266	-39.8299102	-73.2478246	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
716	717	-39.8302187	-73.2418047	-39.8288419	-73.2405796	-39.8315399	-73.2432775	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
717	718	-39.8306871	-73.2420564	-39.8293115	-73.2408086	-39.8320095	-73.2435065	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
718	719	-39.8333031	-73.2415501	-39.8319206	-73.2401026	-39.8346186	-73.2428005	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
719	720	-39.8337204	-73.2370704	-39.8322890	-73.2357317	-39.8349870	-73.2384297	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
720	721	-39.8358487	-73.2567458	-39.8344483	-73.2554748	-39.8371462	-73.2581728	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
721	722	-39.8310924	-73.2227158	-39.8297617	-73.2213529	-39.8324597	-73.2240508	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
722	723	-39.8318700	-73.2207600	-39.8305099	-73.2192490	-39.8332079	-73.2219470	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
723	724	-39.8443169	-73.2481015	-39.8429573	-73.2467404	-39.8456553	-73.2494384	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
724	725	-39.8270870	-73.2073725	-39.8259265	-73.2059584	-39.8286245	-73.2086564	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
725	726	-39.8332509	-73.2114849	-39.8319052	-73.2101076	-39.8346031	-73.2128055	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
726	727	-39.8061639	-73.2516591	-39.8046692	-73.2502789	-39.8073671	-73.2529768	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
727	728	-39.8215198	-73.2499461	-39.8201575	-73.2484371	-39.8228554	-73.2511350	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
728	729	-39.8180365	-73.2478780	-39.8165546	-73.2464876	-39.8192525	-73.2491855	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
729	730	-39.8071390	-73.2469859	-39.8058437	-73.2455526	-39.8085416	-73.2482505	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
730	731	-39.8065245	-73.2495128	-39.8050646	-73.2483203	-39.8077626	-73.2510183	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
731	732	-39.8063121	-73.2516832	-39.8051203	-73.2504524	-39.8078183	-73.2531503	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
732	733	-39.8058064	-73.2505413	-39.8045001	-73.2495451	-39.8071981	-73.2522431	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
733	734	-39.8062880	-73.2542269	-39.8050144	-73.2529191	-39.8077123	-73.2556171	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
734	735	-39.8174169	-73.2331328	-39.8161534	-73.2318653	-39.8188513	-73.2345632	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
735	736	-39.8046072	-73.2538039	-39.8032056	-73.2526242	-39.8059036	-73.2553222	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
736	737	-39.8327160	-73.2452173	-39.8313563	-73.2438865	-39.8340543	-73.2465845	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
737	738	-39.8329562	-73.2511895	-39.8316006	-73.2499705	-39.8342986	-73.2526684	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
738	739	-39.8154573	-73.2474167	-39.8141198	-73.2460500	-39.8168178	-73.2487479	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
739	740	-39.8143366	-73.2469445	-39.8129790	-73.2456474	-39.8156770	-73.2483453	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
740	741	-39.8121574	-73.2443470	-39.8107694	-73.2429889	-39.8134674	-73.2456868	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
741	742	-39.8178310	-73.2479640	-39.8164388	-73.2466015	-39.8191367	-73.2492995	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
742	743	-39.8178310	-73.2479640	-39.8164388	-73.2466015	-39.8191367	-73.2492995	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
743	744	-39.8173673	-73.2425208	-39.8160428	-73.2411913	-39.8187407	-73.2438893	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
744	745	-39.8177238	-73.2492547	-39.8164655	-73.2478763	-39.8191635	-73.2505742	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
745	746	-39.8163302	-73.2403002	-39.8149101	-73.2389228	-39.8176081	-73.2416208	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
746	747	-39.8078643	-73.2355821	-39.8064992	-73.2342093	-39.8091971	-73.2369073	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
747	748	-39.8141784	-73.2471451	-39.8128423	-73.2457275	-39.8155402	-73.2484254	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
748	749	-39.8163024	-73.2437071	-39.8150133	-73.2424278	-39.8177112	-73.2451258	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
749	750	-39.8151329	-73.2459282	-39.8138346	-73.2445949	-39.8165326	-73.2472929	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
750	751	-39.8150656	-73.2463994	-39.8137137	-73.2450693	-39.8164117	-73.2477672	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
751	752	-39.8154116	-73.2442768	-39.8140556	-73.2429741	-39.8167536	-73.2456720	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
752	753	-39.8130805	-73.2436684	-39.8117257	-73.2423619	-39.8144236	-73.2450598	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
753	754	-39.8159654	-73.2443488	-39.8146063	-73.2430766	-39.8173043	-73.2457745	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
754	755	-39.8146205	-73.2430005	-39.8132264	-73.2416407	-39.8159243	-73.2443386	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
755	756	-39.8133030	-73.2430320	-39.8119856	-73.2416903	-39.8146836	-73.2443882	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
756	757	-39.8162764	-73.2437707	-39.8149824	-73.2424857	-39.8176803	-73.2451837	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
757	758	-39.8167460	-73.2486100	-39.8154076	-73.2472052	-39.8181056	-73.2499032	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
758	759	-39.8090706	-73.2481988	-39.8076328	-73.2474650	-39.8103307	-73.2501629	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
759	760	-39.8109323	-73.2515711	-39.8096547	-73.2502404	-39.8123526	-73.2529383	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
760	761	-39.8191377	-73.2429537	-39.8177772	-73.2415031	-39.8204751	-73.2442011	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
761	762	-39.8105349	-73.2536598	-39.8092195	-73.2522024	-39.8119174	-73.2549004	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
762	763	-39.8103717	-73.2540638	-39.8089984	-73.2527721	-39.8116964	-73.2554701	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
763	764	-39.8100731	-73.2538266	-39.8086961	-73.2525436	-39.8113941	-73.2552416	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
764	765	-39.8100270	-73.2546590	-39.8086475	-73.2533842	-39.8113455	-73.2560822	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
765	766	-39.8320353	-73.2386763	-39.8307501	-73.2372630	-39.8334481	-73.2399609	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
766	767	-39.8145876	-73.2474818	-39.8131924	-73.2461194	-39.8158904	-73.2488173	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
767	768	-39.8091313	-73.2599985	-39.8078717	-73.2586939	-39.8105697	-73.2613918	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
768	769	-39.8322214	-73.2522738	-39.8309744	-73.2508717	-39.8336723	-73.2535697	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
769	770	-39.8136828	-73.2465929	-39.8123850	-73.2453789	-39.8150830	-73.2480769	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
770	771	-39.8140794	-73.2463767	-39.8127421	-73.2449485	-39.8154400	-73.2476465	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
771	772	-39.8147499	-73.2455146	-39.8133846	-73.2442591	-39.8160825	-73.2469570	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
772	773	-39.8138056	-73.2452772	-39.8124440	-73.2439986	-39.8151420	-73.2466965	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
773	774	-39.8147529	-73.2454937	-39.8133857	-73.2442485	-39.8160837	-73.2469465	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
774	775	-39.8147659	-73.2464556	-39.8133703	-73.2450929	-39.8160682	-73.2477908	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
775	776	-39.8147461	-73.2466812	-39.8133413	-73.2453158	-39.8160392	-73.2480138	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
776	777	-39.8148993	-73.2453707	-39.8135111	-73.2441958	-39.8162091	-73.2468938	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
777	778	-39.8145166	-73.2469032	-39.8132027	-73.2455645	-39.8159007	-73.2482625	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
778	779	-39.8149121	-73.2452885	-39.8134934	-73.2441532	-39.8161913	-73.2468511	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
779	780	-39.8151329	-73.2459282	-39.8138355	-73.2445941	-39.8165334	-73.2472921	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
780	781	-39.8149318	-73.2451491	-39.8135365	-73.2440844	-39.8162344	-73.2467823	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
781	782	-39.8135517	-73.2446279	-39.8120112	-73.2432347	-39.8147092	-73.2459326	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
782	783	-39.8138603	-73.2442378	-39.8125321	-73.2427531	-39.8152301	-73.2454511	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
783	784	-39.8137681	-73.2440840	-39.8124303	-73.2426618	-39.8151283	-73.2453597	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
784	785	-39.8143624	-73.2471450	-39.8130194	-73.2457558	-39.8157174	-73.2484537	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
785	786	-39.8159615	-73.2444441	-39.8146099	-73.2431148	-39.8173079	-73.2458128	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
786	787	-39.8452904	-73.2111650	-39.8439659	-73.2097946	-39.8466638	-73.2124925	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
787	788	-39.8211916	-73.2493338	-39.8198296	-73.2480948	-39.8225276	-73.2507928	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
788	789	-39.8117100	-73.2455000	-39.8104631	-73.2441748	-39.8131610	-73.2468727	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
789	790	-39.8134598	-73.2452458	-39.8121044	-73.2439371	-39.8148023	-73.2466350	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
790	791	-39.8130478	-73.2459134	-39.8116946	-73.2446162	-39.8143926	-73.2473142	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
791	792	-39.8145893	-73.2474011	-39.8131999	-73.2460404	-39.8158979	-73.2487383	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
792	793	-39.8148464	-73.2476122	-39.8135351	-73.2462751	-39.8162331	-73.2489731	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
793	794	-39.8158099	-73.2455674	-39.8144705	-73.2442588	-39.8171685	-73.2469567	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
794	795	-39.8124472	-73.2452837	-39.8110545	-73.2439090	-39.8137525	-73.2466070	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
795	796	-39.8122532	-73.2449226	-39.8108992	-73.2436088	-39.8135972	-73.2463068	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
796	797	-39.8124976	-73.2442641	-39.8111821	-73.2429252	-39.8138801	-73.2456231	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
797	798	-39.8124522	-73.2442378	-39.8111605	-73.2429060	-39.8138585	-73.2456039	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
798	799	-39.8161552	-73.2445261	-39.8148048	-73.2431859	-39.8175028	-73.2458839	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
799	800	-39.8129453	-73.2434956	-39.8115811	-73.2422575	-39.8142790	-73.2449555	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
800	801	-39.8153748	-73.2462567	-39.8139904	-73.2448972	-39.8166884	-73.2475952	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
801	802	-39.8154343	-73.2464718	-39.8141107	-73.2451722	-39.8168087	-73.2478702	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
802	803	-39.8102745	-73.2540059	-39.8089032	-73.2527097	-39.8116011	-73.2554076	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
803	804	-39.8094319	-73.2332891	-39.8081661	-73.2320810	-39.8108640	-73.2347789	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
804	805	-39.8428486	-73.2412616	-39.8415665	-73.2399397	-39.8442644	-73.2426377	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
805	806	-39.8367509	-73.2016441	-39.8353661	-73.2003356	-39.8380640	-73.2030336	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
806	807	-39.8133150	-73.2443510	-39.8119075	-73.2429885	-39.8146055	-73.2456865	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
807	808	-39.8132981	-73.2450659	-39.8119322	-73.2438223	-39.8146302	-73.2465202	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
808	809	-39.8138603	-73.2442378	-39.8125321	-73.2427531	-39.8152301	-73.2454511	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
809	810	-39.8139601	-73.2476442	-39.8126053	-73.2463401	-39.8153032	-73.2490380	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
810	811	-39.8130565	-73.2449266	-39.8117341	-73.2435838	-39.8144321	-73.2462817	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
811	812	-39.8129741	-73.2450493	-39.8116161	-73.2437701	-39.8143140	-73.2464681	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
812	813	-39.8156183	-73.2465123	-39.8142607	-73.2452126	-39.8169586	-73.2479106	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
813	814	-39.8130980	-73.2445283	-39.8117097	-73.2431685	-39.8144076	-73.2458665	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
814	815	-39.8152621	-73.2442493	-39.8139062	-73.2429434	-39.8166042	-73.2456413	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
815	816	-39.8156958	-73.2445250	-39.8143513	-73.2431456	-39.8170493	-73.2458435	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
816	817	-39.8132020	-73.2436012	-39.8118964	-73.2422621	-39.8145943	-73.2449601	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
817	818	-39.8369868	-73.2164442	-39.8355550	-73.2149793	-39.8382529	-73.2176773	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
818	819	-39.8130608	-73.2461590	-39.8117174	-73.2447413	-39.8144153	-73.2474392	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
819	820	-39.8147375	-73.2486076	-39.8133869	-73.2472764	-39.8160848	-73.2499744	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
820	821	-39.8158980	-73.2421660	-39.8145343	-73.2408123	-39.8172322	-73.2435102	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
821	822	-39.8172709	-73.2430136	-39.8158843	-73.2416159	-39.8185823	-73.2443139	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
822	823	-39.8178785	-73.2472246	-39.8165534	-73.2458815	-39.8192513	-73.2485795	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
823	824	-39.8179795	-73.2449175	-39.8166709	-73.2435630	-39.8193688	-73.2462610	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
824	825	-39.8108643	-73.2430757	-39.8095065	-73.2417834	-39.8122044	-73.2444814	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
825	826	-39.8192092	-73.2472453	-39.8178358	-73.2458889	-39.8205337	-73.2485868	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
826	827	-39.8112707	-73.2514489	-39.8098404	-73.2500759	-39.8125383	-73.2527738	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
827	828	-39.8192786	-73.2429040	-39.8179193	-73.2414645	-39.8206173	-73.2441624	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
828	829	-39.8198368	-73.2443062	-39.8183885	-73.2429288	-39.8210864	-73.2456267	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
829	830	-39.8151054	-73.2384171	-39.8137721	-73.2370252	-39.8164701	-73.2397231	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
830	831	-39.8159794	-73.2369178	-39.8146593	-73.2354818	-39.8173572	-73.2381797	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
831	832	-39.8233798	-73.2400562	-39.8220250	-73.2386500	-39.8247230	-73.2413479	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
832	833	-39.8234041	-73.2366131	-39.8219583	-73.2352273	-39.8246562	-73.2379253	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
833	834	-39.8277886	-73.2401336	-39.8264387	-73.2387881	-39.8291366	-73.2414861	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
834	835	-39.8291357	-73.2378291	-39.8277280	-73.2365385	-39.8304260	-73.2392365	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
835	836	-39.8529249	-73.2484312	-39.8515930	-73.2471039	-39.8542909	-73.2498018	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
836	837	-39.8110229	-73.2452871	-39.8096577	-73.2440373	-39.8123556	-73.2467353	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
837	838	-39.8172581	-73.2430168	-39.8158741	-73.2416225	-39.8185721	-73.2443205	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
838	839	-39.8179795	-73.2449175	-39.8166709	-73.2435630	-39.8193688	-73.2462610	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
839	840	-39.8196101	-73.2451735	-39.8182483	-73.2438923	-39.8209463	-73.2465903	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
840	841	-39.8104822	-73.2525106	-39.8091665	-73.2510341	-39.8118645	-73.2537321	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
841	842	-39.8226101	-73.2430047	-39.8212677	-73.2417311	-39.8239656	-73.2444290	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
842	843	-39.8329762	-73.2511130	-39.8316541	-73.2497742	-39.8343520	-73.2524721	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
843	844	-39.8364470	-73.2402471	-39.8349899	-73.2387644	-39.8376878	-73.2414623	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
844	845	-39.8305598	-73.2254109	-39.8291588	-73.2240486	-39.8318567	-73.2267465	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
845	846	-39.8335594	-73.2274118	-39.8322472	-73.2261276	-39.8349451	-73.2288255	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
846	847	-39.8313880	-73.2209442	-39.8299561	-73.2195236	-39.8326540	-73.2222215	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
847	848	-39.8369731	-73.2296076	-39.8356309	-73.2283482	-39.8383288	-73.2310461	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
848	849	-39.8378831	-73.2248945	-39.8364924	-73.2235514	-39.8391903	-73.2262494	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
849	850	-39.8216802	-73.2098625	-39.8203993	-73.2085666	-39.8230972	-73.2112646	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
850	851	-39.8435238	-73.2492833	-39.8422319	-73.2480122	-39.8449299	-73.2507102	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
\.


--
-- TOC entry 5085 (class 0 OID 17217)
-- Dependencies: 240
-- Data for Name: opening_hours; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.opening_hours (id, place_id, open_now, created_at, updated_at) FROM stdin;
370	500	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
371	501	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
372	502	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
373	503	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
374	504	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
375	505	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
376	506	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
377	507	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
378	508	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
379	509	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
380	511	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
381	513	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
382	516	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
383	517	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
384	518	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
385	519	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
386	520	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
387	521	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
388	522	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
389	523	f	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
390	524	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
391	525	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
392	527	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
393	528	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
394	529	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
395	530	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
396	531	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
397	532	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
398	533	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
399	534	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
400	535	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
401	536	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
402	537	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
403	538	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
404	539	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
405	540	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
406	541	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
407	542	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
408	543	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
409	544	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
410	545	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
411	546	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
412	547	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
413	548	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
414	550	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
415	552	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
416	553	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
417	554	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
418	555	f	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
419	556	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
420	557	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
421	558	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
422	559	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
423	560	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
424	561	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
425	562	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
426	563	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
427	564	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
428	568	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
429	569	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
430	570	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
431	571	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
432	572	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
433	573	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
434	574	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
435	575	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
436	576	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
437	577	t	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
438	579	f	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
439	580	t	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
440	581	t	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
441	587	t	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
442	589	t	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
443	594	t	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
444	596	f	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
445	597	t	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
446	598	f	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
447	599	t	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
448	602	t	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
449	603	f	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
450	605	t	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
451	606	t	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
452	607	t	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
453	609	t	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
454	610	t	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
455	613	t	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
456	614	t	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
457	615	t	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
458	617	t	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
459	647	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
460	648	f	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
461	649	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
462	651	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
463	652	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
464	653	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
465	654	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
466	655	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
467	656	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
468	660	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
469	661	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
470	662	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
471	663	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
472	664	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
473	665	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
474	666	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
475	667	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
476	668	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
477	669	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
478	670	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
479	671	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
480	672	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
481	673	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
482	674	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
483	675	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
484	676	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
485	677	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
486	679	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
487	680	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
488	681	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
489	683	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
490	685	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
491	687	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
492	688	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
493	689	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
494	690	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
495	691	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
496	696	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
497	697	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
498	698	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
499	699	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
500	700	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
501	701	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
502	702	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
503	703	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
504	705	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
505	706	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
506	707	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
507	708	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
508	709	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
509	710	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
510	711	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
511	712	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
512	714	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
513	715	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
514	716	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
515	717	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
516	719	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
517	720	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
518	721	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
519	723	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
520	724	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
521	728	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
522	729	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
523	730	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
524	734	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
525	735	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
526	736	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
527	737	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
528	738	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
529	740	t	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
530	747	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
531	748	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
532	749	f	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
533	750	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
534	751	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
535	752	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
536	753	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
537	754	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
538	755	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
539	756	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
540	757	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
541	758	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
542	761	f	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
543	763	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
544	764	f	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
545	765	f	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
546	766	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
547	769	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
548	770	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
549	771	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
550	772	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
551	773	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
552	774	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
553	775	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
554	776	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
555	778	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
556	779	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
557	781	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
558	782	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
559	783	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
560	785	f	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
561	786	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
562	787	f	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
563	789	f	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
564	790	f	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
565	791	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
566	792	f	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
567	793	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
568	794	f	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
569	795	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
570	796	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
571	797	f	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
572	799	f	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
573	800	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
574	801	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
575	802	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
576	803	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
577	804	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
578	805	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
579	806	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
580	807	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
581	809	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
582	810	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
583	811	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
584	812	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
585	813	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
586	814	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
587	815	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
588	816	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
589	818	f	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
590	819	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
591	820	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
592	821	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
593	825	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
594	826	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
595	827	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
596	828	f	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
597	829	f	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
598	831	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
599	832	f	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
600	833	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
601	834	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
602	835	f	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
603	836	f	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
604	838	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
605	839	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
606	840	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
607	841	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
608	842	f	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
609	843	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
610	844	f	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
611	845	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
612	846	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
613	847	t	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
614	848	f	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
615	849	f	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
616	851	f	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
\.


--
-- TOC entry 5069 (class 0 OID 17083)
-- Dependencies: 224
-- Data for Name: payment_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_methods (id, name, description, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5087 (class 0 OID 17231)
-- Dependencies: 242
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.photos (id, place_id, height, width, photo_reference, html_attributions, created_at, updated_at) FROM stdin;
384	500	4160	2336	AeeoHcI5AqvYvOn3d2b4l9jV9SzS6R2zxAxPMOKH6A5M_hTFONjF9p0V27egE85ahUMIkTo_0gxYwoebxhChlKzh7vVPTG-Hm6jHODgD9Kg2XmkzMxfKwv01lQIMqfS_imBHT2KBM5rnmoruxdMVCJUG0RS_TMcj5NgRa67wQwcQkYCr_wn_Vz8tLXaGa8x3CPBFaZxWUNaoZH7DICGxdK7SpE_jO5T0xtrJgY1e1s2kjEcV4RA868P14-8FsPY3LdCP7JTwgT0Nf5OEkfDMQ-eolc08-vlua7fiHvNpW9GwQ_8LdusDOIEB1WmV3Fv-KgXssuXbK2Sq0_OIrXKozWPfuM6TTOB9GbschwC9dSioKI6-c1j9iOC0OKKaeIZ-jC18FqO9iZr72LfYFY63P4bBeDWMH_nkw-0eMYICM0Lmvc2w45ZHl8_d0dkD3YXtKBbS9tLEoFElbKNgmt4FDw6U6PPIMPUb0-aS8zYhmnRQQNHSNixs2yAXUTJbH3Ph7e09oeZIQgIGSti3olz4a-M22s4DekJwhPKCBN7vlWhxhqY24jV4vQoRJfAimE0oNrluRvZEtE77KpryjD3Lvu8XZyF990RMpCA2WXVMGwsvNeY21rvxhdRjdY_l8e9oxR5Nbo_hog	{"<a href=\\"https://maps.google.com/maps/contrib/105810098453538374731\\">Diego Contreras</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
385	501	2252	4000	AeeoHcJbuYgObv07F1Sz0i4pZS55WoCdadWgKRoZD5wFQhTTbrhG7Caf1nrqyEUGNegDcA_N4rbohmTB9JufC6M9hPT7Z0XuaVddwLMGxEKhSJBm7qH3hMnVh84lMZc4M_COVIEiuwDtOwKPIuZnGLofSLG32hHQiaEOrYIuiPolCS12yEM30msZ7aqFXeXIE0s4rvS7qJpe4ImL8THnDTAP40b2OUB5Ld9cGGNGrtHbFNYwjDUIi3Yavhyx1JavudrtLMmM47PG1c4gpW2mNIjLbJSnOD9HZGScFFyaLtrt-qzJefDR3fLzbQymRXGZhwtz1s9v-8wEkcI	{"<a href=\\"https://maps.google.com/maps/contrib/107353427266203462596\\">Plaza de Los Ríos</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
386	502	3978	5968	AeeoHcLHOXKAlc5H0_PkTeVOWHdY1jpBcEc-B-HmoDU2AEL5iuJRAzLsOBUbl9r7-mvFk2y8xhvFh149yWkUptvJWJMc62cyqxKs_kGasNZgOdHhenNDRWy4WlqEvcWiz1IPE-Q0u5lCtAwQaB6hr2sYqQUcHRzHZAMt0ARyh5NBfPpG_G-WN4H2E0xq8U0qk53KK98DzEWNzMJw9B5rXtpI_m2q8TZtLPvyAzsufTSmbWEJZMhnk9s0_YyOLG24-RwGTM114lpk9eZuO7r34Pc2ZJIfunt7id9kBvPZMi01s52oKNarxd7NLFmC63fvigYziLa0M0dOvlc	{"<a href=\\"https://maps.google.com/maps/contrib/117131966559433105632\\">CENTRONUEVO Taboada</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
387	503	2268	4032	AeeoHcK3i8ZlNPaJJmO7opUjf5dxY2jzh0ltiY6yxWqQIUYU3oV4KQmb9jamKA-fAw2Ja95aqaZQsQW3EAxSzBssyxpuNFPt_gnLFhzt0VSLyM_sYhuBehQRn9-Y7qAraYsCxH5bD7ahPX9AJ3Rpt_grkowHKRQSXUZiTOe0Dw0HY7ciYqVe2mEvOZk1Q4f6LJAsL7uyx0YaHJ4x4pYvQFuVZJsebd9whzogN-t_w4GY46CwZoTzf_MwmAoduY7mANviELOQ0hgyE5TnuCG5rHZWhEQ5CpVaq1Dr-ycCebCQwJFEOfebkW9NvPtT0c0UL4t8-3vOUU-1mFfbA6M5boMPp1NoKAKPR0NHQJQCvvhWqPHhtdh6X7U4pKRpXLQTYHkKeoPCkTbvZ_ieTSXMySjptxhylM1TNhO9kY55WzN9IDyku_QcT6HWZB3FQtVhBUcO-7ZqHf748iYP4QzRfTgWvDIl3aU5256VZKBghrpuLwe8pzcRBYxVJHnrBZwd22WcFviBwFTO2Hp0Qimf4QbER4FoGOsQQaSyyoW6j9-VbxvU2S-Ug_wj9SEyAJq0iQmdeZJHdhHQc9Awtd3ODthoQf0yzYhFKkap56sFZCHJqvnnM5ARql4fmxpgdkv8zyQmodqC-w	{"<a href=\\"https://maps.google.com/maps/contrib/108003148543133771360\\">cata</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
388	504	4032	3024	AeeoHcLf1t7deV5mi4o046Yo0oxI289uytAOxzH0s8UjZYRTV8w2XJAMkWafidhBn_PPbhz9tND8gY_FRXeYJCNa311DLPzlB_qSSo-WD1RFQFx0XnibJwcsV0smf3GRo6XsBp1s_7_xZl-bkUacLIuNYWiapWZmR-YywkHVEAFMcLit6j4K8Khkw9tVDvfM5TmIC_9Hp4XOCQqSGFwQPm-8tuUOdhpS1VZ78y6xCOUtuvHoWwEje4tW_32wRghrfdU1zGUjPKevjOLj9Ermr6tku8--dpJCzU0Q_NFpKAKXRAHVRPvPFnA8s744Dn-SEnYrYFpY5jzBYyrzecynVo3uLRmbvQ6qCLuCulKg4AkEZ-qT9gk7eUr0Id3E7k07I1kIet9fpEHp4xSPnDV0BU7Wyttm8wZK9y23na20cRyA578UPl10_S7YpRfB2Uy93TSaEVydQ0fFHix-cbZosCWddZYYHTZmorF6mFq3mze9_AXf5czF1w4xm76tgpeeVo9ReYCu_7AbBp2vvwaXPfeEoBqDyJRp60RF5fOtM2qkqI9KwVNdBt8FJfoyykvRjzQaLt89Mf-G-IIr6kBx2Mxxue580liqa84wZbN90TgSaEpFL9OY8uFQh2GXkTIMDdumZAXaxA	{"<a href=\\"https://maps.google.com/maps/contrib/108003148543133771360\\">cata</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
389	505	1920	1080	AeeoHcKXfs_fri3_vxk8ya7T6C4Uw68mx-Bj9tL1z4USfy63yT1iFB44XGJc3Uwx5T5D01L5OC0vOpFn02XaVNX5v3l8zKvz0ewRPtMlKPcQSfTaqhfV4434vSMVycbNPY0mu3ylN0EsTlYHn2GV0S5wa1QwG1U2QvxAMY4m6LNcNwX2eRDjpmpKcblkhcgmJsU-9aSmnq7SKcc2aXI6QJGpSyhmoFRI0Yuj7j_QVDweuE8tphE-gkv74_txMzkvzMebXtrlHh5ldypF1d7ErYFR6XZm5jlNe9OlDF4Bk_9Ya9a_FPlHFGOwycyO1NNZnOqywzgMbEowqwUDdtxJ3dg48qSOjihx6lPxtQKxpnYQ1eqeDkMnCN91GgtH8VoMYodfmdAWZomNlg4l1nuw6WFjhrqOxUJHg-o53DA6F27zVmRKlrymBYC89SmJGR4hJTyRh7LRC2H9oybzptM10yOeAW7gXfACpNU4Qm6soKz0H3M5MI8rnAjQfUBhmNhaNqCSY721XAG9PzdFfPMpa3kI4bazb9PXXMU41Ati07F2Xt25DOIDPBt547Kh7g_qdqJr4vB8U8buJwckiQSfCZG_tg0QcWimnQRiPwRRN92UXmnEMlXQo6hZ-c60t9U9-zEf2gf7yQ	{"<a href=\\"https://maps.google.com/maps/contrib/106841444954478976423\\">蒋文杰</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
390	506	2084	4624	AeeoHcIs72q8gKlJhNZdga9F3U8PW5rBwvWY9hzGqwi19RyNhjbnJiW04WeTKSW4rTpOF3lLEwqBY9gQWoICiXMVf2lMYNuVdWqm8PbTLtHBLkg0TBUtbXs2zOdhDtHOj3Sn5GRsvenp6PV2x3Ja43nfAOXlAp6Y6ON1Kbi16wKrTC5jxmjhc1ABVmZTVo5te9UCAn05KOKi9TcMyqaivFeRaRT_VI698RPT7l0N3vKiqYZuyGZTQTalp2QaPRhFdSeQXu9oBRKFYt80eagjMfGeBNRBOUpAFcph42Y1yoE1mn61meUI7E9VljObIMYPvDzU0FT5kIRPQhlXIIl3X5FeBBI1ISJzdBAUr6aXdpTcSm-64P_kSkcdKl4ZrsixUIQfHziu5KBg1LZEd8mVZWkcoix2vsye2D7qoRHJikn8Dk1ezfYTPQxQ3zpmzjLk4Cw2hbb-alWfQvzNypQpsYM5wZfgk8kQn2OCPnM7dUjeOn9Nat6_u3RG9gNK0LUQUjuwE4jyCru1-z5ReSuavkYtVjfjMEa72k-Jt7I-a-HWV9cuY3EUrqz4IsW8XBJg3zYA-4UmZF1826Hty3Hm9xoDpRwV5oQ7IV4SgvQpAX1kBveWUxsU4jjvOFZtunnh0X7EUgZJTOjs	{"<a href=\\"https://maps.google.com/maps/contrib/113279928589588026289\\">Martin</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
391	507	4160	3120	AeeoHcLLkDWZJtE_ORk7seretiiX-PkKkHf30AMWAwTZzTY76DTT0itkJiV7MwwUP7Nsq08lAA1G-MQ28mvKtKfE9QiVSJnlW0Ypo4If6otTq84rVaFwO5yFOHk5mS2s9k9hsB14XH8pnyN-qgLsLY8aEzG0uLfJAZOeNh6jPBJZ4wf_XMjYa20_pienCYiAiHognf9ANj8w_q8RHfvGFtKQH2y-pKE913mAMdOns0E3viRgwOqHtoaCCxalBcaM1XAGMyGMDXE4OFuEm3hpg40h94R0qadtsa0KwRh0DKnRMqFznB5P4TBzz7AnlQaxRv36rzUfXs6PfhfmU_OyGyh8lczg16Bf8vxGQkyGQds9nWiBgsBnpsu7PmIfXNFob06L-qwFUhqaVNgJzG8hBAs-ccvOcGQp7-ju3t70PBlENhlWyUlUnJ6TeM4hEnPY_pd_FS6rUf4KUaRMi_IdtNMU7ZnfqXsm36feONcbIvmmLDGAoI2Y-A0jQEBEO_ozAUqv6FjxaYKguvckfEnsbBUhrfbGxZS3l_hUjNBuojbasjJGUOFbGdQUmnxzFy_dYvK6bnx4XnclHMDNAuJc7Te0KvRc9uuIptv7txJIp_tIoo7Pe2KB7ceU3RyawOPqHv14zXV-PWpT	{"<a href=\\"https://maps.google.com/maps/contrib/105223450330245909305\\">Carla Icarte</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
392	508	4032	3024	AeeoHcLp2rqXGake57_DPCdLMZUkkaJdxN8RNWx_B5lEc1GHJ5aa1CJNJepUr2dAbDRmIDOakwLf5lcCZqhG1bwicfKiH5qgeq9xXeuW-zfHbnMYJ2ofh9uSYBpodMckojRG00VjE13wpS49sKOnLvubCLVUu-vvu2mVwjLXio65e7KjS5LgcFVA0_vQJGoV6dljiFfqmSm1ZI7ZJ3xfvTsrSypE2JzpQz4YxNsI-P771-a0cZGrUBk8OXZa2Tufp-Jh0fxjA8cke5vq0oZc7e62N3wrq8beroxdWUSKCBy4nW5bSTo6XHr5yoJ6th3qCDHS85hAQlleDJqhb4HVCJ6hHyhGBluils24hk6fg9AJZ4sUbyrNBhI21YJu_1qLqwJKvd7zoGdv3mTo6ATk0eWEj5Y0qjdbXCkFA6DXTZdpE2DMyPZFLBW6TZHd-JRm-jcVsL87Kwhb5siXvye1i_rKKlpVYETXh9gE7rQRyTP2VqQafLeayHecTGQckoBKKm_A9RpcAkpu9nbg_tUC5_4BX4_t9veU6X9xfCfuGyhnEH02aBmbtZzIJ9pbGv19bCaQ86aszcN-6BdZ7uI0BWvgENmZ__LgmjuX8ASUV7mqQNOy7_vLe3otjAsoCzGLFwTZrMEmJRKL	{"<a href=\\"https://maps.google.com/maps/contrib/105008274701788284574\\">Gerardo Cocio Olmos</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
393	509	2604	4624	AeeoHcLNlVsg5TFWRQ01zwCdL5lQ7Cbphotdxrm0939lvg5Cm6apBqo1oifx8PleRZiz36gZkLVfipdkGUQrTVFQBQp7uU6_RJ2rZLRpGYl400agdL8Zq11b4fxT8j1PHeOprw5199XrXwTl3I41lIIZXr8sULqumbZUQ6MqMCZty72GwQA9uFLmV7CrGywlTgfaNoT02guLD-OhlyDWMGZufOpxW2PTB5nEsI9_OfkCtjsyinr0hAFKfhGk10BoGL16rBZVIMo9r0_8HLllO6Dop_mJggf5AZ_hvNuYjZuK-d7JusjTOqE71y5KfKFxpFFYgb01_gI9QOLz0jHkgX-mtsGWrwy7jBtHNIVNjFFYHwM5TxpxoziJxgBeoka_EY0g_kIg6b9G4CvFO6OojJGmMY0tzoh8r3R0AOuKvAaIHSx7_CXW1JT-8xJkJAiE4BDiKS6GTzk19bkfS4KFXg00IbZElLKKxWn2z0pl3i71ODs0K0EFXQiKUOvOg182Ev-05nQb1OFAjblQ-VK1zNqbHdYk_6ujuMOduvEkgpH683cdW6iIolxbpz-ZmgXPoMQpYP7di-S_mAQjDMleSN4UVzIkoAoVe2Bx0W2m-Zvn9qDUW0GEhHHA160FBgulIsIZK_hLVCWn	{"<a href=\\"https://maps.google.com/maps/contrib/111117305715107938472\\">L.A</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
394	510	1800	4000	AeeoHcIHPECEDd4GAIT_yto45e7v7DwxgjdVDHXr_me0lGE7Pzj1sBnssJLmyGKX1bmPgCZHJ9bKJFpZnmdG2GQJ0CDQSkxvNdafZM-9t36tyuiOTOYkDY0VLUlLaBpMeW05hExTnhsjsg7OWdhbMlFArPZO_87elKyD5NoLhdI4mZkAr7yQwy25Boa6BYYf_wtRkZ0Z8fb2uI6ImnvMgd_UaNGtnOVy-8ygGkxDZV7q9JmJmWCFwaSWYtuebYmUnL3xMyC9ilpfVQEIedoleFuaZWzQvy2t-cQsGgG0yi7zMiyoFtmBp2dYRCa25-DGlSdEuegIquKW5phW4KSneMW0QqmouywACc9iibcMMNX4r-NKotDPPMwXj01L-xW-MLL8rMaKr1SFVX3gVNjLb-xVoYJ8AevkeKu4g_-TuLCU-qRqzqM10DLrpARGbpvSmDJMjGupk33sH19waMTYsra_uJnEyIFFqNSvXKTqqYs5n8cylszEK8LHIppQujiWgtAz9hzfsRHNZP-Aa0IewovJQ8F4_oUhAuiDgXpjESySXWAIeUxRNq-jGFv0Z_jpwUnSgSkw-abaqS1ZCslg5LwO0eJuRMEF1xIikVQkDjhYkkXo2Gnv0k5TLoi6gDP5JA	{"<a href=\\"https://maps.google.com/maps/contrib/109393312532179007114\\">Diego Alonso Dienemann Soto</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
395	511	2610	3872	AeeoHcLSIOK-tBzskAM-fouJJt4WUc4RxSCcljcuica4unaqVh5oXVjRY-5n5fwrDXCFxEaatr230zuSW7_NQmfqzGoyRDqkMVijdCfSWunxQx-hVvZbCvuX3LYtlxnLyHQmvprTXBamlayJMZ_UOqosQPZU1vPwHqqJzylkxqaaDtgU1A8TLzwBrG-CLAr5m2KCAtP-RGux5AmtSOoA8iI796llnhbb6WiPGqJvjU5eRB7f12o2f7ABYFu5yHc1kd_fdSA8CReHbnoDGQhuVAi-tXRiRyL-ST4n1xaiM2EWLmTwHl8UksmwjCO4urbovDq5RmKXapxf1VkaZj6Fy1ybaV_rFScFCeSrQxFm3Nt5kwrUCCVt_id6c9zZf2EwlLCkwGA0AFYYzFvdBZy9_s-v4hMdJ7-03EMaaPCPvzRn9HTr_RLx_MT8_jV2tTQFWTZcvAcjuBI-WM8s2vYmwSbIK5eTdFAKNMQg_EldsTb7Mhk8WinwQfJiN0ljxr51nY0Mr_EhWc-7cI6Rj_my5D_2W76AhHek0hOMGTSGHT9hJjqJDk7W48qAIQanagK62n9cS2wDd3sYGrR2DL2LLvliyGzpImYDkYZAKp1G-l_Efx98Pq4E1zVyOxKkaRUX1WFOXdHR2A	{"<a href=\\"https://maps.google.com/maps/contrib/102271825456681400834\\">Rodrigo González G.</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
396	514	2278	2278	AeeoHcIMvS7DBPGQFm2nZSpT4CCnF4g-xO_M1asGDRb6k1fPHa6mbFHRlxZl9aUfwUz3y9Rw0vtfFv3PoQqO0REp1OY3_H3Mz0gznz8a0QtXHQNBj5nXAhxDkvWxpNbnK7e_oFMAZbQcddj5uMgZdZGzG3h1xx_65GAkpKK_XfdB5AqEymb-Hug_39A7m9v6eP67oPPlIX-l2cW1OYEdI15cr5p6I1B75aN6eZXfTzD3r69S75ZDTW_MV5nRMBzvFkEa_TXmQeWiibO3byr4l1Q2FyYaXIOLaqDCjh0uWwlT_U2P28qglM3OfV_GkZJiuoO2vMl0ttU80Z5qfbIf_TeWgVahVBdUalIL8qHjY4d2CWbrUn0ESThOsYUeH4kL0zvKmUcNtOQi0IEw_K7JEpTdKQgR68jq_CJGbD4QXu9aOQpGGjIMJjwsKQS8SsxmRtw2rlifY-1Sh_zPDkZj6PLiG0u2TgguKXHRnUFigGKI7XnMs2FSZpy86qo0LQS5KchkmXSAgpdq0tAib8eIHlLyBXg3mx4VmHQv4SqYmigwDtNfZ2OgexQJ0LgW9FcL7jLxETbaiTGylgkh-er3mOhMkTQmcLL7khOaVR_RxJTCwmg6ffi2AQHnkhbFTqGM5h9JKSSpyyNY	{"<a href=\\"https://maps.google.com/maps/contrib/113908770773032264853\\">Sergio Hernandez</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
397	515	1920	1440	AeeoHcJxc6Ca6xn6xjd1YOq82AWVpF8OKKQxLA-xeTfYKxp2FQ5ZvKt9YDW6ieII_p6d6YgmviFrh9S-dGGcArBjzo6i8W6wCHvl1rAJqwWLTK8KEyi35U-F3JxgCKvk8uHJSWZ0jeAPAeFUemvB4eiOtOpXw5y45VbPn7YZDehYiHhJ3EBBKLD3AL57vbQvM_fF3Qh8pzDMorZU3Nek_boUog4z_c4gqQLmmKk57zQaGNufwvzYP18NMvBGJC9fgSBtCxeW7frB4vooJcJOQqPALPVaaQJyXWo_Ov2jsOSFwsn2tO6aN152uzx788wkmfqkiDNBRMiveGPOl9bIo8z5OptPKRH1btBvpZxBX9vcbsIz4xizQaDyyrS1dRRgcVMJTPfCf25iN11VwW75HbiOekM8nRQ04ZHMaFYRhuD_p0Rt0e8FtkdKPS-u90IOJd1KM0RTsuHf8IuhnbD22m5CjIvPWpEuZtvlZU5WKK9frrGP1p4a_MYFL2pNtdvrtQMRqjcevXV3eLpwouXJe-tGv4YMVDkxF4QCKMBpZgsAXpZCEavsMPC5fEBrK6x-fOGHiAzW78vb7PLia_QXNu57NqGbIP7c2BvHASDDLXo-Qh_a1c7aM-vGKUryo4b2so2aI_hSDnEk	{"<a href=\\"https://maps.google.com/maps/contrib/106914386820738284833\\">Gianella Vilches</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
398	518	474	869	AeeoHcJJXPq6EDZ6M1wiSATcBcGMUTZtSt1nn5_nIlgckLIwKwNnZHrf41n-UaPiiOnon2jvB3bEAEPJm8-DSXtSqTjtFF7q80P4_QuiIqa8lT-isNUkJQOG7tJRUer1nR4UoZpqRJ-UqGNljiQeTEGWvysV6koF1RZCFXJBbUHyFQOAo9z2mocveN710J6crx2bZHJh9-Ua21-K1yKL9TD3e6c8oPi8y52LfxdUDfSh_qVLwGi4XJUQJNsn2Przj-y0T9SbEfdNWn_GIcxZw65x2C2yI4Kk6OaZ3Dbg3gt1XOtVLHOJ9smHGicUUlz7n8SMicF99ICIYY1_qWjEsFuyNO68PDQHs0BU2bD29JVQGNUnUaYvEmrDlpZ6Ucs43v7EQ-RUMuLTcYssecJtlnqSnef4C_vw84n_-Grdlm9BzH5q9bbgLK6QNts6KWBdEC886HgfaBUF93sQ7fpJziOpr7h-CU-lgBItZz-dMpuMusESIYNVuJkqdXAZHmzgEW5-P5arkGvb9a4RsAuOrRyjvmSeWwjvJMpIqM6cdLupFUpp91h4XlBi1lo7ZEIY3J9sv4QN2-0lsiRWq58SN66uoXgzQ760eMr6o4IVaWnsHOKvlnOroDxWlf-zThnYfTs6eLhXNnWp	{"<a href=\\"https://maps.google.com/maps/contrib/108414291607028640088\\">Nelson Omar Soto Valenzuela</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
399	519	5891	3927	AeeoHcJM5FdqfOLxAXyPOKvSp4uT6hjJ1PFi-ACFRtehpHPKpKxfnfhCoM31SE3vliipe6h7Qi_c1Re9z02hYAsUePjXbZSMohz5_uIP7_Vr_6YiOSlh2aR-atA6mpqqmuNCotQSZHgaJnc3MIQHG_Ij2lacGSYL3mWeRypOdJtl5DlPFEYqG_zb0KxSOO3aWQe4BgY4G8dvdTQau4YQztc26iI0w-_jGtMU7x_GrtNXbhS8hl7E_mLss3e4DlTP8lcbJ_42D-jIOGOwb8JvNQKE8LmbAQ5pfRQlRE9INjaA7pj9esTjTXUOgsL9caxHLTzRlMrFYi12ZJc	{"<a href=\\"https://maps.google.com/maps/contrib/116199935259828328784\\">Mall Paseo Valdivia</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
400	520	1441	1229	AeeoHcJgPYNVvqavOoEDQdV1bcDVy3RsJVQK3mIQNYvySaVDOX0FJ5wolG8ZG3ocXU9dJqGynD7lmSJpSpXbFYiN2dFqMcQ6akiW5giccSxGtW01V61PSMDXTbi0yDY2_YdMq5ka14PEsqEX8GzWADiR91ahQeWdnv8icN9W5Z570S1G_JI9kI_dP2cOc6-P3AcAP3awxEEdzM5Ej_7V7rOuv1NtMiiWxTtP5UtGMhg8jptScDKHo_1iIU_XlFc-9j6dWICuhzfG7oPnFxZLBeja1sCNlHYdIj3LbNTtPdxrYi-lYRtQX8cPQfmMQHajHYb4NXOYA_7Lf_s	{"<a href=\\"https://maps.google.com/maps/contrib/115720632510123296934\\">AutoVal Rent a Car</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
401	521	1800	2880	AeeoHcJNDPF8YRQOu8abZRqWjJTTB4qsN_dKHRAX5jgQAq9q8DhNYqDIl0zWE3E8JxNt4Reh_rKbIr7R2hpGWq15apuPVfFR3L5BYR7N4JJxGVYxrLxsAWW6YpJdgf31Jgf4dUy9Uq1OKjLKPL_pe7pyLRhE9lkJUtb7q5-bWQ3OeRDZ-VCX8ttkThrn0yTSUshbinH9JRWyblzEsrMDtpRIZ2jj80BGjWvyVbd3MgZrC4Qjlw_620SjePhXwLN2qTu17mxp3eo2TYE4IKq3hOZceJOnl29GV0_OdBsR18pADc999HspXkDQQ9lWKL-HIfE5W39bEQZra9Y	{"<a href=\\"https://maps.google.com/maps/contrib/102481062144177218704\\">Soc Automotriz Tecnosur</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
402	522	2976	3968	AeeoHcLABHslU89fHmjcOSC2FaWY3-xCZuRdkyHVCwo2WE4lAX3XkpOMuoUxVcixMZHYFaerqPkYKTxj1_L19tD6XruzLt6RZMac_EXh0FoAdPVGC4QzrLi_bmaific757_RkJ_xbr4KHopVGopKfEaAU6BPGprhLw25kmxnlwz6I8bv9OF7kuobLFUHqXxaXm-G_gqRb9YJ_PbYFwViiHkR8SHyarOWSzVhQS54h-byCrVBVJLkAtxWtqGvsaaAom_cJNRXyk4tlWcJ3Fdtyqn6OtI0DsaupGeZzjcopTsyc6YPc3Xu1mD8GZp_C513XSV8IQTcRi6zIZw	{"<a href=\\"https://maps.google.com/maps/contrib/111402731395388770552\\">Kaufmann Valdivia</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
403	524	1920	1080	AeeoHcKoghBJBw2_rEGLGhtkQdH1f5sOoXWCBSt-19F336R_CdcwT34ZTz7LuCwnTjnCzoGKgKB93SpymTXyauZ9WqlJG-7Nixtua-VY04RgcZ8GDjLSUPJM3j5jAoMe-yUmdGY20xfXNMOOG1ZURnioCu9NmHZd6i2s9bp921X5iESTpSjfIekKxaQyB3oXLVPogepqsGpzkrdt9D-OubM3loxwmH5qntJNrFiN7v5CFfkwcGspy-hQyJuilcej9ixikMXkKqt1BLr9H0Lzadxr72a_LAXeikVMNvAb_Vg0MsHtcc1tne-v115PbeDUvppO30wUHztCW78aPsyaDKrSTxyOHRxOz55hpnwM3gxp9B20qZQU-4YyeHmvUSmJkbhIbKF080IWTL-fxrQJH7E4hPSRshDFr5eF-dsKD0fQuZOyqTQ3fehC7jd5MYeSUS-lHCfhs0WCGS7qWz6EprXsqJCmQ8soh9qgtUQ6AYaI2FFOexOpjoq-Df9EuV22FhAkheAgtlquarATsNz790nTQfg6Y3tl4rwxlFUo8lFn-u70dxnndo1uzII4AHlygr2nrzqcy9v_1f0_rpw20rOFaIHtLf67-afF6RCn40-jmsZn3Abx5L1v_lmbMYHeAKtokhkOZIJ1	{"<a href=\\"https://maps.google.com/maps/contrib/105360506038554749561\\">Rodrigo Muñoz</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
404	525	2786	3715	AeeoHcJ7sZnUGKzZS7I_UlNs_nWOQmtS8ezszhcxKK4GMCxVuOZP5fYAr1uGGmqs9tvqEbAgCRqVrx6yxFgWxv0cwepcJgO9Ldh4KxyV4x5pa0_u55MiZqgpkU1xX-LtyUpt-h7tGnrnlPFn7GjAkDB60hNSaIIVWB8JjrVn-kknOdZ2QkTdUKosYuZu3KugDtGvAddoycXQHdOrjtuyOv5o6YXObwvWpIFUhgnOrIPQN83GpueHEBuxSRB90NIMXcaN25HEapw72vYFzgjIGYSbFfroMIGL0IfLMGM7ZJo8UEmPScI2VCDMD4sI1Wmlq40e8Jq_GqEEkJ0	{"<a href=\\"https://maps.google.com/maps/contrib/112774250585762291742\\">Neumaticos San Jorge</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
405	526	3464	4618	AeeoHcIVfX10kpJOtCIcyZS9O81tD9uoUwUYHS25L76KBQn9lyOaW5WfXQzqtRrzDhcnwymfSKXUF8jSKvBA--MXq6JxKHlBNi5OLuPbsJqIAf6deNHwAXRNlXA6v6kGPRCv1qD3YQYxAEAUJkWqqQftOFXG4SOBkxWDi1e07nKejqWK9q6XqLICB4ZGTi9QLIOt_dnELmfgyEWb1lyZgc2DtRWiQBUT53x1QM9VhKp-w7oK-Pyy3kZh0BFYLaEA2ijsNi9lavP4rC6wqkd48OI2yvPZEjLKz0GToq8sK37S3ScW-KSnDC-S9Le25s_k4cwAfhobzXMRcNM	{"<a href=\\"https://maps.google.com/maps/contrib/117814191391152730659\\">Ábaco_Delifoods</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
406	527	960	1280	AeeoHcLHkjIyd7PJUQW2_QaECoecrB5d9W1dBpRYJLrvsSsLWsz56lbC-SuaM44QYZvSNlsOaaXAPxTSD2N9IGf_kl4NBlnwWIXwu5p_cubQHETPsHde8PfaoT6f0fWUWthZY7917LU4Nm8OCs0eHsECiTEdd5WUs4HNW5bANjxJzwUcRHXS8r890HS1gUdezAPxVviK5KnVLYc_XfzF5ltTuJWrebJM1dVLQiygXoLbUL2UKFlLD4vm2rmTQShTCQC9xp72CUW2EHWOu-5EwCRKb6b-oOezrjZoMRFrsBrZhPHn2zxBvUT3r4qmE7XuK0UvsoEvulesain-jFtTC0_AivSoIPRciEiZR_bdSKzAQB5vhSCMB5tNMkPzjvhqCRdoUg0DYL42P6SDdJe1sQu4FDvDKxujLrqShesb14txfyg9m2A8TuHbk4sCwm_MvQOi9_kYs43uj4-ykkz8LE1fK5SCz-QWn_ssEvsn2Fj0E9zj9cg4Ib3ua8oEGci89PxsfWimpQsI-Rw7xJ0ks4shRzlyYkc7GEgf0LZzbO3QUtbt0_gyYe-sJdujIdjKn24gt-fToG_DRPA8CXiE_FEi2z7arICPFcvys64a4GRV2TXeVwJdHRUa_Bdb3b2abhEQhRQOXw	{"<a href=\\"https://maps.google.com/maps/contrib/113226138478315265450\\">Pia Peralta Vega</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
407	528	900	1600	AeeoHcITwkJ211PrMdflvJRyg9g88xlPIXsAco5sS-5m_NCziVERXvIBYCn3NEjBKF_yX4UbvlTkMGIPver7QlIE8iCijoUZhX70N78qRNlHYW_d3jFYPfVRcT50om3b1EYMxjZ3upzxIr0Yw5HO8DHZeq-eUtVlf3_eBu1jIbzQ44U3ePjZwxQZl_eVGW6_puU7wZpb0S6VNVeIURpBYXcERI6awZ_SX7JZYf2hEbaB6NbCqpeHn4NdSFGX8XH4LxKq_Hkj0XNSnF4A42sM6iNg9QS4poIYZi_wrnEIOvfv-5wecpgn_M1dW1TDOcIml6-xDh0wfCw8ctk	{"<a href=\\"https://maps.google.com/maps/contrib/115805531766961237224\\">Farmacias del Dr. Simi</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
408	529	1536	2048	AeeoHcJ-dxVrvXkryCmZJDvq3FRVAeuOb-CoTt32u1Zb_EwDsTrysUjDTdcgGHOmbm6CgsnbAG_yQjK1t0QUGezRXIJtc5FM_OHZMcjDCRLOb8IbEjdmG3bS6wsEp11JXKJAoSBri4sdKd07k17NUZa3ZiEJcoQENC-ZEauGlt1QocuXMxh4-nv0D-841PnnYkZi9PkyAXh5xvZrSaSGhpbmGWnzoIPWGVSLHj3Laz5vFNLsmbyoLIBj1-CyJbLFEE14vX28s1Lc556qBd2qjMqlHpFYVW_GkLRNXxcq2bi821Jx3QphJ92fr8erWX30GraCNyFdVl1-iu4	{"<a href=\\"https://maps.google.com/maps/contrib/114492452982208963847\\">Cooperativa de consumo responsable de Valdivia La Manzana</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
409	533	604	567	AeeoHcJdaqLqiYp7XXkkgKJp_ZzpG2We8uuvJX-nzEpCdEqtG94CsiHDQavu9qv6H5IfKZLm_p5szQVIN40tvPy75FvDDVS8tVhJv0wDxFvd0F6gGpTDdVL5Jrt1BvKg-6dkTvOkmSpNUTz4MUfVMfwfuQe7viNkVDMIJ17GKUdBUlH6tCBh7C9Xvv0YYNNjtfO6RDqyWz4DT-bqLg7q_ZoOjMtRbPq6vzBXWw99HMe32I3x-8xkswgGcSESDyaYReDpNkrndf4fLngC4fwWJh4ITYBz3FxnaI3rdDowzI3XKSVMe0MXaIYZ5GVpKkKlSiTK4YfZyzkz3Ec	{"<a href=\\"https://maps.google.com/maps/contrib/101362133201536839735\\">Vamproden Mr.</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
410	535	1800	3458	AeeoHcJnA1W5tGyrxzzwaT4SYaelo-F5fsJXjSWSNY5jSmzsKQIOzmEjPvvMYvuQmrkZEV2KIjuw0SBoFg1d8a1coRPN0-1DUA2CvYZf5Vo8eZgy3fzGDZTDTsK-YXpohCybTJw_J5UkjvJ27BZxtqu7cZNRD5t0Mou1YTr7-62TfNWetJJz4RjrhKhry09_V2MfZYJzD7ql1Ie2tJaPYLkYqNudpuWPPOVY-mAvNUgGXhR-Y5nClla3zWHZmJdCrpo0Cy1PnkEqrDP33wq5O8UbyYL1oF5n36ekIRHnP7AZwJUrBrTRnNHX30qdAeVVTKDiXB7YGZul82lGHX3M7Blq5cwKgub9whCCMm_wfBAPN_W0K1IBJYRkzEQpz7GVvIxqmOm0wcYsYqEsRpODgRSWhxG2xYJ8HDV_PeUkggCosBTsjYj4yY1Ucp4ZGg1htlTLxLsOkf-EMrE0x6vdm-7BDkqJcK8CEyTX3m-0i0gggfUP-dq70AJ4G2oWBIVb3rI0qFjXvvykfjTx8QlpLOx7-U1P5cj0ARYAv_nrDlVOnkrgD79HIJtK_LLP_qdHLRdQtWZ71Un9_4zRJMqJ7l0IgpL8g7RkG_9tjheUYlkZKwwNdPIm_HRMxC4LAjYQaSoc	{"<a href=\\"https://maps.google.com/maps/contrib/113279928589588026289\\">Martin</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
411	536	2084	4624	AeeoHcK9JZo3BxrRAl9D11WphuEzntWX3IJKl9HCxkalISxo3ss1NFiqjOhO-pOB-sdcr19qsqknwlvanWyVLaMO67TBvoAQbM5F0NsuOlFykD0JTA3ZbeHTO2WN2qf8DYAVHeisMQuf9Q7CHK6Ivb9PmoJzg3JVjPCCzdB6fBnw4WdOcoQI7RIFZihudXV2KtmV7yjt3zsfb16AM9syw8xrsaxlw5BcKR662xVj-6kl98L1OIew7q8D_5Lib2he6kvoB9PQejptCU9tzXIbY4phS3NSUlC0qnfmPtLHp5V3JHJU70IG3etawglnVhtFf6U_wAKSCllZ4EC_1E3hL3zGLA9_xXIR6Dl_XCgZUyFjgnYyG9dtgqzJbIZyfR57z7IOw8dye2tYXofKIhGUYO84qm3dcjxQ88bqYOwMveyCFvbtcvPPtWmyPErWS1B3ZDBkcTHkAyzOO0XykU65r_ojvoslc6gqaWjqlVXbCkalDW9vfNTSL39PBuEcs71D0WMpGwtPGWWuucjvkxK76NI8e92ktHLWtru3BynUFNFxm6sdx6zmhrDyYQ9Ny6BEsODi9Xnu9krVCrX-HKvSki7Z_39tp1h_qAUGYpRVFWzCQts66WUuKQ2QK8c6pJHoawwT	{"<a href=\\"https://maps.google.com/maps/contrib/113279928589588026289\\">Martin</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
412	538	2448	3264	AeeoHcK23CDHRCtLMHW8lx4c1BSsdwbxOCIbKqh_BdnY3Fg8Sq1kVKqdQgUD9I4ptTnVZvjnYyfMz53HRkrV4QERAGPMo-FXhxIjGW3L0n_q2Z2AlbckArRIwOJ69BFE55J1-zCrCjtQ9PyL5BxTDntcbPoqTaYrrqMlPYkVBJOc-qfDIyHOgENbPWIT9IQ7iWkznucHF7AJFtEi0XHCerCEU1BuhTw0JUZLQqMIn8dQATKJaI_QgOJHOaj-kGJJNQdj-p8vyq6g1GCoEtfx6R1hfEkeLlpqFiDEwsJv0ejlEiveQ30JIGYocjcdZScG8siEuo-xJey1rZ5LuUbqWdKDGqkYLNUOthZoeRbvVfVKUx_aZ5MPBX43MAkXqJtbimZQhqGVfY3KnCiSvlNE16je_2q1jfyWCVM0qf66NlT4mOSIUwRxgORV1Cq5_UNO8DmCrOKO-sjK5j6wHfPtSC14PD4SIL5hpY9QNDmBtHjyOdqy1BVyY6CYdTdUqvujyPdDH5BymYs8OvaFgqf-ObjBHpHpzaE00AmEaG4K-GNAn41lAEKvSahOAXOvYXoxSbx3tu_JqfMhtmEtPn7VJ9nIHj0VWUNipmXwVtnPkyu05yEeORq76jngA-FNGIgFxJZzUfFqHA	{"<a href=\\"https://maps.google.com/maps/contrib/104163291721676126558\\">Gloria Vargas</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
413	539	1920	1080	AeeoHcKYN15BlohvazFC5E42nkpPk9P256Y5MhA9ouRamOLEZMhY50gA-XbzZAMPsQnSa3NHvICr-kK0i5KpIEULk8qxYQq-axg0tsNKil2-8niTXIdt5STz2euAvg-rxN6xSNUVyi5tW9aDEOrNg-4X1GuV6rwWVa0W2xQ_cizFDS1gEbN1Kas0tRAQ9sq3Q1I1egbK52Y_8Vr2MaPV-nB9pgUKPUNzkrE75uGVaGY0R0EKPsKkE54244Yd12NGA_c92pfO_piCmFfyB049EE9PMyuV0SN45O69C2uyq3-lssJWW_N5SVSUzqz_2-pG6I43ji8U8EjEBByPRvccXPn0wPN83ZT3N1n2_y1YKkphdM3h9__ck2lNNt3HzWeVmTEa-KmsjJM4EmXILkr4VJz1U7aVZ-FxPCsZEj1IjFo7vIvWGl_TpeNJN69Ae0SH_C7bkP6xT0FCdcZ0b63MBOyiXyQiFUk677NAVhTt7Elfb0XzsypA3DIoP61gp9RJeZE_5EeGm_N5QuWwPUjqMDJlqfj3gWAmjGxImSHwhbgzpUqdlyBEQwzKWYl_ivaah9AuouCc-uaNDs1kWMxHpmfuhQsQOgX5orGGkS9Bp4Normr6dHyoG1X4UbBdWq7dJz8nOnXabaY8	{"<a href=\\"https://maps.google.com/maps/contrib/114272386336552876576\\">Moises Munoz</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
414	540	4032	3024	AeeoHcLvIyDzxnW6YudieekxSOVbyczVqEt8FztbP16SR213PGNgJHtpMwhCJZVdhYGQHeu9eiByMo7qWph4lAbb-WpPiutM8IXuE0jZdW3TSszpxhWZO0Exzomeh98lI3d2mqrc_Y6xVVZEZPYL_jxbK25KrdPYNnGZd12gxifYLy6uqgYSxbBL2R1y6_B-f5aNLBbPeSmQifBWnJdR5syMbsmtpAq7vr4hnbu_JHBIu7x0buT108sqzS2oneET3p7FlHf2w5KLrcnUTEQ-eX_5tT3nHys4_DGxmUkxKDo1xJeCRDY4HtOrO4IJEyg5lJR-H4SognsKEXT0i-6uIrmMtMGquixwL1MLlsNVrnRHwbW4VJxhjD6JRJcsFmIbVeTqU6MWY2haC2zHand2TJSNd2wlZg0G4Zcg2e-l9iXxlOPnZN9E2yYWdlXVbeYH9glwvYBhphp1wP5gwDhPjbOrLMkbKehq0JXkb8iPGk7l7ffFh51IIxlxWgc_a_ImRidPpC8Bq_QKjDcuvitJgyCuFxGBlQ_DHSKOu_BcpSVNfLt-PQPG6_jbnLxd28TAoLuUZba5UQD64T5q79TtAz7Y-Yc2CPyxMDszvTpCx_iSiTROy8MUIc8nvTr7bgody5U7GV75-g	{"<a href=\\"https://maps.google.com/maps/contrib/117589255816507081703\\">Jonathan Oberreuter</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
415	542	960	960	AeeoHcIoIHiO8infnBxSnEcQ6HmspCopFsQT9hm1TmxkVi08JZHJCECfAT7Z65Pme_1HP5hG93bIdSv95NBappJsDGyQ2luoryauty8Yw6kivBpVBxURxJW4B2jTwPxNUAfhl-o13GnQH2319m2Sso7uA--f7AAxweupnUyq3ZZbID3e_H-S0RtJToU_zDpxoE_Br2S71__0IwKmTgYaVS0fDKs8zbzFVe5yS6NlXKD4TDl8vBf7peOrH4xekFBmS2x_dCf8fBAzkk7pELpAtQBbvElWFSmuxJtCQCwdyos5WzTW1cma-by177tC_g3qvWjrtJiAO42uu38	{"<a href=\\"https://maps.google.com/maps/contrib/102614789098207465551\\">CREAMWORLD</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
416	543	315	850	AeeoHcL64NQBqHNJliMeKlDaZmPHarnvBKrIIjACoraQs2HyNX0K0izl4dUKnfATpu_GzH0lUfHfK7WkqdkwejWJDfucim54tDxwZc_ePrZTRDAsZt2xtfAbO8tE6TG7-Exj4s8qsQL4bOy8CXUsWs_PrSVKFanlWU7QwJf2Aff3bEmkRWFfloAQUw92irc4mbU4DG7KULEO4ejq7uPp12_Lo0njKTFfaT_p9_ypq87LxQ7MXIFtkhsOXxsymARLPyah1Nd_E2ePv5ciUzdMYqwlvdOkRZkutQtnJHkwifBvWLsk0KMrgZdLZOHWy0KJMVVfLXv1FA	{"<a href=\\"https://maps.google.com/maps/contrib/102349955948035826894\\">Rincon Nutricional &amp; Deportivo</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
417	544	4000	3000	AeeoHcIY5MoDvoS_zgDGHVcr2bAfOG7ahhiUHpWBc10hS5dVDEB5SuDrckwAjaN7jF-5Az5GugqkD-wTD7LmQNmAXUrlOcgoALO426n58ZYZyl-C66oMnAV9NmapNQ99Vv8M3taC0EZkNyjIjQQ8lmLOh7THh5GPANwEHZQEXocxN-WsMb7xrnNjrrx-NQoSp990Ygs5-V63A8tHS_918r9eDmNOKCSh8KpmGe53cH4axtJ0npheKQPM3GI067639SQWDBKGpWWQUlVZBWM2WF9TgtOx3Now2uMThKH4dt07W3DtnC096M66fxqOYk-_dDVYiILNL898EWhF4kOZNtM2z2J6PceJr5KoVj34T6xVgZxMys7j0FvlSMW1bv_7VDAwZO9H2Lg1TqeFGrW8G8q5Z1770c7jOWFfaUE2WWWbh3NXWpFT5JDCVUqKXC39eLPXiGZ0TVVymajeIsQGH2b4QSQUzl44bZME_XdW2ykrkw67i_-MdC3P0t8vbZY9_KnMwaxxIzMhpltDbbEo2FMwVSJbarWJxG4kT1eORIbisnujXzG10hsWCiNapYIWI1YdqTJgwIfEtVChA5esLaXReOv9DbAsuHg0dLrh9awDGwXmrUoJFCwnQkgFfuHXWtidRLubo2KC	{"<a href=\\"https://maps.google.com/maps/contrib/109473794805454450592\\">Rai Singh Uriarte</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
418	545	1920	1080	AeeoHcIBK2-1IIi1C2-AH3yrqvcaHFWfdS0cGpvrYaZc5opb1vCS5v0NSLIo7D-Vkf5yPQu_fFYc3tXj0wtYeYZKRkYzZDN1iXxzS5VB6EGjROT36Nxy8gk5Yb6YniiOdDiwm3lq2RWIu78A_IkepTEz9mhtJcGP5jxWw78JmNjR6IBqp2XeYfVzrLdXEv-tJa27WuvqWAZuZPF3j3SfZ37S8S7Hfy5XHQzmaU2YEO0s72U4QWtCAeUfoUofO4qtoqwogcCBdmE8Jy5ni73wGssvXBpl3oixDC91wzGxDz6KDbTb2LGaeIPo2xBKv1BU6i6h-_PWBsso_vWlMpnmurfLJwUztKNBxCBXNLbPSC58Tpe-YiPBmn2spufq3DTuSVx9GsaS1-CVm9J7QWhB0qmVNfaiHZlxWdvN7Omg-tMs3x-SJt6-zcH3NMZdUvVEhLipNYCqiXYpouXkL9SUaatFXVuLQ9xym6lyKxZomCgtAXqI4QR3XvE_oYfCYolPgCqAVGaLOWuqapTMQHNUs_8j_zMgOzABoHf7BLZW1-mqvg9e3aPMPz7tYo7opf9uuZlYr3-Qyz90sln1zlC8FHl-xx_HI1a6QygGENz46P_kHtVAblhzzv8wjZzRsWXNBZhXWiwqTA	{"<a href=\\"https://maps.google.com/maps/contrib/105360506038554749561\\">Rodrigo Muñoz</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
419	546	1080	1920	AeeoHcIkxO1eSGuuvEgTBe19YMMJlnvaO-RfwJcKATjv4vF2rgQYxFVLOKgf8Ov69ZeAN6BfEfwe3O85T3gqUIXX85boDFpXdxgCyu33oMOaKlSgRy3y6M_8Gw6lmVKNT8oL-z84Bt5Reh1uR5KS6azRV0qrY7nwdU0YmL2Xkl4ILe564ULkVtqqK1bh1HhSw0a3RmtUwwlwTiGssMqzHu_PvucerW8P1L2NBKNUl0IzYxO3om8noW-BI5Zcs7zmqczljMxIQHoa7dxYaRMxFC8LWZK8cqSW28XpwYrfXESJNVmGB7t7E-8dp3S1wp-BSaS75Q5Sjus-Im8qkMmMkQnXJsXuRMjDxBxpkOpQVdTbEY9j13Sh_uEOU4e9iLWGHDEPyJmz1Puj5KVRyqb_y5GyuQ40B25X3EfhwXODzKOR-jNVKy0RavwqImWTz-mdykv-YmW78u8yG6xNXi6xob9R2-HlcdQPkNq_XdwWlkZlc636W7enQu5k1M3YMJ0Ext40txOG6cs6aEZxDiYZCdPN1cFT7X4VMVgdJjpvmpD5i8-HJ_7YdoVX37w1t0uBvhFrsnZpLogJesBlUC_m5VF2fN_T3eejPA_6J7tvNeU8e8KGf2bENm4mzcpTkW_O0GeG3xvSeA	{"<a href=\\"https://maps.google.com/maps/contrib/118032323626800565614\\">Roberto Catalán</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
420	547	3024	4032	AeeoHcLPqXLE2CrdSu0h8RQddiaf1eTTr17sf8OwlBigP7fnxWMx5CP1kMzRWriB2VhyhcoGE_lNe2V4I5232zhx7bHhALBIG_636ypFNJYdz1dtIBEfkCi1x3udDi7V6QMMLJcB_mc5vBoff_UlvIyhis8OuNS6qDw_zH2oNVhlWNlj5DBKaGr4h9F5BIZG5mHyyaIq5NDErDSi-oGZ2RpI-KXaTVFjbGNe0lP4LX1mmig_cSqsiCZkTQskFWW-pu_LyEv1Gq2d-k9MHB3mLlHbsWUPUH_dfeLb8J7MIGtFPxO4F-myksmN4uKQZ-930qTFhHCtnXbQ4f8	{"<a href=\\"https://maps.google.com/maps/contrib/102751918924193759140\\">Tienda Mi Cielo</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
421	550	3120	4160	AeeoHcJXcvSNucqkX0wQHHD88R3xnpFwqLYwu7hMaSdqtxXJ0Kw5b477KzJ4Mptb35yB7K8sUz2pvyOXnLynHcI3dncVwwJZtvomIVyMB42KyKOegaATFSxJC8TKkiz75MPmAY1GTaP2KMqNDdpEWbjFq8PdosGuCKve3mfmkuX1I1ttTdPfjRqy8_RCzNCYoTxatl_tBrVq18PvRjnKtddN0mFBidhjlszdLJClwOjzwSscpCeXW1I55tMecpl843-6w6rOYzYnDtj-GwPFa1HrXlXtI6DjesbRn602fvOhdZmrE6g8BmmtMgsAcPWsyQMKV81qZvfgeyXB3d69oxjvbI_E6uOwdMHvXyj4Go1eSXj4Jub3KyzI1wPLdDxKH9-Uj9wqAjkFs54B-oiv2d6g0eJsRnVXqVKuHuOySDN_UVl8ZrFcwGRtEe6EDSvzmiaghRBJsDdedtSDD8wCjy1wKFrrHKAEzVoMBxnlZSm-5OKeBz7BEr2mbOi7Hgq1vRsigfJWNH79C8U_aH5joBUYnrnZuz00svbYbNRNG63VcEkTKhvivwNPWG3RsiduhGuEFu0fdSsmxB9dBE9gjJZ3HPPMS4fblEN1mqDe9kYDsbygmDKvxth-c-x6iQH_UuXuZpCxxg	{"<a href=\\"https://maps.google.com/maps/contrib/114200115432135034736\\">Jorge A. Montoya Poveda</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
422	551	2560	1440	AeeoHcLlTMoalYsIRCMUJFJLo9zH0EMYeWJkEC-Gb9oOoZx9erEAdtawSTPMQMT4UdZgiw1OmqahpiiiPlNNrsJoePQu1LZ9oJ_YmbB-QoonG2yd65zzl6ouOzVM3doPSHkiO9TwU7GDWUvzNQ4nUWpAPc2qHA90otz14rS86DhNqzRz04RZaxVGZXzcXlE2iPhpf2_EvK1hhiqPt0aehv3ua_M3hmV4_riG4ThfqRYbDhnOYivevxnqSDDyFLmkJzSOSvLYcSf8A9fGvN8wQlZ5txinnInWW1Ehgc6KOUEaz5uxL3qMqT9eNm-byURuoeh58_5Dx_vIPyErneu5DBUv7oD_tF1Qxm1aX3_tjckl2_pvLZYB0sAn9kU72Dyeg8yG5YuktmA3i3a36GDwBnsIcabBW52ylVWzHxjwqwOzGXrQ9uvbbmMPA8EE6KVyECI1Gtmbb_LSiYauNrAi2owZM8I8NCHPI5urfbWsI5jGPOc3uN_upV-ci9UgkhAQuckBNGx3tqg8omZcMbdIGhMxhn5hKXTFUfXJ8iBX_sNjcljJiqe782Ki_Ja3mS10Uc486ONGt2yFNM-drgC0Sq3XDlLCnZZidA7_2knw0GmoAEnz8lz7mLXiwUJ1Hb7Htu1MhXLyhWbv	{"<a href=\\"https://maps.google.com/maps/contrib/105727530362540085535\\">LUIS EDUARDO INOSTROZA ABARZUA</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
423	552	4160	3120	AeeoHcKolVEGHB7PxQBwDwCvVezYTieDA0ASW097hiIYGv_Kew8U8tQlIMTAXZRLfNq3XWs-aB-aP8JTx3zF1vR-Qf7tTeltcHCpd4-jeMD4HVGSaTVMtr_0TBBawsCcgD7-KrqtkCnMHIPyeQo5zf7WiXTas5SCq62oKo--bSCniq9b4zuQVPcxtxVnO_K0_RgPkHSth5SmKUAzFOh50Vu59QRjbO6I0veZn59hlY18xxnUrqq178VN83dlbwQp3Ed4v1qwKuEq2B922_Au-ItCfTFVv5JrvAg9zBDCraT_a5ko5kQ4VA4mryaQhOzLpPPIRgqLWma8CQto10KYM6Es7zB43T0qsVXHcS8LunrxOXoFGft05HfjsIfrt6L6BiyIqOMEBZdDD9GOQ0LV3EOoi2wFR4tYlctL-M_o57TKWq8o8PE3QtEchl-iXSjfvtzXgeIZvoHi64gMy39SW9F8-qj3LB3wLb9_RP7K1TMIdWAIG5ma3phxeSSKv2zbjy4e3Aepwjgl3sWFZzRk1c3JTzE9lCO_QA-CzLpCKV4YgO6_IzR0yMF-WzYEZBpWafhHvwcGd5lgKRTedMF1zIsyVdFc_1p_XKdnG3Gl8hkMscbBJ4tlJY2ysmDwX3mJQhBxX63r6g	{"<a href=\\"https://maps.google.com/maps/contrib/112020610052773028767\\">Marcela Soledad Hueuemán Gonzalez</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
424	554	1536	2048	AeeoHcJWRNORbdUcZqSHbMDFl67ruiAeYoclwMt1lSnEvnP7Ulm8XUSjsshc507ZDqGzcSm6eQENs3JrxM6PgEW7f4osCpvpBRrjEE5Mu0zy_9-kaO0dblJfpHDksgYd0hzLi4NjWzrbSBxjYSb079PjThtU5NVEmPHZGJM4GKhFN2-awpXz0BntOrm6YdFeAPbm3znGfGxX45AwaUG1Tb1c2U39DGsMtBR0lGSllmhiPGRaf2XsrTRxGO7uLMLXJ0ISTRTwM9834FN6PzMfmNCvr7SMdee2LzwPh8357WYY3ju3v_zO5Td7MOBCIo90TB2g-ohheHCxXo8	{"<a href=\\"https://maps.google.com/maps/contrib/102865334143585280593\\">UMBRAL Ropa Usada (Reciclada) Europea y Americana</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
425	555	2992	2992	AeeoHcKsXr8YsYmjYu4r1ChF84GZs4CzQL9rlULsHN0iXya919QMWhKxSJ98bO0zShchOHRsf6kAVbB60kCpNGbhMDB5B5lULKSpcqrHCBEoXSfCdKem4qX7mgL2l1dcB8mB2c2Bdlz28NGSvn6jzYwh3pfl6OO3iAQhmwHUyPqQrAzwOBIAfavGDyLbMRAwIeVghyqChlUihlKnF64erVLsRt7cpeucO0wIgVvOPlp6pDk73ZeYxtONlOh9uiAOz9OjE40OZBccpLyhdW5X01fIgX4OAdmCYXaIG3bWogcXbYAqRVferKUpxwkXKljwZcFc3ZINFPEGGfjN5QDGoRjSJjgT0hpK1Dic3C1esFs7FeEwjBs3e12zf638bXSm-6gcZmRMY7wY-BRDDRXgJUVF1_v_wCzqyS8ZCqWMiKBSgLbrzXZZcpCSs9Io6scnSulGnni9etWH_E_aLxBxySUQVFj0wSJkQyTCdgzW-Zucaa23jJQdDap55ebtGwPdzdnhh4ZC1as07P8Wub-7Ge6Qf8eLk3LmmvGOcQxubtYDHTvjzFwxZIh5PbpFJPy8OMkPYNSwi52BSQQsT52pQ8hor6LBGAOX_1rLttmfRM6amioO7xdziVtuQEZauXa_kSBZeVNpRQ	{"<a href=\\"https://maps.google.com/maps/contrib/106595114467069579678\\">Aldo Rivera</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
426	557	1800	4000	AeeoHcJnsDt9v00c6nvywVoorWFhnUOaSdLVHvtPXRqbRdW1r4bwBBaaXghXAtj0LJoMTMJLfxs-37ALkUBVuj19Tro8kvSPldu_8izHEiWVs25f3kKSdVRA3hwuUd6j7UZN22Gdp1_llSjrsZWlC4ytDSmrQGAXC2dkuO3NRBSF36FUguW3tZB3eJustVWDA2LASPdGN7trcatH-lrIJJdwE90TCrMVh7lP6a680o3eMAujnuuXdj_dBmfhkV7Ljq2jPpW_RPSrCGZdia3AVF-d_zxic_0IL9eYmAYLkZByhctdzP2-06mjvSAixciyfYQv_J4BBg-WYlbXo2qVF3sLUCP6oQKpjqGimHr-8HsJNMtVe8BVba7D_cUnEGqGAHBsdxL7R1CuFGpGxXPWzWB8pv84le6t7TtU6rvDgIZ3K8cnIiB9oNTxLEOA2N206KoZqydwaYQeNWhrwv_EAc7tiVMSYTdB0jFWJOZCUyiUAwindMP4g2T17saD9bzpt2Z7Z40kTLzsFhj9Mkid7bc5galuRPRceDhUSyKtTPDV3wtUsHWm-6qtbZQeFJqG5cuFdDWkdiHmjOXkO1Sc0teKpnQI3xhXJYejSXQWGkB-aXeZw_ajER07ZMkIIiS8kQK6k_vAeAp0	{"<a href=\\"https://maps.google.com/maps/contrib/113279928589588026289\\">Martin</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
427	559	1920	1080	AeeoHcLWqUbmTAVut0tOwawL_zqwp2gqgxPqRLWCRYkT_lXd939mKhauonyPuYNl_m7x7C1c06mc2F0-F-8-2EhWQOZQZsASOJxIDJM5_G-oYgcZitaknda9s7eTLiL4vw7i8XOEM_kB9Wta1igcwuSGi0al90oWd5j4Z89pGtBpdmdLG_a7zSJGVxdxwRBmFu_VCzi9j6k50VHuUM8LWf8lR84dvq8EQIy5rjV5HBrEAOxpEZmCDuEkgWjpCkfBVMY65J8Ay4LTxFO5XVBcHALAcVhwzLXnfJBierdg4PAvC6zNVcuN2BHB9h99rCpghVKzW3To5SH26rJ4TvJYqeQa7iCVafhUzyyUrWLf1Uq3dD2cohyy7G1drxiZywFVQxx6ejnEAXZWxv94KLsGbfpDj-A2UtAUjPnKv7sbLWOiFFmXwLKVhY-2rZ8eJ2C0OCmNqJRaN1LQGyAVMfldH4OUgL8jtofuBlB-2PxP0tQUP-Nqeea9L2Vqvj58DtbcEH5V1DrC_DmEwQP3J4e-dI8MNMcQQE909Tovzhz3KfoCUGZ_rbsJIWOAd6RFNJLQOP7fmYgs-lW5WrZnxMS7VvRbFOPSaNEYxmNRzHbI0St9aGp32pO8SoN5q3lN5LItmMPbbuDm-8BF	{"<a href=\\"https://maps.google.com/maps/contrib/114968696034358766063\\">Moises Arroyo</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
428	560	1836	3264	AeeoHcIXO0HdzVYCkFbvZAypofSWPUyx3kfQJXnmjOs2R8PBYTedZ1Du-lqJUHGGcxHJjmMUYPjP_IKncwagmEaM2RUvMxuL3lrdPEXfvPrplx2iu4OvT4EXvGqTdOzbYjcHoiC9ssNo36nWfs1g0xhHcKfhxPvl5wwxWnL3cIbazPEYYoZukZwcnLUetZufAzDhUw2yxkLTNZuAcwkzdYgZqBE_eYJzq95VyMeG0eox699iOmw8VkrBH-VRP3rh2kewY9YSnwL_-whNBRJr-jnCWEDMzRxdETsUKcQfVl73NfCeWfvmmjUK9FnKsAgcIVMCxyDOzynIRzXHikp7_q4gI3OIQnTCB7Agi5K1AZS4V5duWEWf_dgv02VB6v4uDRzVqMGsUf679sDNYGGSyvKQuQiJilIXN0LFtCeVKcpPg8PFAyLV2Gq3wzkS5QB5RrZRoiV_tMPZSnAVC7CX-nBf6ZbMKoRD1OCTMbQ_HAi2GDvz8Lwbg1rFgcpOX3zGZscbCZ9AkmmuZBQInwlc99sUBChpYbvxVowokm65fSyfLp-JA0fkUUc-PK-v_x_nym4HSRu3xOn3OXhjpiTPIjqA-jInRcMOGJ5v329AAeNNVEio_bE5UmeVIpvscyiZsyWFINL8KQ	{"<a href=\\"https://maps.google.com/maps/contrib/107048418215709942697\\">Felipe Figueroa</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
429	561	4000	3000	AeeoHcKWkyL2PrVAEVFxFn9c-cBk5RJtmBRVbolTqnDcU8rR9cdBeUVxYLDKuZasft5DIvTjLXlU6RNJv4NHM4Yu6HdwSQOAdrJq1Syuf6WJKc_dPj3DPVa8tGORPOvAg8kDDLrYApBze3QJyjWzKW2x19dw16WWCVm2WUkJvEeIbIXrdPrlo9dsy13PbQTS8ui_-Yw9FuCYYJwJrjb9D78i-bwwdjS8lvoTU-sVsVhnlStf5mkzAu_IFE8bPhNvXzvN6Ex0ZZhPj4iZw1PlqIY1OGweipncnEEnoO9C2G2hfMfV3wenBdhaABr0nuGlzsDslcruZR4Hzl27Jf0YULSTNJG9z3OkU0fjctnM7XMczPBHawld9MQ0C4iigxGz90018Ix3DCYm3UKhyE06Xk57VIfyO35ioGmibjfYnCRMrJ2_X0ygMcfpwFRRDNTCCFXYKCisBv9pWNSGJVf4_iF3Lzia_P5vhddbO1s4gVXJ5tfmZHslW8Rk3_gkNxsOjz1lwAQzAUGBvG1941ef6HieWmuVmIEdohU0aHl-6JzSYhV3VY8gINBq21g6zaO5s0IrP5AcI0CCjc3OdpD9sg_1xMTofPll9wIz5Zf8rIm69ACIFbfLOzQDeKnE2aXc892rOcQ9sHcC	{"<a href=\\"https://maps.google.com/maps/contrib/118053358291609883470\\">Florencia Giavelli Muñoz</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
430	562	1200	1600	AeeoHcJ47VDziyK6XuudFzCNELzt2RcD47I4xa_aLNFIXD0hGH9TlEo0QDDPSbjvUSllpJs7ZPlkTsd4kBwV6mwfy70kXIccNICWNK3WQUQpEche5jOnoJaLYNg4WpMiTlS7eouf0JiIX0cjKlPNzYwfNPMQg-ym9ZliRU82n3ONNkdxtsUL7nCE6LgwExYjiB5RrallP76ItDxuVOGs9MsJuYPewkuXQxqKzjudAf7eWEaRlDpYwiHw7u9tiJFw6OhuV4vrfoeBFjFwnbld7AnmQ-RShPtDvoOL08fwpeQ2OMpnCvaiRbqTliZC4iNg1O37hegKjH0-Npg	{"<a href=\\"https://maps.google.com/maps/contrib/105808114800304329578\\">Paoka</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
431	563	4032	3024	AeeoHcI7yHYFnec9_gmg4zA5-WbCJsnJe-KSrN5dk3r0kGhv3zjfCZmAKuNqYavafStlOZPpJ8pk4CNQaa1VNnYqIO2KCCj9FhcSJaBLPDAe4Bo9pHPlDwZup5Rus9nGPy7M2sKwhTj41p79qWUa0XJQcBuhS0HfhmsoFMtSlYwEbAwHNmEMVBdvc3ii76Edsp_8g6zQFgwChvSnIjmoOG28f44pBLngEGpI9f_-ONdOZw8VMMdotupXO-dodjfMkJ8bpG6qGyHncfFye1gqH0Ihkvf7lKRHRqy_l5o9Ddwd8ZQNYWiJAbBgCdn8_f31Xjd8aYD7s0ZBYrCT8Dr3-4cBA_JXjVUP9U8lCRKFdYKElRe4_lsO8guW4DgLSeY21OCqgcTFcfZvAa2Sbms-cvPEdJokRc8SH5TZalZ_Bm162OQyzI33FpgeJt22A_MAy0NI213boY5ky79_25Wn20I9sb28qPzLBJaGkamTFo7SVoU4B_bYc-1539RmRaOLhGsENnlFTtDN3nW2frn91u36fLzwfU1SGtZKEoYbzRVBGeWKHinWg1tQ8x6GGHL4K0EubqKxY2ebAk9ABidPyaUuQdb-ZqRLesWR11A9-gfHEv7tU2UJVAZZVKop4XkWZcV_4B9EVEIQ	{"<a href=\\"https://maps.google.com/maps/contrib/115657730929942560731\\">Ulises Cárcamo Fahnert</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
432	564	3072	4080	AeeoHcIpRqEsF0v-m4k-FCYs7G61BJPCJz7drC7c1cRgziRc7Q8lzBfRmN0XiE9s2HO1El1Jh-dTOsD1o0lzVfU2bn1iaE1isfWFZ1h0wOE748jexJBT7JX5Md3TqV7j7c24_3j6jp48ssTWjwwJY7J_oU0T32DER48dekFDelv762T0ZsxKDP4X16vtlF_TeYiKYzY2Nh6aC20CA4JGJh5qX8mubCfIT1kHi3RlqImPe_B-jYjvm3U5IMtQ9GFGhsUmueYAMXivkI54itIx9qyP8PO7VbdcDChTOXLmbQeE-FFEqRXxdKMdiL6S4IIGvXBxckGXFTmhGQU	{"<a href=\\"https://maps.google.com/maps/contrib/107306990255658427924\\">Kiosko de colecciones, diarios y revistas</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
433	568	3977	3108	AeeoHcIASnx9F_SfzgOg6VW27XXfOcyZYOwZ8sSRFQ2EdLDYzCM5NKQHzCYpNR6eT8E4dj2sbIQ-FWjsy1zniKV4bolLIG0HNLhPSFJd3u1yJiVHYOnGH7qwdC2m4Dm8PigFB5cvET3vfyNPEzFUjIVu4C-nmHxa6PshPwlONTzYE_yOY4ejxa7wxqUscUPMYX6z6VplzGYoBvmKBYlKvqstNBe-UxPb5v-X6cJaGtWbmHqkbO5uKXsLgykDqiMrmIYodyXUciEBxKn_mjrJ0bYE-VxCpsgFYWrHod9uDIzLYk6-K2sLGPnsdZlVVdpUWqyWjcn0VQucF7U	{"<a href=\\"https://maps.google.com/maps/contrib/103998142757962877949\\">Copiaysen</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
434	569	640	1280	AeeoHcJogQvMq5phmvsUF26vrwWJ7Y67dSq3GS2VRpdUWSCRVW1UcLgLwy1TKRmLBIkhxPu0pF7-_WQQkQ6SEAl4elBFhofEFeOQskGnalR1g8fP2JoPy0vkO2C4Uil2kR4b_1_9X_Gm-YpqEgLJrUuCHGDkqG6CzGei00QXvjnPVG9snrted2wcLh6k6uOM5SW0QXWP-Tt30CNhgknkzM6_MqToanwsuz-lKCncUupN_dO9yCXVoH_YpY7ULqXZrkRHZpMRhTrTB6Qoprx2i8pLBzFw6eXhGvEP970KxKmV1ejM61qMB_XrBrz6gR-8hM57S3bY-yPUnazVuTHIYPVv4Twtg4_HA_uhjabW0OQ9YMUzORZAwWHivJiFfqhfZpIcUBi7ncYZpfDC7waObDcoeXgVrjPSNmpbtleLC8PknMUCgoNE9HKHw--I7fWWY5sNAW9gCnJCY5yztthw4SFHdC36-SAtOcD2lRPrCQ1Xx3VbJHn1i2b0LqZjITVfxISm9r4Qk1znJ0wbRgaRts6E5_OIz-Wa_MY_OLZ6gCVYJndGyUt_gvja7-EKj2sC5EzEtrKvhfErEypkWtmWEUmjhedFT6ZX_i4xPE88jeVmVzh4pxdqkmvOpHL0UTL-jfXUbZJJmkkt	{"<a href=\\"https://maps.google.com/maps/contrib/113266713262936122179\\">César Sanhueza</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
435	570	1080	1920	AeeoHcKjKZR0JnU194D4XkioyfGnIBVItlAHFehJlofuAtiXTFQtKHslth1lq-HKwskxXI7iVl1Cs65EaG8vb7irmkioFo8O0j0Vqzw2e-D-Y70L20A4Si1_-mvEy6aCBx5adfbwqDcSQlJLBd-yjYvYezJhS_NvpiZhZcf2Q8_K5sE71kxyitrWUo6DNXE4037Wrj38Kbg3dGa-zoRPdaY1jLtHPgGHUpCYi97fjWc9RaU6q66sFD-mfvNBAHwRZ61nnPS3QqoOoP6OOIvgiwM-SVUj88zy56bgY33bM7Hq2-5LSt6bCqxb5TYm9dsV1Rlw7peZNXa7GEU	{"<a href=\\"https://maps.google.com/maps/contrib/104353136486928372685\\">Casa Niños Juguetería Didáctica</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
436	571	400	960	AeeoHcJbOhhV7KxyvHC-SjWIM-gnizUYMKaUR22LU8LyOixPOnoMWZWJYyg2Yf9b59N76lH1MlvQz2692ri_5HOsHk-Nr9mJ7j-OqjWu834qNd2at2cuE7COd9-tQn0CfSYipQG4R7AW6EHRxxJN-TzMbocIkkjoGBORyabY0pF6MqDT3l3UrphCmwgn8mXGc6wQN1WIXbYykyzKqGhAHbuK10djGSmbrwa50YMeT-F8ReOt3nHygVtvZqzZXxb57PGJJk3IchL2Meejrl57JjDr59CyyAXzwgsU1i55pbObO7LScDU99KSz_NJT-1G62jTuteVoWEOw	{"<a href=\\"https://maps.google.com/maps/contrib/113727622834990750458\\">Librería Chiloé</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
437	572	4032	2268	AeeoHcK1Mpd4i0nR7Cn0R2DE72kEfbOdpdt9LvF1n-MDBgCArfOzIrAFay7kefQPkHkVHVO3wfq8LHnNnAZCXczX532A5YKAudeewKuWp5gntFLXHCnCrvJBdnKDCbPuH862Nc9mCewOQachlYH57JyGJnbCRbZ6l0hQpa6Jo3mrH7Y_nQMimRCr7xffNtHE0lvr0R2U85Q3vkC0nUXLBWcvhyvUTcUohpPrUlbqJMBjZx8OJdTeROZv53yi5ioR4xwcy8lP9nAdTn_37J_Cx2bZ02Le0taHy5VKRgsDQckb_gnqKxpS4LzT6ZNL7T1sGdP-ESfU1YZqedc	{"<a href=\\"https://maps.google.com/maps/contrib/104054435001441601741\\">Pormi Regalo Decoracion</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
438	573	1080	1920	AeeoHcJrILTTFwMFfQ43fq32uTZCWICFBu2-2ssa5YJFUv9i8lkHvUIg6tNLkETOCID-K3tzwp7YW3dPyM-Q5QCeACORsh1WQdjLtxAqCzpwnrL6oEaDiOHQtlDlrVSaBAEJG7BrPYpRtPO1EIe-fGPxX-uSupJGR2p5TS3kUAs0ouXhJEeA4tAlRVsaFwxGmcuOHA4UNnbRkDgbj9hjn_lPgYkoDLmD9UwPj6cVJWKXaL38ez6AyuiCyeeVFSjSOKXZ6z5o9cG2C4BqyS2WdgOfwk2fnhsOICWhNawJoo5Ir1g_6t751h8KfCutYmw-BfBLd_Zj2ydj5no9GPhS-HmThABBfc5Ju2Rcr9mTMabNKzIc5dGM0tMSJcdHl0S7HkYkTkbwqnpDY4QUM_nqW9mkDUho9vbwm2sbQNjAxQqKmKHXxLld-DyS06W8gY8IZodGra0RCYMoLbnL7VuI0iXD3ugwOumPburVX4JZRdfLLDj-tOLTOBXyx3y1En-2rKvEAJQWK82JOVfHocZBG1GDkY32qCm8SCcrcqsxwFDoYaCaMsoRV1NDVO6nsh5tMf3Or2viijWttiPkXTjyV4Cpko0xxTtfqwwYV7r_leObHhI_UXi4SlDfChVCbdXm2nv-Zl4rqw	{"<a href=\\"https://maps.google.com/maps/contrib/112935328468339154697\\">Claudio Zencovich</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
439	574	720	720	AeeoHcLF5vbss_BvoF5tCnnoUVnZujcwHCIoQ8dAusAn9vHXQByPVkpcoiwNaBNJKWxqeKdGplf1gQFjLO7D-b4ANbKh4OEoYLaRaHdCB8GkB3sEff5VZGoThsJFUKqUlZddv8OSgyM7u8-K1s2V-yUXxXmdh2Q_H-reXBvP8L7dqlmOByD2xwD3IYf7u6IXTYkFk-R3u-fMzQBhU4itoV740YRi4NDMMblc-3LU-P88fkU0ZH872NtOINDTcZTjjWv54bq-8-4DZf0-jkl3q8wfhVssYyMxs7xJK3mWEhG9g4TyXxj90UKWzeRkaWxita_wkoecbVcC	{"<a href=\\"https://maps.google.com/maps/contrib/111040828208467685159\\">Mangatoria</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
440	575	731	720	AeeoHcIbG0miqZV8WwK62ZXsI7F85PlGYlxhtH--5JgKeDYLptaoXITdP-OD70J7BYSyoWhna6yPmI5dZW08LRc7qDgfJLTgeye-ZoFrhxWxfTO8iJTl-k_p6r9sYmG3lJkDQWHVD0boiOOz9UcrGcH5wF09075WOipPLrjJq7i6Qiu9cJg7OaKc5oPNM8aTHzR2F03wsmX4EgINTBwEBQj9PBd_RuiRHh_aibmc3i5allus7yOGFrWe9yX1Cc_Dw7k8SIA1TnP0qC4AfNMBu9783lEqCKO6LuK0fYBBy2gQuyb341fRRRc3ioMdfg_wSlR4gf1306Ksj9M	{"<a href=\\"https://maps.google.com/maps/contrib/111430894375213497847\\">Libros Teresa</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
514	695	636	637	AeeoHcIJf6UFEC0lZVnZ6Vk_8NiLI-IPVVuz9kXY122Ti45vtRKAznorpkxh2XsWSOv5HdX-ZrAel0wjAPvfO--n3rul4SZXqDm7yO9VcJHHB_qvY-0FkiZLB6VntLpaZSMZUE70z1MrScMR6YzmBEALiEMwTIWXECRJrdim_wpsTtZEgjhfBZcsh-_hpLrlPPjZtHlOoTd6roGn8891fzn2s8brnpb7Uk34aVgLARR7uyTPpHYn2DCyTWa8gcqeFRGizIhGsQkB8o2OvU6ffGODq14glJ-Op5dXrI7y3A6QRnn_RVxJMPU8jhEtsCvABKr86IOwGSlFs7A	{"<a href=\\"https://maps.google.com/maps/contrib/105061542383826868491\\">Dr. Pedro Pablo Torres Godoy</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
441	577	2084	4624	AeeoHcKZ57Dh-XqTbzIFachDhWs0LNYdiCFCvFMNhaB_xF_lhrxgpl8hgr3_XN2h6ruCoj-DTTCZpr1qO8OjnIjzvX7xVxha1ykBfncDS6sLJQ5MJU-s_ZMMmj2wUfavl5av4qkBz0N1zqUs4892zTHoc_IN_RfAwrOaDw4CO0dOaWCfP1lOzxHt8zSS0izkOcATuhSOC2gDhGdzj5XpeZhSwZf7EIApWE1nwYumPM4ALxho4ecGXqyd4h6NT4rxh1FYz_9Rlesvrjl66vxGRce7RSvan6ZjJub0WHdYrHGnUnI8Ld2kRJg8VdjURlliGWXtyNkE3M3WMctiL3gyhbh6nlnLSeH9vdwt5q0va_GbbRqYDKG5AEx9m7EdpA09xdXhrQ3Xx1pHo9wCca5KnK9U17zEcpDbmPZMEPHife1TcXJzI77hEFvvr9wMfZz7MsZL_2WH-JAbOXnxB7YnTJsAYXgnCfUTmJVgQ83OPob5TbYZOXQhLBa9cnh-QNxg22M2wsp9qoDUuzDgkNjP0gdUvoduoYC0OtfKGfQPDvLU_esoljkgKz8Mr_snZkNoT98aaAjlohZR1zNVEcrxwZZ5wEhXGdwbmzFakQ3soMuDgHjvYZ3ZbQkbEUVBc7PJQB-j	{"<a href=\\"https://maps.google.com/maps/contrib/113279928589588026289\\">Martin</a>"}	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
442	579	4160	3120	AeeoHcJ5b52l6_EGaqF-cNhvZt24bCc7m_OtyFKYfOspZTPmy1uf_bQuJ6HiyQgJfDQdM35aX87lthfePPI6lYJpfKsrH27p7j7kLhYmZJS--lYA6YV8qnS5mR550iJP9vhP_6fL37Sw5lgPyEOQnBbtfliZPECI62DUZ0JRwEmWeaSnzsQdGtIL3BjT88hYZyGNWh0cv5DDyZpR-Mxq3TNVRjwmiyniuIy5O9L0ZOi5HtH2wHxP3PqjSdF72DwZf94LbEzUoHaaB3rZt4QSJmVJULAvjhuxBPHYe5m6jA0ne9TK1bDjNb6c8ThD3GD3mD-c0KB3zhMFK2Qjqe-elVAel3akwE09SaiBe5mU4DZRtId7FBkl60WCeSKKjjy_DAFv6aLYUJLggJw00zIB4j2CfY2qgskdPHHAVVQhkv3j5qxyb-z-w0V724wrqJouzW_p_qRw9J0FrtNVXhRDE5uijc7y85RQ4SYjzkFSLXNVAgBe1YWLzvEriogsJqb7mDOp4cxLin6UxvXEccL79lrEwnStpAEFAu51PWYAykOdJHo6O8Wsip41mz4hs13SuM6gkyZdjfPGCsp7iUQsruRgSKb2RR7vwNemySTjdCE6VNdcA3u7no-ExOULynl-Povw6PMfPNpD	{"<a href=\\"https://maps.google.com/maps/contrib/117854248766014106413\\">Elizabeth Sandoval Salazar</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
443	580	3456	4608	AeeoHcIplUUsoiK-UfYgBlTItlwoN_xaH8D-qt7mlE02ApOU8Tz31jU9mhorME238-EMMTqPeH93lz73CQFeNdt2MLG-yBkeM_WOnKbWyiHL11yKkjhN5jZkoZjRXVHwLNSDCbBo4Ln2_CCBwCwCC2utMCG2Z4jj-odZPU07WfGKV9Pb3GZ59TonmWObvnm7FvB8gG9J0x7LB3qjZd9rnxDrrIbHjBjW91Di78ETzDFX-YGdsL27sG-JNsTWLx7OcDjqiJoSpLP3PQ2ZsOaZJG7Mt8j1S05uQq34Nhbbv4ycpDUoEI0rIJEsOf2xtUdKFmDXkB0nL4jKy1Afu022U1qJcken6mWp3mRbNoNGWeW_zKhSZBB6qhjZyBu1PbJFZB0REfMwPeHluTdASqHhQIik18eEr-POaZYJ6BOk_VEGpGWCs4YDHltFImtPNBbMM7MouZdpOYACyDAm7SXYjLHJ8h5fyoIWShigdbqKOx9lUT1igWlwAMRNJHRw2ljG8ZkOM3U2ZJTt-R17feH5UmjUijwmThfcmOH6E0jCKMLetIYyBDrEFpxv9h5thnCJFCP7n7jXUnTAtFtTDrMKzI1cTfLkORPrKrL55ovuV8VDLxk_0aQ7apP95CKu61qYJL2F7DrVIg	{"<a href=\\"https://maps.google.com/maps/contrib/107240174948898150312\\">Alejandro Espinosa</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
444	581	2250	4000	AeeoHcL26OPCeiSfjAnVFoLrFVuVarE4OoKsVofEETa5H0cLtSJKad_H9arLXmp9zAl2hVnSRBAkreWz7FE06GVHXuDhU_uOYHgIvNe_Kyb5gW0kilnGXII8CiOqK5B5tjyrohU-knKryQbDXCBFpBtvXAoUyZ3kNYV0w_4oWUb2v1AHDP49vhG6YrdIwsoGczj8NrQdlTw8hyZBXW0ENe1JV4xEdkcWrw6NEvM2lwt8x7tz-rZ9FXxpcZ9eSfGAYP0DZ0jvk01ph5OmFgXcaFAw5OSsS8daILsgck-9FK7KGAlqDaGs4mmBaVYcnGlBrzJaqewHtcp8ozPXSYwOuqnG910JCG1CPkqy1m_DoBLefINA_2c7WnY0uSMc7mUX5A0DrfgH2SaS11U-cBQyeejYol-jHJWU6swoAdH2AV2bi2cbnTGGrPmtKmnMKpehptNZO65RlWA3c7BVHzMNSP7eA7vj1jhtKhYFI7wScEKgjYZY-VUqd3kb3tZgnxsOE_Il-EBrzRdX4c1YZY2yOi5MCv3CiJxsPA7BNGV0xy-KH9bHVyDIlrWrLta1d3_DNNvp4ejycDBg-bBkX8mylNiS1jNEWZ245ncuw3mSr-_peMBm3zUSv4d8vdzXYgXg4s64Nrp5Ng	{"<a href=\\"https://maps.google.com/maps/contrib/105966108192158056593\\">Nelson Rivera</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
445	582	829	720	AeeoHcKptSWDZVAkUjkIuX4kNp-6v0j8zovIKdytlZ-MLuLmcJoifIo8serI7HvCc9DyQVdi54yNMy28VWbyI9ydQzfHaJTUpomBcxA53Ui5jntTmyfJqQ1zM1Oj4GerXB74LNxKTTfRyFf4NFkQlZ9RvGqWMhQYLG-nCshxMcGN8LBLVKRwqT_PRYTNH8tFgQrpxLaOR4xs9chYnTsgNPQyJ9_nYizFKEbW1DZph_nhAV9r3JttbM18jlQoCS8oILJU5VyNq8KAU5sInGe2u6o-ujHE0dQoYYkSfFhWgwP9uicIDNu9cPjKB8sDslcAbspz4-VMAqqbYBzHwarB5E_oYJMz5BdKJkD-L0whoRZw326vxeaxf0ID5MFr7KjPMISKnrp63zdUhsiMI1JLDtg5sajNhT5A455sSH2ABaw102iSal5-dShL47qzp8U-GyX-uF3xGaAIjqHgUV0muMGwFRzm42aeTWunNu4n4U8R-_RkmmkaWpf_PTmsoJyfIa87fpGQ9HXoySL3cGgqVTncWAmDfu9X8jkA1-jpvABoFxhtyxn2LmHkJ2jBJRybQrpKyDKJlMVyIgB9eoxdBJRswUMrPPo6YaIdcbHShlS9il23zBOlLF5Wf-tMPHfdQ-RP	{"<a href=\\"https://maps.google.com/maps/contrib/108325654219339617732\\">Claudio Aranda</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
446	587	3243	4324	AeeoHcKxQXWQaoFcvW-CeKPLkiS1zH7VZFzEZsivvXdTeqh0Md3ZryOX4Du9UVUopc3PSoGS4R65osy0TkI48H83iczi-PNW-b2JrnqIKPYryuq3aN291j9MiPchQjnvajEIh2tlPtpWWwr6O2UwcdFTiFCGjTS7Zl3qdC_tT8AqIa6CWxfrJU1MjSpgrofwrNiH-zWORo3D8NWMCgiUuI2I_alQHNX_hcI4D8e8l6_laAkr5r6P27zUfQfcx3yqFo7JCjlJ3jsptjvUhCFh1-fPWDqquoWo6i7pz-6JdywTzBKlOCT-eCmtLi_p7ql3WxFCBMF-GeE9pExsybaRBhAE1pMeOfuvn3kPk-4TYvckXjWrbvHrnG2yl1TfRoBZ27g5ouusn6pTEhmDfoprOJ2cxb5o3s1h5l3qOBQs3nUaLqLr_rMIf9WTlHhq8GQb20maZzvxsvbxsNciEbpzjuEF6e0sIXhvtZvgyATO94hhhtrKer-SkWSBb7xTD0L0c-e7w1z34Gf0JVbtokiq1UpChBiB5QCiCgxHHthR1NcdiAeknKWYkHj58f3WO1xNIRLVso-A1lgy6LLmQXvnp9L-92NLbVsxT5KwPlPxEXKFS5yTJEYq5k2u7_TBt83Hphzl7rnAG5cF	{"<a href=\\"https://maps.google.com/maps/contrib/110393657775386794260\\">Sonia Zuñiga Fuentes</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
447	588	4000	3000	AeeoHcL3cHJImzdrqdGpzLoCPsgL7KWulV8BQEe33ZRNWyq5bD5VjP2aW3xw1ttzaUk_2PMBizECqsMMmzDXNE__f28vhiEKruxNy0iDOjh7_KLh2SPgy4EjxvjDkGwredxoyGjjGorZ14mF45qXJgKGvv9RBVwoYBbLjkow2FnD59oG1yVnvuSF8gKwm3r3DNdGzAJQ3myKfFie2kRFvqBJRkNSsXfoa7BWJozAlSBupa5rOoarUw75dVv6wKnK1QGHRwkPZG8Y_Zy7ldbMC6degsqiFEG4vbqKF7lNSnavZPMTQdjsy4snmnj7zxCitfJqo3pU_IRXuvCL2wxvEhz3QZ9LinirFG1zIEXBmiuCqT4XRD3HO44ofBjJ8BeLaQt9VSWqJrNRXCyDaX6vhGck63DjgYAHQk3_ljJPt2pT_FQ9OoDrW50Z24K4Rx3guNmZYVSEcrr5UcNu6HuOlEmhLPmRgHo6-WKk_jsIYjocbz3KbF1Quz16pIaiI13zSv45ROiL2WtA_Q5J7Hck0kcuZT9fuj1geT6sLxZVyyZ0cTj0TUd5xKU1M9IJf50NByIyZYopF6ZkNohYcdTRMwGiJEUn1oI1EDhPOPiihEZKQkmZvcpDJNz1wQz_8zL5BVKZvbyjbw	{"<a href=\\"https://maps.google.com/maps/contrib/100087894157535314287\\">Waleska BS</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
448	589	3456	4608	AeeoHcKtKfUTByxPh4AisVG0tpy2gi7L9ygJqBGZjmHD_ZwS2wmVW3y3Xwb1HaDVhEdDBTFO8K2_i8N7xGz_nZtUQE2okg-QOC4KZfSR95YzQzR9Fciai81RQxikdWJ7AcLvB3hiJrbCwZCEvNSqRHT4o9o2Y2M21DbH6g4DjzhCcjMtvX1QWyjSN2FB5ST9YX0CB3GhJsK9DNbVmDH8NUgBt3t0wYtm7Li0v13aoUJM5qieP1qkkKirZBRIUhecM1CmqdRVXoA26Zj7uceW9DrURjxliuLdvAx9FTnkjxmqLBk8vWgu4sS8idp_I7cD5VeHJXf7gvzmOC6e90O_e4VHOj9LEIA-juxV7UL7NA--z1sqOZAuSpzTQhgF_O64oN9-InIYKhdSvgcVPc54RLuxpJAaIYKgyD1ixsnkotkTuE89SvtuHZZJ_DvcbnOeE7vgsbrrneuuTzT2zL6aLrLLO3U8cUhMMTpHlLDraXTVed-rvJsBZ0mWHBS1X5Bmh0B3ZMTKLXWGTKS6FhKh5CA5TKEP5YNoK2cSqZctdKg65Y9mze66hvMM9A3uLMzJ0SWYQcuq_RPHAMAfR9gfGroJDgsM9vr8OCT_NpD2pCATtv6n-43eGBpCcEK8xSslDYFy	{"<a href=\\"https://maps.google.com/maps/contrib/100795927032409492889\\">Jairo Guerra Inostroza</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
449	592	1556	1080	AeeoHcJZ4di6c6t3smOkxiMqSndHyqtzo4-Ybl7Lu9d2Vqie_m27017m90R1I6DmiGxEpKOcQOh1bURT8uxxYbA0FAKT2KYnf3mnzbVc2Oewn2JJI51z0tMw89jB9Y_Q2km7wCnsURl1fz_ppDYhmik_edi40dDK4VvPHL1pTIwEjcOkWRW84BAV3xGEXGt4X0wlhkhK_twjjPe8nj2u3NM6LjsuvQmIMN67IXu50fIw-f9EwTAP3x26NToHPnpmlO1ydbZ2ZkUVMAziBJkQmYDlKwxuQHZbKWeAq-qr04OxmuJ4GVeOMS7DZVjgowNdN05oXHub9lzwtpg	{"<a href=\\"https://maps.google.com/maps/contrib/111112967969700424736\\">Espacio Casa Hantke</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
450	593	3648	2736	AeeoHcLj5MdPve3H07yyeeYr3scWZYTemxpVxGsEN0ODx2G3SDM_vrQ4XoEjXyCsfD-_2AQ-9qCIiIr-UzQyDt5lJpaQrDMPBgFoZN6xYV6d4WX2VAplOiquEstbzTnRWJzgg3wN3ZlU35sXqKHs-RvwK1Cn8Vku2jPg8glkrl_WDkrk1a6A2Kze1wtDk_IH85BlB19jzc50_fokHT_n5qtfZe0JLqJcjzJAuj3kCoYIPgu5PZugWLrYUo_Gs71JXVjzlg70xaaRWhKb6T1chKuV-kQOOAjnTdE-35JKTPJbYBDQ-_68X0fwWsc94PGVUcwMGVobC36X_AgUq2FBgn9en7ZNx5LtncpDseSWTKoabPu-weK9F728naXBwuQQVRMSzDyLSX3uYCd-cSQ32tOfgMPNruZ1SPtwQldeoC4H_rXlngRDy8DgbWwtkrGMW8W3sZ_Y6wwvn6jXJROKp9Ux0ehl1gEdI_MLThealZDsrh5TKlU-IL_0QBmDru2tn7DukI_Zg_ygSNhsejaZALoImufwPRyD7lB2RVv5UVE8JF8cD-tQq59Cxvfs_96eWRgVuQ7PmmObaU4mqOtlFeQOL-IxFAMH97bEQOtbL8Nvt3AjSpms1BFfJELer91c8N1jMHS93w	{"<a href=\\"https://maps.google.com/maps/contrib/109780378808306967398\\">Bastián Rojas</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
451	594	5248	9424	AeeoHcLQXPIYKSTdSy2HbJYRH6n-3X0q3bxm7hz9Ax35PyL46m0CbsXGlmRujyXkXbIUQbXGJRPi-wqXvY85XYVBDo-nze23SDUMcflNOPRrn9VdKrZgPKYtVs2Gsz72upnTqv5dkQcUwvKH2H63RDMh98iLO859rPi1xEGCVxHm5yl5LGCaeQKBc0z9G42CAk-3ISuyJe3ep6vMwsrNiusa6gb3Y6eU0nxrJaghdgVI_bcNO0NreEAXHG9GWucqnrzywwv92E7wgYEc_Rk0V0699XGVPzSDARbdTDQNm_-C0AR_iFr3pBnPPpyasawPzYau6KA9E46-K5rA1PqeaKq-kVHefOyKbLNwJDECOOVfd7j5uwO62GHpUlHwr3wZh9Sqhzeml3lBNvMuzn-VbXxae--GyrHTjTJeyQRmoeYeePPGKzOz4Fex-vzHKemUTED-kQM5qnCc3S5FCT6rv7ThQg07dnB-mRDihZjX-Gg06mVtZtqNzJIKlXpiADpL6g2iQaL0PD99YVAI3WYzX1K8Cy8E0fUmCzLn5O7tjz1SuZTBuyPGhI3xbu9L6AFep9ygxpmOaTf_qJZv3CgCa_12W5YQup6cD7sZAtG9jaiOOvaELYH8zqylhYvBKgk205RjQmMz0Exf	{"<a href=\\"https://maps.google.com/maps/contrib/110652447871230924117\\">Carlos Javier Gutierrez Oduber</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
452	596	1284	1284	AeeoHcJl8dKKBJ4SucYW-jUGFLTDbpMg9FCfbwd9lCMLY179Jcm84QeK1yXI6yacZXOt3YxoAosWRdx_v5tYwfgBc4M8zgnDly6YsZvBrb_S5ArPqBOuZ1t5d12pPeMb9g52lHi8wNyLgA6oSRHruHxpdgPsaKz7Bc0DIFjpey225Wu9yGqXqnF8jF9Gx28MFF7YtM7ZuzvsP8-uzEU8VQP9I9gaHr9366DuqQG7Vmfu_2tsoY__yB00sg2SXmFW05cx_Dii3AC136vAJEk1Bvq7C9_--tcBYuPqRQzb9PtW8qs-0yMvjCAhZauvAcO_FU07u_191tcH0cM	{"<a href=\\"https://maps.google.com/maps/contrib/104840894140560614569\\">Oficina Innovat UACh</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
453	597	3968	2976	AeeoHcKN5ntU0hnRnfJxRpQLPfOvTze8iGEZpyn-_-QF97jWsp9VFUmOj3qCyldCJHNtAIhO7vH91WP5y_f_a8xHa9HOOCJULxKGglW4vEHlF_9Bv6huyccvSznZFIYN5-QzohpTjUZH5ePwDsBaUmthVaqwVEg-taH8splvZARGJ6CR61m9ENshH01dL_C9IcAxrsNVPDD7j5ag0gRGbnSrH1X_v1qsIGJc1D6cbYKwni5cjY8sbB9frjPDpDhiIL4AWwNdTvrn8k9ZGIioR5yaLAQRc0-gL_oG3h5K74RxZ38OX-2lJ_JVn2RZRvJQBAiYtvWpaZAVnVWlwmv-mp64mW36weIg0Z_xFyU9oUCNfyh0R_WMuxwo66l0_HmAKO7dr4C8VdAGMQyCtDHl-81B5i8ebENrA1WN1ypOJo03uoDrMtmojz-eUazpiQAxl7miLckMQQR_zdWmQle4-aEO7F_-JvEmiUoAvaKcYDF9tLD24kroKuUguC46L39E6AHYWW32xlmTQ81ujFvGzcmxqU6FShI3xZtvdSduGXaBartR6laIQx9Ve4m0yihNT9mD8G-gsuW5N_s4Ty1HgsMbB-BjiDTyvXtWzjp41p82PiN7_fM0s1F206FK7p2pKvBK	{"<a href=\\"https://maps.google.com/maps/contrib/109381569005900398061\\">juan oliveros</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
454	598	3468	4624	AeeoHcKGtLGqHqUfmHFNvyygJEMHPxUSkzIlOpYQMcNBWhUKGq9K_e-AJWCFk4sGQkVeFfGoMwDyJBREbMswsFzMGbpSsUZBMsemDh6omDdOGrUxUVO_Hu_CR98qjADq34rEEAvz8b1jgzoa_X--0hH4cz4WufPyIKB5i-K5qX6kIOW29o9-Erqo7xYhwnW0VJQPkMIFz2O8n41F8hMP65_RFqYhBvdlx-Y70i4giHzFBEPbgVKNWNIR249TnaIQX6tqQzbvztlLL0aUwqbxmka_o7CtV9VtB4_MtJT741VxeuxPkBw34jQK0vTXCZYiCgLDmd7bzgcjClFVLv10rLV5FHmq70NwPrJicVfCr8WvqxZG3ebgMIdk-tUTZm3TiYxEAC6vYT0ZyjpeRacIfctAXrPPsafocEX7ZIPuHgsf2JHmUfeLC78X0HIvPirLSi57U0dBXnMMVFhPvov9XKtKvjqOFzrQAcfu5WmjY9pGvrxllg2nPmYAw4yqaeSqdHdbeK4ll90HowVW0Wh8aHU_XyYSWs_Wp1Hz7nn38Q_y501BKT-vmoG7jHSiuJ7ql7WyVcNrrsGRyOLMiumdbTcOPFJDJ4e84pTO2_tMvZ-3F5QUePgPSJTrijd80hKv_1BqHYsFyWwJ	{"<a href=\\"https://maps.google.com/maps/contrib/102347229717523900172\\">Francisca Mardones</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
455	599	5610	3934	AeeoHcLbtUYaD4wYl09bifWIw672cpdZszFOVhhTZJZ5wdxyKHYPYRNl2-6hYHteEyUm0g3DuYym_TtrvsL9TnHm-92jZXNDzkoN86geVjZG3EFV0jLZ39ktya_47Gmgvm-e-h56etJBZt1RsZ-rL1pAht5wBXO9QNoZmdcuqriaGCv0nNO1JgCM0-9OMmAKWlXk4Zio6LfjrM7pPouJZbl_Uc0Up54MrRB7IWx0WjxLXZzwMZWzlgWFQoZPKcRvOJ7B-C78A1C24nfuby0TXKLDTVAV0vs9RAVAlsJzsKm9SQgOWWP8HoDOJykgAPEixaLz-8xyJcIzzPF92L_GH0D3oT5tRIDd-hDWtYR9BCvfyXMtr1zAcq_QNS72TJTRY2bocTC9E6Pt_WNeffsDazp8ksu77FZ7HC962yK5UZ56mWepJTn-0hXaTIlp2OUGlFiOxWeLf-7jFJlT1PTWugvgQtL1jjrirYnkHoe6__NoSdMlD9QIBXo3VQZ4Mk2j8KvKLp2lijJchx12qG3kikpy9UYnS4ylWBoOX65gqa9GWK0iTV1z5rl6nBTKgys00UwaNNJKjZuwh8H9mlZPJqug549Ax_H9jtuXR_GshrTPaRfKj5dPUoDMjZGEox7MgPdt	{"<a href=\\"https://maps.google.com/maps/contrib/111581780068876104132\\">Leonardo Álvarez</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
456	600	3072	4096	AeeoHcIHVyuJAkOQQyPJkHcuaYoA2TP-DsWrodsmDZ4HngA76AJ14-QG_z7anwuJYqeW6wslDisPQZEV-9yPMppaNefNp9NNoo8tfL4l7XOtv7L4yTPYMGgvRu6G7zS5gLF-eNBBIsNL44Iw8GpsEwrEQ-pr0X2n8tyfcI9t1v-F6aNzF69kPXGgPvfB3_TlCfplX5waRu17eMkz05K9Gkdmezi-Wez_iT85YnoxL6024d1cUP8CYpFep6N_E_lxClycab9-m6QxLyHq8O6bXwLRbLVectUBw6bZw6iE8IBlahMUuzcozF4Td_L6zquMY_YuCU0pZey7RwA0J2njqOFSZ4tarRAXziX1JSS3mdb0dk990LwpZVfPNjh4YjVAZ7gzk2GbnzKxA1j5MQsxXCPxtMPmEu1aMZ2Aew4lXhfLCAkonV2J8Cz5uh1NcbAv8XH7EFbwREhrRmFqD3OmvxrCzh3e2nq0_zsOkYK4MZAcrn8TOphpSt1sxQiiCB_THXuFVUSw8S5sNtqSoPgisbWJjCvKl8TKkudYaKn6qwLpf8FFQeekMSBHfujvquxczE26WaYY0wIkxYL8aRiZ7wFjkSpITPR76_zRA6xorUDugxyxFu3mgrLMtZLb5T3n-JBDU8ol9g	{"<a href=\\"https://maps.google.com/maps/contrib/102411594181605036064\\">Juan González -Kopal Ingeniería</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
457	601	4128	3096	AeeoHcJCYicDvxqOs-NN8hP7BLV2JagCb86vNd8hwC1zOaKAPlBJpwLbxF9z79MQW1ptdmbE7ze5IqGmomCozSYREjJuQ-ElvuZrhWQ5Stf56gm94RlYnm_WPhidp-YxTzTSo9YdsSm9sY0XYSZivrI8Ms3-_qmHl99arNNCIztqZ8fk3K14SgfPLbFh7DAMRa9nQLKmaSYWaji4BuOo5Fc4oZnfFLcbJt9AyG5A-ozvRErE3lfnKquENky_2qF-IJu8DxNsKLe-UprM4cerCTDOEFWevYaY7PVkk3p6h3hKe8dMZXMYtUUd5wYyVOYaXNNQH94He6CQN9J4Y_LcQxI3mSrtOHFXdiLmi0R9brAsx_TqFPxtyZkgNcE71HCkDrd_cAnZHNdwJdbgY8r6lXAckgErYxze0RK2oXIRAuM6XD8hgIJWclFJZUuzLcQjdLxLh7ayQuBGii4_AsxG7L3zibBdZP1CJJWSxWJxvS-OfStqS_mH5ZZvJPVBxHquNOxWr_MNqgiGCewIbNZxi3pXzfQ-SEcWEuHBUXU1DccSr5RbG0xg10g05wKRDIHUyTsfM8T6iqylwsx5nyf4O_TCVmB_QvEo_dZqsWLfsaHrD9gAnAIzhXzdEa90qK8XFvj6nvK3r2Y5	{"<a href=\\"https://maps.google.com/maps/contrib/111993537037648306278\\">Carlos</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
458	602	768	1024	AeeoHcJiLycKgCet9VQidFoi84bm8KypEMsikkh1LWBAQa9LwXNnz3MQdMmIkJkdgagRN3Rpoz0LWXHgLN0-Di4CsQ1JMaZ_ht_M6bqPrfMVEXtlHLNuKjzfAaa5iYyOKJDfFlohURPTk_8brqv-VRs6QPTTjf7HIRTsRa406hDfvVO8UEsxGMXReCgjn8quHrMk0OGaWNS71v7wKLWSvdXFmm74Vq-YwuIOWSZqaxEV6yrW771Toc8UqhgteieUZqoX_vYVf2dLQ-VjyrLNQHf-7bSD05_aSCPMyg8C1dTswAvm6D4tgzqByLk9ZVokTm-V7FL98o1HbjwUcOO6ZdQGq02Ph0GCIwIFuLzmKUfZEL3-V5w6OWElwMwk-_rJuxt0wxXW2Xrc6gYOJpj-1BMk_Ln_sYecA7oQ41mZZqENDdBo_AYVlDFXMxBt-_ruAKtrEdHBRltrXg1McPLIk6vLCI5rKEujgyWLBdr9KAOKtsduDAwQwsQx2nfKtBezXYJlgtogZNlAHPdMyOpykTRHmrlhMs7EECw2wwzTsoW3c34eiTW85wN4UR53CzUFfx0XlxO37YV2HP-aOBZQh4IRoNjI24OU04_cmGms9qDL5h0Naz2yozcecPzHM_mjim4g90eFww	{"<a href=\\"https://maps.google.com/maps/contrib/117105682308814668515\\">Kevin Beck</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
459	603	4000	3000	AeeoHcJU7JpsCY_enugqgXbPH0c_bBCOsanlhzdH766YTDVc-7Jx6cLCBbZFaA_HIcxp9fcJzYfUejhL3YT0SbhaBcYiLB15iqbWc9SzSwFO9WOnTZzyRGu_aESYTFlGPaNAYqdddrkpXHM5AUl77YlEHAaviuQpb0CXtsGmcttZkAG82JQ7Ibv4MdhLzXZHSLRnchr0GfLxUxKp_4ZX4bMErqgkwqewbfroKIeGYNCw4bWCIxMbsfDHaZJ5RPGkklvef0lTYjQ-WZuXPypzMD8MFueT5UzXqzPnCJNRnn2Anj3XgsJBXEKQm7t0cTwHJYVMlfg6n2YLGhMmIE3b2lFpixhI33aqZ_uV7eZ0Q16SLW5V9WO0lw2REP9WPch6oIDBcjUQScWWvuQiwiFoaJDFHJzS9-_AR4fJhZYvlXi4g3l-xtqeUivN1pF7pdpTlGTDmwaNQiZ7dR3UzbkoGg17g1tnrODUqFMAoYMWjWMB_JLkUBBddqoCGlXMB2vYZqhcbzUoN3e4mol3PxJGwMWMaZiE-npH7PncAayceOQDb7mm4TkremYkH34W9Mb4kF8rTE4mI60A6gKhYmBiHYVm0XlXhWaptj5_ruLDmqG0iO3LoM1kyh2zPGgeYTi70NUMzu6dGxsz	{"<a href=\\"https://maps.google.com/maps/contrib/100718102553692159710\\">giovanni :D</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
460	604	4096	3072	AeeoHcIwv9iiD66rKC02ydt12czpQ_2vpxF5_Lfi0XQChAn88xxtSNZ7e1X4cxTzeRh7sRDaa3DtP8-MkAb-FBtul4ocmpTE384mui1WGK4hm_wUZyZCq40ylkxEwY-YL1V0ftEwe5wJdWQK41hTCxPLsSnHap4CRG9WihXq4QhrF7c9_8h3JVXvCPE7t3UplMuLUsEtnZJT58_gU0u1MitUfHU8eTcoEubODStD1HjX0MinBkhtHUZz3GvTWHgh9izcOyvjTjb2nmsPNM_wdzDRkK8DckP9GHPJ-B4C7IQ7F9JRyf6HHha-weCNbpOIyRyu0wBYOR69jRHA4AhLbvG0SPrCbspYYjQW3vEPUqm7Zqd9vlD4Mcl7QGsndd_u07zBtq5JiY94lFgAwMQ507P65_BbSebeYj5VaMjKuBtMzNyECd0U0yJUHjVdOOj1ouZmVlAK7zvZeIo7JSFKKVzKYVFSe5pRyyHjHFRxLX0CtQmEjQff3NSF8AOQePL3ebCxWikcvMe_1fAMEjpeOatBzzyrNdjlyJ66AsAVtLIHmrXr1Svvf7OsuE0iWJhpQwUb-JukyeXyih9F767esERiVlFUskZYUQyU61mUKpem_PF8JVTEhN98zQ2PILflJ9SDJPmZByvm	{"<a href=\\"https://maps.google.com/maps/contrib/113029026857822003204\\">tavo ext.</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
461	605	6936	9248	AeeoHcLtGITtUYlQ10V3yrEi7bPTvv3kM3gIxXPH1E1yNGF-WlI59b41afl4Rl5yRj62qSnMJOMQJZT6BA9AeENPFujVgfLuJC0rRQhP7-mcCvyhe1ywL5quWB9uBzlN1kGsmgW378gXBTXh8hwNSE2SOXdc0esKTCE2vuSPJr7gBcb9GZXG4xJe0FdtILB6wVv34SM9X7GLT9aWggP8aljtrWSqKhT_VkD81U9J2OcWx9XGfNOiAVGLIPS3zxJJIqJow4bMultw8tZQvf8055423kT-EiGZTM3yBmSCwInDdzxgsUeYeauLVn7DsacN9hJfjM9zH_Q0QtJpFou76i3TDjWpb1zyFxVxrs01zPYDAh4lBm-Jqih4nfETGHYl1BpbuFFKm5TNThTgPQIPK0hzBQujhZ3xr_kJ4ZN0hzhLVZGnkCjvKXxjkf3Cp-VgLjKJWMW5A9UKGyXlrmtec0KwmforWcxK622duVtHPWz6MlNGNJ69VWOwbV7hUv2hSCxgRDUiMWOPAORLx8r5C8vvUNp0d1Ui2YgzyfZnPV_zWlo5Q1VVWw0WF-E2P4wUGct3bWkFLKaGYjuzOT7syPb2sOasX9YwT3VyS6jp0He4u29COspCLJMkSZ0WGppehnFUTpmcHg	{"<a href=\\"https://maps.google.com/maps/contrib/102936705445639577197\\">Roberto Ortega</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
462	607	2880	3840	AeeoHcIqzEq96M3CxuNzfTB92F6TnFEY4AzstX9uG2-P_nVjqW83dYDA9W7Y9oeDW_mJZAZRUS3_zH-Y1CNH1U_YN8V_ZAicdJkmQd9O8rjbw3vkcec8zjPgwteGtiwjxxOsMVn_MoDvddJG5NYEC0dNCN0_a37gO8BM_r4anGOUvRzVdz9FBzZ7ljt8XsDPGVpYUGI0iDXh41mPM4b9Oel-3k00Wy8Rdc-OG3AbyGgF16jlU3AFFOIhpuuRw9yMB5PJ2kYg333PyXuIZ59otES0EPMH1URgy232Ey4BRyNg5oITys70qPTUfHspkwQ-HvionzAOWsqQM6DcYSAOnc3rk9JtWRRpauy7tCIJ5gShdBJaEj_I_giAbSJ4KkHWqEm50P0N6b3Q_eIRF6hRwxKRt4p1FoLueFFwFeYduE3b6LUWQreojKwfMde4SLzSMrJtmvFR8x2f29gjHY-sCGwzPUlsHV7ycJCu_ZaqgeFO1nohNRq9gN9unwyzd2ouFn1CkC_qjtlNkIa8rxgD8aHR9NrGJGijmcPn9vG6psHrSs27CNEhyLpsqgT36kst_2qQmCWT3NCwj-ADWNNVMlHPdrbJ4O0YcssU5xYmb-1zSG2x2bPQReNeEpP-QaCD_Xqy7Zj-Q2hL	{"<a href=\\"https://maps.google.com/maps/contrib/114436731178881965124\\">Daniel Vincenti</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
463	608	4032	3024	AeeoHcIVzMAANIjPqISZkGbMknKTVBmaltam9-Gm1q544BHy7MoC6eiEd9lewssoOFj7rjZc0OW5RxHM4uNQ8mR1yo10sOy3rxr5RmQZCj2ca6-nGeCa98E3oqXWPW7I4s3Gc5I4hLYOABzUl0JbEIV6gfZuPR_Yeu1vvkqULYqdiDkH15MR-_6MeqyQp7M7wy1PGChFOy9gmAREKk0fBy7ze0NR7ZosTxyhIWoW4v-hxPUZ2fli0os6Q0-Zb3CM_hsTgQZgN4MlU3iPPaX8R7DIxo4TKZniGhthnsPw8JWnhTlgol-emOMBnGvoNRVjTXn7BzRDzBHj_4lHWb4QVdxIhsVIPIXhfypPUP1NokqL7cmkMsZUQHn5aby3CMEyWW7KsWPeu-CxoqJU-LoEQJ8RYaTn7eAr0CIulKISTHE6k_purycwSA3LA5iLjyTbqqB3X-C93XkWZd_R_kzmQ3Nc8WG5gumvaXaj--5M_JSsNTgbL3EuNTaNLTka_VQrAc-arOvi567u-V7Zv15MB0sqa9Ol4iHpfAejLNGG5F0w0JP8-Ky3H5drNoth65pi8jnOYLVj56dwhs1_eR25rTFFS5_4DD5Pb_D1CKCi96wZ-sfxiE1-NcFAKEsh95jHen-YzoE7Og	{"<a href=\\"https://maps.google.com/maps/contrib/115960270981559684649\\">Juan Pablo Pezzone</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
464	609	3072	4080	AeeoHcJd7OeS-gOeTdS1jgAzqABTzwiu2dH8dErNjU6TdswvvDWyuozSEWpj8fSKi9CjJcPx1v4G-UMlP9xmdL2ClTCmqJ8qvVmIJazYxbU6icwgnABHH02W2uj5gszSjIIcABRXz5XAQywK7gHKuVls8K--uNf6SsfjUf2eKDv2FFw1w2IugiPEUAqxQk_2oGbmU6VJaoQdTpKYwdTNf6Ow5TbzyRSsHjUFaFLyEZ7wDMjDr2yj8Csqyo5w1ZQ8cvMSTPPbGfZkrlFyrFPxIBnUqWD_R4EUcz9Cnb4OLSPIfNlr3g57DGjQVXRI71cn_DAIzhoQ5969b_YWpK63CYo34LMnXxWhY5Fe_KrkvLyv3dxJiPgFBHSnfLLj6ktEIu_7nvt8lOQiifSFoz0QxWyO99wuZj565p6N9D6SbTI2fk2a-dKLS_yHvIO1loyPlzh5_tBUL5cC5k-WZ9k-6qmZ3rAZVg3sOzIqD2kyzeYK0SYc0W22fBrNMAXYNdBb5ydwzHhnUtiqNDleax3DSnBBRMbdm2gfSiH02p9saPQkhnXEkeQQ6HX8ljUs_OkVno1pGv2yT1XTqmzRqHVBXRJKA1OQRvvEm6Q9eJYxhPcZg5tBe9LzG4XD_9ETJnSZBxcxHLLrlA	{"<a href=\\"https://maps.google.com/maps/contrib/101838235481827897903\\">Patricia Salinas</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
465	610	1080	1920	AeeoHcLCiJdTqMW44qgr54TbpVpeafULIydZxelqJTDCuSuNz5t7ioBl30qX7RB4gk4MjXrIOqsWBszZE7y-l5avrsGj6pEOWGutlNDuzTNjghg_1tIhO92LYR04R9wAgPDPbUUHgk5NALyTrRFg4XvprrFmV8CGb7LzJySL9SYKF2361BdpUIRfAmYb38n9f_G21z1d0T2EsJMA5rbMgZJZaPO_Hp4H71ULm7iV5vCVyXkz8WVOa31m7jzOfhE-x-9RmueAGQz2EpEuJAshpVakuSG0I4ncBrCkFYLD65wJRZBr5v1WCnkO9A2-sLMF3mrIV4TeXsd6Nsp3rZUvpu74I4NU_-naThj56SeIVisBKETfVg8fhdMixg-PPUiDiW8n0HoSvTz-192V87Ye8CgQhMtGG3TiIopY3zn-1nSTJaP3SIomrnZNsg2h54yfBIHRRGX5cL6EEXbwjN9jnkLe0gSa32FJELiM5SY_px5SKcPejfbOHMx3u2KdMSADCD6Rj3JcqasN4xAD9CCm9X1zDDgnBWPXW69pNdAqyEod2uy3JWHjottz2XNvO1gsUcq3WdG0Y81Aix_LmsUDOzwQmPVzX26fJcmuhKpre9IFP1aez7eAyHU53MItxfc7Av4O	{"<a href=\\"https://maps.google.com/maps/contrib/105914589141188385769\\">Alfonso Salinas</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
466	611	1920	1080	AeeoHcJdss9Dm6hz2Di2G8KI2Y1cVw-sp65Nmp3p0icohLMMTPNszvAR2IDjHtGLFKooVwMDvXVkEYmk09x_oTgM7mxj2bEoFiZJ4KNYn-er98p_I0it0Pi3qc39qZKQoiFTrTw7coONv9b-EKZea2hHHuoa74cb05D4R42h1CSmtgF5HMtu7Vcp-8_N1cKZqhCISGD1W_gD5P8m2c4ucjcrLzbOmTiGAJvBBFQv2JTsKP6XcJlnDBtEkfUyW-c2B33kQ-EN1dpwGO1LABVck92HZsJuYw5xlqtW8dJjlqHVmRHablYW75W4vGvbFdtUSTSJI3_e3fC1e2BREZnZVley6jX5T5s8VktHXn5KGPAqgD9h30hQYNQtrMib__TADprmv9_eKk4fHo8kQBcsUTt9pkvOi9zb6csJc48vP6asby9CEWTTQv11xz7NWtqDf1qjTr-F764foGmUn0QBhqWxuvEHNKYY45-XEWZ-x4IRmp1rJ5okS0TUxc-xK4r6vq7dkI6ZGBimv812Ks1ykUm9OnKDWNhrCPNSiuN8g7mOMSlI0ZI_I5V7RUfTtCE15T23pSsK8PqHwefiqMPprICD38BPYtSwFMiUt8ShIQsbRx-UVsF4yzqMeUTNe3oW0Bb7yz11dQ	{"<a href=\\"https://maps.google.com/maps/contrib/109575823643984387768\\">Barbara Garcia Verenzuela</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
467	612	4000	2252	AeeoHcJHRYnWRbSjV8qbahqjtwEyo9OawvnGE4Fn0AqzOnjafkdGFEJd0Ke8ynzvSNog9t4Ko_86SMkGnSIWxA0XG0QKGvmTXTZBZ4uOhN4vQUeE3MWzK1iityzw-A0hpHs-MwCAPQlyY51G1J1k7TKRHOq91RbNJaguIoI2TylkFJ_UrLknvpUYodkFINW1gbZzuhNCarjEGTozdDQC2i5ggwWM46tYvHXEHfqTHutC4h2L5275GD4nn0qsT_Ux91iL4ck5hwO0GH29kijrE7xW5R5QtU8DBI0jTzz41VrTCGsJV4nClrPJkUsXRCn0k6Dm9xflvNubtYmVyxxwl-HIH4gAeR3zVPbEkaeyuZtI8rbAnJk2OGSaPzrwyAHDQLsB47kl1xkONIkfqOOhnzhxZlvKxUA8bdxVG8lzZ-Xf_dXOHRkPQ8e80AJyFPbKVn0nbagIXJeX2zJ_rx7Q5Kzn0PWSBWx5MI4ZEpB_eNTuwLhI8lt3K0lRmRRHUQzTF7LDdDyoxpKMVlx4MCeZDo0G8apfGOBd_M_P8jYzZb-ILe7MpuWLnMaNHohaHmj8yBnFXapG0TlaKJZk13kEAUxNvhZGtFLnjzZ-7nBmTXXgZ2wnZFTkSwBj8YWzj5DZiJfGLaS4V3mA	{"<a href=\\"https://maps.google.com/maps/contrib/118432996679027280274\\">Jon Fisher</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
468	613	3000	4000	AeeoHcIIVto95s9ikBK0IGPDFZpSA2P4JExH4ELEfZYQMoOVLT2WV6S4dzE7iVe_V_1n7zaBiv8nacoXrZr_Cb0APxTZvDBCQOsZoy65Tlo74AB3P12GJ8CwzdfHegGEu8TPMdsfOYCYJU4cVcj8AuziDL__KLr3mklIYEPw_Naxq302zV9zWf41zmev6hhgR7p24fvKzeUU4Y8kgAh5ytQmCo-YMGM35p958iN-DLqT2Iq5nBGp-ybrVLYduLy_4hFpQ4nXwytpcrq7VGeQ_sw-Wc5ir8ZXpPTjVTKLUUPMHbbKw8lUwGb-cqn3Yigf_m-EtQeoz46Rlc7jXKAm1KZrwjlDQraa-RkuNVydDx267_liGNSoXL-kfIktcsw5lWVOl69EX1IrD45wKXtnQXH58c3smwrvsWUwWs9Gf6TG3RorNk1Iuzy3sYlszQvH_LFjUvSk0rDa6p4STg3jIMuPvjzVSI2UVtcNcyi5StcZIiC_pwXOKRmo-HEQVb0L3ZnRBwacm4b1NXUDIpwFxfZ4uEwQHQRSy0pFazTha0vu9Mnrv57OVRLxqKuJgbxsklNeEwNK1SrXfomSFFAfvf9DjG4mVBfEv_iQ_0ejZ7qeydeBL9cw_JYVwjnccCuEAktSWg8zuQ	{"<a href=\\"https://maps.google.com/maps/contrib/115893341212060192371\\">javiera</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
469	614	6936	9248	AeeoHcJS5D4IxB0SliQtrEVQdwWVoHxdOLsQDculWPIjNCaVc3tj-Sa6szXEwJhPrVh_Y6PhlBXmVc34ZbgfGVQEDXPJ7Q7wm5Coe-NZEnOBoAMl2G3VSA2rVpKzhfT4oIQjQowz4VlkE9v7h01xjtksYNEZk2mfwh3-E2YGYo8VKtGEIHtuXKh3dyZ6o-DRFCnwqY-RK7KUfYkbhOzgYLPv1NBn9oa_vsZFiTkOX6yLeXSlB_kMXRXghw5nS4Sf1NBOmmWp1LycErZmL3zvy-oJB1ChlI0xBfTp-0KqjF_rWVNOvHOLtycjM6LD3TGv54DGCfT0JNfUVVFna2BZxxF_HqbS4vdnjNFKdaWmm8nFUlIxDxNEpSlmZN5q9Hurriw6LTl9qOPwjLLEsQJpE7uP1-3SdW48CtzZexa-dXDiGQzNQnYVjbWbgKLmZy75DIoQ4zdtQbF9i8GK_C5y2Wdl7ZQRZamB4woMmU_tH2WhLdbQpJBUTey6jgFvPadn_8hsTog7UCVGEPzd5byd91oE3v_sDTxNmAdsNAVkpbacYVGyBZ2LDFCPQc_RRDKgKMi1Lr8PFCIdGj2S5Xo4VIX8Ke4VBewxUaeDlhOwG6hDQA_AlRviuHN3TXEcsccTMeWn-QAFHQ	{"<a href=\\"https://maps.google.com/maps/contrib/110887977273438416687\\">Angelo Oliva</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
515	696	900	1600	AeeoHcJxpTE-4yfvUHzALON6TWOcLkSw0GGyx1CStcv1ECTDx-2RjH9FKtGprIzNswrS2qEqyMOQr4R19cT1N-ORolVePTkRq24Z7XekkMkuuAjJNWlxnpYKznxyE4b7wieE-VNRP_lLRe2EkGfrjCAwhl-veqBSaTjJAuCsPUR3AuLFeAqbBQkJWLQcAYo-H8gJoG0Nih1XQsT_Up6lWLb4XbuGGHrqP0dibbpoSZcw9y_kXCsEb-dPETkzOW3FR2sJ89mPHHABhl-ijTHVQrl5X9BQCVXXSPyePTOsK_i_CJGjRwditTYrX5pbeda42K-XHFpLCniT3xE	{"<a href=\\"https://maps.google.com/maps/contrib/111427922147218677421\\">Clínica Dental y estética Ferraris</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
470	615	4000	2252	AeeoHcLzjJyldI11EmV9WLdvFNj09TaHMj-3Acb4rmskoVc2HtPglRs01HelozNSnrmY-dzmxRftVNCS6bk7TiNH-TUE_WFDZHvQYAPidIcdsGSZFZiQaWGp8exphXwiyaCkJKqP41S2_FIcN3LIbsJO96KFVAMbtYKkWVEX-IimMrgeAVCfZY0dKp7raVYALbeOA344rBDKnU6YzEB4i4Fq1DAP2JqJ8r8xbY2NIzugaLxObF9zbCuh67rUExBq9UayI4U-qmkHgEWxwYHnd3uWJUYTp6_jVzmLxtoWbLJdKF_YxVeaf2cqviRlGuNSJ4Qej9pu1ZB8o8ic_ko6fzOF5A60WsnI9TsLXhM5YK5hZmYiWd-nkTw6c6lha0gHOmQXpuO8G3aLUlFaFA4pioN1TNjCFJYuLmRlh-3y-9gLfz8dGMny2NQyBfT-Dk3qgKi-HfoEzPfQZzAD_3ups9T8jz96PTO94oyY2xYIJ_e4juQyfecq2Gy18ELuIYsctG6ZXMDdp_TeChMjppZNxeN-tYk8o5nGhxxW-nW8Ld4XuwO76LAb6zvJrCBwmmVl9iCH1N2YZ2E-NwCdR4N-DAcqevJ_3SDSd0dr8JBxpxRER8fGUGBKDlgV7dl78ndXAisSvXEVIQ	{"<a href=\\"https://maps.google.com/maps/contrib/109669399393660971977\\">Clau Soto Osses</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
471	617	2080	4624	AeeoHcI9ARZ5dI4Cb2hqVfD6gGe5aWB6v215fWVBLIXUecGws275hq2-yMUbIqrjWsv0c_gJZKu-ygqVPPC8rXBAqKfzug7GMp0uPNLOB7I76rh56pkjx9NA6f-1a70FqNxRUGn9l3SA0Cbtw_-6jDq6ydkWt2Ts5KMF91n6EgKB2C9nQSHlTL-PgSjLdzu15d4VnnBQ5ZFWsBH6j0O9qIOx4_DqCiNDLAxHoBcYION4Z6dEP7rH1HYZuL7WsOTxBR9pY0PfcEmn7mAANkXCti1lYGJAA_RTfvxeXixB4Xm6jOfhxgzUQXY_2PRXa3w0g03T6NAFg-KDPvYH6xtSs2Ro-c5RC8mFAvRw5jsamfder6MjMWF0yfE7y3wCdyfkFMRBajCuu-rD97oGWngyeyYFfMqhNKSZkrEWF0JouxwEBid4_rEzCgptfb0u51tajpVVBqgrPNNriQ2wVaey4KbUb8eA7S9Qr6dqja3g5lmxm42jrs-sUEs1bPFgSx39mAyOuse-3wQwcaje0fSnwjRF0p35bcdlgzcrhZh-g7iuGylkIdR2FFYvXAB6IBiCwLExhi4e__enPglDDfxG44QzxLpBytdmTPGtz5308wC2w1yndwTbpk3zhnXTVuCACGqOZWw71Q	{"<a href=\\"https://maps.google.com/maps/contrib/102760368144369852284\\">Viviana Aguayo</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
472	618	2604	4624	AeeoHcKodGBs4Q-GGNovO5ugFGKL-R9Bqvy5Q8PTcuv2cXQbpzGwTfGrHvpvozU75DpCdx6OhNPaz_nnvM1iJZLDYqxgTsN0gRY6bVFMFGodffLlBgpwkQ5VQMQsoPNd81ZP5ahtCdXipvJ3aO_LyPLyluRO5PBFiYx3sXd4oLsm3ljMSADVkBp5Q8Pos80t8P44yVPSfJrsXXvxtBKNy6r60qaqwFUodgjjTyNZjbeuzkHA1Qm2QumW6h4_mFhG1rJSqTvpnmjTPrVpDE9w9iyQhAcM31rEOm1-YOvWYSSX4jIq_kAPsouozMrHjeJAoGZqKS-bggKFCImNYOJYgODHMFflGOTfp6bIcK_RC8ByRX8KwkOwPGauJVJ09r3Vv2rziCaZ1s2bT2KgcJ-HQT0jonKiT4nsuVXfHPo3wSfR1Zd3s7PUUlKuCYaTcY6f6uRgKvML_6it5Ns95MR-03dgyOsgpzM5pZj6nklQHkhz8U4KjwGwGCIXjkkEZjR1Gq2g3CYSRFRJt40NrhDmLEkfe8-8ppo7rGhfp_tLCVC1F8rc4vO1UMaiv6X_1DLlF1pqrPDways8f-P0-Qio1AnDuQ4KHpailXuU28wbTbWA2YUEmfNuRikHZNNUeIg8nmHDedhOBLig	{"<a href=\\"https://maps.google.com/maps/contrib/110109846308172786776\\">nathalie bugueño</a>"}	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
473	624	2560	1440	AeeoHcK46lgvO70JStV9aTK_DYe7k2c1PDYMyPsoiypO9YGb8Q3CIbOyXCn0cPjqeLScb1rASSW9MwsBnXO6za3K9ER_Qd5Sse1ESIt2nP9rE4c92UbwyVCZZI2QuhA1DfR8E9Qlki3B8OAQhFiX0T0-EP_zNt2-7bcsiIZWJVlTbU30_3mwjxWQi4t2571WFUI6vXkNQo7i_Fmji2HP-A44jW6DgShRUs_4IBa2fCapQk2fJDYT6gw7hHkWNmZr-4igjmYAwif6h5WsrcrfurWOI2dswzr0E9BUL6LZDrwuF6nM9QFewGqMM1BE9hA4pyV2iSkJ38aa7DeKtQpt8JrfUElKs1c8eH7pDvHENz1wxLFMaIK5QO_2jMUyMEbK6hs3GUPW7wXLFvfDYrKAk3kelcJlhaakt4m7nqnG3u107jJAVxVEami31IV6K8JJQAx-sTW_QdtrVjnnxQl8xt0btBKcK96DryE-UgZ3ftgTSaR1ftpFkKtFSvRcs_vmztSzFa0oo-5W6i3KpGKHg0t8bYubBIFUX_ZYZm8aWR42lB5NcB3s7op5kus7AYaxB1evwi5GGgXV72XB9EOsCnJvkVyq1UWM-aKiNYq24-utmayRWh6_ReoYWX0wZTeNe15t00as7zew	{"<a href=\\"https://maps.google.com/maps/contrib/112410363102150167147\\">chileno lo mejor</a>"}	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
474	628	3000	4000	AeeoHcKHHc2cJyX1wrTlrxG7i15J4RZymM6cAGuHU69nnXKQal2DfXs-B84OOdYbka_qr8Z5dCOGFPS4uC5L5KYHrYgRY4cD4nJ2MFjKnrkRTFmZu5Xv1ZDB_OA8GS2MFy3aNwzyj_eYwm-Os-FMUoWWh0tqGsE6Tdnkh6WJizeZNSXjEygy-3O6ggzmHU3HXpoYa55CQTw6cfy4SzIB2u3UZqcgvj9z7naSeQb74Zar7UO_0GxWwt9dJOMoSMmpnoK5yRGTMEnWJrpmU9e4W5btnC8ZUykCNbopfCdiJcTqYSauCLCVL7gGHX6aPYJP7exfrPJJVGtm8VhmANb8hzqzrvU7o-r6CLLCVhem1QL_3hGX8On_vayCcZlmFmeC9W551MU5px_5cLRLrkvdUCFGYa6y6CQkFCiA_Pw0Q8eSMEt1bpvimNksoeYDHKaRqXa3WfC2WomlYv62gDFihL1Tdvum7W-RVZAoMKU2wt_iDH4lKgUe87zBYckdetABYuj76mdaDXJHEwgPwh4JsOCL7zIqZhUufT4yBFa4-uQaa4YOZtu8wedkzi6g1xU8QMHdKfBzu_17dvAC9U-lNWxwyafqenQW8rluEz-gaUviyxf85auT-ULPftjWA-BDPt1PGkuBDA	{"<a href=\\"https://maps.google.com/maps/contrib/106381093309427627818\\">Adolfo Eduardo Guevara Garcia</a>"}	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
475	646	2246	3436	AeeoHcIX7b49mUMgv_pk4rgdDNF3Wwb5coAUVhfbv1pCxSgN8-Szul9e1txUisEQzy75zv6ltZS4_Ww6flv66nga-LdnQGT0Xa5Mqup2evOY6ZeOvv6rg1D3hnDKEogihnu23xwYDssEEiTi5GWw2dcuNpLft50Nwt2297wXsjBJYBWp7POcLAB4080a_WVUdxyFgEZ8dcLcTYvuDbaYu28pnHtlD3xvEDO3INnHJCL9HJvyQ1ul3L1EIReFZXk8cB1CiJ8Vo84dkGXTdGY_Z2p0eQdwTv2wU6wyiJBf0zaS_CJzJ5tY2J_9GZIx4ER_aBuWgd1L71o_1hGX-C8RI6khiEVVveMHO6Pbt7m7ZxiHuoWMgVyl3EcXLXFCmhAlflhwYh7zJi_N7xmnRch7uZsUKNS6uKNDCUcYZtwt6bBXCGfWZHtrQTHmQwWcrjBSQ9CaT7EzsZo0JtcWiBtBlh5UATqzmINiO1wQRPfmGrA34hCNLXzxKvklF0xhLnU5oWParote4g_HCvbaFtS2wZDrZuG1MLFk9mlsNddcyNThbhcPKRrlMWxRf3FfO_2mCINzI0XUKEFWY-eVhGqCgcaWuUgFr6sWC94aPkGsHy3d1BrZYIJz5qFM-W186-o9GNBXOJ1H-g	{"<a href=\\"https://maps.google.com/maps/contrib/104108920945849979515\\">Jorge Vasquez</a>"}	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
476	647	4128	3096	AeeoHcJBp1bPq6FOvHhQsA0MPZipJKy1S2hRxR-kCj5Jz8JAF6377qYiQkBvN-cXR4UK_ZxDH3BlJw0h6DXHq9_1pfWbbVg0yGhikAlD238NNzQJZt5qKYPYwL-j4XfzmaQicGm6Ey-Uuct15EVSPgZNlQRM-MJYhLmYRBsg0kkf4fQBC5Aus8vUlqjRKXBwvj6kCTKI-d8P2il8WONbFop4i39HojjqyIBDXodVEKfwoj9qR1FwA85Uz1CaeJ5IPxrw_DAPu9G2h1-LS6haOWVWdAMGLu0SBmGZi09IYTLuym26ElJV5xkXo0vPFP62-0bASUjmeU-lL2EeC73tzmSLmx36VPq_Wo94NtyoUm09HZEtlkor1Lrr-Gy_qvibyrMYVOR_vLM2TW03tYbUWnXFZE_ERNYjHSGrGm57R9yDAZ48PAe_KdR_vavoHh8zgaIVjHwiiRoQeVkQWIeoI_oYKiqHRIHszk8aZFMzzfIGQorgbjdkuy6rrGZf30dwbANEEZARLXMuKVLewnHCUjSH1-5wIoevwgzqKqlOf0vma0uWucxaKhy7vBkCc0LzapfJwd9NewlYuSbovThz3X8C54bkFy-m60s7FIH5XU4wb92RXKJDg1dZ9iW2US5bwz6D5YNSlQ	{"<a href=\\"https://maps.google.com/maps/contrib/115904379767343883981\\">Ferly Ojeda</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
477	649	500	500	AeeoHcKvNH04ezzcqW9s0dyIccSdLDObjcqn0mwN6jS05jNDC3jDhEe7cphwdkAj8XBcjI5eF22yMhk6G_ocRNZ3WK1GNoE0sLvyLOzKsfPJrOt-r30XE6UWh481Mib36dQTNUSKsfGlyMqGVpMolAffN1qqwTU-4WxhDARLZujX_iz2zrGpHtFdBfZMs9EJksWbcryY_IJew_7CbqfO8kdHkocLMeXGfQ81109CzgB6MjQUTTmHaqkNCKApPSTOqH-Yp8Jb_7QqGZLUFkcBrCVhVnzrr0kRLfnJnBniCNPOlKuXEPg7Wft5JD4hHdyTkk1omB97RQsWOuM	{"<a href=\\"https://maps.google.com/maps/contrib/116831519148326409964\\">Centro Médico y Dental RedSalud Valdivia</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
478	651	3456	4608	AeeoHcIswCEn6-3ieze224L7Et2p54cDL5_PeaNMAfZVXuhLzb4a2Fh8g7GaaLsg1DkqlGzBwgP440fPK8bdH68WitFIDRqn_vDgD62b6eGyQCR1cQktMCK9_GaW7UGs9XAP5O9wMcmrBFFCYNouvzAzO14gSVfavWOZNFDYICSmyk01Ha-Gjsx9WKD39dxXBBVu0h0_J6zGwXKEAnNlIOaI_0BijlWtPyUrxzNUgEjgA3uSxHwrrjtkN5yGZUOg2SHPR5Jpe4fLtMHux9Lda557-4-7K61dVJev6INc5j4jOCQyhF86vHHI4QC1S6YfGUkSythH2181IBLVo4eMQxTSJ2g7ErWmxYEZXMYSIMAQbM7FW9je87pvspeFdM8VQOnsGSpkcKFCITwIBoHLPi6z-pwsff1rkkei0M6sqP09twu34zHnI3fWiabPTlYlfCEfi0gOJMxqkEug4pQh47OAUdN-EGMfOy1LLeYeW4BIiMXplg74s8KKLwOkWtwX4gd-jDzomHyzVjJ3P2Yg3E4Gz7pkVLuFzLOgQ_XCc13hGox8pb1W7GXTsTYlqi_2CXYgH-KVZnq5OmxKkCLGeuIddLvHV4XYB7mxqv0_lrrHiHhUh0jeBR0JonDyB9H7siaKYRPSCw	{"<a href=\\"https://maps.google.com/maps/contrib/109034312226304403308\\">Cristian Jaramillo</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
479	652	2368	4208	AeeoHcL3EZu7HkEP52cirC70wGkDjkCo6NJBkzePrELmxhruZkKzDWF7sQVCz8J8fxMkJGz3iLvxyjZFAoLDvF9TqbqCBraKrIKHl-RS_oy4hy9nFEcaBuTZN7kX5RE7ejctFn1eh2PRqAfIUU5fTPNikK6WcHtOm6KGAUZzZusg9DrVvO-DsKj8U-RwvWM-DevZdWkoJemF1wO5LdbAbnU6wtA6K8C_fZXg8h_QIsVgU1EnJHY2_FwrZinkO2jkKjZCL89ned00571D7pAh4WYsPxULGhu5YZRhbjZw6Jx3aAYliAw0MAD5x8cuLGAWx9ggsE4S27SJM4iEom2zQddOWvRGmwNMv-iikbHo60QNRFvjgES4lKg5EJBAHOTmqkj3TGWkoea-eBtLnMQgR6KP1BQ-eXn5Qo77ikskDug8wbzQfAlFUMvqBidVnDL6tSBPOGLg-AMN3xpFURtmGFQa6xc-gMg0KGyip2A6oH_eRyCITTiSSAuXVP52Wyev7or7X4wNPOEhGTDEVDmBDII-v-NQxy_845s07Is1TyOYGENU07KZn5z7zMG5Vwk3urT4RNJtkRVEbN2gj7pMdByQDPSBKR2ELTsKhWVo8EVp44k5qSB0Se_H8p7Urtwo6hpwHPyOUA	{"<a href=\\"https://maps.google.com/maps/contrib/102271825456681400834\\">Rodrigo González G.</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
480	653	1488	3280	AeeoHcLRD8cApGHIBEJO45dhHvzsph2RqEoj6us9kxlmYjl1CM_JxRse2lBWf612It7NThrr6aQlRCUCBRYvTV50lP3o_pyLZJPU7tnPCR5awY2g6O3nkNoeYp_u-Xk8b8VPzO_4uIPJe9aSb45mRgeTpZ2ka1zNr2x9Nrw4ZG7y6etycKDTEvl4pDqM-IQJ3nnjaKU0Nlg2oZ9vbTXLPhKXx_SW8tAERdV37G7XQsJfbLszZwl-rujBo9P6rS5R7GOkFHEm6UaKY5PAk53rtlyfLrnCzF0E4Os8AUB4HOnSnTJjDW4qqfZIi7NB7k6bS9hPFMubWqrl7f5glYq0c_FPxDclaBsAO6DbjL_0vSHVsCpPFvUbUIA30nY4e5JNy6F60u-zLzXwH9Zr5hukHjDBfkeyk10W2kpZroU2iDJ6gyW7FhVt8ojiUk9XP3skdjN_kftSk52FXOm4KXEwkdhixLIDmM1cOZfMXeie__WUR0o-0Ck21iM1vypFKj4FQZrDuUGN-ARPzNN8Kxt--h3E4x8fUXeYozrn64p9hL32aTML7wcUigFyCqdOunX4BzlUzAC8p2IWc5l4fON6jpY-lxMN49C8Ev7zo_8JX3QelT6ySed8c3EqiphVM04gdNHhADHM0A	{"<a href=\\"https://maps.google.com/maps/contrib/107048418215709942697\\">Felipe Figueroa</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
481	654	3000	4000	AeeoHcKAf4YXdGcln5c7SMRlk6egVvywfdS5MjHYp3WTA6bTmHZmWXqde3ROXgh9M7AHuB4w3ElKiz11IxMJwjQHPl-Labg8IB4RS2YAAMsOQlvLd74w1Q57GZV7BtukUdGsDhoD_ljFAy44QjLuPEtYRIkWrPGQj73D19mzYi88VGaCb7ZWF62OqNqeIzew4xefZZStmGeJDuPiKc098c1t9Ye83I6QD5H46JtU1LEatpRjAEBD4FdQvAURhGVwfNMQ8uiYiAftNkht15P7DUJpeRkyAE8pxLW-pB1RwM2R3u1BV9arcmEWHiO8RSRS-oWAq3wRPgshTueTYtdECrd4uTFSQV1_vtyoICsZxZ0z9VegkId_zPCQ3D7RRXDga0E_tjwvtGx1nVr2yfooz7vS8NmaY28mouF6Q-nGt-0HDCvDZbeaKaITjBmeFv6JdJllx_Wmpo_HKvRNfe1vZ1zTx45xz5bf33pzxMMKvrO-6p6LdismFEhJB50abzF8Gq-0EjwckeRcZDypPosWhu7Nfd1Jj542AEgrX9_mnlh0j9dleOjx39uDnmkLF3_fVGa_68ULH3xnz6YlAKAGM8OuhRSf-I94RJ0xMkQzmE2zKxK7KrkYaYPLSzeF80sXzTRHyJH1Zw	{"<a href=\\"https://maps.google.com/maps/contrib/114328915180091611411\\">Jose Lienlaf</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
482	656	3264	2448	AeeoHcKzHxxMARNqpKbjjmDNu_vxJEcr4xL9Qsxc5ZQqZhTsDwrjiILDygSOuyFT15s57ilOfzFVHN9pF6xUhCqbFFRvGMa4NoV2vcqk9oklCJbloLMr4rbCCJ79N1helFkVy6zJmKfedYHj-bau981zPXJ8NoKqqN9z0_-BeVcpjIsrr-kdaTglBc2Vp0VqVD4PpQ-feAbL-tI9tIF3-C2CZsZd8gNoccgNYxmqMe-EpW62d6pEXiL3KE3JV_W1xQf7oPpIUsbtp4tlaPGE4cHA9Zxk1bLGmWCQhRGDfJhOznkjrbriGjSXH-1DTerS7JfiFk7AX1blqupmT0AZJhGAlQ26mpNNtv_1_eJDUyR8bQ6xaYs6J6Wpt1oPI5Nf7dlwAGP64Cbuh3Ws04X-ntlMJOZuah5BENPIAlF1WPS0oi1SU_Sj9PF5kk6G2UNJtEZw8X9XiJyZ-JZikM73j70bUa3v3JHJFtYphjGdPojRqDq-DsVzO21lHcq1E8ifJsKC0s-erU18fUd1QEvcWTaaRO5rKb1iyt6PwICTUHNbuqMKLlZQwep_vVh_j4yKwA9JPaRDYYaHC8Ep0iPNKgNTMmi1USiM62EJHyekP1Vs0WPUlmy3IDztLdAPfYCx8xUa	{"<a href=\\"https://maps.google.com/maps/contrib/103253128967067256166\\">Carlos J Pérez</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
483	660	924	1450	AeeoHcLOyFvnj9HFyiWBNUbbdWG078cy4AQ4GSPylbwwiC9wHVjqlWeHoKBNDLchMBWP3nIwrR9SKT1ws3w_Z96-z-0peQvwDxW2UW1rHXk5uGqP4u_ZrLld6mHQ70pMNARemKW4W5eRPqhMdnyKg8sf8e7EHnF70RVF2URy_lSjhERTneTwoX1MGsBu5XcEJVAMdZAjUlaub6zcCHGavwQJw-kf3MLrkFQu9h3rs19KwptDn0-Ud8LKWJIcEJxzvR2EvMjJC26dM2GzcRNGwQwWAejimYN3gSKtDSGGJBEvFmPjgItcp5w0wWmMWS9NIm43qgl-6QssJkI	{"<a href=\\"https://maps.google.com/maps/contrib/113764085483057790422\\">INNOVAL Centro Clínico Integral</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
484	661	810	1440	AeeoHcLZXNFcKQiNv88zfzP3y4Pzr7s0DBOBJR05WC2R4BrbODnGtFA1ur22yc5xW5OYPrs6NJVInpfcs7r7naxw8SJp_ILT83U8lHpUmZ6C5WvR8kxVmPBa6pji9sWd3uCmbetCP4Y_Hjj76JX4eO5TFMaaZZFcMAxx-fT88JfBkbGOFfGRfKRZYwVLmq34bH8ihninXyXsJH_4k8LD5ORENVYiQM_4O74pTNOA98THCXfAT_R3BBPExFR_TDamglnsxuZB5qLEMIWkOjAOrYtY3QH6O3wfElqo_Nz48r9nByEgRtiU_R3u-h_gbCpPqyYWMU2hLAaChwY	{"<a href=\\"https://maps.google.com/maps/contrib/100477527623461879388\\">Cirujano Dentista Matias Guerra</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
485	662	1080	1080	AeeoHcJf2eepIGgvBXMwjnreoqzvaq3BlgOtEGhDRvnNJEakUiP9lMworPbQUqBhl_PAMm2w7vJSJsWdveu8l6ZWtA9q1iiEBsUsM9Uzp9jFe4JofYt8tJ26H31XNUpN7BHqpzjQzKzk7ZCz-xZMG64z6r0pxKZYRlCb-bGLrLttIAu2KGQlD1WrN804v0H6BOS6bRGNudYx0c1l8tGa9zXZC9iv91ELicnNeVrW_xOobAoV8iKhUniBYBoKkjK9w4U14y78DZDpPmAsCyuOci7dFN6Oqn0-IzMlxPDKNrEq_WBzZ55Q91vd4JOpt5yb9ZgPpruoirNAdok	{"<a href=\\"https://maps.google.com/maps/contrib/114602681269857783380\\">Clínica Dr. Castillo</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
486	663	4032	3024	AeeoHcKs6FYoH4JlGyDObHA6Z1JOQNSCpCPjx0h27O9cDdlefSldwzm-WRr0XXYnnYucUhxQuAu1qEbzKCW1DkSAicHbI7TFXCoHOXOunfveRQ1vskrAroBCNPG8A2Wx95tEeQIRJpy4oEwPST7mBCVqPQTCcERHn8tejDpyETw8wYZXNQNfEZ0-zjp1tAM_152OnIApTHqP0FhOajSkyuwhNfHRSqm8cPROBpsSJldHirJVVdgD1w_78lbPueSdiZpnQjJyWUwRHHtlKK5AbLhzZXCmZ0R3-WOoG5BVZIdWNiBu6c1vFf9-Q_HGsErggJ1UztHtGzD9-LU	{"<a href=\\"https://maps.google.com/maps/contrib/100817387387588331121\\">Dr Claudio Villegas</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
487	664	4032	3024	AeeoHcL4UNkdiTvFxsNMwxASOqfV0dYvT56eAPWQFuBmEof5utfppgGpKplpDVUV3PPmV37xcrusJt8UB3rOFJbsPGrf3vLxni8SrOqjnQzIXe_9maA5D3figEknT5TicMVkP7uGAWxVLARS7KGRvvr5e7ZGptnsSVJjnwgGTH_r9u5D_hwfQUJU23ra5raUZ1THqE92mOOi5Y_mBqNK6KrQ-LPc84_MCDsZTukQ18x3VKGGnKOnZzWbMIJX5bwSiPbUTMxjTEo686Nre9QrhToiiWjsmocoXIjc74iRUja9rC-SfFtWRH3I37QFdRpAxGblIZ7o4mbzqH8	{"<a href=\\"https://maps.google.com/maps/contrib/100385910405644114058\\">Clínica Armónica</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
488	665	740	1012	AeeoHcJK1xp8qTjnPLjXk6DiRLLWJITOU0ByLg-PLbHu1WpVgFvoqsoyo_VnXdX9u6INAAwL50xMnnzX4OQyMQURdZJcHcwjnWhabyYYQdLJzQbbh2Xti5HC9vmRhgdd4dKVBU0vxKkmJYcdfs48HpyC4fZ9nLI3gbUOvqJgookzJWW4S285rna7QOqysJEZkLe2ld0TXnLO2RRl_mOc8Jk1eGzRx15VTkZGFzIDP1_W5AASdJKuGXSP-9XzpOFPjs4H8wF7PrgjKHwKSSzFkp9TZ4fzsdwUqVvo7WMxwOSyR1NpSXV53N-xZSbLQa1ODPoyPDa1DwGmZ1c	{"<a href=\\"https://maps.google.com/maps/contrib/102692784054675544879\\">Isaac Quero Ortodoncia y Rehabilitación Oral</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
489	666	2160	3840	AeeoHcKWii-K239qe5r0XG1CDHX4f9qpLKzEYBFj4mZrAyVGJJQfDuE9jrVrILqUilHZtucyL7aabpkfCmUXGwjgEvFressIJQ8HRWbJlfK1VgwwQl0sFwx9MnMdgvMEQXWozj_b_DnXc-cpNKR8L2EbcU8BPhvl0X-GsiUX5LNs6zS1An9aMaUU4Elwbr9USaOUip7ceVj5uR5VHC5DcSnBwSaxTV93YUs5FbtbY7VG92bZ7fwsfx6kEO27JKG6PMjbceCxmQ_q3ngVlM-P_i6zpBmUJ6QpiWTCkBbIVqzsSwoyKinlmjOWG_iGq24cD5-Z1ZqYwT_-LaFyaEkAtXgPikSl0DGtc5MTpU9yJmEaBvEEn9us-05u0fCpykMJH8eIbKZrRoauuCjZEW5HFLpoo0qPif9ZYqTGckjcDevgvrHjtJm8b9RSCPGB5XqQPzoi8g3hiR_YteRStLaQsC30GL8JZ_YmAaUjjvcJuf4Ais7ZmP5uVz7Z4yKZ-J8xaZx5_BgCA-0va9j5nVa2b3UTmjifYKCNI0IbyyzaGBJmrSECdv6iYrlu-a9BWKNF0lkTRCL1MGPL8sFH8eERzka_Q1S47Q7M1euXbw79r691BsOcKZ4qelK-2NfX_mPUS1bfv3JEwA	{"<a href=\\"https://maps.google.com/maps/contrib/113513661553609513410\\">RULO</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
490	667	5220	9280	AeeoHcKihjU13VRk7916cO3CDxaxxjNX6dhtg6tKaR0T6u6zVSQWU6zg8wnGieWSNDjTLlpIRdCMh9rVCCU0ssxkFgAGig1WlLlKRr4l9yX3abl1dAgy21V_JDw9yKrA0ddKahWEWgPt-TWJHLS9xQw5-efOBdkq0cxff8R48C9PAiaAfZI7beDHqAvslNFITbzsQ9vztj1Oz8W0tu02axDMPaVZbNGdnzK9mpfMmi_6hLmiDcvttnSgt_Kz5_hNFEmVy9q0IhwEjhKYIa1hTc5KFlDKJAtq_5r1eMP9AtpR9HVcp-jrV6cImxMb_hpaKTIlvPvHUnU_Jw2MwUDosejIawjsEJrqvOrkgvkCeBbUEvFIyStfbG8HEuqFjlUfuL2Wu0fUWqB4JF3pFABez6-Amt8bzTzbEwNVldYBXsK0WnecVldehsdje5MKdh0NoAtxp1GXTEMpmMtcSMON0z1iSr9nxdEPxHLzoKpLtXLiOIYIAe7HK0q4Ka6WgNWrqgNmE4TxNVLXfVtA1a7hBGo5ftuAcBLgUu8Vs4vNi_OlM95zE4DpcEBGZIvKRKWry2kOTc37q_dCWQV-vFDJRN7QzJ5CYu_8sHyPbFi1oYUMjRXvyDtRMhjBAbncrwx_ymE1Crvx5_QV	{"<a href=\\"https://maps.google.com/maps/contrib/102271825456681400834\\">Rodrigo González G.</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
491	668	608	1080	AeeoHcJlaPZhqmMEVzKOy-CyqqHaOt25e8bNGzhxD2tK68qDOymU-kyh9LFXYfrFtVKblgEuFcTeCkjaQbUm_CYa2Fm2Fb77eAEOlTmHQiQpl9nCbf_wF8ltkHqnmeeMm1pFB60P9yMBIKrGzBvGRZ1zDX9GpKAGWGONztIBFw1Yd_jXf-nZ9Ark6-2rTk5gLa7Rf3j9eOdH_2ck_5Q7BbQH9YRjvdOc8CE2EP1YDvpKQySw2Xe6hlzF38_QNZbbO5Wf_f8Wzo33K6Dctnih9XCPSXXDISuT2JZC4s-LP1WQqIaQqYvEGOFfM3oj_IF4S0-Rp6ftW8XRKdA	{"<a href=\\"https://maps.google.com/maps/contrib/116971794071004822653\\">Farmacias Ahumada - SAFE</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
492	669	4032	3024	AeeoHcLgJ9gkNtH6txP9RLSyjopoxNsZ15OWVZCMVEUE8TKXlEQJquwJnmJW8HUdQqhUZnH3oJROQGkhP-K5jPHAGyRBMWpoLEkXvJVxJya5BfvQJ_wTyNY2mmh2j8rM8pMOtmlwvc7qDYB6xX3aM9pIBhyFU0-6aWW15qBz4AnoI1tpKADsMa3lcnOHI7LjJ4OFt3_NuvvpW8f17N8ZhxKN6fD-7y1gS8nE-4yJaEoZ-p_jOQ17G2YP-bnB8RaRd49BxbPkbe60yss3C6GTeCqu68SnhPTNbkOyub7L4VIQA4F_Wx_frFnTO3yQTjGTMWx5gdGDe3sPgIsiWnLXM0Vyj71GTtJ8yRhCm0Aa9zEk5aJUBoHRhggibyxbM6lIq-xdSP0g5vrc0SaIwuPUDIdxd-L-7LMTfLWSxq2vKR6SefyQGsRU7a26qPJTDQcqQEZ3BV0ZM3ovxrBzDYcbc5YVM1lXMY3A3Rwv0i-v57MYvzSLoS7S8uMPMo8HuRvTpicJlxS89mdfY5HGaZ-ikPdAJ2Nbs0fuwC1-bMUL1vVtnOzWe-t-iKAIwcZJ-Sai1jRWnezm3xJ4jClSWHxkiDvI0bd0e0RAkTwTJrEEGG1RWhjzsIxyBHwb7baWoPzKUxwtFqNm1HFq	{"<a href=\\"https://maps.google.com/maps/contrib/101175675036998006760\\">Rajeev Mylapalli</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
493	670	282	500	AeeoHcIDhlOiQ03BoO6V9gBzHSwSRuRCwffxo6SsZYTHr7YLwqAroAO4YR-0h16Bc3WPCn0_leH211Eqc1DtHGbrZquhke5nA8v_SxG785Dsjm3Pg9LcKUCvR2x0IIxry0TmyBPrAmEj1U-IKaR0LRyrTFeOgwfMF_MmANRWHJRDHGMIflltfNpd_YrrkRuu2QgJ5YMCTkwKYwhVHV92Yg1rDSkBABzNWVfyQeTWQJlYd8Uj4iyKe6AJHVvfMDDhfUtWkENBnzZGbdHE_nhiFe3QKIoS2hqIbZeUNYxWwPMgx6hYo4bk9KrG4bpjsFJn-6UPWZ4wC7zMNfA	{"<a href=\\"https://maps.google.com/maps/contrib/118423789442560997328\\">Farmacias Salcobrand</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
494	671	283	500	AeeoHcKGGkN_J_V-a1syPU_EPfFL6J6uudiDoTGn4s2pXgA1VCshlffA31dCWqk5XEbStytC1v9j9oYrIa9Dy-ziiTgl6ojTeHtqqH5luu3O8c7oSDBl3374fqcKGbc8eTPRHOLkWayusBlp8LYdW94Nz-KKcnUKEA3N6kyE5kjs9yhjNBRqk0FBqx4hjNA7YKdwXzgVzu1Jc9iz-HV-u1mTZKGF6KINpnst8pAS3eSjXVCuEzfg1lCIR-4zKc7kN5hK-sXOwXXhicdCeK3bopX6AOFHjEPc9s7reVHVbM_3HLALGe4o-0Lxe6Q3CrBtHu4A1xTBBImATRs	{"<a href=\\"https://maps.google.com/maps/contrib/104711408594379781820\\">Farmacias Salcobrand</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
495	673	3000	4000	AeeoHcKdhnOWMD7XAXMIgrnifUYuNzGH5UGeo6bPGxOAq_AqRgSqu7iRCTwpEfGLJEWl4XLSQ9krYAC1hsebEBP_15wBQ4-H8TqtINB8Wf2N9dA7dYNTdgkZdELntwB90QnQaxQAkx8tDtx7TqtRvTAIiXC-UQhOxJGJkHT7_u8rT5qn_FltCJCbQn8dagluhC7ID3pdPhTg-5QQHUsVoEjJs90wWTY-E9h3nub1YnplJJAbq8a6MDvq02h4ZmZntHltSwoHYYEb35XOZVA8t0P9n8xL4sCSivsvUH0Ng-HNxUZKPem6KJ4Y8q4Hby8oTOgKNmFejaTdrP8	{"<a href=\\"https://maps.google.com/maps/contrib/107916521826315245746\\">Farmacia Prat</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
496	674	1080	1920	AeeoHcKXA1M92JG2gf30PzNYLzQ8QnRefvSAzuUHAC30CYybX9pjlElNjDhWcAzw1IhXnKmlSsKbQjYLn-9HilW-VlNHk_Yktx56Wy_cvh5s_5xKjv-9v69_Za6le8eLHOPz3SS2vvWOF90cBBcMser0fr-PE90KsPuE9JTbVEt_p5MHwrP4WL8IdI4TfTxfBjGNkCtwz40PeD50QaOxCiTIvFK-8xBvdnu4P62PYN43FualBs9Jro1Omm9neyOXbCsRDzXNjOlRaxhw3F-EU82yQnkzGb8yaSG0JyyfpQoc_6fPjFTKpl39TjBy0pnwx3OfqdZn9i3PPRfT18fcmb_NxR7QbaS2qeaScWk5LDwIXIbyztM9Ta0l2f0CDP_oy-OIZ07eE0HaXuhduL-ap_QEq4Naj1dVsbH-Gzjyw9rmB_V1-kiOhqWim550cGQtomK1-rRtiE93FqaxP7WvYslxoqsd5JZR0DE2kd-gwXplFIaDAP_NIMYT-nhOoZC9cvumDPj-aVVocxC5zg_nIDW8-F7VLxOVNmSN9HT9mMnYnntMZzn9x7Nl3SiyYvhOnXUPBRNIoHfDeJxPYeqo_Fq7kfdFnJs9J7jJHjAdDajSElz4iq8edMlQbyclucUE9Hh_-vJO4Bid	{"<a href=\\"https://maps.google.com/maps/contrib/107200358553142664497\\">Jorge Novas</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
497	675	283	500	AeeoHcJs-tPR6BFipZ4oTBjrCef128as9o_2W3AEBDw4JJEP9Q2eMNeuxkTq16VTJcD9Kktb7tJ5PKbweBe1wF2g3qh7KesVG3osDP2qcEUfaf4H-KjXKE1YOXTlgWJ27Zdkp1VqAYBqKzJgrWH-VBe3oEAvFN9p2EbNHR8JhSflNv4Ms5ifz8pvP4P9_aH2RwKcKUj7USCdXjxoMSZWF4twqwgS3IXKw2vzSrQAQOS4IvA7Wya6Fbwh6xOuzYlMoDyXPzNhoV9C-G2HMFYw2g8eCdcZ-6WycWByg-JjHRBo-PXIhxeq9ktPOU5eznckaoqLiC8SOvE0s1A	{"<a href=\\"https://maps.google.com/maps/contrib/101559368461664632054\\">Farmacias Salcobrand</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
498	676	1080	1920	AeeoHcJ9ZM9gDOAmSJt86yF8GTxJYmhTAM9aZJOxf-w-AVWEjgPhBaZezk1TQBciGrZ2crcL8Afr_iQGyWxjEMuShYnIUDqLqK-kkzCfD8VhxAJnGvSXvWLHyQ_CAZalf5AS3bKCJrBypqURpbwfBbQgoiN0iONzRhn5Ks2YmJfKNHdvnlJV4iUTxS6zzUFS1l1bzB5DiBTDR63KxDXgP2KQ0AagB0t1ACeqqSpvfRG2My3K4636o96Zh44ahqu5UOkJB3U1E7IjflD44OTJRvo5FuEgmK38io8s3wnnkcMyfcjoKchw07Rhx65TRuyfeSBeA_VSlZ3dezCx7ByiMTbv77QPI8y8qmaiNCSCFqX9bm74kk7lKxvSOQn8omxFBfAqXBs2bT_aNA7gHCymPpyfqCHo3wVNo9n5Jj1SpB311Qmqam9ENO3gPCwy-W0Gy7Y7tI1faFXnGMj503MdCI3KZJlxy1KfOZg3bIxnq7SpYAXoW360x4Whjv6kPh71KxsOkd1FoY09YpzHEy6PxC6lq3o2_hzxtRHg0NFKVb9iFpiLBm_POJCQTr0Zu3djcxCDDR-vZfntuUtWEyZJz_j4vISGy0_eb9_XDP0kxTJQ3E2vH1MSX09AUIuWSjnQrRAvIhKADQ	{"<a href=\\"https://maps.google.com/maps/contrib/102226415225273996820\\">Edison Ruiz</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
499	677	3000	4000	AeeoHcJYVeNDSr9DU280xQd6fOOg0lhTpmzhyJx-9lLYDOuGZD42C4FODuxEZoWDyWjfLrLlh6hP_uYEHoce3gy9o0SscPjVLj8F90klAs29f4neysCi7YEhgI2eEYPyxa9v-8Jkua75PGRFB9OuZ5lm5hMZN1jZU2X2TeZy11JYzyCP9Aw6REDE20hBOkP1M49r7Tk8HWpW0eCunD4fKfqlq0wD-qJuYKjGKydWIvBj18IFlWt376ujn6gvMMl-atF5vhnSfMPLvEgZbLs3aNyKlsIdJMOM0xCN-5KlSQu5d9Jjo07CGHYWBZCW5kdQw1ndmtoICEp4Uo8gX4LGmPFdoctBTmCqLzcSi7ZrxenQAKPLKkVwsh-xTPuzKgAu2ZdsPKy9dY47DwpN8y0dBDqnWfGvvhkAb_aFhMcUdt1TQpI9cvsMKZrGwHVwJnp0eT3fnsKV_0cn8-YaLgvpN_tqKj_cUil_8P0wBD7AzbWukZbsA4YmdQrqN038WXSJVvvJZwwI6XBujkdNv7ybTqlH38p95I0alJy38RzL7K9pKa7Pp-dCyzkPc1NzoZ9YBqarvSGaWz7_3_0sfl482dPadMTYKdRfXOz6f4xF876g8qW4p5y3M6G4Z47S-4ILhGdf-Liv_Q	{"<a href=\\"https://maps.google.com/maps/contrib/115459732730453500375\\">Benjamín Soto Rojas</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
500	678	4640	3472	AeeoHcKx99pDmzInIbhsWS48Vo-l6Ecz_vI_spgyOO_jsPUFFv6mg2ua9kVlI755itfFfnPyN5wH3FIBCQiccLqJul5TVNnW2BoQlnmsacnY8sLjmcSsmOlFig_R4KClazyZ8egNLoZodkPBRy_xsNugrTvJ1UjRZ2c6cYlywhlyqUONBrnpwUSUPjvSnql18eYLKPVVd2Ggsm-vvcnXd-Wcf3xwNYjAU1ylmlF_NoXW8L-r3PmX8V9iEyFeigc5a05wahnDP3JXTrmpRpU4gTQQA2ckEXvz4aWjOoDpR9CzGe56JKat-HT_DZ-_dwLOAsIylHmkxxzQAv0DDdcKUlE4iKxK4vZL6arXAYJ7LRV7xViv9nOd6dIQOZ388jdEhNqmGynXibmD8UA0gYx9bWX3kECD_Q-xEavcdC9DU4AQnLapC6pYPpv9kPF7GcgNHCbsT8t9gorHmD1qiwa8dcs7mrl_KFer59CUBG0q3WVrbTyHndG1_hrojYeUSK6jrALNnnUjCDDFPVrwZj5-44haGDZozr1TUSmRSqigL3X3Wzyzw3WQaPIwPNcdXAIliz77pFz0dOKPyF5Ga_TO22OlJBwt2og4eXOTXvFu4IzFF-LWprp8T1_RSLZlNJAflJE495i2F6Wd	{"<a href=\\"https://maps.google.com/maps/contrib/102271825456681400834\\">Rodrigo González G.</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
501	679	984	1267	AeeoHcJ4G4U0P9FOZGxe7u_eXyKXIHgwA8D60JkHboSvd6qFYe7nmCEHfaYRSRMptrVUFj5tof1pxAZ5cRxmHE9lGBDi4LgR8U7br6J5iHWYbGgdaPQy2Zzyebm2M1LvfqjDHQd7ChnlTiOaCwLF0C-aOIwPl8NC4Bj81Z_frMJa7bB4kmcPXZ0j5t9RBPd-DvvnJommOFHKYukir-vZrAV94oy31XPDOfcDZCtp8ceRZCuR3y7xSsjFymScGPVH41TU_lX-wZZSCvk0o6lgO70zGBdADa8RBQmHyZWI9fiX16Pqv-F20yUNnUP0ngXi05phJEzKaJzY1yk	{"<a href=\\"https://maps.google.com/maps/contrib/112441945457979499193\\">Farmacia Central de Homeopatía</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
502	680	3839	2742	AeeoHcK6TluSur79JpW_vUXXoQwDCMTxRqy4r8ds0Hph9G2aKaFw5gtcsr7vQt79v4XsleFioD96870HLlVP2mt6xnskmFafsMwM6g24ePe7ez4xnRYJh78FtXcL5Xjx5mB0JNbzhGU2_LWCSAC7x5f2YIgVxd3TjBhSKekYRuOwvXXm55MEHeZLLa-LfR4NfVlMrSEBCdGzy9uclxO-IIbAV3gmW2YWfqUGuZOYx-mdbuPRnpe2kEu-crZTwCb2pYDEiZy97y-5eDuXm3K5WZfEnVxiWc4DvFK5jHihVqyTUw2-9C-ViOiDrjOkTMuTCUpIOdRg2JjihDxN1Ivq4WuySHw1RXA3S1r3K3rjjNNOmzXw6tgnNmfTupEp17FqZl8G39189VJ25oPXog72Vj0z4bDTMNHBKrUzjSBrh8s2l8gyAuDLm1pLrbxVqcjqpiywnLA1wENDDtLE5zyu_wuDrMV2JZ9lydxZ1Y21gP9BNeTu_NNnaY5MYs1mONqJS90mLL2I0-i8OQ90nbFqZDJoPUnGcKhD8WWT0VvJ_U87fr4_ethIrtZ2z8pQIz0-_taHUG_Yhh1sg8f3IZxbOBAgj1bqOxyUUT5oinvyQrpquWBXcji2rnw_nU3wcxSzrQB9jZQuSi6s	{"<a href=\\"https://maps.google.com/maps/contrib/111535953182385780037\\">Javiera</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
516	697	2000	1414	AeeoHcJoIE27JzFgolIO8RcwS0cfrOQCQSSBnydD9syBMh8Zv3NbgXTvXKgtyZIBqmXw6m8UKfLT86l1vuGrOqkpAomRv_BMOpMwkaRch4eVjvLeCcPTf6gShcPa5V5rVrULEJg8YGSFu56T2ntoR3b9Tv2IItSBQF3Jcv-XlTfBOy6TQ98eldNH8HwHNYbuzGrRmLqanALuu3CGo9rqst0H-TpgHQEGRgS8Ia208RKWqCAK-E3eLlvHmGfXgiimwK2pNBGuLOKkWilWNGDw1BUG3WGo_W1Bd74aN48tY4xqQO1fgZnTFEfPWpd8p8jUXvB9_FGqk3o9MWQ	{"<a href=\\"https://maps.google.com/maps/contrib/114978340803625585826\\">VALDISALUD PODOLOGÍA Y ENFERMERÍA</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
503	681	3709	2386	AeeoHcLRNRhUjST6OZxwjK5GQK2yhUVQa8GH-y_lWq7n91geR3VOx4KjHv0K0XKQvuWwRki8M_tGMhlEW2PeStD87tbZzObPKr8Yjb5dlaSXXhIC6guw29lrCj0VFWvl2t-B-t1x3opU-PqNUiAS0rPm4nrV5sBVwFr2KG8gBodgruFtvPw7r9-YK3AG6Kd9ENG8wDuQdU3QxDM178Hjx3Yy1NfVxAFnTd2eaRsjH5f1yrYjb5Qv7S2oZM-_Afn4LLKVLdJ_DdFXUp8jpAJEDmUHrrN45VaZFrLdwoIUBCCDdeVrnb646YArZc3wk1vnt55JpDb8NyH7xrrOEvfnZqa6M3fopE0PUyiUEY-QB-rWbbwvQTnLfPeQuvItBGKCKwpJIbSKJJmuOzt8w_82Cs47pbMeGhJFafOGzcXz-CAXApuLPTQuacWohydrxi8CwqOjOF5eVyiYkfEU3KHeZLbFEkRQOtUOHWPlRYXmlZu6x8nRCGI60OcwGeWBcqYsHSDHV93Wd-o0e3viOdqSm8JmWc9uSUgWdf4KQvGLdxQAOKFABWLoaB6z8bDYAx9Di26Vyg_UOvg0LmqnXwqxA92NS024Kk9uCjbxwtiOssRPTZckMDrHavRAsEzmnT8B28gdG_cDdA	{"<a href=\\"https://maps.google.com/maps/contrib/102271825456681400834\\">Rodrigo González G.</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
504	682	1080	1080	AeeoHcKE3aiGOP5InJ-MTYHx8637EeuU7b8t17sDZe3p2OQ8h5tIkFMZexX-NvXBSo6f-RpU4NS4tpWt7ha0tRm3xDag2eVNsNguEJZTIFvHvAEHRSklfW7cCNMdSeIcA4OD7LFIRKjh22RSLeIOagt-rGVV7xPcw_z9tpFgCkv2xNOXRhx6509fvmJKYIt8lVupZiFPOioeLzArUnzCbJFIlqNlyzvf8JTbVatQAL3OF7azwzxzftxcm8CPBIHpjpjnpznvB8c74BbndrXRIDc35AiIT6eJnYIETnJJVtuMUMdA03wrKo_mpBD2aqE14UCl7nZPwVPp	{"<a href=\\"https://maps.google.com/maps/contrib/103357256193937902936\\">Farmacia Los Ríos</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
505	683	4000	1800	AeeoHcJqKPXgRN15ZJ83EFxuJ2Yixmi0gWDhropwWLn9E6AULoAA_Uf0QjAzVHuHmH_72VLzoGzI6ZvJ88l1PCmF7sfvmIHs4Ej5p5ZToE1guZfz_L1ZQ8YH2frMQlf97jLb2ZpOKF4ysNMfLwml6Fdcda1z2aD99GDJ1F1kq4q1Y0E41n9mLLcgbECJ31SRWpTMkiKd2PS2QoBJH6JUWbbM5DptxcA3bQ6MNyWhZj5j2-OWlWmR-_lty_eymHuCSUa0sGI-X5zrMWoDVZ2BudPvJ9DS70eGQC9paF39gzzMZ0AUJ21pW_n4Xn1npEWiVDPN-9yJWVoPl_U0hAGAD0i7O2AVy4j3mDe77yUu_lCznM4FjtH0759KKVW6Xg-SJIMIh6Rc57ragD5Fc-0wbxyn51k-I1U07W4fiV6NFepJodlXy9Da6XosZkIV8GteqAjLixf-UxTHO4nCBl26DIS0BcgSKLT-OPofE76IYZc3nsHQwmaI6OQmAKUjSU98ogg8ETPRmaVHOfK32JAmh3U5VsoQ9gxJITTtVjRT9Q8fAEPMD6iFyL5lwOr735Vy-W64XvJYAJoKRhthBbQ5vzeF-27jQG8MMKA9kVF0GR_bfELDGoQk6b40bUaXIQeYGMbX9_3aF_Fqef7tNBNm5aX2vMIY3CY	{"<a href=\\"https://maps.google.com/maps/contrib/103796220795309981223\\">aaron gallegos</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
506	685	3280	2464	AeeoHcKI9huRoa0xA_Nyi7fdPB28wNrFWg3HYWqsWT37wguWRT5clMjqZZeBIiX6W4aAg909ggKx88UWt-n5dSPGkZBZC_MrdzVi_pqZm8j7X5hvCTGWMyCp5SN3juRVzMjyrPWl3yJNOU5Vj3x81mBiuJJu0L4Udxp3UsOAriT639exjpkZhJNI-FH7W4VRf_XVdexWUyWPxJsB48HEnAPsNM0PC8oAbaJpfpCRM8rDBrMvreZ0YqAqQmTr25ZDU4llAWKRSGrjUF-c1kopBGMdDVvfEKTQ6u2TgTEEhmETS_oBBq0pQAgx2hn45l6qc6bGT0CD_FqjMHSbSJkmes12dGB4POS051EOOdf9fU1rGAlMdMgf6j7Yxfn4AmpIs3AVgx9twaWKpWMYWuz0K38N3PfCvXy6v8yTd1p0mLQn4xVtORkKuOCLF8y3tkVNzMOEMamXFP1fhaOhxeM0FKizG_aYtTbFZcrNnkQGAjGFi4kuiSFrep5rV2zystWXsQ7bsGcspD3R1FSfmMvHckY1LjhnGt3CDK8BMm1Qm76FXEZCpU3TipVa1WgJ9keTu374xo02lwT5Aii-3aZPAj8E0XzAUca4n1hq0aAv0o1HNCBK3KoAkgcndyL6VCZFodZ2JOxejzYe	{"<a href=\\"https://maps.google.com/maps/contrib/115459732730453500375\\">Benjamín Soto Rojas</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
507	686	1920	1080	AeeoHcK1szZPm4YuhZPhuUwDhvhHT9HZXbizASx74adIpMHkDwMCW8YqdY7bX4Bo_FNgO3Yweyd14TSwSfveoOxap8mGkE2zqVubrlPESwxdDHzZYCgXfvuSgXKi9q5aeOedefLA76tumTkTy_ypzqEvkL_MOXh3f44X6ZnDiDwbx6lZcDIZC1hSGRLxg2TvmcRI187xudcMe372Ji7BDHpVOvdqt78jUZ0wrEi4GU2jo7LEMMfCIIa56bKSDFAZbz0ehRGITA0yGjLktJzS8MsjhkJ7Z781aDCwIDmkCsWkpCrIYVcgCDb0AllGG7MuFXZEV7CcLCIDNpth4GadFBH5RXXNjUBPEOhq_uuXXYk8Z96o-NgvYZZvUgEXejKDGI2GTUwmP0OhngHTcVsq-bUVl8YcSJR2eU5cf_PQxfWEZoaZGzPFV8EMYo4h7cE4Cxb0AiIA7m3ITObCzp_kf3l8LiyDaiUif1YNyuoTRcJE1o8HpkEiDWjmTmOxNqBmBlYb9DkzU_SJ-tcukHp62DOo-kVoAsRR7ryZWBCqyJAbLIN9p-JTVtMGG-KR79RLDHSW0PEAQ3RmF-gXKahm49DFFHhqxl5gIzaguFHBaYHlGoooZn3-v_lr-wl7sUdlEbZKt8PXZQ	{"<a href=\\"https://maps.google.com/maps/contrib/105360506038554749561\\">Rodrigo Muñoz</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
508	687	3874	6887	AeeoHcIXxkprNfEZLvfKfmYrCorJsTuFK3tv9xYDorRRfMr78wHqj07EAgBFkI1Bzbcq4SlUPz8pmd64TKknSiETiNGxzShi35xzjFsK3NsJ3bedVvz7rho0r1Sck4eIevge8WAUUZaX53gbainf7nvS_mq5KzoydBk6UoDevMs8axCsLgQ3f4Ckbyhq6rl6dAhxkRKDhKZBStbac2Pe_gMaEc4ia_JGMn49bGqZMFJ8guWwxJQxeeIoUAUGuSifn8exw_9fYTr-XF_bYM9CdZUORM0ZeKfMYk1bsgNAcVUGr-eNgNsLYQ7ZVkHWjUM0sf15-9BXTkydfNQ	{"<a href=\\"https://maps.google.com/maps/contrib/115214750357906831023\\">Kihnos+, Centro de Salud Integral</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
509	688	507	332	AeeoHcLXkyksws-sWvz0x_3UySrMpG0OwD0oZ6KUA3fTcu5ddCV0xGvDf-kFncFDonUstx5Zr6ITkrsGP71TRAUZ6Ic_zesJ6Xwt8oeGhMHVSdXweXTemtoU5LyjkBsdWxNxeJMqLauh_WZcOKTGZg4HfGhbsSHziemT4H7odj6D9VoV2elFXOnWxpDr6dmj5-DAj_kYLewyNDAmh-0BdmwDA_R2pVm5wmh9y4O45zVlbXk8evtr76JlNO6E7Pl0vKLDOo5GI9qYH0mx6Ka-Xgny-vHZQ24TBEKJOBDPVJHS058DPnAkVrmF623ZJv5fVOYcIE7VhQ3dFp3o9MD8_PIRWXjqKtDuTxDl8q8XI22w0DreZKmuwwFvYFNjcPXl125YWpmFnN9ru7z8M2R_I0z0NWkY69yRSs0HgHyMNXK0VafQq2zIUC5zqE_U-rTThYcyfxpDaAG1xMZoSF7d_2R2hcBSwF6cRmK50MhULt8WmqofMOhSwt6m1oXcrA8vyryCVQ1QGog3hqLQJqzkP4AWTwHBIdEBtICGTjgnLq3AQmLYhoklWoZY6ulXUkWUxa1MpdVX62VEnepmiJ1YXatGpVSTMVvjktR_ZK4pnKEfrtuG3naWetOgkgBzMIKcZUgudaqviVp9	{"<a href=\\"https://maps.google.com/maps/contrib/101428042732852066426\\">Nicolas Cohn</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
510	689	894	1589	AeeoHcJeWOh4neGGSQXbOYSRcTrDNGkCpG-aBw8xvlqqkHoN2-wGKe_9ZneTO9Ig92qvvo2diqBWWU0q91oFg3pihg26v9HJLX99gCVX_p33abmmfXbk0JTt1NYDDnwrLeNOLrXrRJ3TfY4INMphgZninRb65cSnNoXXUl6l7uGXLKyqi_0L5WL2MdzJ_WtvPAp-kIziXcUuIzqd0KzEDlJr4DbSydjeU0jveSjieq0W578XF2DXGjuhS_6xaqShRUBttw-IEXyRDeCdrDTHYyMr1jiS8YHhETRiAwQyreHXxzY8nv52sIvTVvo_wcpi7xhgsLZAbb4EvD8	{"<a href=\\"https://maps.google.com/maps/contrib/108960622880072838177\\">Clínica Dental Uno Salud</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
511	690	503	895	AeeoHcIrluaUuVNEGYwznDMsD0kUyf3d4xOZEiSQPWX5T70GNOHjMlTOZ2TBKojFjbu8tLYcXUCJTIGeZjxWC_laGJBQrPJgpGBFkn4iPGIjNlTBQ1syZ8pmabf7nA5HI_uhiUL4yvXwcRSYos-9LpO2H7jCPImumrRXuT99uCVNWJFF5VdstGDP3MVUTglGtrk66OT6oKc8bLuNE6eB_1FOzMRY18b7PddWp5qNxlaybrEMtyzCWx5JA7Nb9CFEwrzMbrGsQ3Xu3Rvwefa1HoFRQm8jWG4-c-dfOxygj3X8qWszz5nbP9hNK4VItk7Zk9BAZv2EGl6CJ2I	{"<a href=\\"https://maps.google.com/maps/contrib/107747239237359696558\\">Edificio Médico Beauchef</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
512	691	3468	4624	AeeoHcLBo1KZc9_l8T-XS27FceI6JPCSvY14sQhkf_IKxHSdfELUrU3MoUnAAOVZ1pEwDAhuzjX1rRRcZGM4ZxI17tI3N3PdpEQvgBwV1n5REmhS7pZltEK__UZ5yFt67MwRyzxOwsjn_ftkq7KgoZONOPuueetr36pwOwStuo3l1GJoZVaW5wxpEsiTi-mw-g9mThcYuMvrTH0j6Ukcgvdz79IgRio4TFqVRMsE6XnRpFLFKdSiJnIf__vsDL-FDpEYEhgQV6hAJVvnP7plk3ePXKCUXJP1zIz7s8s75cIKMquRSCpyz_UTltds--pQFoARVA2fiZKdd3EtlKvubGTET7lw7e5ha5cZpLA0a215p4m5DGYSv6NGlg1XYkROXlJzuxm5zqNN32mDVpfMY0O9uG_NHPNHJcCDrpqRA9gcdQc9F1ePmwuXnO13VfNzB6LsgUQTEL-C75ZK6vOQrumczA_YkYM5Dkm8coN-AQ9NJR42Np5tozu_6SvqovnS00fkDdyyGCkjklyET09FMCjkpmA6bpfhVgwR0_D9Yb9k4O_-lDzixRbWFWPWX-LnNmJFTTbDXxoQNFg_2zCROCyLv-x4TMnrPYOs3z46SRHvE1nnrZFiqp34RXtPHvV6FoZl	{"<a href=\\"https://maps.google.com/maps/contrib/103006807099550048888\\">Madín Moya</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
513	692	450	990	AeeoHcI69uKecc6WtNopgrxmKQ_UNybsXqxen-kdGCHxuw8r7knpvTxz3nw0QfHGQf-QO7DNSAwSWaxGzUb2AnG_YIC-d9VgugznQn7vyQzfBKF60JPi8MMH30pvkR8DRLs71VVxmpjI4ZfqX05nSHIKPdYwVdD0Kf2e7cSdks46O8fFYFu7AG2PxmkWGrrGf0DbFblXgtTVOZAG76Y4poUp8p28htDzSnQEbAzYL4ssR4-nWfifbxqNEOLIb3pzHj-vBdKlxAoRreerdymoDMI3mfp86tg5ipuXp5ro8GE1qxpcSDLsY-y1PEKxOC75Vd2Yq6WrKzfeYXc	{"<a href=\\"https://maps.google.com/maps/contrib/102395269291213241058\\">Centro Clinico Veterinario DogtorCat</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
517	699	2880	2880	AeeoHcLKWp9-R4Bgsp4NEzXd0lky1QaRhoaNGrCpUcLHumgQ83Ouw1uC7qibhznOlCnqNWVswK6XkKihDNRzw9w4N_yRElqfLcS4R84dkvZhHFI8qUclHFoFTFsC74PSSWtyPTtP9LtryhxzupB5bopL_TH2HfTFXHte12gCq6FtwDEkyjY6DALhQPJID7KKkX-WcRDz1pfpoecTB2u6c22B7THvRAMnkDtkMFar9_giIQ2cqRr0Yz_EugdXxdoonCERn-YjQ1Rbno684zCz24GL-lC13TwdENe1MgVal2_gzFwq8HXbKXDiQJahZouhGyKrMu-ITReSYRY	{"<a href=\\"https://maps.google.com/maps/contrib/107109022176861506482\\">Clínica Dental Exceldent Plus</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
518	701	1170	2025	AeeoHcLwZhSqqa2CcP_1ryu5Hj_bYisptUOtmw-jOvXamMuwsCoWAH8r7QnVUJGVawaQHE0pr7dc1OhEYLoEuQiRtEb-fTV3O8ntcJ96iqK1-QzhLZWa0KDUndLAO9Jvo07soX47AZeCp-6nDfTu_iahohZ-tPjvMsOf5VYIR1iNvDHOzte0ZsQdmZ0dDOnOTlJW24A6RyJR3omjf-nzMEGjy3eqCTZYGCnVqYrlqWcH_HjNPHVbIffN68ElkJ9vDBRmc8iJVGnRXuYSMbUAXxaKf7ESWOvxYtsE0B-tF3LKyQ_e5NT87lBLIBDrDTCWwvnqsRdgOk_SdYg	{"<a href=\\"https://maps.google.com/maps/contrib/103856353236129803199\\">Clínica Odontológica Linnen</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
519	703	698	1178	AeeoHcL4f8JrJKR3yHblJmMiD_YVCWrE57G2eQDNUJJOJAW81bcDJD3TsU4UX80y9zlLco2fGpvzhqOS3IRrrQcGrSBGA1SVsFRZWATLlDQWjw0UC_HlDoxoDa2_F-2xvtrZ_UMLq2m-0nPD8rYjUhOh6_KMzb36f8Lmlh0joVh67v2bCX_qZAh3xz8tZeJrxlT0nvHJRDiyX5r-gG_8shcXfxhvJZuhWk1b1iHVyzCjoVZLx1yduaX9pz0qactXGc3Cv2izw5hdlqbBPK_-LkuDiZiGuNI0xQ5c7cW2u8Z2txJUq8KTxR6ak21oaHhSta2BxeOa3VQsK6s	{"<a href=\\"https://maps.google.com/maps/contrib/116176921891762857479\\">Biblioteca Pública Fray Camilo Henríquez, Valdivia</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
520	705	4080	3072	AeeoHcIsHnZBnSXGQfrxi5pVYwsvOqc49I_RUZuYrAWKIK5oLLerRu0DnXIl4QORMYvZZjMZqURZUFLS7xbM8U5xylFO2kCSgerRfaE6iIgOBVBgsju6ZQBmG9mF4DmR8MXnQNMNaCbNqvmRHDKTjVk9K6ZMI1eOV3I76wWrF-dSKgWzwPdpCMx_MwOGS3xoEkMdK2SsERdz0P18_U2ujHAc5QgsKZcHFRRYTYXPc13F0h6q5Orl8h46vqYYfcJ0UDV33Jwo-lKEnG9lxZ_ySiw6UjjZa9OqU1voRSGM0eRV8odiL_VRyLuGlHdYKwuMPIemuIGDIchKaC2NnCH5wxyDz-wlLeo4BEZRUIgbG1kSPKRxxtEcHOBXpKz5I2B3i7HtbW5pvKMirK9lR0h7D2cfHkqvqfF5TN4ueQoM2EIP2oFvMJ_L28RQsTxhRYcGT1syQ1aJBFSbawBebKw-bsZ3_WtEHe52rUBIerDvzxHgyGKc7_-CNF11Y5s_eJWb7sk58CPETq8c56_LGNNYVklrVgaVrH8efbodp7qeiLT9WIjQ7hZhXzYb6qr5z1ATtS8gcWd9Vgi5XVqpZ6jPveZm2kJamRJfYIJcOSGTeTQoglV2gV7nk1DX3V8ggIKFnVpP-C4U2g	{"<a href=\\"https://maps.google.com/maps/contrib/101061784778762918902\\">Valerie Barrera</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
521	706	2442	2442	AeeoHcK-c5sEhtwARkdAFHRtynuGrU3HXfPuof8hKMVw5JDyalxQavOwt8X0BOplB8T0LYso1EObE8Vy6P7gY2eUQPB0mkYD-LYJ5gBeyIFzx9RY97mOSmbDTx2JajWq63RJW8yfZfL_gsuvrK25o6kPj0Lf5TIVfjSsH8bE0VgIWZozf49HLNSg_HeOC87TUNBnx1dacFE0-QvJPDhNw82WeVpTNRMuIp_CryXoFuqPbE-XO-VcZ7K9yIG5-NdOt6j1h0dk2cY7K2YPNVh7-XQ8KgfP1nz5mRT_-4_gUxk1yJuVgEPg04moMyH6QxG7pSqkTmpZdcFslxmkRit--sTE8oBt5rc0_lktZeIvPY2t71avDLxFK-LrF8c8krGSUWjToqx_cvQHvyKlNtBNYsEG44bGTUGA7eLsFP1xrwdrThXnVbQGkhOKiLz7ircwp2Cl_qo-tuq3FTj-JiJjR5i_W_SO34JbX-524Rk3yoBZ_e9AomfhEgaxI3XLPeVVttwQq38wXx_VUqvRKODCVynKTEZW8d7T6mFX8jiidz16HH3AXnuF6ajQU2hpp7nqkhZD4tNH_TfQTwWxm55RNnXw0fwvLsL6hCFtmk_FeJ50ifwvUzQxuxWk9pQ0CHkTBouhP-d0vthx	{"<a href=\\"https://maps.google.com/maps/contrib/112864865874707258541\\">Roberto Freraut</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
522	707	928	1488	AeeoHcIERflRDBJ0Un0z7wY4-lO_cevh2q64KtT7KnBsA5zLIwMmQaIB8FUwoNJe6wMxsMw_iSsDlMCJ-ixIclFomT8zKrChtCWMX-G6t6t47oUpSBnLITYlMfAW8Q6fqKdZnfevx3Dqc4Js18yA85QiOMYTjgUWCRJCg3ymVTvc-8Y2wuSe3K463gSFw4ce1ueIgNEg5JsaFYI0rf604O0oc6KlJod3n1r4bS7zrtGtiaL5YCTPzOeMxVmxue6WbY5b5j4pr4M-LHbOD3m1xrsRnq_X9LA3AZcM_NVMvtfQhjjpi3G2pmSwAqIAKY-yUnhAtAjIYnVZ-MCteu9cRcK5iubi7brV3qtiMPtvKc0SmjluoeS2HYooHUncb6yzMUN1KEs50x3MOG7aa9bQeFA0theH6zwvLdpM0B_UDzKDLaGGfA_NlFneSi0UiMm95BcSLIuLumEAw8J02X26_wcviSTpYbNKQfwLpgFrkG6LDhExvMeDPx8Jafbl7BaxEICyYayH1gEYeQd2cHklpg570gxUcueYcpeO31tX00N76zOaNeNHB0fllBO2cwcreILAFNJbobSADw0Tv26-qXrdY7YqIH_UZ_IGih_KXWHMOU6CZfJmIGMVtuk7UQvHJMTyCdTKeg	{"<a href=\\"https://maps.google.com/maps/contrib/100795927032409492889\\">Jairo Guerra Inostroza</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
523	708	2592	4608	AeeoHcKbDdNM2EmJ7zvT6_WXjsunYj5A1gBVAMQ0jJeqWt1nzzO7-yLR3x19PJ1lyQQSfnqnCTTiIHhfGBDcB4s1WvC7sPUybkM9CIrTDZolcMfN0s2v3rIcfHsh7Cg671mhBUL3V7udzl6JmSbULPu93zTeXofM4Lmxb17X_PxWdPdqSd9dimomkFb_nfvTGgbn3j0dtd_pIvARvN-avN7GYL5tsdw2G7kbV2o_nOWmjGaiKsqVvb23sB8_2_zoIkkah7I4w4p6Z3JfaAg_-pSvK2bvhv5HuVoiyDMi7RPY0XtFmDhBZdRNZ_jVIF0xXwYp9se0BB6MJhvZ8-sf0eb3GuV4wIXq__IAfu43Z5KAqReQLRofkEUI42ard5vBU67JXHsGRZEqd9bDB7DDDI31lxfj9ex7lMf7BPSwaZfF7oIblwAK5Dkt97_y7kG_krcLFOEOK51jfSNRh8MCoYQxh6DJKD4sc64Dtb059WZ8TgbrHo1rQqz5fPQH-1876MBr9u6NJC6ZLANjcXVlOpXbnDjHqcG5in1jDb1i7MRSJZwBttoK7zOApGkiiOQcvoVhWTyMQQZn_0EAVp__sMz0HLf2vOEkVniW6Hv25ze5Xaj-o4A6QMZb6qVKfOXVJuLcAbdWqQ	{"<a href=\\"https://maps.google.com/maps/contrib/100795927032409492889\\">Jairo Guerra Inostroza</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
524	709	3472	4640	AeeoHcIz3h2RWe-q5Bu0Uv81kslx4fk8t4WLxgNrpVyMF23F2t3dyP91_3NrLhRtYLyngg7LLKhfFp60vmyJezasZ_Tho7H9vZnQMrqmzmSF9pUxiKpTFnJXOX3MPPTUMQXC3Vx4MmMi-WJe9EbOfzWjhzEj1BteBa-WgfIEEr3UawqoGT1Ag8xnmfibDseiVrbiAHWSU7X4U441GtGTWTlDodOKsz_JRGmb1sfvKGJkl5eIRUIsUiW5puilKfXmWhbXqFAv7tCuKSAioso6GkZkkZJFRS8NNpwrDQXcVjZEM5TDPDVq-5h7Yu3vp1lNBPPUsCxkn-7oG_B-z4jtCbvs2OowwtRf_W9tSvp01mt2cf18vRc3xhQMqdurap3L4oyhe1lvr9WrrDpxv64gdRMnrOGuq3ZHGEDYpYOiviptDyhVdfMsUp4ijJC64tClMbiciHs1neknB2ezMcy37ukWriV6U6An86HssPL4nqqw2HK_5kSulMl08YH6_Kd_8LjA47Vgdh60oqUZFVQfI3hZfbiqQAS76X_I5ftoObAuvCuKJrz2Nts7Lc8_EdMLHmBZ32k_IvRB-54HanzNaQLlkvhSv8nmVNBqWeFCkOdlmeLta8TQ8DCoqlGNl-xi7xpcupknxQ	{"<a href=\\"https://maps.google.com/maps/contrib/102271825456681400834\\">Rodrigo González G.</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
525	710	4160	3120	AeeoHcK9psVOifVXfds2fXXiObiwgN2WEeRr1bA4lyGfKyO9OEGVU7A3qq3OtYaocuwNo5fmGNqW8APPclm8Z-Moy1E60Rnm0ykABcNF1sqLR9kvOnV9l4ItQHdqHgvvSX6sGxXw0dMufQdLwyCphzYhOebgWjill2shhKrhqKsQ4ALPdZmULy4lc0Z-9punLGbufLzZsKFyP4CQ3-8LEr8p0boTdPfg9DpOU-g9BdEMGQjgwfa7Bg-RNBjwczoMnulmOzCZ9ynX_Q_RT6AVL9HfITpRotcfqmM662DSeXF9ptZzVjZRLtauLaE46uLumwQ96c1jsWIvI-6FQkXp7P3cLSFm8MIXUnfUnWRFTlNw0l3AVEjxJTsHaPWOWnXMhlQPaLza0uhSolQ50X7xjGdIloJrBCpy-ECpHdqxNLdMsQhrzxEKz3WCvuxJXtsKkG36HarfOMifuQCoseFPFOhZ7Ot5gqqJqW1Q2SSebSZuSAZy9Gp-shqSJzllMO4Ap4Ajo-5obBjnkvg9qBqYB_5p5x48dn9PU4wfR90mOYJGNhUvLsCqZdJuIlxoIBjNm-EnMdvldifRYj5MTJVr0YEUPKmuGNYeSjY_6TGdXzVCFWpzBL0W9c38OM38j-nWhOHfN9Aqi_BV	{"<a href=\\"https://maps.google.com/maps/contrib/106923429983076849145\\">Luis Saez</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
526	711	1080	1920	AeeoHcL11ZXVsvB45rCk4q08P9yG8w9eSJ8f-N0S4mo86DS4l5Z3HQM3CjjEclXLfC-9LjSrcSB4rm8309Oq4zo7XI9-0BXLCmsMoC6JLkrHTtvv2PTPK8_3LojjjggLmH9KuqHR7jf-CJtyi9VhMQr2xaAeyhuYz7uWhPKfNzb5WYqTUhTZ3umrqoVuvXF7KLr0u4TTX5R3g0xOWHeS-7-iCPymclP0pN8fMfwpoUTWKqo2YXs7ineK2AH3-dobD9PGdLrDeTqjFCVwXhsgntqTzX8OGJofLl2y3BjroZ0xPHG39bLBSwmywsT4o8j41MP0pafyRrDiGj2IdinSw5IZC14VVy3oaLwKNJJCc4CQRDjtLNHKC-KL8a7FvqPLaZhEGXSnhVkueUz6uQ59_PlmUo84uZ5y6KbU3FdVFGBiiyK83IKQghaxvumlXWq1uGgpJvTvvt7Y7Hx53lvW1dls6qTXZ-PO-nQOFopRorwb51K2-tI9QcD4aaXMuUF973NMoIBtl7cmf-WO3XOXHqhpTOEBAWolAbUCnEVff3P6jCLRyOTtdlEKI4Wp7eXRitHGHbflEIagmzXyghtMGYCUP1U1uKlU_gvOyZSq7HPopWbpUz6o5whJGuzmkN1YkAoZIgkjV1hk	{"<a href=\\"https://maps.google.com/maps/contrib/108296300836406575691\\">Jose Carreño Guzman</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
559	757	1024	768	AeeoHcJE0Qc46RqmqVMM8FWMMr_pwBcqkBolAkW-QAAg2eMXU4AWqJBZ8-aAypAD0IRSjPqL7SBW8rAwLnEZFBGwowuS2PhY2Qk7MGc4qW2NXi6fHSRvRx5m8HlhxJFP8sq5Uxb3ExaYcCbjZyiMTgK_zxSiMBM49pZaHDmej7Kw4_eR8mrjJg4zS_YsYKDaM5wTP8OuKTUlQl0n2kMCZp1gNJsQ3u18iuyhyx-Isey3RO01sp4fVQ5tJyUZ66dILE6Zef1pF-eDdj7lhne1HENIvytp-ifsKGil52bxE-QrL0T3rGE6r-cITEzxjCv_jPwVzOnCglC4XEM	{"<a href=\\"https://maps.google.com/maps/contrib/104062456280922620138\\">Fuente Valdiviana</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
527	712	2592	3872	AeeoHcKAQLmXM2oLiH4pzu04gy4V0lZenqR36p3Zr1OApEgKSPcMXgHXKEbTGuehmOJTRZ9ylR3Z3za9uKla3zftyE8HPpxL7ND-kR6frmOjFajL6xYnp6zHzLUs2Jz_xdz9gyimUTkIJVtu-vYg1w9FSlVdsjU5FvifHJf_hl5MvKheGLzhr6krNxY3rZnZpRpnElhLkQbfNuzDjSl-LVShb4BZmyZyaBuLapos5T5kK4_0DyXaCOe94w2yzmwuTmz3KD9UfcyYkHY6HEk84QSCzDhwRQjR-wuEF9bjyXDub2-grx0-Th-dhZ-JhvijhGzQIvOgXNznChfc3f-X2jOUihBhIP4ko6MkFsIkehuYGLJPFFo2UuP3-EQGd3fqYcNQ3F9isBMFoeW6X2Z573yyz_oCC1ISZXmc57kJLqjXShbK5jiU8PvBVICI8VlGKWnFyx0-SQtGOUXfg3pex0TitfU72D5TG__TiN7znA0jcEDUe3PeK73qCmUPo0lmA1UI8AkYA-IQLCDMVzlG9TzqqjaN9qHHVCCM0_VOlopFMo_LtaO9lyP-e73rmxYIqjVbxT71h5TcAa1UlGzh6grij5l5qg9TKJQgf0xTJlDr1bcxqBiSKHfenBQ3pELjGrjBsLmSbTUn	{"<a href=\\"https://maps.google.com/maps/contrib/110059003304785921608\\">Carlos Ruiz Badilla</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
528	713	960	1280	AeeoHcK2JFNrrtXbssETOvguekaeqnV57oZn420Fx3LlTcfJey8zAm7iu4vFTNMWQ2LyOtW0zoTamyC1vhq3BMw3bleVt0bJ9wWJeQpm26fNWgCwsg-lyaZt80aL8btM8fg0D2dSQ_7TG1buvVQj6DmQHguv7m_EaFmUOuO4DFEAAKMIngTUjCcudRtR4Tqo20RB3CfGToBCP9RCHU9YPtmGxtWOa-vWQVLzn0hz31DKk8k07Cl6Rx5WWlStf-5geoQvdILbZLQ-A59vCZcJU3ecyO86bIdy9ERypNdm1CSYb2h-mfzelq7RpndsizmhFR9SRQhH4wtg2H4	{"<a href=\\"https://maps.google.com/maps/contrib/108247270707527154743\\">GIMNASIO PHYSICAL PADDLE &amp; GYM</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
529	715	3072	6016	AeeoHcKL_QUMhioAlX1mzHCRnzvSnviRMI9lkxXvdhSREQt2IvBXSH61UcunkyYCTR5lJVnxuwapTHjHNXnGULGNBQJk1XcNRuDPkuz4RzFyK5L0khcMIGWvU3Ba9ydi5SX211MhWWGX0u_p5bY8SDUAyPhEF_AZ2ph_EokEcbzCIvjrF0crKUDugCGKfe4vLUGIsCYe91NbTJ6d-2nZYpX7LIdnwCYTGrRR2C8cYPGnmYtcc_FpkKqVJzJscx-46V-ZrSJe3SD5mjViJ0eL75vlC5aymVMsdqVIYWEPCbXT9Wh9X8CUP-CS3eOBNdiEWqkc4ZP4VJ1_9PPdEunx0uX7d3GI4W3IZ0dWc0GtN5XkQPOmaHe7rorJGOrftnocYHhYD9zvdABStmH6d7hizNjKTrsQfWOcPAKVO3eZBI1iFvxa5MHancMMijpttcz614gCy9u1rJdrpyTWq4q9X0cNj5YDzVICSirEaMQ7b4J4p7f9QkPmEVuPc_qmkwyJ1H_85EI0lHJxokF8bqaTObJqU2X-k_RHjmtazIuFBI3PcGM6zmnSKtbT6lM3b0c2VHLZMhdUl5fq2VQvxiCuKDkE6lGzcLS5oBTl7TL9UMMjhRkNOTS7KLt_7heIdzamOL01557Msg	{"<a href=\\"https://maps.google.com/maps/contrib/100795927032409492889\\">Jairo Guerra Inostroza</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
530	716	382	1273	AeeoHcLPX2ygHS7hycfJL_IHudPNjPsOxZq8FoNBQoGkx1bTZp7YHp1dOwqwuZ-xpX-IZPn8KCJe9Y0MBoV2DYtQPRJq7vPLXdbaXWjTmlAaUmwAkOhSB59kbN4qFO3DyJRJOd4a13onI3oW_qEOTOXN-KlXtbNAodZ4aj6PT2YVi0KvwXcUw0g8exFaUdDsjnydOc0vm28oOJoUERcQmHQJa44jf4MYUL39yi1J6nu43TOj4rWTKkHTN2mdVuGq63V3eNwv31pied-jih6d9DctRYGSkCvtCDThCTpEe8p0JQvKMuoSat-9qzNvH8VoRiOl9ZQnQee7	{"<a href=\\"https://maps.google.com/maps/contrib/114861488143378367961\\">Colegio Domus-Mater</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
531	719	2592	4608	AeeoHcIiPH_tUBKL_wiBjcNate5tAtHcu-JVuPWqiFmyNIXUGqr3gtni4XzpRA6LmnEY2nbrEMfxOpDP8t4cjPilkskUFxwS9qPDorDhCbO5ExrEg1WqdWttRXjAZjsTvQe8Zrb667iy_4aG3_wVCwsSPYg3A2phxKOxYJHiaYhpQWlhd2yysYxoR34GWGC23ByW1EXywkz7XZMHCr9sGqoLXlS-jx9HANbg2kKQ5PiMwnOUBwMlwi8pI9wif9GFqN_pM1DGnWrqT-TpaiG5q9io74WPFxeSWU1leBz5NbI_nGA5tJZJaqgWCtorx_5tm_MqrzdqE2wGN_pp_fmHvIiNeheLMYcoC2lZnPK_YcK1m1MvpLLbQhK_VbsJGqnKFG57UhFK31zBOKOn7weW_JWfrW5E-KgE1ofjYHxj5yypUohXnMO9F0_e2lWwJWtaqac7uRd8XmCE47IDlod8CecWxpXeUE9yQUUFarzI0SYlc0YJRE58fe5DY1v00n1HRdUwq6ldNykGcTwP7uIYiI6Mv52_dChkp-B7_nomuz3NMtMiX7UgoYTdYCHQjqrEpkpEkcyk1ya6-L9ka3iBJ8tl9qiww1LY_7qE7ZlI9HJwv6UJTdKkMQaR5H9cu9cIX7TFuxavtA	{"<a href=\\"https://maps.google.com/maps/contrib/100795927032409492889\\">Jairo Guerra Inostroza</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
532	720	3096	4128	AeeoHcIwWqy1aE9fF4A8s93x-E_uY_nIkPt5V6P8TioewRz9Hyh4cFe_xTDIOAB7VOfKcHokucb-ViMaTh9Dc-KvIKpM2bE4cx5piMbs5wobrltnxjMQ3peqjdv-Baq9IQCyGSJXW8bKMgcGfArVaCK_tdYP6ABqnYrrzB3GwdfS-96B6P7bcDly_8aIrm_Da0MilLSo9xw1HU9BUqCzxAtSg0browt8bStZOPCpab9PiH2_UeuertOpeQP8DYzCY2Qsf_tWbNoIqWqYkkVt7-_yZxFLjfp1tPGPsWzRo-sYtoy61LmXxUfiHOpwc9tLE5bYOLYpdYgE2Sw8lIkOoFPTmRnUlMLCPztFh8ezwssekxW4q406loMw5m-Rdi1srIAzOOfO2LOO-xfERy6w7qbyxxhzSGgOKuEULSkNy7eMm8wIm1IDWFuR0TIPhMEHmI7NRM4LCdgKLLaj7DQhCRO5eFGt0BLt_rWm7fwvFA_J5paLPtW86GKcGoV2mL6ZSE3NQp0vtpCS6_a2l8avr6mHrD5zRJZ0x9R-fxU_0XzjR-qPfhuAD8AdjxHiw5xmDkBq-rdGpD0h-pFRvVVyEmp5ShGMatnHvkgSn1YPeahW_WXIIg3SbEiND-lFvzs0vJRFtcLl-OQy	{"<a href=\\"https://maps.google.com/maps/contrib/100171200425996103245\\">Benjasmin Boroga Carrasco</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
533	721	1365	2048	AeeoHcKRboWycCzkPqp47Wn_lzMfpSssNGZ8527DR7MXEPH5SZ18Y98oTlQZcuZ22m8eo5WM-_-vZzZveIAy_3ZHIyUnhsaESR2AkPvwFtzJ6hlYcnWsUAT44bLmB4LjuUbzbDV_KS3kFmnPeOYqaIFg7YjsZANH7DvfgR-CJtChWmKOo0p86yJ0wzxZGAAY8m1q69GWC58fARMJM3YewoHofdfhFj6TnQ5NedUDzurf2G5wnTtnLFYVcXsydesOMtr-MmA0TRsgfEC5EI8Qe3sLiTAGZjxQ0anotaJUDtLQrF_YPxTQc8Hr6aoMLsWyM-prb970mRWNZps	{"<a href=\\"https://maps.google.com/maps/contrib/100897787483431459968\\">Colegio San Lucas de Valdivia</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
534	722	2592	4608	AeeoHcLyjn0G0688k11nQ3beBKExK_z8evZ6fpoQBmDVXeTQUvApmDIMaF5dJqC3J9nXwahledAwfA10BpbBXRsGOxH_CmN926kCXOePhrXQ5DOwDWLAnBREiG4KNgDTA3eeJqFidGFxBxeUNK8mesPSxgDPpP2cIlJsmpSS2GGh0wFYKpDv4u8Zh40c1q3S22DDuLGsEpl8raO2N6Wg5LnUBBgbjZ6QtVjWPWmiCyRDnz2-vGxhjNfYNoo2qhvRR68zWp2JvfEwd2qswnvZl73UWIJP2VPsvqIQbEEebg7ctkk2_-ciRjmk7PDJcr816QzVBaWvEQFh35J8rZy2r_7hzEzzTCbqo-rMlIq3uXFqtOMG53vfsytfdgCE-ns-K0OJtKU4VgjNMkqOYOugIQjhtTq2I4jy2_zJwUBluWCA4hn_OadBFB2e45FqC6Mvq-L3LM5SAX-v6S15aWGfwT3WVuI7huAYgDIjndIBQLaqaMcrffvxBw2sE7g1LxOmQ1vywdtt-Qpp-eKGfsLhUS2awgZFWrR0N_ETXNX_P6Hgf1zlzB5xThG58O1dxyM_40stCvHlwo9dOOKi4CI7no3JCLWf5SZPRZSfXPJ2EFs44mHrVI4CykdChMUoQcZUHdqj7QS_lQ	{"<a href=\\"https://maps.google.com/maps/contrib/100795927032409492889\\">Jairo Guerra Inostroza</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
535	723	2592	4608	AeeoHcI7leDaAg4NUqD-iGtcCVzMALcsSeNek63jPo4sxw-8cdqXvBlMLZ0n6wkXLPdC__2Agxw27sQYOPDdiJt5Z7OggNfHV3by81sMAOuSSN-AdltIGuhXe8KEvcJiJ8iolPC1qhVg6fsdYxQA4qn8BqH0kSo7PVn6RfT1RzM-Lwfwd4_wAG23SR0TNYHCMP47dVVFLrQ2jJWBE451hjuYcZlB4Gn5_07EZ8dy24YzXFmcZJyG9Hvh3RT67RWSLZ5iBSQhVnVkIx8wkLZrmtwT-T-Q26k6awhm5NxPak4kroLwY90JzgXAyJwn3HgOx74lqowIE8ubZfKJVwEgTaKbPc6BCDH2ORAIgKh2wz6n2CgPQiasjbUw4BxOsyH9YftfP9VhT--Hd3tj1b3TDk2_92s7V1CCqgsKQbIFq-yb2GELytm1-1VYFPtiT9rKLOIKj9pcC59SiMD2qxMFDPH1mBGaqb7KZnWcfvBdX1HjCa19fej6tMBhZP5qycpVn44rqHkgrxqgCXkVKx-HVxIDTu1feDTtDP-vgE14cZdcpi94jtYFSvP4z0FdhcbYY5siOC3sGilidMH97x_sxsslMtdiNVZyy2BhqeVWyXVZsmZ4NRIiVaJZMRzupN7sedH9thds7A	{"<a href=\\"https://maps.google.com/maps/contrib/100795927032409492889\\">Jairo Guerra Inostroza</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
536	724	2448	3264	AeeoHcKrVSVkmxXnsdrbgYFJGqmIxOIRNzOi43GKtF9NoioppB3MIblXAo9idWcXJZjagFtBogc-hZTSjfCkM78evshkG895F9IKKhpfWgESfMElGdd0tsmU1o1jFy4Iz9IU0tyOVOCKWGH1MQViaw5cKM8i6yQfCC48Wo0BuK1Es7Y-bBV-AQFyxbkkq78bj73PVZNk4HmOLFcCI7uGdWx7rm1K0XR1H1C-1n2uCtICqR4xMuFkT1dtU6LxodgVW2oTalPDt40NB7JTIFMyuEDKX_1ydn3LdqMjMJ_GfIBwSNDXh04FIeP9YCJ-OgLyg68NRoYYx62dQuTldRupbAUnaa2QrcD4LuQDP3GQccnQyALOiB_8lR8B9pkctSPcDz4vO33h7tVfKYiYYlY1IpKkZKYjTH-BWI9pq7w8oXHoeJQEvvCkLT_a9_VtgO4gz8VhoaFLBtNTceOWCJj2BRRpEQIfbCJ1W0ALzX34j_iWHrN_3omdDwB80m0ubuFgXPh-6dWAXBu6D_QRA3hbM_eKmSunQM-jc4BcUpO9u_rH_20bPP3XGCT8rDAVHRLlDRjchlkLP3Wahdd6OwSLnZtvrr9eg0I7CY2ooNLfhD7d2R5OWjNdKMqgiaG9Xf8f1C3G7hAmAw	{"<a href=\\"https://maps.google.com/maps/contrib/109044542254469621464\\">Carolina Recabal</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
560	758	1560	1040	AeeoHcIKdY1VZX6E9n-vuH998GqFfhbs_f65gO2PeiKsjcqhh_Eud2EL2TKBsALpqmSyPMEtRlH45lauaVAXgN2BvMjdvTdgONa9FUF05UXicA2BvOz_NhOUzrB_uacvYZmwaClfVQhbnu44WnAlH0y_0SZrNqzSfWxF7msWIcWwahj6TsQbNXEzV9wD6aMY_ZXJ4WfrWmcLztleg-t63VpwmHXm0lsnULC0_3863UMjrICX8Ll8EqvyYnG3VWvVl3RniK6bz82e56TAm5wF67ROKLmNJ8bIZfkYYGylU-buHaICWCIB3cq3wVpe8t8sjsfVnxiItwGkjnk	{"<a href=\\"https://maps.google.com/maps/contrib/112923844430536219056\\">Tilo Restobar</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
537	725	4160	3120	AeeoHcKxMyOFtwQoaJKBuwirW-Y35gt8Zqyj93PMZXbZ_yB_D4vfXE2uAOBgwcEwgqqw4mxztTJiO40PjWIYb-DacWh9RXwZd5B8LS1hhZEvj4DTauHyt0iL6TEctol3C7wTB_UEjv54iQQfDcc2u1Q2IeoCQLa0ee6aGylyviQSinTe-Ua-5UZQ-0u0890CM2g5Tqmc9GxGfBCZzhWhwy6ZwZL-HPq7bhla0yhO-rFMlD-LtPbA3UbH1GYGq4dqlItKO33kISEK4Twzz2v9ue6-wQgzBVo5Rw1N5aqbC1zzc65hAYcsrCaCe23LS0c3WoxCUYOEooluhWpeo5kiNpy7dcQ789EzJa9ptrY1hS9MvKFAXyorEL1ExG0-Iel2jdcUN_SDOzL261nUQDsoI4GGpb16-FH0b-lFyA6pD0j2WWkevtdkZVOi-HYBD5897oPCQ5t9Ad0-tICOQC1xxia0QrgSm4utABKo3-9kbm1-jw4LIAMFPelqNq9de94-PnmlyZWmWcyKZI7XvjXVxW3XR8rNX8Y2cZTNZYIZwvOHotja2sUMp02uwz0gH_wD6Z6mlXSCPkcnhM1WjNIagsDRLYBbSP8RVBmvKYegNAi8BflLB86xW5OQr7sGBdlwccsOl-RNhw	{"<a href=\\"https://maps.google.com/maps/contrib/114622371126253799838\\">Moisés Rojas</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
538	726	2592	4608	AeeoHcLiWUwJbETuyP4Mk-xrhf5IFfdnMIyOACHiYKm7j9wCQ7vGYMeCR73XgwHyAccaLIWioLLbBkT0lPxNN6FzvTeSb9ZNi_UfLvEjEcCFkX2SLPB3llPMU1L-afvm9PFejilPmtdE3x7JPoC_aLuhQh4M7HehujdfaMTDbohevz8hQnPfa1KtNXT5e-aYE9NvW5OIYuuO3hBMRH9hindJPH_q15ltKoqduNHV2PAjK2rQvEzV0SElvPj3W0YSn9eW1qTA3SiVuDi_QSb5e922qAeL_UsKudfBmfEbtTyjb7tX11gLZpLL0irg53jG-0CiomaDbozWyBzv6HQYRPeA3XRF8B2I0Ogjdms_u6V3Dj6N9CIMm5lZEscxAFaFzrA-BvSzbY3SiQ_LnlXuz8oAGo91LB4jZ5J8lv9XeyLeYEa9-HS57Ux_127HP-d7zp30DQwR8SipzwRf3XoTQEaMT9919zD8eotuC2ycv6nzsSxmdpkN3lfkxLCJWSRRz50lQApRhqRJO_3I2UNzG6DsSfEaYTtDy3LTBqYHIvEj8X85-g9ft15xw3do4AcOtQKGNNPMjS-VGixkhF08ocOJTTa4-g_huKbRoVUm7C3EMFwK-dKzSx2nmMYZ6HIV1zDhN51row	{"<a href=\\"https://maps.google.com/maps/contrib/100795927032409492889\\">Jairo Guerra Inostroza</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
539	727	4000	6000	AeeoHcJqjHHhDQZLzxPe29AlSdQAShPf54I7CcnN_a1TiJKLXWZUrxTcqqyOPfM_MtWmZspwAkecJi5Tb9Xxe15ZIq5R5rcGsIVj-mNqa8DSE7KO9aC9uWHrvEQKHk8D0Na_-uY_cqk_cm_bnfvtW9JNs4TyYjZ6D_DWRM-Am2RkSwekKdwmVO7ynExElN7NLUczuDqFLz1Ytdxs03q5KEMlITvP-HYSw60RiR7lADEYACJEG6YoygZHEqI3T-H6YRzS0mci_lrdpVcWHP0iZ-WrPU9Yymqx7TepVor-of1zUrbi6_lEKe6uiMNzCEHkXpb3d6PQhI3evFJyb-y4uzsfT3zeBDNNbvcnniSY2r2dq-YI--QP6RSKy0k3Z7dLkLRamy3gZHXmn3E_oHo903gLIbiRy0oUZOaah5UZ6rSA4wtpMKhFg93YdBSE1iloD_HVbaFYQZpgCEu4BMvmUAPJPP4tOOkwuaLB7FG2wzfFKe418x9srEg0LE_54GpqoatPiYJ2Dn4pbT95NOMqdOgrFFs9-eWdSOtHSTdg1PEaO_rgyiaoY00i6GFsT6z1qNU6WxhByLYLwCIRfXTsiAOyPTV1IbMljiLD5u3ePHlSC7hDCzSwV0q1zriZUDUaA07YTl1xXA	{"<a href=\\"https://maps.google.com/maps/contrib/114739663538178219642\\">Andres Labrin</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
540	728	720	720	AeeoHcKcQTM5LQa9u7XY7LZnRiwfUmPmBtnU88_N3e84l0vubZusSlw0hXDwRkYVVMx2zkuGhbxIazeNT2pcPwI2v7S2gB2imkjIzvfgss3h67U-leFZIgb0GpBX0q-MgIwTTK-fVirbpNQpSTP4V8LGb7sqbXHjQM5zvs3hBn6CSK2yasLz0bDw_2oo_QFJp3zrU4QVw0d7RIKIEr_GFnLTn5wKAJTdAU-GMGmXmpD_CkW46neQlu26G9Rv2_DOcIcp-KaQjbeVtzCJWlFC_NtDw5EpidT_3siXFNJoNvVR5rK4pAvilFJoJkyJLO8PAOVmObgmhkNvEIE	{"<a href=\\"https://maps.google.com/maps/contrib/114027309522958097836\\">Universidad San Sebastián, Campus Valdivia</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
541	729	1440	2560	AeeoHcI97jbMYkzNBRI_dZQX6EnEdrqpGuPvDO9VwA7YTVZinpveM5tK72Cf-MxVkvoroHbYaRKsOKoIRp6h0q1_YyoBB9WgPLn8oEiA3185qqD_oK6jHnVrKJ5pGWZJZBeE5f64JFM2uqwcTRGA5KEnY7M0lXIxHaKK-EbyzpcewBva954MS1dvSLIQA1YTFxpI_2YuztTz91tXcPhxhO5bAEhuoa8wNySo9oWEofoTNODkfoPDf0YvnGiaY_fcHigH7yreAnvqzL36BgombqHlv-GUfDOzrXxON4rn2PWNcVx-h345DoGI6lzQ3ydKco4iq0N2Feci28fDKRGDHloUGaBtIKlrEPqCT4om3ry3_nmfUwTMD2JLaSVaZ2kJ9mkVP86sv8699xjp13VuXouEozCSXCVdlgJHLSEYlD87FtGakkNVAPjqkkKndLIPmtDc6Nquajh8LDH6KKtnnJpxnZdwQzqdyc-zULZjaybOZRB1bY_RX9bkl5kTNAwmhocJqPG6dux_UZwre7DneoiX5lMtHDZMJ8c8xP6FC-wUjHooLTV7R4pcy7MHhuWDjOruSnaFJCycHHephRkjH3heWIcjsGZ1F3aPod1y-4dAwDy-y69rkXh_vPfvSIL_ayjEe8AGsA	{"<a href=\\"https://maps.google.com/maps/contrib/102644358660717307958\\">Antonio Ruiz-Tagle</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
542	731	682	1033	AeeoHcKgitf9Jp4Blw913eY0o895KK984JggPGgzyi9xcpn5yZ29SSLloUvZL1MMob2-tlkylnl23rgviw7Y5NhZ7b5jF8UXUxpEyZZ5rGoeZv4hWqz0dx9ZkzPKZYObCAwU5l5PWqLH0OIu5N2w1XlvGS4VJwaKx2Mz2mTh19gn9CaHBq4-dFi7HoxARkwzSXWZP8I-mx93WDiqFwspCPKo3efbhaUlh1K4lWZUp83Pxp3fp_nmBj7f4J70AgNOm8WQaoul4N4RIueKumLO8SaUkyg5rMwxV3tfCLKwBLv-OkYIor8D11LLMBO6UFmJKJmZ7IMRqndT4vbN3AVsSVXkVt5mlpUQFf1WYDfLIznGebPqYXFxRaM1Xh2Tx-t7gFXIVaKL-jqCsQqZF15rVvjoB4dP9ibpsu1qYAMWHnVrvmwsC_E-m9hnNJtZHGykTiktIoaQn0-mb8kVv_PoUoDdJY5F008s4wep-V7OvtHOCWZ8Ams9CPgLRxEy36QuZT0p7HvWM093EuJiEvDc0GLnNzKlaMBMBurtZVlgNA3t-CWXTnhw0Oh92aiSUypJh7M7xvoBehRLlBwWwBnv99mGoTLTKz62ckzcLFwPCcL6KEli2zc0VORJlSfSIOtWjpljTfur3ZvY	{"<a href=\\"https://maps.google.com/maps/contrib/115710148763075392108\\">elsa oliva sanchez</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
543	735	4032	6048	AeeoHcKEdUmsdsB_1ekC_3YOECrL80C2U1r4IOh4PTmRqRV2juL7Eu-759yrj5i_pCA7FxwV3mG0YvJEjNgkRqGMVrRTNR_wEk8IJZ0V3FccA-nu2mcREI_8grCq2zkkKVkciWjXtKOGgQUjmofq_K-jYGW0tH2opsxh-410iMKwu7cQzOrW27ONm94JPu5-BrrffA7X09y6-Fu3Ux7YZLXYRBcQ6fXWyHTdgLJJLzGDdukwunmwfeXO7__oudeCQK0Q0eCW5S8vMT_zIIXhz8x4hRyKUSUt9yuIB2pSCQYzHf8Ug7qWByvX9A1BXjgihMaNBpqx7d89I6ibKl5zoPY-BW9PsVzbVixttMaq-gypMUB7Yb96Otf7aohx7WI2SR7qoKjuOtwPLC1sr7ShrE6Vg580HUFmxdICRWy_5JgwNO__lvZVQquKO2wbthgtV-nhNSbHIJXI0rFEiY8KjVWNYvS5u-GniEBk3SRs1lmW3fzdNk7SqWv58TLpuijWFz_ojr9i48CwW732btBZvC6U9D3dD-QpboARBvU0ToK1LgAxMGK4ARmy_3G3phxtLu1stVc6QJUxo3UBgU9xgCR0mGw9DCcbkzQQ4IfFyGSN0odwLWb3q6_TSkrqoQAaSEVB4q-7ig	{"<a href=\\"https://maps.google.com/maps/contrib/116979609651337006546\\">Daniel Contreras</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
544	736	2432	4320	AeeoHcKwcnl5YytX5UUhSmbd83i8QN6-yrJMqtqBFUjGEKrTe-AtfFQXBkKwt4s4hHy5AdjUM8Sg9aTx62PiN26lO1wLGCeJshJA2FbLAFsPtm8NFIk4-i4uejttCBet7CB90ZWEEXcSbfnDj--6gtUoNytm7QO0gfAXwJrTDkcJfzXyZgufAI1eWW3L3a2r6lmoS_3tfMnjClioqKYzPxDc69Z5rVfYyZMl9v32IoPzW9VFIggl4E6V2eN4DKjaxJLNfX7GJL4YhNGLRr9WdGlOgM_c69xT_UqiCgKgN7wogUNThUeDlCZFxmUnILS3x2UnQN56JJysJpCvHZONG5Ip2HQ8pX81ztOIG2K7mudYIGgHoMqOyV7j_op11NfpbcvUR4THii3jmahW8CBcqHwTrHwoPAS4daAAwr9KfMmmfLYeAfMAcZ6WCaD8isnDcvAtmJPsx9LSJcF3alaOQOwUwx44NhzT-H2laP1dI2QNuS3db-1qOPEv8X4zBy0naQXaq8IzQjYFVtZxN_8KwrUTjeoYlzrXBdW7JJNDdRGWDZGHuxoEQ_p0HOvBj36lxLn_U1oWyRQFoKVGK0YyQAfWmdbxGMthH3jth19w-Q6gbC3_XEKaRVQSUUDoKB9yWlr3N1PMmnZy	{"<a href=\\"https://maps.google.com/maps/contrib/101081362778054746233\\">Eduardo Santis Torres</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
545	737	758	960	AeeoHcLcZcQez9RRNg5eshEfaZ4_YhjQRv3pfngyPTavHU8gdY6v8tTjMXYNnhCXDKsAE8Wv42S1VIRYQa0hD70ZnmoB5N1zsV3ZN2XNH33WaGNfS5R1gqTTgr1A11IaU6faFZIqBTNu-i8hamvwts7b9g_R1Cm_a4wONl6iMSYFKm5lxzy03ALYJWeQzfEMfZE1DcJJ9OOHF4fYTQI7iVcl93n2RUdkaDlfM8Ssii84q8Lrhac0BP2EFguzXqkjIehuuP4AI0N1K1JReyYrDFrL5TGH69lq1TNsPvlpl_Kp81zAN0WDfyoNTDcmOQMWIB9P1Q6azhBfvFEbUfrt5_Jxcln_mSSG6_2alnZTOiPIdEjxW6g2yLn966bQURxO95GoEirLNfDeP2zMINYS4v8VOO5fcMoL4R-C-G0GZDf-pQrQSp605X0KdswCXGwx4FpsqqRikaVjpSJvJsIFjjd7yL83G4Ut9x5aVDoB2Mu8IR3oicJAmxTvUnTM62qBDrHV20q6m8APzngeoNB-xr6uZd3XaRNJ-Ujy1g_iOO8ZiTQe2dyfR_ZsUfJ83wf5YRRQvKoG2tYWQsIAZL6ylL6-rBlyqKmMjoY28RFJH4Avz6vWRm-U80R_fGcb3DPCs7orzDge9Q	{"<a href=\\"https://maps.google.com/maps/contrib/110440205424395378538\\">Diana Carolina Hernández Figueredo</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
546	738	3120	4160	AeeoHcKlKocKHHLc4THDD-vsAKWF8ugAysINU-P1YVwEFxL0CGcrLysXvcSL-umlvn2h68doRZMa_i04mK4yR7bk2lWA7TN4F1huCBHpdrA_e8q47Y9VGINoT2IHYLPF1H_W23mJEJd2pbQlN1lxsnPkfRAh8PUVhd-meDDhbQ5mZNIUf2M37F0zAkMbgqfsYowOoyolup-RTuDx4g8sJawN6nxP45vwUZpN8rI9j7Mhd9tZsLoCEquHdrYpgDEEWjotBWJpnZ74VParllBcmi9-IqMGf58DgbCKoATJBHqGLb_c2K-rQCLMN865k_YvTF4YTsc5Wz2GDp0drZe0ZyfsVSQlPrUUnNW0LM53afgkl-GQq3U3g4uNHzPTH26vRsshTnCMMzpWQ1keTZNrIj2yw-1nrpDNLePq2e-2iCLPK6DVemFcFr05WdcWeHkxaqYRiHJ8gDlTFYjBPe8OE0EhoFRelfmRhrZEnp12DnC1IAZ086_pMvAy4qOQBQxVY6bFVqwR3oZ6khbmiuRB8O44JB7MyTlFGfiitfHR3X8n9_cVz4Ug7FYjU38ZVV4wFv6ytypiq1uFMljGq1sUWgYOojjhGWMNVIIJu_cXBpmCfHFRD_1xfqrhdE9u8VzsWTNvXzk8KLn4	{"<a href=\\"https://maps.google.com/maps/contrib/101003362904303331181\\">Richard Leal</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
547	739	4640	2610	AeeoHcK9b6fETf4UPxxn2vtpf2W-CEdZOBcDmEgcTzRKUvd4jbrnnINlcIx70GQYndmb6P2HGo1-eEROnWCgfDLvR1Sxi1Hm1Yi9zTYLOxGQlpTdUEvbzdhwaTxevKJ3kx4OJQTpzcUBWT8ociEbRZrENMyV7gtTsfUoPjOBLzqACc6Swm497fZQ101WPrqBmqjVdB8eXu-FQgcn7q7fS4FJ_DqR_WgSy2wQy8j6klpHTUaGW8iSnW3XvruvZz79Cot--nbBemaC4EhOVr_y2hZ-ofy1BibArO4wB4R_7xrb6zCc-UJp8eVX8nxU4Z-593jTdh66BQd5tMClFN6vfDjiTF8mD45JeqNkTaf2yTaRsS25W7ZfINbggg4p85nBfI66ekCs6vUZXPwmtZox6kkOSoOYmbKtEKqws733yiu1Mjynn1JsqYjEAbz91hC0EZ-1RpWtE6R2pjsviPzmSDhKe_2HvxwNlw02kVVOLEjq3QRQoERewmyOTlNrUFJfrZ3VPCL1Ml0kdBhBi_fnbLJt1eXtirJO4f3hpiH7M6EZ2sKTOlNYveNEVKmvtBgVBhEyc9ebwNm7OjZD0bfXiydNp_Fn0btqPWdx7_jVjQQAeFTc2OUHeu7dOQbhL_g3q9lqWVhwOg	{"<a href=\\"https://maps.google.com/maps/contrib/102271825456681400834\\">Rodrigo González G.</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
548	742	809	1440	AeeoHcImNaLRxmFNrY7AiZf3wCZ6BL-bcCcLAXF9pX0UAPdS3383Lr9YGvQ4Nx28a9AiTand0dlIEpoNJgZYGVUWv0jh8c5hSE3XT-eo4AhpIRC_fvy3XZ5IDw6wGVRDqfomnacgYL5DG8-BFaIYxqDVT_Q9wE5xexMj6MTSlYtTgRRJBgyiNIIhnPdz0wNz_GFwtwtGJ1YVJjJHyMWwcmqsahvN9o17rQgT9Nn3vqklSYh26z7ZmCBXCo9R8MXgp4aO2SGpQm5uW5jjiBvWTOJFU7hrE5hETQPofekJOC2in8SCBWXyWvrLUuO_V07ylppsJTeCrc-760E	{"<a href=\\"https://maps.google.com/maps/contrib/113096583204759274703\\">Centro de Extensión Campus Los Canelos UACh</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
549	743	719	973	AeeoHcK6ZjmgQrp_iFN7LUKiPT7azAYfE-DS6h2idlQM4M8Ju9xL5FAw2Rl4wvno4SDWUPK5lxax7i8gmPDrMk7xW3H4UeZFk32HbrxicC9qtAon6Nh6s3a5vujJVN80mwD3R3QCZM-kZw9zYZNuCxVDIbkuUy-mzhwm7-ba843kAo2KGysAsm6sXYKpUvxAqPP9ne-dzHoL8_rVeoq7kYuudkfTeNfkGA1eYhmJIaKG6bFQRK7A9gWVYb0vD0vLx7J-JYMtCPZnY2oEVy14ewOJ3ixI7tbmcx6EwVslGrFeFsVvXHBdF_7vaxcBdBpo5LYqmDCRYM5CnUU	{"<a href=\\"https://maps.google.com/maps/contrib/106159431622388311635\\">Universidad Austral de Chile Vinculación Con el Medio</a>"}	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
550	747	1365	2048	AeeoHcLlsvjB-aSowoyfalp-sJlCPSeqUC7TSvsaTNMc7cAzZW15krLRg30wJSM4LKJ-bDozxWYHB2solIzZ3NaSWXXAenRnnxrvFAng9HMjmgPshADx9IXHm-LRLRwEZoN7LHhAloGJG8IBjeNBCl60fjK-qAIkxuqfFSVHZ4LqBSx3XMN73HJPTBfQvdolh3nBKovVsDMoFf7G3U1tIS_g2ztH5MfGHJLsnArPRImKzf1f8KbKJyaAlY7_SkkVplScKZFGROwzkF3TjCVYToB98lGHivnSJ7xoin1Du_DP94PJDBMOpF-WT3_Vpy6-Lu1SCTPI1Wn2C7A	{"<a href=\\"https://maps.google.com/maps/contrib/102682978606940859994\\">Hotel Villa del Río</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
551	749	683	720	AeeoHcK0d8GBbmhuZxePlKN8z_QTrPggpLLNdBa6o_aXwd-rHu3FV8pay5I5M_H4R9YNNmDS_U2Pe5gIqMZ5D-fIu4hHF7QyuEBFhMaz4fORTkrjM1wCAIbIHv3wSBCkxNWwnzDo7VvhFUF35me_m8lvyFVI3o-mfof8OwX5dft3lwjUkkLjSJLik-VBqlUHl0-XvMWA-XwvxT5ND9c3o0mWrWET16tlA8K-jeZ5T8td-4c657ga0QKxdkxB0qgvg-HhzRw828mFTfhD-iCsVd_0OTDmnLeFOPSdMQ5jpE0nx1MIUlZnTi4cV2foQ0v19ZkJ-yBB5OVidzc	{"<a href=\\"https://maps.google.com/maps/contrib/118430101884843496306\\">New Orleans</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
552	750	3024	4032	AeeoHcIRT8M39EdRCQ7fnYvL80LsP2cJ-AA08nawQyWPEWQAw4M2W3k2GPdzvjL9VBgUAVbPjbnAGVPBPDrckW40bBc4Bjv5ldSikqf6V1j6E3p8JyZuOO5OCGezneJOK8BBQjfU-7dRXMIX5h6qbi6GWQewjSM0y4GS2YX6d32jRPXzFj5m5CAHIYNbvh3rKkHLYQqtsenoeelBD5H8RcuOcJUU4jrDzT91oWrXN7vwSjhhsGczQ6HiQz1tF6IiuRUEiCqBB5esEv94_V_XOsHoRU21D7uDghen24TeQ--R0Xj8cRuKM39fZ6cDc0-WUp_ziE3vf6fbU8pokRcen66uJC1KLz6EoRtg8eH7Sie1u1XNNDeVJHZSXyJBcBxPZG-92kqnAXkmdyOKWpHusUXerEMIr4tcn3uYlcyN7PMPtTKX0Z09Skf2U-8q7-_Ue990yTRilI0FYaYP7nbkszrKsjfkHY_BtZr6e_-DdK3SXBjO4fVyFnfE2LAe9r3KiALgpBJ3RvxSNOa-jAozsXcJ7pRsfpGi3qcisLacvVCtyfEVJrEFGoOC8DW08bvVowQUFcVfE0UpE_UVUFWQs9SXtLDNpoDqgffwUcwTICS0zP8PjmfSgwbkMBefYflESW9P	{"<a href=\\"https://maps.google.com/maps/contrib/117334479358994306631\\">Cami Feer</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
553	751	768	1152	AeeoHcJmF4VwQdma1O2Mm_Hfli81tL9sdAZyAb_ersffINqUFUrvAkOlzImNoz9pQts1hFHRi6UQW13vNNVSdwRnVGnpPCzffcRgRponQi82rQojed3pAGbzJTLLh6MwSMA865HzT9r2AvT1b12s_unEyNQMnJB9RPePUSWzlGg4RU4awH6IXzJ16am-gSIxDYYBNpue29eyItBSErSA9p4t5BHd8bYbqVJ3r-D11wh1948iVC2FSyusQS1X3V-07l8JaYTJHAN38BBkr8XYKR1fvYTEoAHVAYL-xMG3tHEg780fvt42ukHQERB2yPzrZC5mCaHSGYaifIX9iW27YjkKCqeABqUY7NHof6o5R8GoMxyfVTzmRsmhkJ-UF6BPZn5cn18z1eAuaQFivWldvndl08_DiT3trz5ijPFteeaQRreS4_Nx8XpUYpJXX6wyj24dlhkePZb2FWSjGIIL7O4Htb77U1qSWwWl_2PTlDoabdbtQIR2Rq3Aoozlmg8psqf0APwdrKrs8PtfSYkPuhtlYUD4N-0Tf7NomV07K_ehsVghFABpMmxsNgzHROI5Y-OemC6l7A-kGdRIX3ntnX-1Ma7fnLOOa-bduN3mD_SJBRugZJBzxldc9AN4UjYX_CAeOjaxbw	{"<a href=\\"https://maps.google.com/maps/contrib/108512198279600524014\\">USERNET CHILE</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
554	752	5344	4008	AeeoHcIBVMNyHv12mTQLB-TS7A-4rpTTFvUYH85APOPHqcodkA_MeE17gebMNRKHafxz0wrF6rRjaYeP_Ua67TDb31ApLji7inZhpmvKkmei9BdGpyFtnuxU7fC4oba4ap2JlBioMBQMfWMuA7IFfk2ysxL7gC74x8yhxdo5EU2AA0cAkUacLFMQFaQyeMerazOb0nTZQHqi2_MquuJc1AJhjbIZdJiYGzozmqEX-oujDIUH6rrmCkRkZVXxHkTk_dIafq-pXNb1rzj3iRiRbw99ZH0daf2HW5cuwNwMNg18wisZ2FT1hnxJj5EXzqD1kzkA9Tnkp8rG3ISDYA4SVfx71ajgYlxjtd8UT57X9Blac8tkUf_sA9l2yC_7-V7JuOugQvOd1BRB6_XhLYn0JExe5TQisww0VRAn_tF3BcYTZOhvDNDumJLNo1SwKNv4uJT8lIiT1mFPTuDio9yPdMGFoZzqiCz4GcCDMohm_nVKFEyoYBMevO86V-YZPan1cFJr7uMeDzg952qmRfxO5z6KTecKlAmOTaIPGDO0rjp8cotj7Dhl2_VIjpV8O_89rlX1gSDtedjwbK3PRFlCTV8UE3NkHPv3KwmI_5K7DS066musmEZDeM3FA9olZO5UW_cEgupGj1eR	{"<a href=\\"https://maps.google.com/maps/contrib/106696135529553342545\\">Alvaro Flores</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
555	753	2976	3968	AeeoHcKCeIzocxkWFvdh8cG1BGkp7gQzCobUob0uWGbsBZxJnvXDJxzSeCAvNaOboW_uTv8vCq0unn-ocoOZmq3WfpeEg_Y1R-AkiiTl5X552Hh95pFQWarx9D7-4tvuIg-zUoteYmQRsHKUOevHj9IU7pwvwerDk0TLRw1x5mA_q1ggqwl19SPTnYLst_0ysIN6kHA-WAIYbbwH02s6o1NKW2Sk2s1QzfZIgHOqpYgsvq0sYJDIZLAzFWn3qrHaLoLQpyaY-bkmVW85Iw_z7qmGJicabl707WsOTOh0nIJa4tJVLXeRQ2umvIkhlZbPBXKaePKT94aiLgigwJp0KmMV3Adz7j5KmZN70RaFZwLLF77cPMqKOOemKqin5_xdH7CWGenR0SZuYcP5m6tnoGVx5leBopc7xnjT4XhTrr8Oc6yDfNwNJWx7GxMRE-pBi_KVbJsQ1SmKMneULAEuY-3g-t0lVDTy2--wmfk5S7vSFS5jUO4Zh4aaSEPviyZuAYklm0IXflhJ189ARdy-p4S58cg-E-uXyaKhxerxp1m5071LI6Htcm4YSE6Hqhc9O5VqmxrEW6sUL65WiUDU-rkKQd4OJ1p5p0VgoO39hnzTlg62zSIxoBxjXgdDxlCDPNyCUVDFVoPK	{"<a href=\\"https://maps.google.com/maps/contrib/100011094058549893793\\">Claudia Valentina Villa Alvarez (Vale)</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
556	754	1284	1284	AeeoHcLH6h58htTJ2U8_ImQ0vnDON6lDORVYG6moGb_7aUhhvtlIdfPJ33t06pgBVQX9s7NrULACDJChWrJ2NdNiHJpykz8-dWkcJ0MC5qa4Y2jj9bvqPCnH11ssZVRPYmZKJ4jg0kb1Gok0zOfHkVXfX9GVTzCOZ1xMH5BNexgSbCvOZbP16hb13qb-Ki2IJEHotM4qfiHIafxku4w2QQOhZY-J_TDYvZX75b2yZ1EPLY753XhB42DmOiCtAMrhXZl-POdgr616-aseYPc1BQ_5RjKkxn5SsLCP0CJfD6o7MqIeQ9CMRNUPX1k55glCYZovbf7S5q8vfCE	{"<a href=\\"https://maps.google.com/maps/contrib/102655058280056898540\\">Mas Rio Restobar</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
557	755	3924	3924	AeeoHcJ_AEu1NcZD4bqJU4f3t_NjA89XwFuNAVjXW3P0b-jXdGSRbGTqvQDzu7ZMFdBQlH3qOXrlDYj4nKXDwVDb-42kboEKo9nE5fuRNqAk-UVY3iNjQi8nbmjl5A7OdbHoFDASt02jTcAGrqPPKSxv5TeSxJ7cNR42njM9r6Fe6Y97PQBLZs4jb6ep7O2lyDDNI2SvpbL4BVN-LjUfY-mwWIkXANNfsRLYfKSLsIeBe44WLmwmfTdqQQTteXUVzQ8_gBxGRp2ktwmSdxTnoeVxY2pTnj6guxateRT3tBHUJFZbGQ-RSDUZSpg0fii1KnHITCgHQq1flMI	{"<a href=\\"https://maps.google.com/maps/contrib/107102782564508214497\\">Subway</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
558	756	2268	4032	AeeoHcJXQ9JQFFs9CxvXa5LPtQaERq3_JmAJpy5JWfoY4S-F_pQHM4If_ebL1TCjg_abe9oyFXFr7rnLXRfTJQDcmHt6xSiXzEsDALqeXNXxK1kVTVtNFR7XrXdBxOVps3jyZCEAtX7zXafCDNlVqIy_uxtB1Ni3gOvpgqJJgStAZ8mcT9cBhHDIEVbsYwUBpTBo-79TGitcMP_Fz4P1I3Tc3H6ewNu4oE-sltR0F7FaGd7L_QGdzgyjbX8WqHdDDlorlJvbjicnuUPD-xkLNciD_KPOkYgdP_bTfFmZGQNmKJdy7xgtVQ95MMJcRz12h_IfZupK6n-ln1gcUeTqy3rfL7lZ2fVO4_OQpimz0AxMKh3dP5fGInbHhWEuCrvZivCjQnKoHgr0e_OBNwrTobfF-S9ZiT5z29HkDjeeojODiNans5qlWtYGEdMw9cPJzIKd9HDhnq6GG7xANem2SvamABkxWAWmUoytKMZgZ8yfEFXBsw0hllMpa1AgXUBfM7Wk11Z_fC72KR5NEiPn5yCXUlUb0cDLLoXplOHTFRV27gUuPFlZk-mRSFTPO4HbP9wT5XkwPmCdKUKgd_GenV1Lu-BFEC985eCP2iF9pVnMiK6-gDOPqlRzO2IJ7XR2Rk_rrjJ4I6QT	{"<a href=\\"https://maps.google.com/maps/contrib/101924240102689454983\\">Alejandro</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
561	759	1080	1920	AeeoHcKxAv73mXS61iOjn1Ha2bXipFbtPwQpPZ_sWdhBsbbQQ3ngjRjjFBlko1tr_o14g07xHs1xzlaWdJA8HXtBjmIVt3pgMZWoNaAVzz9YwKX31yqmW-eSZ4SvbM9qhYtq53-gPFQvhgASvHBHLUOLJGbwA_8e9fRB8XR0_fMaD-NF36u8Qyuao3K2MYTtPXJ_a0qpWDvuLt6yO69NL0j-H0tigR9W0ykG9qiEPBcD5enpp_xu9MS41co44usdq6sdSYhTBT5kzAcvNZ5nmi8RcyqFAxh5gZZnaHsa5sNHIez5dMT1WikB6URPcsNIhF_Zgad-XEuDP67HqgXFD4NoWQefPOkTJF__zQ7TgXRAH9lNQrq9qbjNmFFO9pSaZFJ0D5VkpMwfU1pRiS-DYHElKpOW3Nz47ewLft7uctTvlhSyhDTvvvBM0xeu5on2cqVPhYFWWl3cPwcHvZDNss4mhb7Oo3n7VaOEkPVJ0rcZ4LNCjN_1ikH-jNGEdCiVVJherLv_T6b3sqYApNK6vE9qn0df-Qx_FAl69UVgj8uPsPezBj49NNED-LsxUrs1F1aBXd5jtdwyKbdxbP7MNk3R9xE6--2xWSVtgaXUGXBMhD4IPAN7IpSXI-Vnu-IARMAYrWBb6bwX	{"<a href=\\"https://maps.google.com/maps/contrib/113963640619924758018\\">victor sanchez</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
562	760	4608	2592	AeeoHcJI4Kvz3DG6rCj48ybKqr5_wd0AiZjtlvLf4tkBev7I6lWM1ef8f9vq2JGidtvlrI8F3-gRPkMNeO5zANatqBi1owiOs6WFdFHtxr_V1sM6zLw6GzM6qR1WgDVz6CMPq88pSY2UTQbZOWBayiCme6pC03zHpGHJvbP4bNR40_IXmPceOnsC8DIMYw9UfMMKVHM75CwluluNBOEcbCFbK0h-Vqt0noymryehrF0gTlkgjjDKUjaEzf1YRf9iF5WYLts7uulBPbyKLh_qtX2I1H9Jy16wlToijKLD30_trMmuhHZCitVfhi4Dj-FyriWbBnBCRM93htfuJvFOEmJ9j6TfNse1_X9N_XmckOAFlnYyjL_6Ly3aMeFvRzK3Tbm1XBIYpFR88HZorrRx9wJmK0M7qU2Cd7VLFhz508aHqQaC7xu1_GpzoZf8Dua9q2tDyrAdnjJLlgzi8pcxEtxlR0sJkGNn_5EJ-g6Zzp3Mst9fliNeiAso9Tj1b1toqECUUqY6qRWvT9wGlA8avitghdEgtdYdKU2zqR9fhDesJ-Laf3slaLt5LMCqy8Ucnxk6Nz8Av9waFJFaybqCz9paclAu0mhazv17Ch9-FTI-fBRZrQXhNlVE3jlMbWMl0l0CTkAUvQ	{"<a href=\\"https://maps.google.com/maps/contrib/115633535610533050850\\">Maricel Castro</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
563	761	4032	3024	AeeoHcJLBwIRxvao8MWP4gaXGam78gc9Vp32lbWi5-psJyd_qYU-pcKokE5w6D73L19rKnHiWmdaPymMpC4VQS0EAzUKKM-llJQwJtSBcMYwE_xAw8e6RYLZvUZoKdzp4hKp9UoyLlC4PbnDazLrlIuxZu6tkQBPf1VDIurTaD3KBiwWuDGE303NKVBJjdZwyK7Jh-PZ9FpDvMoJUHyw0VsvQFr0ngWFlGOquwPnEpL0J_cppNkwfXpjC5PYM9Sxdbrb_PwiTLpvULWG1wizEFDWdetxseuTr05PgqoFYl2tWqR1Jgs8_RcJf86MPzLSCsM3pkzPVkCHLFIKhNz-B8HaJdALqttciByVGVQ_mY406KJpF8HDWFEBqsKv29e0aUWZEmKDmDrTfCHt9LjTy78NlDuNEOtjl5Fj8K6dgrigh6EeRd-oMo8dv9fHKAiVzebh3kvTcJsanDUKyzGx3Acv-MzZL_gIySO-RGDd8edUVqum8afdSwcT_T_Yu0iZEAtjRxiJvLmCsTXfe_hLEg0CCel7-gBCyQN0dS2j0pH0wma5UfbbiDtoNih2ScyZ9PpyJINok_SHxNwqJsrudgMBIenGb2ZyjUSEwqfgqEvGjM0adlLadc4FeIDNZz6brYKa3UH0fzch	{"<a href=\\"https://maps.google.com/maps/contrib/102619666970305576802\\">patricio poblete</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
564	762	3024	4032	AeeoHcJZmuJ3dGUFBZczv3SEaC_qcvDK6PYG5NQKMdKDyUi5opK1T_JXQxdcH5kO0K05pO-Jm6FngKqcRaEDeMcRncclziIAtCPpKj_m_A1WRb-x3TjAl7Emf92chQqXYTTCFbhXR6_BxgxAEhHjiRyrBLsay_JNVWEHDuYdgb6Kx6picYUiCNmWuj4BgGRUYc7BfrOPQRGpf9m22lsfhKLInh67Fwmlx17siD4KrurY1vZTje6gIGvZ7ltOcS2lEt3KAz8E7SdIvrrCsbsyhPcnfgIIUsHwvzsrug4fUCeCI_GA2RJb5mlzjC5TUSDUhJ-hT5DCk9Qmf2GuUmtSVZ_EUWrjGNUydi3716nKjZqXikWzwewWG1X3PoCgyPzoe68AR_mH5OT5RHJ1lmuaFct2QoxtNuDkd3Moh36Flmfee-_any4n8B5Z56CXRPivQsreK9Qi--hU5QRK-X8QInH212YYuldCNjB-0_vgHerPNROyJIkIKWDiVrKqwAyYmLstfdREyIe-r3bxd4pSmFfv3Zu7iOSdjo7Q8HuIokveEnI8dXNKiuKArb-ARzm3Aaw9F7p_Pf5Ch8zTLq_L4wjDBFNNNMkKLgoTu5zegYXbCogEtUooe-TtfmFojUFxofLlc_ZgAw	{"<a href=\\"https://maps.google.com/maps/contrib/113945942712355307058\\">Tanya Marin</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
565	763	3024	4032	AeeoHcLENFtR3_zEmYBRz43eDr8wVCUf9LXgRiTnvuPzpkOzS9cGJYZgg2N7bE2jKKBXqJ4EddtUqsLSgNZ7JFBSxQFogF9zEbm6-a09J2T2YVBkDvSj2ipa8y1_2OPe-PLkZr5eXHPSsbz3oYj_ic7htk_3YV6mNXKtDpYZUr3csb16q7YZTXzNCQICGhPs9TQLBHk-tWtxl2JtT8-0b83QGgkHmO18DT0UhWZauftlRDUPriCa-MAoPygfXV4z1jy04dSvlGqdgTFZugErZGWd67Y_Taon1uLF6U6XHwl_7vi8TE2HRYxPmrvcn8QIgViLHMGNuHgALYvWKtO6NLP05toxga5idUCquhFwkU74fOIQzBilPruL-tywipYt3KBpf7cfwnB77A_y-JXv4XXh6g_2b59YmcVAGTeuOj6ue7nomkRuDNtcAc5GXOxgMDZGT2qRgG3Umeniu07g9kA3hvMFUlvhQchQIVjqyF9R9iqji4VjTfeHfutWOsdf0g_gaoAmhbCb4sLj2-jIOp35NRl5YNi_VikRpdj3Ahb-RaWKfWN3dI4Y0j0ZVzN_i_c0WqJJWjebB-6S3KdMkW6i1Rz0AlxczDgb_IlrFmY0ULk7nve58PbkyAmhdXjUAOI_c7MBPBXI	{"<a href=\\"https://maps.google.com/maps/contrib/112172614486168384648\\">edu running</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
566	764	3024	4032	AeeoHcKSs62P7Y2A6Vi-NHfGmr5vhPFxwjoz-wrX6Sz7iF7Kf3gn1eyiefqOXE4NcBvDpGwLmJer90ygkI0ln_9nZnXPMMHIYfxtKht84QJI2XJ_6VYiCGDH70z7O10_fvo3Z6_i8G3zZK0c9Jw0psLhTnKfiy8E3g_WOgd_E1TZ_0SmiEhadyhJhHZgnoKgfkqK2F09cjrqWvY07lON7CvMeiIcDhNMByFbpZRHUWDy9_CIvnIElIHD31bQzbbjQtZhI6Pk8Mw4voqAlmD5O5UiCbE8IKrTI_WfrXo0DKxFIuI-mAovhNR7_e8KOPqOOYXqCfg_1TifXL0	{"<a href=\\"https://maps.google.com/maps/contrib/103850225167397402050\\">La Pizzeria de Renzo</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
567	765	1800	4000	AeeoHcImthc1cdGMvhQZ3WtHCD8BaIEDGeUpqb7aEJtgHG8DIq2kC77Kb9kYoZ0NWTf6AXZ8osdTVOkT8nCgg1IX5UKGGPnqELB41SQ0Zsm4jOZ9r8bifbqljlKl3c_Qxh4wL-HssUUbadJ8yS9kLNpWffGoXdazZHOhbL5mG2swJHG-XfhAjcLTaL39VwM43SIoI8lN8U3RsdVpsxEDDLasuTbHUTDDmjlM2IX62vXaGImgfB9iRlQqUfeoSQ0B1TZUOLTbfgC8R29K0DoJtW8NM6egPdooPJ8w-ghwmKQnmZsJP_dRQI7APIHK0KXsr921V-X9msVchN0	{"<a href=\\"https://maps.google.com/maps/contrib/107495575474825112292\\">450 Bar Pizzería</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
568	766	607	1080	AeeoHcIFZ4_j3SN5ULPtweL3Hke5Xbvnsbyi1z0EMWZYXok-9ZI4maP4MMEQb65ghqhydeSiMlsl54MAXHeh1YyXO3hhmi-FdXgBAFWvSxcMOJvtljj3sZ1kyRWZJ2UsXvF1z87OYupeF8LILW7FQkanBeaMnNS-haAMHWf5EZiieUOV5n9bKZzLnGTS-CkAumXs0LUTNnGC2iH034ijWKXPm0HQtp-kE6IhhqM6Xsd3dWUDebuDxdlQ45ExWzhFRacW1RI5QH5-RJLip8OUdEoAnfYel97TfITXb7qZHtHhqz4Ut6XJA4LegBfQCR1axXCmwtHDyoWQXIo	{"<a href=\\"https://maps.google.com/maps/contrib/109339552770736355874\\">El Pewen</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
569	767	4160	3120	AeeoHcLOw5rpUBjfrtJ5kBUx5q8Hyw0rL8Rqd2mWrgQaafluXtrDmDGcxvqEAqb4aDywfInwUW9CuzyvUh-jJFe5-1ID1GS8QISUUl65Uk-3kloBsk5OJOxTi5vnCcaCznsPdT5LAD3RkpDKdx09VlBEN0_YPLt8flEBSjxnuJi5aYp4Xn2VmKCtr94CnnMtbxZd9PgikfKTxQ5EjZeVqo76g1XZ7bWVqd6K-fzfyqTLqf69IRGME2uYBBwGXd-fb1iaovyypalBSXQDUS5b1JkyZaRSMpCvL-L3hfXTdt3cVadwlv6gg3bJs2zSgZfD8W5t0a-XJoYfVU7OuMAJj5e1HeEQQgn-81VgekJRFR65_v9RojQEp5bgx4WVqSHPVTNi1YsKtSEkikPcruCxlqQ_D0-D646CIpQZqOEcVlgkqsgDoaNN7eHTPSDZnHiiCDND3cfOOW4M5cZBrJUbeKynkS46EI08GAqPruVPDjvWwszyCE0zhPn3OtaqQvvHib-Q5ABASBYhzQj5d1wyK3a6yFHsXj9o6ozR7Xr7EBC3Qwl6K5KgKBAW1sT7ePNpN9v5zyvN5W0Wz_9njjCPLu4suteOeOvAbPdcRVBB4m2spSrOxQxSHUbWGozY5JO82fWagZSQdDAd	{"<a href=\\"https://maps.google.com/maps/contrib/108854897874636541419\\">La lay</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
570	768	315	851	AeeoHcLpnYp9QALDWbGpSxpRxKcJZbChDwnIaegXTxiTiLUPUxRCA-OvVusZQYgUwrTBlTa10rtXHKj2iVydDRHpFR-UZgVWAb6Dqta6T5KdNBdkx_heVZDtYVLNPymBMHB2B2hhX5m60v6nzoUHxWYVnFx5-mJ58TzkNZFcEdT-Recl7Ny61LosJ20nefYj0YGDY5SLrKeH4nIrp0y7oDauwk8VOYZl990hNtCNdf5fO3dQrW_bCsQd8S-3m07OdKzMhbT4fyeuc28xAYzFeEloC8bv_TATyb0m4QmeoCBtYXtm-itEajq9ZVnWtVUfeo9TNo2LKfoN	{"<a href=\\"https://maps.google.com/maps/contrib/112383472759655980839\\">VIVELO EXCURSIONES VALDIVIA</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
571	769	3120	4160	AeeoHcLjVwROdZDI4xT_ktKodYb54XeeBCQx-JrS4OfZigN-zeF5VUJ50lZsARpLYMfGybsyNtu_LTSR19b9g-20U6yrneMsitFf8AuxcCPMJ_l_vp4LS7WzuJsn8SArNv_VqIbuvPWXiHYwM4ztxJ-EgOgQ5kJqWkqH1loH5s96Mjwgju4N_mKFbbt7WkhZrpBbjKIW0yMsMibrvDTEzgwbv17Skkd6I-EMHxPldS_YUEifs4dJoq_xP6Gx_yjFwfcZiNciPaLlPw43P46zJNnHVvHD_MloAFrDhaImelnhzpU_gGSzDoqfdDosoMhuKaK4lPlloRy9vCATTZAxEVdOVWhilDIS7rhF3NzRpG4ToKloeUYxTKvg3rIWI1gDdw7Wtmq6Om1oZo5brAtEa7QQ9WZ4U-WWthv1sfxd_X7fmjulIjfJHgsybZaXrY9_wPcE5zMXnhjK5e4uKouXYmi_tDbrPgd2GtnyVYjK6-itsj0dOozgCgJYbFut-kYnIGwGynGu1NxV4Gy1vnU2NDm9iALImShzZdaWJnD6lHpLAk497xNSPdJzaAO0hvWcBKDTh3Yantn6zJsT804u51TPV2FSjh22h9pnYFF2KRcz1oamUCMSr0j-KXfjRvS8D_ZTiOUMgEip	{"<a href=\\"https://maps.google.com/maps/contrib/109661709413405849360\\">Eladio Burgos</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
572	770	1200	1600	AeeoHcJpDfA7in9C2r34G_6SPKCPvNJwbnMQUIlchYeMyoYxH7QiLwoJ4BSNkQcNkDi9XA__b5SMidYaTdoIVnX4XjaIVV4MoChhWRXrkobIh9wtl0PF-LbvwfboDCZi9v3-WrkJURWvEtB5x6TgroaV-LCmA7Pbu0NdoUcqbJxHsn9cnX4zlqlWa0IwiYIbpGLdH5cj3GyqgfhSxnac3UBLUbJtTaymo4pVOg5a6QzicpcRtnPgkx1nFqcbylJY3IMRqlzCqGfQD5HLp0f8_n7Od1GEatR4CPtw1sruw4IOwlUNkLlrGaIMuoYF6ndBkSi8axqpfSvWnFt07oVWuzwFATxR31l3RwnIqkufBKC3Ess14IKwrEcIkp-yVBpifW_8XJyLtmFKFAEw7uTz93uMovmNQQ6ZWsSeK81uu9KCdW-JS7Xa0JBgJ0YEIG7nW7WnNZYJP92eX8aYrSIibKhKOBHmBsz5339azkownt2scxSlcUqUVT_VOEVIyCergw_trhc4mOwl0PqPjr9PAqCd92fIcLvOmOPoPeJ7ojpIJFiH4zbnIyADmBSIyxs9mX-u7a8HVYJ2JZyRVt8dFXr4uotv9YPCOeNXNmFu8z_CZBJ5KBnvRbw9U1zRJcPAOBrl6IRMnX14	{"<a href=\\"https://maps.google.com/maps/contrib/110515563347019207321\\">Lisandra Rodríguez</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
573	771	1024	819	AeeoHcLWAc2ZUSwUbKLM6pqA_5sSUpWoDRnzFkG2FukeEZKGVJiQLRNUPIK2KrUAvpaDL2Xb94hvswi4w8Lp08iqJZ5HNihoe219-zB-UUHAYRbESie36S8vw57uYzwpHK7f5uAKaAuOkHYNt7OlNxREYSGgDPO56crmsNaRrHB3Xn7Zf_5bo7UmJH-K0cinHTylRM9TaAgMO8CQo1mTZNkE4YAv1tXXyOCiXMez-yVQTMOTW4vIYUm5Kd9e8jETu93YlZTB0nOW7PKQg_vVJ3pywolPEtPdQNkZaZwR6zmmRp9nF_fCZtozE--m5k-FXZA9iwp_aKIjWhI	{"<a href=\\"https://maps.google.com/maps/contrib/104100888817842500723\\">Santo Café</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
574	772	5120	3840	AeeoHcLT5GEgKcs2hkT5S57mfnfervsyAfHWLHYIzaHsgEr4Xutbk8UZilNVdvGnmrzJmnoUtXRYeYlJeSu6ZGH20WAse4_q33EZvRwYKjRuCu1a1pvVCdGVcfXN-9qeeaU-4CDAxiBarpmC6wMZWwCRXZAjNZW8kqUFMNm4LnlSotMW4nJloLxITzD6tPOrdZthdsfte_e27LE6tvKHWYncFsRpT009QxpWe-wb4Fu8P3FT3WkRruBRKqKeEISi1vwyMeUx0toAQgy8iskTZAfJc9WMoOC8DYrq28UfgUx43Gsa98_7wrPT2m86766ywrOVE1H41_8hnyl5qRiOChqVPVMfo8R7RzZ6PFb_uD_Op-MTDG-RcVPHcXu_RO7cqB4uZ8JsICErc9l6FscNpARn9xQmjGTPM6qmk3D-Npy3EgflbStr0p4VN8SzoNfbB2xZPD6opG3CjZBewCvDSt6YclWvSyADd_eefN-aSJ9PDbp2ZKUMrrNB5r8QG8urh_OurpiFuEmodXzT0AcHkaH2Bd8tsK1fAsY6ZiJSNRVcSkSAUFaEJStUPBRNKvKViA7F0RBz3Ec4eZtJy4kXAV8k2-qXJaQMAoYZmIRvo4k8MDiUl-r7Cca_mcXdkemd2a_L	{"<a href=\\"https://maps.google.com/maps/contrib/109793026858218453811\\">Pablo Silva</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
575	773	2084	4624	AeeoHcKfOkfgLk9jhgjLHQXozRIsOCICZ0jQHNdCK_6URwXAS2H_-xKAFI-OO7rCd6F7j1m5Sp5pIxP26o4aO2INq534pYmsYC-3nuU6tWJnX9HG2pwIMcLqHUCzIUriOIAN6-hNfg59jbeVp1Et1M0EoBsJaluKd66Uw-0nGjqhZBHNBBp-MXMnj_mjFXIXH14DTynytWQ2LchvVavILOdYsZtnyE7Ltmm3V3WuMzp05TzeOVc8P6U48BkLOlNhLEOyD4mHh_btTAR_hdAJAO6qtECnVk7xklZZY7_mQKhgld0NGGpKIgaCKfbBTeiXb_NNHpqFHl2QM4NfgO-m3S2D-B4l_Kjd2vn6iL-wF86QD5sl1RZgarebbcyWABMug_aEHZF4tvqztKADEjQ5AE0QZljbbxm4_SCVVEcK8gRUsJIid3qtPIV3cuFC4Me98MuJkcDZPL05cT2Se-3n0WEggw8u3EiagNv_qovmZJfeqANWswHkLWJ2qnU_7acxGoFlvQnT7yZJ-sh_SKOFiD-ZlPwjqd8fUoLp-JguRczULSxmhAEAbiq1FvmIPy7YNnpzcbQGUmACG69s2runV0oZq6Jju91mg65S3WMItq91vJbRdwLErH_EgfHYs9BuOQXlQnRXfQ	{"<a href=\\"https://maps.google.com/maps/contrib/113279928589588026289\\">Martin</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
576	774	3264	1840	AeeoHcLjAP_1KOZOg8PSnF-qBgk2uEIuO69OCasKU36dLmADuQpDJyeA351-wG-4YEcd4NeMB7Ec7m54vhkOPNRw8msLVYXP3tyNmZW53JN0Yf4XXQonz7st9QLdcQpmW-q-iBJxpTO0wGDCct63WQK82IHROQvo8la9HdRWJ1NxZMOielyP2493uJ4-twCCdj_N3HNYH2xs4SDK8T-O2etpFHBKwMTkXl3IEd5_SkNlyIbx4VuRNEd6dPnaNzyCaB_j5hrOgb1YWS6AttNdfBZm2FVkkiS9I4P4ENQiG-aL-RehYykIa8wzimLf_686jLgkXdHDnD4ICQXTNUzWnvqocpYO0JuTYvba5kLeO0-ORnZxCMVwdD8WqFSFa7CozJlJIL5zV3yJve1tO1hxr2wjABXlG_TQBEHy6UR__b0Xeq8bc4Ki2pRRf0YDKAGx2oWN9cUem7LTOCgnaScNBRnIV6UgRFVxGUvFMKhJ9KNsWCC74WqLOUCHyEaigFKAfDgihh2VQ6KPmxaAgI3vWu-l4GgD16CcbpTlvTLlbZnr8IHmFLniJeii-6Fb6ynHvHk8elTcgWVs9vV2O1PLBIAPtOKvuwoFjduIeiQpLy99O5-lN4SGXcCbw9QnzmyD2PlX	{"<a href=\\"https://maps.google.com/maps/contrib/116666504564623796008\\">Lorna “Rome Hassler”</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
577	775	1816	4032	AeeoHcINIgDK2GTqPhxBLn0JMNSEbdk282Xl1FkEK-OUeveawsC5XB0R6VMYWJCbJrxOlQgXNouytiXSsN-J2iNjH5xvdTe01zllSWXIUrBvmubGEfwuv_EJ9G_uwun5PFh6jilgZ7hXlznb8CMPjGerfh8EhgHZlO6ysM300rWnrV811nMJAJKnAHd7YmK8-X-gcSAbhI_IkSGrsfYWAKgBGc4q5kzsLdYoYNucOdzCEQFd2TvOmErAl2XARn352Phdzrpv8Acne1_VmvtduzcS1jONhLIc8VvBRuXwo_AU6ZuKWAaoGzzETWgxHqQtqf0mEN7gcoQICf8s5TfBlvfQi9Qmam8gSZmqupo3d_ymQ0wasN-KE3K2BwvplfFhZ65RLObic6kTXtyXD0xMClcF7FTVGeDI4U2UuSEAhZ3WZUvffw5Sf_xC1RdOh8BMiCw9Z5Y1VyPTrO0GNMg3gdE85IYoPGSSWph-8rdF7g5plA9TSrxfXMRHrN5c-geUT8WyUAPy25uYCxgBiyXGV4O7IfVdNRKn2uXF7CLec1lypz9Iv8dDdzdD79P-EKzFDSh5LCaMkijKBIBywQPcmsk4gKDnrAdUOrbHetoT9Nkeif0RnoHhjh7W4gHvKdMN4pdrg__SCw	{"<a href=\\"https://maps.google.com/maps/contrib/115529052236257219965\\">José Campos</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
578	778	2456	3680	AeeoHcK6KK9BTddMZsvGFt7AE6POivadxoUzjDQxEF8cg7zHfn-RipbGzdNxqbthYh-FkXnvwR6M-FZvVCMpCKCp4MeO3mxhg9Y4kaISyHtvvIy8PznaPWLpx0j9nE4zjQqG3s2OV-icnWy4zxI5goONbnt0UwBb8XHWU4m_VyIJjjeapiHu5Pliws7ybRwEDbbv053Rq7wLE1u6-krNpcW1uTILK6vJjUg4V0OqiapoOc5tQ4yx5RBAFB3BkxgLtd3TW7R9UL6cTT4UIc_YVsW1wLAMWEVWF08truqh395V7o3k9dvPg961bZ5bpwQvTLn7W9aE7_E3noA	{"<a href=\\"https://maps.google.com/maps/contrib/108894701508404511340\\">La Passione De Manu</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
579	779	540	540	AeeoHcJ2n9MN8ZNpb0blFnbbnh_eF_Gf88pyQVsDkCBXeL_wH0wPb0cNBwIAf5jqXOVHOMuBIC2WbWLbG05Vy1dFSsCNiMh6UagU7S53KjED9iR2QYctsJ7T0FORtw75TnvpAfNEYhyMtnM28UWdicoqt1zmzgurHyZwZgt6PTKCgB2z4EQbEVrmDvEqKpWACYSWzABMcFxbL8okrZynDaDXG16EImEy0PGqv0y2fuJCYRtU12q50PdGv4tPuA2TiYy4-pqn6aEmSUPjXfqugEHNZCaPUpFEc-9NVt5Sj-yIR4WlEE9uiw_tfHWoCOr8-FtgCoVnFRl3nJEnQR9NRqixgwbVzLNsHryz80GV3qS4-1BYbZ_SU0grVt7r0pFpcT6ZgNfZwG2l312QAGJ1i580LtyJEbXYcoQa-fX5Ryq3f-mF8LJYBiDQ1tDmGMBLLoChykuGVbcie3IvCErxxPcDO5Ih9nHmCjMCFsnLBky2eGxefr6K4afjQc1zThaCAwYb3i_7Zvx0FZNAWNAb_BAySvPthTAwYjXzZ9g-C9wGkUvfKrjZ2JV_l2BDCWFsUjXPxgztzgUsE6mAOQiy6PWQ7-c38OboqTZu4KziEIHFBkGjgWjHrDri2yLpjAx5YT7fmCK1Tw	{"<a href=\\"https://maps.google.com/maps/contrib/109714731649596486791\\">Maca Parada</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
580	781	1600	1200	AeeoHcId3Wv4eOPwyagCtJum21moNXOKKZXfSm3gOyYWlTPRPLLhrYYnC7tDeQecAOp2d0Uj4VWFDBzR1GAZBwFFKBcRcJOk2hSUQlD-m85tfDOT5tZi-XjXjk3XqZzV4ddQztmYlTn7vOHZ3vvTP29X_X-3GbCnu8c_fhLTwA-tRFLFmG4vw6xjS8oWsd9InmQtqmG11Z6Yz39sVPN4fXMBH6KfvkXBiAV8kpdKE0pdgeuV5VWFenY9WryGjcoSO7ckY0BiuObFgdnxAnMncqo_oyC9fY2EboeaLEVdx85hK8H9W4GKsa8KPx6k0vrc8PnuVcp3z6IHkWk	{"<a href=\\"https://maps.google.com/maps/contrib/108801796002038883555\\">Café el Escritorio</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
581	782	1800	4000	AeeoHcLW4cNWLYh7DU7xqIyRDJ36FD9IVbE7SC5RX1E6Q08fM7uzZxQFwsIrg_O0aeKKGiLJmlJld6bbD3cElp6nG71l7tFy9NGka-p35a7yqSPo3Ioy7TG-E3yep7mTZOOObOlQaW8dqWsRW3r1NQQh3u-7tTH54JeRXNK5lW5PL5yQtI0y2wbmLQ9dsO_opsIvxEQnKlz0AFLtP0-GVwN-4w7f11qVESbtq_pBhuGDACR7WIlllNVX4XAXH8Y_xAPkk0_c2C7WxF4Srp8BxTh1beW3y4_5Uizx5yaqZEKXG2ex_870uTGTsDV-31L_3PiDcOid66Dq8F7oVk4d-jWpqZrpWwLXOQvVCAxIB63tkJIpQPyNTLmw7WzEDUtQUAqmp2FtnHq2SALXTCdkddqUcu5BzQco9Enj2w8ZgBmuVokU5dLENY--iBN8DmrCPYcffY7Xvs9CoSxTMEEKVWHv75anhGcUEZx-E1NAoVO7G0kAJmdcny4u949sE3-jKcyJ9d4ZAzZpLo0_GmYN-1xoPck7bAySBqjsGiqJ_wWVKOwogxi1P4x_OiYz5aQh4kOItY9Lq-ARyXT76mJIUmrEtLbw87i90X9nqbeTLoy1_lV2Ra4Kqx0LHCc3KgSKmf2FicHiwg	{"<a href=\\"https://maps.google.com/maps/contrib/113279928589588026289\\">Martin</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
582	783	4640	3472	AeeoHcKyhIxgaWfwzZNM-Ru-4L5q75ZQE8vNvOjPUJXuuwU9pkaylAnIUyRwTHDr6X0WhzxxGo5vklr8WzIe9eUwQPJQlixzYh4rQlmAEe5rx1h7oIblCrocsCgDds086FsUQ63ZoTMbdsPcOp6X_DiIlgByl7umSYkS25uM3Iq2WyMDGrdvYo6dv_8ufCQjt0WwS3QJsF1YNJFNuXTwqAsuew7DDiGfWBTIZ0gc7GByFI5Z_hPk5rOfC4dMQH39DhLhAnU-HeTUPAuWy-CYNdYQz1nEbBcXUhpltADBrrQjgeVVcrHRk3Z7L1F_xU5L0Lrg4pDuKoLGLPVKdi3l68ocTZIt_HB2t-sFGmYAw8hIpelCTPqFn4-pUFOaIMP6pxjfZKdTBCQrb8iFy-8_vyKY1WVzqA7URZFtA7Wml6NhQLLC2g0eS2PYrh4tjpZzo8ijkDjZUbAPY2SWi4QNVPtvaKGWtBhWnMR76gT3rySdh4b2he1yTwKlzPyxv5BrN15yA7PkA9BN1ckIrsmBk8WWUp3i_GlIvd8YwO-olyuab96IxfPp2VW8sh8UicFjH46VpuNL4C37KEaj7XO8Iehrz8h_LFVYt7SSty_hplCry6AWXYpfqSeFXSaeNHWD5oqr117yfg	{"<a href=\\"https://maps.google.com/maps/contrib/102994604297797104204\\">Andres von Bennewitz</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
583	784	2610	4640	AeeoHcJP2RaGFiWOvjj97Cvjrf_mSHJgt9m_OXJwK_oNbppOIlveWnoZ9dRuMNjZU8JrTLC9ZYaF9ygQzDrLuE2qaLFcQ58M9pagdDBJ5amIXbuAd3ogYH-IS7cEQYZuxctzzv-EzUQTP73i2vIHIb6dq_0GePNqd6vW-JexuyHrKC-TKW3T9mNGb9SsJo11igx4DJDtI2GDzg7UmN0cgGwWferR7T2Tv33op5p3rae1dO7Ro2u8slh9Tk29NE8VXfL2bVnRNM341iTwbNpifgDBbQ2hPNALhnKcsDpmMMMGjncR8oOi-vMc05fYkYOiAUi81A4K-a1gv_3qClbktjOlPoW8lADElqE_INi7bKBn-uuZ5lwnIl42A2HqXQnLfasetPJvjx5K4QVzTjuSlywccp3JpBbOohCRbVYszI_lPgugKUyO48LzCQPBbQ_JFam642MIZVIXRASQuze84vSFnIwdh8JRa_Ej25hnEGDT8c5mTmylLvHbkM32X-_z8RGqyEoapYO75QOKiCq4NI-BQAsVd28PVekV01Jk9Efd3w7orpONlJfB5MZQsR8juszRIha2nY75uBm6qrKyu3_US53z4-2dorh5xtFRaOs_NWeah7ajUn4ANwyMiKkjWvM3AOIuJA	{"<a href=\\"https://maps.google.com/maps/contrib/102271825456681400834\\">Rodrigo González G.</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
584	785	1367	2048	AeeoHcKSYs8644sVG8n856sC46NVwJbT37QtyJIpnoDOLrF1d7eYvUzJSYUofaKFypvvRlszfCtU9tm4C7ZWAm9wcjdolqcdhy-im3DaAUlU1QKUJpdAXBTukzw7wSUkCkCdcjoZBLuph_kCbzr8Tuf3rZIiTyIYWrtciHRZv6lO43EouJgqj_-HUztvl5PaEnn5YKjgGVGofSayXvSNi9tEfIGdJUTHr7bPw6XAOqgoJViW0S7mTWE8SkYXnnpEQJutKbU29d6FcIOx0VhTioo2Mo_YDVP_0mRzZ0aYQMtrJSt2i5Cb5on0-zg51CpYrNJlHVMKmv05Kko	{"<a href=\\"https://maps.google.com/maps/contrib/106791713796594534488\\">Bimba</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
585	786	4000	3000	AeeoHcIJ6XZ3FsfG0c6sfmqpHkE2yvYFTXqoX2p8XJKqwfdEQeCHYWb0fDugs_O5Xnl75IqngUbzQu9yvsz4hw18t_77yq5oEUmQu5xt-vgS6D0JMsU8X4Zo3PxVChZ8fUJw_PDYC0koaETbfM-F5_6PiUO0NuSVMCdZW3RWtW4tWaIhhDDKsI-Uh0x0u_408QFXNULlRCcW5Z85WQW0y-q_Ynan92Re6wxKz_rCh23j2GWPAzluA6--b1GHoJyF18WvkqC7htUu8-lZ5eYZ8SqK8uXy-lggt5_X58gd3ASlXvDq6_1CWPQ3DG7mYwofC92OU4PWxtEHBMaM10ar3onINIl5vXMiNOxRInLCJCAerlGfyKVlpkOEL2TbgonmaHpU-bEhpmBsTRxvzSKBS--tBuoELECM3-Z81jqPzTgYezqoHYiAeh68pTWUuab_cf7GASJ8nYX8AQyUq9zhapayVfdyObm0aidoIorFyN2hjrVAxcy2mky8DPtpRH20zw82u8dKBjylcD5Sjgl6Q2pNT4GgcPV6XeiubwTCXG5zR5L4fKc8Q-wi4uFvGoekW-ziKxd8Zux76TltrtGawtBsiZZiEBhDj15TYicAyePFOxzJtWDRHzQ4jgkPIhCkvVMoJAZPvw	{"<a href=\\"https://maps.google.com/maps/contrib/115459732730453500375\\">Benjamín Soto Rojas</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
586	787	1080	1080	AeeoHcIc9bOdk3FvX9AZ5LpnNHrbRNg6U_QYL1nUnRUPlVRhgm1sPHWcggvn1BNMLl-JehYgrlTdDeigHBq_h5KJbeCksPXWbTFD4Sne5Ilw-fB-7dMtF4MLi27MWQguAebRURW4NCYEk5oB6pdZeFWEAgGon4AhtK90ChA2YQb4b0IgCanMmxA6xFx09hr_cIiz12sGN9Ek2UuI1MOAosyl_BszxMIix0Q88DvGN_PvfLmnYrogJQoJZ16SyahN6L1IIwQk5Ke6zCdFH-BMLvLyXD3-iTAPQ3Igg_Yb4_cqhmf8J1u05iyfyorkScDLrYNCdG_1oahKcWY	{"<a href=\\"https://maps.google.com/maps/contrib/112697663946113491366\\">Cerveza Entre Ríos - Granel, barril, botella. Cervecería Artesanal.</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
587	789	4032	3024	AeeoHcKL1nkKBgUEQl0LYnefcqrYZnQ41PkHpVQgFx10RQV8GLEaPzzffnM4fGLghFr46EHi9twBBPhX_PMY9_Vsd1MdRAttVuOP97cATkUU56PPeTpnyvHCH52GrGDhjdZ0eq-A5U6ovbKUQs4Vxdm8wBuJ-lZyuwnNfbwZ7Eqzj6c-PQk_SYT2bI0uBDCtVCdfafn7F5qyxA7InqDq1ALtwHqw8fkCSgBsOGlIg_VplKZt24fX3h6bNPIqltEOue32LjN7Gk2-XgkXYDnEhG4rNagXPPiMwgFxZaslAhNijYt0Jxn3ig3vLLp2pRBstOb5_LKl98PmbFc	{"<a href=\\"https://maps.google.com/maps/contrib/115624635826444959991\\">Strike Karaoke Restobar</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
588	790	2736	3648	AeeoHcLkNeNojCG4tKPD-2ueW8HgL3H9nbE3zgPddC_TxrgK0tqH_S-h1tu52rXO30O1sk9fiRpVIEmw_rSMCBj8ot65XlrBJ9rpe1e-jlgkOgh3C4OjLgPHZHKiccRLtIUxN-K8Gx-9dOPklJ7NXCZi5pfjRBBKfNFJhyX1BhwyJYpm1SkTEuw4lXMEkFc-NmwiSMoSSh2V9cz8RZd0Ky5qB6Z-JrXiMXMAmrqRB44zYxPA0EKe8gYcnlMS8KpgMdQCA3X_nOAn0M4XJjrMDDDwDLl32lhNYPzC_VSWXji10xZvpCB1BWfBerIcFhalYcrz-S3xY5u_iohSHQZRoMpxMAOBpA89vKhcSzbvHhRwWECZj0KvgT0S6v0hZs0Ej9RoLCev9zIBmsucsvJZULxMcC2scRq3I4d5z2t3qSKlAakA9TyCNCphFxjt9HwWhSDiy1N1fHp_LAkERrxmjato6qHtdgw3Nu1iya7RmcThE7M-I33wTm7rUMPAxmRssfb3ekjsIY6Ipc8eKjmSf2hfuamx2QJnq00HycvGbkACEpKW4-I3b6zsW1TLPX_kgAu65OcV25TGuzwkHQyGh-j5Qb7mYEqZIm2D7Tw-MJG2AIq2a_cdV8Qu3Y9PVcCM4q5RnAPe1A	{"<a href=\\"https://maps.google.com/maps/contrib/101939800367324146710\\">Rodrigo Alexis Tapia Navarrete</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
589	791	1024	768	AeeoHcLeuU3xJHADCqpPCihBFwCLGgInSCdz3aJEgEJQhSsmA_IOSi97j3MePsp-7zckvELZ5jYEY44lAqPAWrdUEMgEnViVWDSdfcaUBNQxZDFHMnmJ4ol2SSrf2WnsITE_ULUrY4VQV64VQfRV6Ev1bMz1qRVbxZPHpnS3ZQioK3cQ0Pc-ncU0PQBuaprz_50tq1dD-FoD92YeM0xfi7cpOO9l9LWlsmPfvQX766IV3Chr0-iBKhTm8eHoklCnm8Kqpkq_zj_iMWZtuwL7YxiQjDfVatIT7nrLCtX7sBrNQng4n3Tg0kmiO4fgLiA1pB1ndocwkNda	{"<a href=\\"https://maps.google.com/maps/contrib/105657345628801138385\\">Café Bar La Firma</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
590	792	2088	4640	AeeoHcKSaYXSlkqFzN_YKwYYEVTaKGrSC4_8My9tr_qfHt-b09OBRtU8Id9y7GcWJvhBgoJXkjqkymH_4CiNWpSRPQQfSJXbu1eSALUlSYYlxxYGsipcvoRqv0IxvwiqtF9ps12jzxSRbYtss0BKFxrzXMASfaI17NiMJ63U4IG90gR_vKEsHIWYHypFYVihh1aKv1Ptg5qjSxsC6dwtoOyKtXcFZGTX8iLQB0Pb5sk3Etf058C3AadGytfiQO3pILrsZyXxcs17SbNrScYwRFe2EA7I8T9o29kd8I5lCOd0g259IWOthDKtRxCjdRW6QBKzO9WnEVjBpGEMfwFNAGNLfxUz46LU9jUR9gABRQgSYccg9RRHXffPAizRXy39PCczJ4JeRWgF97fLCvK1iO618GCKoh42RGsnbF_aSVvpxxgdusO8kEvMtiOoW4O2aqrolZWEUDYTGAMmWN-jfvuFvlOYPSiRQq6VNw80XNKO3tBBQdP_ELbLCDs85p6K9O3y66kfur4s6YS30mEDorJLhSZsW1RLXQboaYz1fg0mfhKSxLKl1zXmgK4HCyxtc1-QrkmAXR0Dioo69eCQ2xus55QPFMMPVVtoOVNcurC55FpFvGWDdTO3OB0LKQeSQexOnpcr_Azd	{"<a href=\\"https://maps.google.com/maps/contrib/110085037258063802314\\">Ruben Pizarro</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
591	793	1080	1616	AeeoHcJPPicO1Hbi7g4BacL4WV-k_tTc5YnfNrX9gygj4xG8W8QP-hyg-8zDnm659GGFkvIHWRUcZSdZdE3OPWPZquYsI6CHsN2wyFLxs3VGdOw7pxNwKjWabqObulFJ9K0jOuY6Kwm1ZghnFzSyHifbftlpXKUJqMZ4IO_mxgaCC3qQRuoS7InZWOcjo5xoTGuS6Kbgi6jY1mJlaD9cvihxufHk_Ihp5HlE1sZzUrHMEhkhZbnmnN-4Kgq8R-lLtLBYlX3qETwmKs58IqJuk3yDdHMddQG2FrsXW4V2MbvsIb3ZO39TVsMHuzGr69Sam7-rMDaD9MHS702UO1VbSS2bb0Dnj7oB35Pc2pOlq3gpAIkYtx2BZsWh1u9mgESYJfGTrFI4DW_Pq9pwIZyxr4m51PK_T3hYLsXyMDpgYdqYOZR8eajSu3xV_9GzA_6J7BD-_WEDl4bzAjeR3j4iot-DRhdsSR2DeQy_k1m-Ly6dXtGekQiaEwJIIBnycj81NgNtTLC_VJ8KHjegpBFCdzrmv6U90ppKkas3-XjR3n59N07VHHVElSwGtHfjnqoiz_jQiUWBj4VYlVHKedzR_caWvfA5Ac0j3NebWCXk4iVn30jHZolUgvWOm_Ncf1hHq5T8jNv4lw	{"<a href=\\"https://maps.google.com/maps/contrib/102411594181605036064\\">Juan González -Kopal Ingeniería</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
592	795	1600	1200	AeeoHcLi67uOOTVhIoKzv4Ej-dnWBVPmLZRLS5Ifvb54pllv6cfS9eMAcIqAKvTsLFfTgZ9xNdQdf8VCH69oOxAQ362kYP2EadFpM6oqhuki-eRWwdhD_d-zWEVCgknrJAsMcEUEadUTtW6c_759xawmyc8ApLlnz_jrzjztZfUGAukxfQnUy3b_ElXNO4oiw3LVQTERgnzDghUpi7ApOt1bidNv5BeBgcNd4IMQMeQMAQq1GEqQC1gcrucY__Xn3xiqB4TsXUltF2t6AFOiBNOZRmeaBS1u21glbq1b-87CARYQUZmkWbIsDAHziSfCQbv23bHmhDkj6yo	{"<a href=\\"https://maps.google.com/maps/contrib/118205189262842395573\\">K&#39;runga Restobar</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
593	796	3264	1472	AeeoHcI7nxkfkfznwqVQceJbFwGc2PydrGDeF28artkmhEhXl3mASk3vYYQ9Uqr1PXNdtri_zxEuGkf4w38QK822A5zsKUs04yk8h4t8i8940LizA1YXuMwh2--oMGnjJu51DmwDDC1f4b6qtMn6y6ct1szXfwooiQPIp1_snGBzz-GXa5HI_CZ8ewNIdZ6y8g8q8ExNiQfb146SaBqbsJUVKmTTlm12BMkYPAm4qD6DF4jJe2YFv1P9vqMCRs9PFATmzrBdZe_6dzPrm7Hj9zfTjIeK0C0ilNCbGJ0TPokR5LTo0aq-4jeKjXQtucJjHIYexg6w_Unq5YU-koJV9Th9jk-7A3CSG_uNZyA4QbmBRsBEYJvtn93JJVV-qV030eE4aKaA1KbxX93pHZn5k5XxaiCHrdJl_uc--lyweGzECzNVOm1sbbnJ8eYou4MgxbMsAIt4hUWlaWGwVbI6BPShLnwCnWwSsqnbKOI60RvGY2HKkIbe5C75G4igOc_fOWJEgJJyuZxvXxoH9n2KY8XWqkUfSSgPmDFspczUKpN4NAiLozPzHw_eBgueUSpHUUc_BM5ZkPx8xDaVKg6GhC9W7eWD3pjGbQyCDHq7GKqrDoykx6pVURl08Ds_xK4TdExj6X2dfSBi	{"<a href=\\"https://maps.google.com/maps/contrib/111472984376453969575\\">Yo</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
594	797	5000	3500	AeeoHcJLYB1iou7cWAVtWD0CujsHPukz-0E3WCKaXnadhBJ0x1NTL5tPZCPuHMRkq_Y7jV02AQMfRBThSosz43mnWSTjW6TCIYfDrw_vGcCWYevavkGyGPOYfdGAjnMTGYCmWrl-uoJguLSaeiQ13-IspO5eftXKdR9hfS_xJUtVhytxN_c0Gg2d8CqqDO1UURDfSxhZYZ6THLoXcyuEtAj6NEsrIQRCRCQIgoyv8EmNEE3G9WQCmnPp0loN8NzrLVhNfBY851xpFbzrngFWmMwUgBn5mm4SjzmPkQbjBdwtT7blrox7uhqY65-6ijAnlTq1pa-vnIoMFlWw8McOTuNNVzMJfjwqJsEo5KxusCm6blRWcvspptWxM4-ZLc4ptuwyxWy5vdBb_eCKXWAF146sEMjlLlseyCcrJ8pRAoTX8iNKw5jH6Lxk1O5kRplocy5mc5v_POI1AUT7pB6P40WN76CvZFBNBlhpi764sUW_gNvWVAer8mrel8efN19fUjivNngciLPT6Y8ASQCMjSeOnqWPlHUcDZkHLE4i2abCcW5s6t7LWG15HPFVEntV-LC9Sxm1r7xgCPnsXYj8Pe1mjdDBr__zWr5QKHQHc-FbCVI7suqGrrywZnDKpXmfGWO9vC-HSF6A	{"<a href=\\"https://maps.google.com/maps/contrib/101462467797033185128\\">TappedDust 3709</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
595	799	3000	4000	AeeoHcJpbKsochbm3iOM49HyVXcQOutkOKBSOeZOpi5A-FhBG1UFBkoURTvTTuHDAzGL6wes0W6vx4qC_roR6m28lNr6NUS7KtWk9WoRuANrV3ONjMAmLRWoeEdFkJ8AAPXhPesIfeb0PPwBqVloFMFxZJnnKIunhlTWwPLUH3vEFB-vEYvpnzzNHMxd8zHInfoy9O05BsIfxHmAI7Zb7HzCI9lt3LSD6Fh2_4nlR7HhA4vJShIALKVhYBWa8fDQUBXk5AsprMnj3lQe7Vg5qqWcOeNJngY6rvwOWa-piPTP-7_Jo0eAbosCEiHiODg7d5y8QdNq5QuRxGkbiEO9SwVhAdbzfFQX38lSeq1Zbnc5KDqO3YTfXZ56aQ3-qyrfYIJkZsHYh1Tej3cNgpEY_Ryw9UdoBnji5ZZFkc0RZBoIv3qFOVYM8-UmCVyqbp33DFzWBeIVhJfMIzb2HZ-sSmpoLYRCQTYgipFHCEUwiCe7y-SqFIWSO19vntXsTU2_oV5dJZVdqOR9zLACxAY4kEj6q23eRnrBSup7kQ7NqRUut9hdztqmMgPryBKnXhghfpm6rSx-EYoMG0lAlqXPj_T6XSOps2ozJCne5gOMfXifA_aRVgN1-d6dwozwA6hzCgL-vla2o2Jn	{"<a href=\\"https://maps.google.com/maps/contrib/115459732730453500375\\">Benjamín Soto Rojas</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
596	800	867	1156	AeeoHcJFXtxiPJd9Hy-Qd_jNtGZqg0ZnpEXlq4M7PK0bjxjGpE_1ZknPn336wiFq9ElEMtiHlI_sCOrEzg_lhHbnElKjqzkLwiu4LrjgF3o4ldCpS5H2aMqNq7Z2YS0ChtU-XImNBWo_A42jkF6zUQhuPAsUVniOUQIcHJyY5LkoOEzn7JDQ2adUIRGVp6slsPgArybd_oLY5pKimZjb5B0XrdNhtQizS2nTkgL7I1WTyWk5BYnvgxcp-ilte8zHoW6jpAhM2EpDgL_-S--UGm052eLUlZREOfva95obUR6sIXldrwxJED3RIR9I9vHz9RtOPKK7Tl6NV9c	{"<a href=\\"https://maps.google.com/maps/contrib/107052959175249529981\\">Tabaquería Quitra</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
597	801	4032	3024	AeeoHcLb6e7HQFD47YEf5BqFygygz_sUNxNMu4UG3dvnk-p_0b-NTYhYYp1w6DS0QqnGMVdQtjeTGghTTuAxrTpqmKEIoeswg_SjTYDoEVh3QFBg--FPFnBwJrpkIZzgvSwkbPctD1Ze5jyD1yIqlo_zpTAV5DL-tUgHC0N6U3CXQC7GJNPMnG5W8F2kf3oqjEYGSlNjInLzWp1FNmSBpSEqHmTk0NbQJTjaHDlXpc2hPyF2rZgALRdxm0jJgTIZxwv63nDDXn6TuF_qleDaeHGr4un6-zQ_6GvZOV7qrhLyMGpyT8gYY5yeDXzokcI8U8MwdQJUefAlMGlIlhlSUuBpIsZvxFJDhLqLIPq27yUCOt2JDEun1RzOyqfOr79KurrevdqlTVScmo0zqd_Y7YtgR4HytnilK-RZRcKPNgO2q1mZczyReUA8CJGC-fLawHHz-Lerb9Uj50BSsDIi-7OLf75SnYN7sx5WT2ow5S4DTZax84MIoiK6jN-gKOEn594v1k5P9oHsJ49hl7__HN3T5-Dbp5XI5scczl1eMova7W-lOEPw3nGiJdiQRaX34B2FdQQnMrfl479J8Q-RvrcdORTFKXvjwvDbvJhvBvWbKjmWIloscWrM4WgLWoIdGn9O509OjvQX	{"<a href=\\"https://maps.google.com/maps/contrib/117375562641868359915\\">Sebastián Scroggie</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
598	802	960	1280	AeeoHcIfUfDdn_4B0iXZsQPUpuIMGIlEJt3ly345bnb3Vou6m51bmcvpK5J7jy8kzHDlqZMUN-UScjXZepGKmrws5XLWCEKYrxROe_3CbF9oXzflCJBq8RbnNnqdtKVoBh6jCnYeZugsPB0du_MGkBvZwKfVSwjQHPaAMrNl9ALAe0V2qlk4GbemYINA8kCPWCpD5qRzh0wsjpzF8sXS_Xqh7KQgtH-hijBHylyxemlvIbjEMIGRHqsBIT5ZsC4SjPe_H25DBxiRQgcYnQ0mpe01YAJMDRwYWzpcYnO4TpnBvbxG3argqKwPyFz561R7NyKSdMFQWiB022g	{"<a href=\\"https://maps.google.com/maps/contrib/100639685391822290909\\">Chocolatería Entrelagos</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
599	803	642	960	AeeoHcIqr-2FpfpIiW3tPr0tUeERaeUDCJva83P5vUM6YctN2gjR4jKAoHUyk5U9oleOkM5z_TB0rPb17UOYuRT1GZKR4C2ws89kG76fNvJWu5UdpJWgzvnEdw85tY5gaJusUY0NJA2Rt3Kx_Ki4A2NlUWVt33tv0TL9vv4D2itX4A3skPolgDaUJWwBhshPf9LRrpCQf0eMY-GcQ9v4cx1Ov7lXpNUFad_u9aBkgCXWEtt11jPZEAPJZywRhtDdzNLDnK2lL87rr76tzBw1ZKeJIC5X7e7mTkxocupMUa8knXa9tPt4NO_EefQoJDG4ZKXgPyj_OmYQ9AI	{"<a href=\\"https://maps.google.com/maps/contrib/107126696116722676792\\">Café Cappuccino Company &amp; Pastelería (Isla Teja)</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
600	804	2736	3648	AeeoHcJQ5T6blNYxb5aZ9Y262UnjJwsQ30myTSK9vS44JFwB0r0L5dV5Gufxicb2OVbuJ0PW675o4ZMLlueJwCxNmjoRsPpCLg3n32zkV5zIVChoZUDZqMacHqTa73rs0DzDUfXE8_zqacxb7XSNRbRxuWZwRsO4KC5oJW-XI08NfVGsgU7GSa19mUofGj1lMDcr1MnILrWfs5WZ8t9Dj0F0Kz2f03bvXxjf4aVRyi5V6K3XVtsWpwIX7zsVaHf0n6uZyEisKoJ4b-G0Wg0LVWLDyie1xB-I6TTG-FSqB0vRSp1yeORsz7vBCn84xeRT7eJa8hWo5EF54pUojb8sAx8bCgn4-eyR5_SrE3Prgwi0IcJlRCQK2CxvlO_4IxEZzibT8dZkoM2L6N-QNld-e6srELYArvBvl_EYLddZqozNvm806Sgth5pumn-dr0R0xM-s8GXzp5aGWw8PLZSnCKROhITFd4WayGyxsn1dDSMP6hY6qUhn4WVukWoKBLLsWxWkRfYYR2Bk3uQBxSocy3rWWNZhhCi6IWzGSKvQHs2ye-_WMerw2dJNSQNuc1Yg2LC1J1LdpQbhaLFurKo2IUhtdo87axqa34AASSV5yXiq1tM7IAyU4ZKk3BqktgJgE51VgmrH39EH	{"<a href=\\"https://maps.google.com/maps/contrib/112100968966176148754\\">Ignacio Correa Hudson</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
601	805	1065	852	AeeoHcJHihWZGMFGQiQs6VO-N-0n9cMeD87geO710W1U852XRA3tfSEErTm-AIdEASGWpXXC6PULtze2ZLGBGqIxIZlnsnqhCECpLyj8PFXaGmEhQyNdfbBWsnHBcf61tHtObcKzuKu4upuPoj1CuHJvFSmnETXFTSSSE23-soGk9UeZf4TdCTvs_8p994Wrux-6IbTkTnlv6K_FYFIYmf-PP1S4lv_IEIhuO5tzr-BMqiPK6Kqla_Zs4a6kzhiQGoNWV9IvvCVo-ID2eDtUbTtoMvZL-GlVbX5HUbgAcfuRWylbWxV_e78uWUypL3SAf8MNzYj1w63WZdM	{"<a href=\\"https://maps.google.com/maps/contrib/101691027673972152286\\">Vainilla y Cacao</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
602	806	2336	4160	AeeoHcJd0wcsfChtfRkLyeXZwgJAOIXl_sqKza9_6kUQC_Knf2l-Qd_pk3kcRgMPrgW9pmFIfQz_fgAczCLj4yLQqLNd123bBkTzftujJ2rda9ROlmo_uHHqTDWDwu511b93_sAF2P_opdL7WnQGLmPVxoS2FK3RzaMsQ_d5p8L5L4p6mz0bzoOmVYpZ6UBo6NbONSgU3AyY3A9l8gxMuiii1u348D-yKog4tjDYgNoI-aB1LAl7H8B6rNjMjKsSvhraJ6xOej_ATAmmrK169I94W24qLu6GA5IGpTpMxxHc4nB3jBKwz4fWEFknXFI5QBg5qTdJGL19j8KdZCnNslmbE7HFT-GyKngyJlFVd3HNMJUMJIPLQN1f2o8jwUvED8HUbsJd7X0TQjLif8l8MtNf9fP78O2b9yiqR6_q-8GvxW_5WCoVaaousiWD6GfdhaoxBMXP6WmWEWWQ--gOtmb4eSA_itYSVjZxg--eGErb1VRg6xLYQCgSsuoEZMTJy-AQfH8nSj0PVg2TbWg2sQNZ0dr8dI-DkV51XffMcb0cK_f1uIjx70gZrMrKWkwOYj-c_z6zoek3sLg_h3tHDdQf9RmmpCYXE42om7VQB7Gjd-Up5O_mmrjpc3Ag3zkc2cLMyIG4LA	{"<a href=\\"https://maps.google.com/maps/contrib/113183838814791076807\\">Karina Burgos Soto</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
603	807	3096	4128	AeeoHcI3njLz7szmUQ34PhmwgLER7l6Tw92Bc4FU_9sJAf5s601o6RbrYineCRHOzMtpdsTRk4ngTqK5myvGCIPbTw2A6YOQM03_XdjV4WsrieYdwd0hIbjf7JQo4IzKZBd-6X5xg2LgJHySEZhoPnn6iJnFmzVPgsnGwlx12JyXmuDcOpmnCFqx3nYUxwrXv39LFyP-elE7bBxP-5vGe8gaHLrFH7VOCzXqbX0VG-fT8PoSz4DBLt2un_FyQg4fPS5HRjuabn_Y9BB8jOMnfRcQB5rdKFKXOV41as708mPhAmbIR12-vGRUyK0T64jCHHBkNbqMtHy73YtCvKY6w4xlydxxCwaGJ9M15j_JQjUkrMKEEpVfmgFeCGnThlJrO7UpDcKJJZkIM8KGYKMGn9P2EN0jjPl0mQvZPgohljdgwRfhyoCzpyI7kmK4KbRW35Op3_vvlivnWgd_m89WIKWqmG3qPHCsYzWJaojAijQDdX2HuqUE1jYwQ1d_GEKkQWtiS3PyImwk1UlEzYJ10lByN0py1119PmLUa1IF9Jg7GH9SZVzpFD7yhOVbTdOZfk0maZgvjWdi2E_v13LpP42qXpywokKSYy8yNTYo-C_qkvJ9lWqQ5ZoGu2vsgkJO6tGm524cgw	{"<a href=\\"https://maps.google.com/maps/contrib/113364891218599149112\\">patmiras</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
604	809	4032	3024	AeeoHcKJ-AaKJrIalHJ8fsrWQGEC3LzyNwfrK5HGZLo3E-I4P7AAOm7B0kQjnuROsJp3VifTjJNVM9mU1L6rGSFws1L1BH7Bcs7gznOFy8jib6UOGXO2M1IQohXYirONReOqu1UKs_kblIv__S5_0NiApZJ_E-TD4Fh89P0PzC-4az-WuXJ_a_66T402O20_JSnZfFLllTgZ5-440HFyy7dbdQmFKjOJkCikcnXqOCjDAZBIPXaXpmrFtDm8z7Vnp4Wq1ydEX-edZ-x07EMFdjxUWNbIV0FrTvURnMTaA9DNemi370nuCHA7y0THp3Gtqly9C1tAWwmYg2M	{"<a href=\\"https://maps.google.com/maps/contrib/116611197821907042871\\">Galletas Tip Top</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
630	839	2652	1200	AeeoHcIOQj1__L1wvsn_XBXyDdq7YuKmlYnTs5KaiDY96bSIdyUe7sI8YYsZBLHLrhpT2vkk04EyC8Xqasad5B6saksYJQ4hxYsAOJ5KEhmFIsMXKjWSSJZz_BYEhqiPxDocdzUK5J2GhG0mZ74gzzdvUNhkCcI68woCs-6cwO03nWpH636k9qeFiZ-sZQniftJ9esbYEJbHe-QB5MyrxFyoa-lkQ9iHUIylnh-za8XSgeUxe_h6xa-Cj_-2nh3Fym4ZsRx0RwW5ei_FEQsc3PFuz4R9gH8GVd5HQGl3J8xkCAxyNIZ4X96IM11h6TaQ-iBME91dxWgN	{"<a href=\\"https://maps.google.com/maps/contrib/115229650208571320099\\">Sushi-An Delivery</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
605	810	1623	1080	AeeoHcIEtKlW3MGfcZOGoaZjzFHbVzVThZNVaXFrjrVzRvT_cKZsiJqS5IaD8spIZkx0XZrekZGOwwbTc_3ipCmyNGmOox8lXG93F9EfN_hCbFRTjCVTiVSKQsmu-4N84lRSK4ytm2MBEOWDd4nQDwoEXz6qW-EchkRT5DIEowvMvquy6VRuA1Sn6pcHsSPTdL-6bNv8p1ayIG7VzE0Vu7ZhEDcoNo7VdyW-RFOZC8dzDlCsX2lK5KlVAQm933uGZvhe0YgPYczkpIGLLmHZHkH-7EdC7ItX7H8T4_0qFrEWiJszZ1IK5QcNkqU6rzjuyuhj7SzpZfgWhRk	{"<a href=\\"https://maps.google.com/maps/contrib/101898969664967517824\\">Pastelería Tentados</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
606	811	810	1440	AeeoHcIHlrClRcQsV55IoL62FduQIMJBs5P1-qNni-ligeUsjCAWYAR5ycnnx8r1oc85hCbHt6CChqkwvlhRnd-o89AlqnmA3AKGRQwW793hnQQWw8DK01-9CY5ekKkj8m4-dR5U-h1D3SOZXZy4nuj4b1LqPo4_72A8wt9nKGvkY_b_JPKFrFEOxoTV3I0iJfStPYmlMKWDoEWLZl9Ib6kIqU2CMAOO0Fe0Y6vKHJpXw9gT6JFbQl-yf0BUyLNG-3dHoHqh75oD-ZjKOxD7wAQqf1cUaB3Uj4z2SZsj_Hk4xrfM5OKspq5ANzWbNqtQCRUarj3V2hmJC-w	{"<a href=\\"https://maps.google.com/maps/contrib/116116930725746703365\\">Tortas y Postres Manjares</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
607	812	2604	4624	AeeoHcJzCeqXAd9M4y4PJqz_9sbVNFhBFL1n70lQE3BJI9FT7Lkelyxvryqudg3vCpQIttDwPjpyVB9aIl2yDmtMFIJRJ_Wahd4Mq2dunNP4xEYyLpuxxFEoM-ht7hDA4_w6pVOLOiDJtQ73dYc1FoYxB2BueYts7ua0Bt_LX4yvjluugYKht6WKOaiQcz_5Gc5ugnUwDKdjewTmijfjowNqbC8pUktjwqMqmXLE2A18iGmervL-1s3ChGmqQkbKALatdVmKEp24whY8XktFeyLYI6B9SHZ4ZENZobxDABF9GQckN5QqcXpIj5r5ZIUTNVUOT4WYZWuET4HjKtkxjE-fn2UYsICCVfgYKeoCIjEEJ6KWWSZIMl3QH3cQoUUazRkuU5NRlsoaztqfKnNcx-XVUMwzWQCNUmnFSwg3DVlsLHB5Fql02Nutms-Ycpo2bH98q6uopR9r5R8quHTYJWLL-Nin-gayxhfdxlnTtfaRxx5AGuWEHL5ZdrPwWZ5k407PNG7fv25L0F__WsKMVuyywa1msOXxDnIqThhiZCw1Rvs8LEtZtfIvkXnrmgxTGdMx5M7Zg0CPUJFWJNzr4vaREfBIhm1GtyBHa6LApoh1Qz76cy5wSS9oC68dT5ZEc-Wozu8r4A	{"<a href=\\"https://maps.google.com/maps/contrib/116927776370926624440\\">Hans Noriega</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
608	813	3060	4080	AeeoHcJlCec9y29Y2ab_Jo1Oofa7yx22v8B9_Af571UKgycdE8NvvAdNXxsJ7G3La1zRUjELmJ18gXkdP807IPvHhKijvJ6IVubd-CGYJ4TPG-c8lkvZuSaFOlcGYRm7OuGsy3Hw_yfkHiI0r5BU_BGt07oSftF7qoFJEYBw9s64YeDgxe2dqsNEC5NLXaTl8W17Ri8dDnA8dKtDTNieMDwj8pOj6WflKsVocU1p0B7FCmZpLtXxVQUbQKXH_JvYk-Sto7R4KPhQTGvdG0U7z4-LJHsOOSRz0qjWLqUKATo56ZWBqmA02smKF-QNlS2ke4uV4VAHjpO3BVRjXtusLqgski794dTDFlDOQTlV-H81Fzli12-zEorXQumcbghK390uM2-O3sfRC1lNRVV09ksFTAk3HCc5kAwibPGC8V1g0FqcxJK-X-l_vVWZlq-x5SUzMZwLukX8PpXmuZNkmkTtqoeNVhg1btVIrck2eRceo8_TfurObuJ1zpIhrLRBPatgu6KQYms4UsWCkKq7p5r3NIQN1YI7aRq89MBETvxZEXhqkZovkumCDTp13xPjlbCHV_PpjyEa9licwhvEpwdMXfVsHWIwL7AIl6zjH-ob7FkoGYP8T8VAZ5V6is8B6cbShPuuTg	{"<a href=\\"https://maps.google.com/maps/contrib/101145845059239185865\\">Marilyn Jaramillo</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
609	814	960	1280	AeeoHcLejg_xFtA4971p8uL8lgtm4y8PkoKP5jozOp-KzSeNPTwjyJDGi5HMJdmMnyrtY8TDgy7in0fIEQrPXcTeZWzAYHGhztmP3AGxhbciLdZlU0KixG-v446KCaC_Q3b5SVwoCuZMWqaZ5C9B-UwjNtcN0_XZ1lGStbXWFA13sXBQRzETkALFP5Tvf1qb_bmLRzCrcpjn6OCaauzuQg6dTe75bajfrZihTAdtSDLpCPFdWbma2F-mAO2TiOGEWJNcu6lboSzr1Tyt6haw1EXxQe2kv8nTI2oKiLKCUkqurkNngZAGE4wlrRc8D1deDSPPW_Oegq-ICks	{"<a href=\\"https://maps.google.com/maps/contrib/107238946046392336084\\">Delicias Porteñas</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
610	815	1180	1180	AeeoHcJGg5KideZ80l6kjoVheYzcDbmBSmhHmOHFVVWV2RkqPB1Jdrtu_gZD4uCMDKcmnuak207U86UAe117b-x6tqBTYYa8xEHq7aiaqEZ2ixg9tIYwMuj_tjza3uQ-ZBbeFQTpxY_FgymakNU8HbXrJqxUNzHnfj8B6N2K-FWGPbMdJTBfGJSG3aU3SfrYOULcLMabHbyKYQMvsJjFBmLBSZ9No22uIZ34zJSkRGOa660XAu3gLbFt0ZuZUROu7xu5XCHyDN4Z1C4e9MBveTPx365ajv3tq4fQEolz08URwQZBcp8I9JewsUtQHED32l6fl-TjCT39O4Q	{"<a href=\\"https://maps.google.com/maps/contrib/103906222346894239013\\">La Empanadissima Valdivia - Fabricación y venta de empanadas</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
611	817	4000	3000	AeeoHcLq-XIsKDCU9xFp9qblc-HHBNKkacDsQxk452oP-Xbcfyka1knIO9znE2-X-wV-Jy6B4XQJo_9BbHX9jGKW_O8fGeGK-nmrfPLjobnOnAMYw_9nNYJ1mZ6WVi8ORGWji8CST5oMIwOKVd3a9kqcFNMD7avYFdfDXU8uu6VPg-qsNkwH4NTByyLwxZl1tw6E5nY0E5hVhrWXVFGsfa2HJoevQ_rgFdrGOHavcGZ_YGvkfdwGzyzhl5vIbLI_GbjJzFQLRgwL7b-uPOvNK9xboiaSi8CuNmarvvtEE61mF204q7ENj0Q5uPV_qWlwBIJjpF0kUbM99zbWcj0UUO9vvEzia51oIro5YV7j3stvYMSaQzskXofn5tiuLmi7HAeMz6f9yaon3-dhTTKi5bioxIoUeSL8BJ9APcIPidpORfuLUH0VKDopx1ndJBw6dA5yy9d4KYHAlJcR4y5qelEpH36GSJ_vcRblW-hHa2HX4IYPnIHuilfApmY9_lDd_Tbwemih0fAYg_tgQaOH7EZN6YTNHegQ0EQhGc_ORCjq0Ujq9qWVGoO73qziH28-yZ5tbuk853qvl9D8mDYPlzn2H6sHNA_hPDn9Q-GuDRIMAZjFXajUBACLwAtSEFPlsJ1S_IB2fbuL	{"<a href=\\"https://maps.google.com/maps/contrib/109473794805454450592\\">Rai Singh Uriarte</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
612	818	4160	3120	AeeoHcKhSddyNAyauaSv8XOuBhQcOK8ZSeUseiTQtZIob-cxFpDkpCqLmVYqWlMmPWyIAa3ywP2zlyBPTgPV5O-ELwTBQCKJY5I7aXBSAZhElLd_Ok2q3yJPkCpYOeaNoN_njdm2rhIDiqK5El1EsdBfUdru-TRaLxfSa_cK735UFW3KHOPIBsTabYtR1XUrPFrLKPwTv5NmI5uo01J9LjhgG2ha_N9VP1u5FWjxrQhjQ9vV3oAbteRurSccSZ6CAT4b1539TgSJADGiEBwahUo5820eRByRqqjj-ASNFgQek3UOyY1i6Sx1yMHQ1NeF3hqfnE1_LvtBccYUM1SMf2uZv7ZM5ucyncN5lMGxUcwyI-Drs0A84WTM2wqmYNc4x7icOBYnG7cqgBgpHVqiWRU1eqK81pDvS-XGmsAIrrgbQSYVBFpVp7oiCBXWKAcmIwwwBrJz40GeQjtv9eu3TWWA_5AyodjXUUzE-7wVypHD3dSZDFZhpZaGzmeGACGzHybmSmj6QrdFf4iiYOC4kX8bde0pikABQ9w-iT65nIFJiW2MI500WUZj8p7R4tieJTmwVMq--0_R2hKyAkWJpB_ijgQw0gVCHyJdD1691X7A23DXI_ab0ASpLtiDjV-yOzVA1XEW2w	{"<a href=\\"https://maps.google.com/maps/contrib/108021263703919335786\\">Stephanie Pacheco</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
613	819	900	1600	AeeoHcLtwq53If8lVyr_w2s2lODLh1GyUhjzVVQTwVM5j3VGr5VQZKgoPwIYIHX3jC_NswvQqGt-jGs5tZC7vWKJ28_UsXlI6hEwzvwaoH-wi8sYVNMTlh0TdFDH4K4KnQY3jrlLKXCTKeyWO-fujc2d9nbQuzHaZFbFeIFN_HDMmu1qQQDG5nyk-SDWaAt8dX5IByZNlTrM4qihNJBLXHx2yWz9z2E1XK9lmYp5YLO3_x8ZosTXZC-vbDfb7xd6xsxKEGWDEbPpuhxw0S7l2iX4LpP1M3WfWAqfCOThJztFu0RAD66wnST9JSESEY3ilztHb1SEmyE-BgA	{"<a href=\\"https://maps.google.com/maps/contrib/101723443500992573726\\">McDonald&#39;s</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
614	820	2250	2250	AeeoHcLbN-BGZSh5MGhyJ7YJBO4XVCuELnY_SQK9NetI0ei8_TjtPs4iTyLuMn2mc-uwPQGifb5PM7-2AOc6i6B_RVgSPYOptnpqy3Uyi_flNTgfrwz-plMdyd4Erml9zc0CfiQYDGAqq3LYuwlijDvnpJQThD3uriLu5EIRQO99yBQAQt-XAI4ZaEkFclm0qC_FROpe0OHWuNTmCV3B6Qd_aZOB8UdC1tX0W0sZKQ2Ab3DMSChVIZcEiFPu16B0MtGuSx1LcIFEAZOBJhnfkGCorH2iR5Ak4XyPCTKObITJ0_tzTplgIO0fhNbqKmpzPpjmSHX-ydgEU1jJ6y8hUpTNig5mh-K2YHiv0k7ae0LAg1lq2mg9NTRtIwQQj96bISCa70ecTJ9H0JjOULaCkGk-ajjFKfjW0yyLDX_aoiHaCegBH710EGqTJhpMapvSfUGLtPa5x5qmHuFDohAIgM577FYJ06o1VeqehOyLSW_xIEyzMwn1Igvr0Zj2WYdSNW_EsxLF4Y4tC19SCi7ZQfhdGbnwf_zkxvyz1-SBk2l2Ls4Hjs_q1_e9QymSjda8cYDewXxDXNFKNK4glYCTjw9OrrumETGVGZj4yI-4wYhLbPcun2uQXf3daTnAAiJVdd3Wkt7xrwl2	{"<a href=\\"https://maps.google.com/maps/contrib/116915959339374841116\\">paola castillo</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
615	821	4032	3024	AeeoHcIcpr_W6aIjW92yimNFD5dlp4FiNwAAwoMArnLQWVWGaKXc630CErVr63uFpyXt0hVYQRRnrFZIui2en3nkZF-6LEGT9PjD-K5IFmjzlF6Q5Hezlg9eTa6ZFYjR7I32WyNfC8mY_X8YtAc7BqQQk-U3eYxhbVVXPbE2yw-KD2TuYK3VD2_QuuFd6MCgHOCe60OR7laHp6MPCxjrXumDyqSFbhWpOTeKSn00LZjKbvcQ6UtI1FtRwb8MjcWmpmivmI2y2vTKIrKobNkZ24rh2CcdMQPlrmHlVkU7qKVY-GNFqj_liO5yubGhX8z7gzufbULN4J9VWLD4_0XOop3jxa15pxgO2q-adR-AsucVORxol0QJu6sE5PPiRVF3EqofmLJgqZ_zgxM2VguHsebB1i-Y85wUo5Md3vDfuulLJvNfLg4Ytgmvn1nL-LpQoXtLb0HtMEeHAUvbrjXMKDpJ-zuMmY0_sjJLWu5cXhzujIXYDQ1Iko4Ep3_db6fbA-DwVlL1Hx2JdTpBjLovEwupyO_bBhmq1aH0c7jyuuOpuzWnNsdKqKrXrZw9kkgriINjRsAPu9tTVcn8iAKbj31fLHm9EaeB7cMg18ryuqkttRxoqB1XnBtdimusTB0kV5RB8V6r0A	{"<a href=\\"https://maps.google.com/maps/contrib/108677701556023262184\\">lara violette</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
616	823	1152	864	AeeoHcJldFdznQUBGS9BpZr6I_1Qrtd5_coWytS78OK_bHFkn0nf7ONoObRhGfyGXlE4RhB0zYfMlDg83fjWNAemFYwRCXwGPFhzQJ2WFwhD37zN3rndI8ZerEVKVx-eaH2fuoJo8sU3DA4X1fMDle7r2YRJvjcy09bNSrP0_2pJY77RI1ijan3v_ncQrfyK8As5hiqRlayS8t9TcTM2fPqSK5shjN49jY9_QsLEL8qPyU_bq6-qz6W24yBc9F2gfb5ee1u8zn6O_2eSyuNZcmHAy-ZlgcOCDjKiCWXfrSz04EXJzCJrgpk0hmLxaKT0JMBv5x6Z6mUScLw	{"<a href=\\"https://maps.google.com/maps/contrib/105766253032583289340\\">Sangucheria La Real</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
617	825	4000	3000	AeeoHcJEO37xdvmWuvjfjrQQEzG3T3N4WV9h9d1u2oxSrXU-RBLKaUpNOpfnUQPGrBluiZy1CSLnxPrphZAVGL1EoE9ns60eRPe0W2WYd3aHXUo4rTFgPKIcpf2B0zfvqdTLxIyUunuVV-DbLum2eoD--Auwtd_K-HkjgPiemI2I2eHDWuYwNasBBc5PTH7O9ust1Gj1scgCThwp66MgWrFQ2Xk-iD9mNRzyWbe0HYYc_ZxKKWpVVP6UZ8Ng09UAsbR6aHuQ_H9eqVGTZSZ7E27VwEyF_ymhryNEmOFtgjit7yDp6ly4dxH-uTXsHPaUTkWe4zSFyUltBUgN5TxWpVIzoNvgoGggzWMldb0ISUCGvgXaz4dbYTuTzg4VtEjTzz7PIaUGZ1x-kEtat2uTXe63RsuPBNfaY1oJt7NXjFRbjDTl-C99Yn576u15qbNY63izdElgc8OJ9-N9D2q5NVyGHwu7Y-XXZTCXGsDdqerX8D_qXj16I6Ke_1-dW2GTIkshDgFLqDuYl5QujrCUDurfUo9495uNiOkwC-dWCGU_ZSggXATmk9OY_d9GxlIglbQbRWnGmnYCvIIDUqEs_AL4AOlnMn5QMi1RYXmX0dz3YtPFiAPLVZQgvihBGkqS11eFS-Ud7w	{"<a href=\\"https://maps.google.com/maps/contrib/104646978334553325249\\">erika carcamo</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
618	826	3024	4032	AeeoHcKSwFCnlL-uRVWzYwc9E8WXhwMrUj6FKoBfv3zUxM_xBlbqK8JHlZG3pgtI-aSnS0EdMkXUfeaDjESvDLG7ttCwadTHP6oJM847o3HI64PsfxqbMgXIGxZdIFto9uS3D1U40s-6lqtdTplT91asmYzM7nxjNhl_v39N0fiLZiG37Oe9EJY8QKGTPuPNvvwYKyiPLuoHeaOxXhj4ebxdvHnvUeJ0ZRhKpV-9PavIyGdOSLYqirzpXCjUfBG3A_F57YLjSJzq2cZv8el9yC662RW8LgSz_senqvSqIhNCQDPeNigEyQEXj7oYFsAkEPADT89MOVbN7rU	{"<a href=\\"https://maps.google.com/maps/contrib/103461557628005773320\\">Sushi mix Cochrane</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
619	827	4032	3024	AeeoHcIcb0QRc9CPVBMcK2eFVWdRQ46yZCuI--cwFVWZFA2u0B4HT_dpTXqDMLO36KRK1WSWSqRJG-_MLl5O8TVEQg_ciKrVlHYqjXFXgTbKLNeG5prIfFZaGVfHjPeSxzc1s_vPM7KeHn-rsxQm0QCUnz6IiQOkzQkZP37EQU2qAC5D9VM94wlYtVEcHJ9zOb1X7tt_3nbM8ka6omx8KfIl6_4s_GdVNuF-wI7dTUYJFi7aZjWmapO9Jwl0loB2g804O5iPOq-lenxP3QglDAG7XRHGbjU94VqThbcP3PGv6GEIl7pYQ7YFKVU0yFe1ZyP9QfzcSwgu	{"<a href=\\"https://maps.google.com/maps/contrib/102127199976503407081\\">Happy Days Waffles</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
620	828	4001	6000	AeeoHcJ2-bhe2_unrQ8aa8q1otCcVU5ks7-f6W7h_EZcG2jW2K801J3dawEaBK0FsnIrOpTksXq-QODEvQkgX2tv-xuhDaHyjmA9ViPSibpu8BMuJXXK4famtIiG99folV5SMY851A9yUqxiG1-WCjHG2I-Xw18qp38tlXYbsf1i3dUFBYGaqEnAiTKehzNSocP1_kPWkFfTXijs7f7y1oxfu8rnExqBL7gMFVlWtRh9kf11e6a1nIa1bWOXjPO3t94Oo06D1vVhxkBw3wo3MIM_C3aQQmXB9mmLifRrUemB4pVjH82opoZsV-qo8el146QV1UdkM-CZ4nE	{"<a href=\\"https://maps.google.com/maps/contrib/109393282092227070665\\">Sushi Valdivia Tremün</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
621	829	1280	949	AeeoHcLbhqMl4GHSKu_VewtzENIa1OnjDX6B4aA8uXDSCt94hY_iHMvYT6isKOYvxumaUD8VLssLWiAGDL_YngSYyUidelJNT5YzGWpXq4KSn4-QQGlKgAXin0Rzxu4eF4SXqtDR67ZWWc0H1FKDWz95E8CWG3zRwjZ2HO1iyHnMb2Vf1Cc63uuTJqiIUKee-cfIn-W0JgTSE-Nx6MMAw5aqWlFK-JT1YECzD3EYiqRziuAsahTJyYHZir-WiTCay-L0vUONyCqAjau-5L68AVYL0GtMbMqPc4sUIM0_PSKMSuHFbzOfZ2I5b_-HuLK_uTiVrR9fG6hQJEo	{"<a href=\\"https://maps.google.com/maps/contrib/113720469289558036136\\">Pizzas El Cordobés</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
622	830	4080	3072	AeeoHcKBAQl0pFcWRo2goPrYp_ef_lfK4ZqppcFh8gggVRxWmxgxrhP1nTr5342c_V1IDI-ygjjkwHbJcz6OkrAGlU5x36mSbml1Ww6pUUvneKmUx2xL1HhAAMAVzjpYP-oAHhs4SDZKE70WTvBlWExu_zZ5c_tZW9Efsf-vo0wmcTuGR0M_pZiFsUgMRHCZz7-USfnN_CmP6jcxYG09ouctNyXx_O3NeMzB1PD5Ypa-FRoGvg90PH4fcf6VzzkUPENfRMoiD8md7ly41dIhwkTmN9UYYcvNtXgf7MO47rauDzrqv90NIViWyva36sJWWQiytCvFH6AGF8xwHQD-88R4jRj7fXziXIpO-k-MwE0L-nodymmlE1xIhNju16p9DnthDOeOJm204e8A7i3Iv70Q2BLLXR9HF-Q4iynq-cCGSsOlPycQxSKP0z1I1o22BJxxV9NWuI_5iFYu2H02PE3A_S4uHB0XQxR2wyvrTqMDMmNkNtCn-R4XOO7ekjOZxLGy33pZxcqGbMPnEyTcgsIOJUqTSCM96QV3SyE5FYYfSqFPoaVeyuBcXUasRWrdUpJJmqhbPMuFd_Z21m5xVGfYDACvK6smzUlQNYx9K_i4sZwQjM-ZnDtB7OEZQ-uprwoKSsg05c0x	{"<a href=\\"https://maps.google.com/maps/contrib/114017164099839378367\\">Agustina collin llanos</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
623	831	4080	3060	AeeoHcKj_skv3frQfd2D056xAoxleu32rFvF2Uo120mpR9GykQwvVmG1zqPAmIV0M9IakyHDNEPUQY9PexjgGXlJrPQ10FZfaZhci7yy-oOZQVzHQQiNN2N-08ZnfByTIJ1jIBTMqMEjeeQw_m3aors7TyZPAq4gHwT6i-CcQ1LIzig88WAOkS2zH2b4hYxUmFeTlKqTYrJc7R4KOF0vCVJIecrJ7xxRVV6CRpyW-GXVKc0Dr0Y3_1RDXTlbRMyRAtJgWaLPJ4CQgbaJoHyPaOja5KAQbRyt-GLCRQVBNDz7R86JzeT57AeP9zufknxKsEfUkOdUKo7PXYHoXf3Jxi_ydcjvtl3kxrnBPPysg10kSNjE683HZFgkh1ze8YKLqsKjv8zHVDudMKaRBoK0ZX-uDeTahLLXWkTat_-SJP_kJkBQspdNqUMjBFYKvBfnm9E_GUDRlshPJ23epawRZv-MMtzg3fj637GlKWK_J4vMTOOLpPlEXVRSiwqS1sCSxeyDU6oFnyYmLJg0ffeCwCwRnu4F93QWdV3PgNiBKDs9UF8K1xDem6vgsH0HLk8xcwD51B0MCoEFeOvQf3PjKnsp8EmIMJOHH2N2PWRpfbKyNURHRkfFts8k74fM9OFb1YMJWID_gFjw	{"<a href=\\"https://maps.google.com/maps/contrib/111668918485647945265\\">Felipe Villagra</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
624	832	2197	3680	AeeoHcKWUaSQUTSJ9CSRIU4VAFww4NbKHBxgq__pIK8KT8c_kiN0RLtnPUI343PFb9c7d-p0sV9AzIeOWaO7LqXEfjmiMYoDDcGexpe05c-wX5l3GAARXWbaDUHV46YDLu9bl5etFSYznVD744kZe6LCVLEZvyLX3U_TTHvbgG6oKqf66vF86-ZZEYZgwdXTQ0wfhmRg1qKDU7fvkqX9x7nbsZJFrtH6v-AOZsfTL1T3GZWeFIXMWfX7EJO6or8CMliHhjVgHeudg1EiP4HIswn1E8MWE_igrbDh_ty8na2lKyfTZg-DDpdmzS6RlvOdyRGtkVZh9jJbXhQ	{"<a href=\\"https://maps.google.com/maps/contrib/107386040221016039975\\">Shokunin Roll</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
625	833	1024	910	AeeoHcISGsmXjV0kqyH6y-A0COWci8D1_J67sBhPuSrgpgt7azlU8pkEunCe0gHlXoty_SIhO9cyM5TkwHZHhZjF26eWuAzYdgkxcG8SjPrE7gd5d_5f68z0rPw4XF5EGqHr41HYNn30D3We--S7PIE-EbbERQeLLSQnogn_x9ZcgOQK_nUItClSaVz9VGlFfCAq4ES8VJmDkxqyrQRC6-OKQ0FC4UzEtS9B5opyQldgpXdgXJjYVE5KP2_lREClMTHC_acmxK1Ekb9lR-rFluv0U5V-ntuMxKN52IG_a4k1nK-W9t7yr2k_HK8zhHRxXwkOTQ1n637UaQs	{"<a href=\\"https://maps.google.com/maps/contrib/106953997289184896732\\">Nuevo Approach</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
626	834	1993	3000	AeeoHcIQpZMj16s9P2F-3ZVw-DiMSuv-NRB0tyTuVaSIrI2_VBpSZZAhDCpyXoOEEOT_KjypBCVAgSBpksAHmptuE5csUgrFCLmlaU7SwtsCX4uNZNfzpXgO9nn24w9nCjl0HnAPk5gdjDbIB052xy0JHaKBD4_v3k9rlOQlbZndERe9lZLzqHZG6OnD_ukb0YsyE7Q-nCvzkMuE5JRCSZfrsHtuGLgkgifnMyfiNPhv1rpVuO89W62ijZ3EM1Bzlr9jdFr8RggP3OMXAzg90znLwXbjNILWvGSqaED5Vt7pBtdFeuPbjmTWqKxQtOr2_BeM1ryg_hVEUKE	{"<a href=\\"https://maps.google.com/maps/contrib/107340320608493440068\\">Pronto Express Aníbal Pinto N° 2007-Valdivia</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
627	835	1280	960	AeeoHcKLn7djPZbbrQY9rwsYECCN1tRbJL9T8p-OslTMVr8kSqNp_Nwa0-YtmKJxMRRwu5FidAdCxcxITPnlENxOOWtubyVqv6ROInPN_A8khIkV2m3ceNCqU4Cf8KOT8p206W68_qjGm3ycBkYhH9sMQn2KPdKKRN4oAKRK4WMKR9EWhGN2w-ShRVS9E-r5vRF_4ARnT5S1UZGKKBM_rjgjRdrmm8wPmkrkk3EkXNqcX6vKDBqj1LiVdR9KqD6ZX6H_97IocNtXIAX7yCCi7O02kyJULBNYSu4YL3Y1dCFvSZqjWhuKEyhOXFQxjqQeoSspAMzBdXKR88M	{"<a href=\\"https://maps.google.com/maps/contrib/112911187757506135196\\">HK Hakai</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
628	837	3376	6000	AeeoHcLcJv-p5RHoYrU_Gmi8vnHwV9wICLovlYPDAme0OYscbpS-chVSMa5iGURtlqb2ZKHdld7-9SJzJs4AgNeaEVLK3yO2jRfDlcMTCgr2cbKhtuMTJhRgitBRZwIrGgAxVykIWxfb194NyXBMkHHNN2xHUBWoShzef65GroQ5OJZrO3YK5bU-kT4Po6DnwLx500VZcMoRA_ctFnPY_FqGwh7t1ncEvp9cWL84LrmjY98JnECWzZXASa376KlLLharIIEbQhLpFSapipozinw5oK_3fMZFKYfNmwqVmPKHY9ikngDCRWzRELdcP2MiPO4-UY3mCa6lQko	{"<a href=\\"https://maps.google.com/maps/contrib/105086907529438943785\\">GARDENTRUCK</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
629	838	3000	4000	AeeoHcLcnfrC7CzPnQcJfritwO5nX-3RToBqdKysZGxSOzHWGtVqIxBbLy6YYkmX7LSRkZuds5bFnBazjvOzFbtSlziE6WtF41LSN1Gmtmh-KfatcV41VtQmJLuYf0qVRFxk2qMaNwBkT9TDUG_WPNkUkSto5AItTpnYS4bwWH6SrJUiA_3ry7qgEJV1iqDYr5keAww1AU1IC3HJspXIvKejtWQ8dvyC3y0oIHnMUN7s7O4zgxwfVyX9G-2FHvBsWzTrozkepC96x3Expq3M8VUu7FlUMle_c8sqjB6yzC9NqQ2DcAuj5LxCRv7B3nMiy3v8R9Z8kCK_OtM	{"<a href=\\"https://maps.google.com/maps/contrib/115393045069995039404\\">CTM comida a domicilio</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
631	840	1600	1200	AeeoHcILMd2HKWURF_cWB5TGBv5QKYEuNgH7WYMuVEp4xQ2FNNXJ2jVlmJmP4zdjnwabalzqIGGYLlVghOC9VJ0oPdGffEuuFH_cIhi9q4ipdrKVUrZEuXnWiz7yrR2wyWlSxWD6t4n9E1VspTzKgQfvFbcdn5DMQH0d5oHs8_d55QE0F4HFvW-g52tWTtk50_YI9RkP93JIK_n5ji9FwPJOBYz6x8Xof1SzHCr3d_A2ZbjVrO41chWqkeQArpxCur3nYHDOUj_1lfk22FqZOEVehUdZM6CVAUpcYBHjPz2V4dH-evstmPee2TwRSn8yLcCZfgZj8NEHt9Y	{"<a href=\\"https://maps.google.com/maps/contrib/106449983447856538152\\">Klasser Burger</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
632	841	4032	3024	AeeoHcJLOhWVEPJ9BERkeniwm19B3zP6ehijkV2gVCaJfAKQrBjPqTJ8STAlo0qTYGjm1Hh4X6wAK3pWj4AStKi0x6btEAneatBxXSMMmyAhDJvYMT90We_xQ-7_nHUzFgcvSX9-e6NBoFBFttseXV_r_4kv-XNPPC_C8BhkPD7B8ILmBF7-01Nri9ntpnmyj-XPHqMfV8YnXxiEK5nk1v7JihyK0DoQ-TzEs1YR7YAdJ2IRoJsWd9ZSC8rRX9YzIk5p_qGRbbbqWbB9RN_A4XcFSs1O0SD5h439PjA20homJirZlIJ1GIs37x-EF7m0uO3sxRQileHDIvwrYefdl8eTGA5MQg5qqXaLv7Hjc9MLRSkxhmq5I7PtT6HFwMQwwH_tEelsRTSVl8f0VR6uEyn0Pr0XqcxqcTAXI_npsCF2B6JMtf2TPtm3XTHeZVKD8pK9NdfUBU48ozCsVKbR6ozHKFWtuZyQx3FVWKlbD5PmlWi2qf9Ebvu6uyx35z6xqjGEKQEvxVOdfoV1zlOj1tWbuq4mFw8gsoV8aNuoKx6cXCSNr9dMkfwcDlHWCZlZJ3T1iHSEcU60bUkoOcvJBx8URpYCuPLwnUqVWB6M1fXU6hOpjTPsyEQ3RF84VGFQxDPj8GIbWg	{"<a href=\\"https://maps.google.com/maps/contrib/104578265582672037228\\">Jaice Jimenez</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
633	842	1600	1200	AeeoHcLFiPsKgdmTBppa365BC_awNX6EiKYBpYrXatqmnmFYbCAxePBER_3Aheha692L63HVSTeEwp-81caHTdhasejMoj4hLygt9tMwg__dRxd7BOXARGBeuDszapX0C9xYtJdksvodrqcL4wqU00WUPb7aRXfO-dBfvWDGYnYkUuCGZKQJ4YCfEgBOJDqkibjV_DB_GhAEUPif2W4hc31brdyCul7oehzHhb-hM3g9nUSZhkQIFhXqG1inXhMvQZmXT9TmIqdh9RApeToAQAQwYIW4aGgSWrffO_KRoV3hMMiUNNV1vAOkevPIKm0WwfqV6Ur1qivAD_s	{"<a href=\\"https://maps.google.com/maps/contrib/101282406095773509337\\">El Carrito Sabroso</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
634	843	600	600	AeeoHcJ6kXl7XjyFF5oRahqHz4CSrgWUiWSLd9UnqMagV3CHCoBDQ9L1KeJWmTpgbHVevWHAZp4MSYDeRQnMa7_7b_nWpji1w2y5GVO7DU4MB2flA82AJ6ITZeYIChwMUxqFlc-5yCVMWMNpK9ufArfTMJ9nwSJzks6SzS6ypu4qLf7kXbEioE6tD8GI-2lbiBX4vetrXxzQoVbWHuFPo-YL6zXn3_Y6MBx6qr_DwEkNxbbCWP95xkEBIuSH7T2429aOPZGYnfoy77gn7nksD5bqBgJVaYzF9w1zu15YF3mvZ3ws_EJw0KRt5OGMpNDNJ57EEl-H1CwA6ng	{"<a href=\\"https://maps.google.com/maps/contrib/104077414405792725421\\">El Toldo Amarillo</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
635	844	1564	1564	AeeoHcJNWe3Ngn9y6qesmZ1cj64BE1dHUhtefQFlfgWyCmF_CGiTQEAIt-kzF4r2ieYz2nfZG6e_ZZbpMKJytit_TbfYuslTeM5GxK0YS0jT7v8wbsejOVY1jAN_YQ2xi7TS0bB5KSBl2N_H7P9JU6k5NXBY1hEP29xotM6sToHvmcob_f6dPxgH2S84sr1hVLAnHkiWAxjIbyfOI76l0Ay4WzdNNwCihPDqN9XJgonfpt1mZtZGFQ1lrfSVBWhNVEWu6KolW7gsC0OxqHadAnMoioMXvnDn_Q7Xy611NZU1qNbJJKhl3xurwFTgfbDoAdH-xSiRo2zDvW8	{"<a href=\\"https://maps.google.com/maps/contrib/107549545457890850326\\">Los vecinos</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
636	845	800	1200	AeeoHcKEUpp1Pl76G5tFnb89ZowQXHXTRmfBrOB8w8C4gb7BJ1kB4HfMGnni7VW4PVt2pVloXyfT7kgKGCiYiJAzTsezSmxgqkHxbSzeRFAOiH-hEOo4pkUMxERuHxxa7bV2DLezZredrGB9aYDkmXFvUCCpEw4i1rwE6hmcjNWMIJmy6GcoPJFk0NWqLiAiads7oOSZ5apunO5YauOakYV7q1spstGyp1qTD-PTyuDxnTjHFyiFYzW1u-pyATX56EQnLHZuGM535of5T1Y4szUGcFLe-iaIEicbgEGzs-tAX6fdWsW7td3jwQ3NRT9CFmh7rzxpjACwO9g	{"<a href=\\"https://maps.google.com/maps/contrib/105573162536151832344\\">Sushi Hangiri Valdivia</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
637	846	513	916	AeeoHcKaPRACJoy27AVVRFRAvTbhk5iojUu1M6qIznyFreIfTiT_MlX2WVkhg-cPAIdAx9TDbPg-SRoHIXEo-Ise9JrVIajZD9KR-B86AWQ0LKocGJluprjwaMSHV7hfI5Kh3T0e6FTA56wvIpj2Yn1MvuztKjWX36qCly6vlZCQBvtAErVYPcDsonVURkNC9Dyg_CB3fp4qBMc7MWi84kDvcaXaWl6NvXm6zOh_XQV_lZru7VmjDi7V0zb4c6EY19X-u-pHo-7q1TI6kcCMRHq05xi6pkmZA1D5gggK-Ld1jgAgO0tefEaALFr8G4sWOv9TnJ4Ijx3FaQw	{"<a href=\\"https://maps.google.com/maps/contrib/100608760118306281782\\">Mesón Nómade</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
638	847	1600	1200	AeeoHcLvC81EYZ48w1BqlM2JNaAkysSehjjfBG-P0pcacqxn2Tr_fu5NEbuvnd_TOifSONnV2a0EzwLOw6Xv6cMqvWMPYZu_H2fltP-LLEepyqrajKqDY1aQ0elYnWdLu5wyRQXbyxrROXeoq_5xEby3hIoFwf7sRwMBst1tDMuZSGjrAyRPWj1Pk-uxYb1ikLolv5W1cwVcWxiclVCy7PQ-y3fWtlzGz2IYQgl9u56GFOPfAzPgjQ60UaTHvkYDZfCsos2nEq2tbhBBzxOwmGqQHKcb1BQFsfMBQjNuPrbl5Ed4duhfh2RztR3eMhsF8L4qhjEguR5uqsE3RsdIFSeOz-8iyLIYS01Y9omE-Sw3lVPAhJqnmZuQTDFeKugjgLr7qMRIA-rxawzdo-dD-M_NYyEnLBqsdHyBj62WXHaVd8MqwFH_EP5ZdYxF9rZp7dJe26MB7Xi9rmQe9UhAOlMFhCztVShObuPNQsq-6HU9VhjfvOR3feocc7EaLqARCJI4W0sgSAooxLy_WOC1KpMIn2TLBgKchkO7csZKmU2S7bEW3xOkBYo6p5v4wDJlyqG2UMGV6NWfaPWSBY8j9sziCLeI87PBy13G-GTdgZd0ZkqrZfay6AAZMcBw8TwhNVtpS6I0KA	{"<a href=\\"https://maps.google.com/maps/contrib/103749840788169927143\\">Isaac Maik</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
639	848	2048	1638	AeeoHcI60uwUs4fUEYQExPG6QOnTzQOQ_QOnQ_9V0MBx-e2ZBYa8sJrGlQ_JTFA08XSOcI9X9PI97TYWuKV3UtGYgQjluiVtVYj2u1XOkGlJAXriDNvGin7lE3S3FQN5CPM6e-QXuGnscQEEsmia_q6bjuDCSertKYZR7PnkFeMsssKZbq6olvVFULCK9WWc5fmwrwtrbSQ-8YlTJIgdy5CiP0dqn9obn_Z4gQxAU2qyjfVVDFFYNyJdRdv0qsLQtWVLt-IAQMDHPVy_PVQVwTsREc9ESPcYv6ZuQ9X5u8L-cTqyg-bTlaV7H1ANUbQsS4wUIkcVap52VFo	{"<a href=\\"https://maps.google.com/maps/contrib/104947416001138161497\\">Ayutthaya Thai Cuisine - Valdivia</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
640	849	2269	4032	AeeoHcI6-IJSogWY76vSM6CYDpV5jrrPqrCZc7tvGvC3vG0sH5hVTlkDqTTsLKbykYlDXYbQB_kv--UfpKatS6VVgMfCu4zqK_7Ty-EQtQCfBSYIgi0GnswH9lXUbv3-y-exvyXWstaT_zMCZjlPaF_tVMkubLTinG5ozYwh-NNUfE1aARbhXjvIN5tls3T0_Z4bLjJZTHfZWc6jQrX4uYowCto4kwSTqEjZZV3_dundMFA1xs0xSQSJp_QJnphTSp9fXZijZQyAVuEOotPrhJKG-jrsfzx8Y0uwN_e0UTpqHPssztfVY8tlozO-lXR1kZnUB3md6Dk0NNo	{"<a href=\\"https://maps.google.com/maps/contrib/111339900601716784064\\">Sazón del Calle Calle</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
641	850	4000	3000	AeeoHcJ9AGV_tjSl90ATlTueCn-3Otkx7d_BoOey_IyF8WDibTg7dqqXkEiAnRHsZ9D7twK5mVwsUPi48U2I5Zp9Rjo8Ixb5ZVoiRutbml1dCBQ456CMU5v9tri59tHNkPvqVaxT52MCc4viF85ttDRGaqNlTz5Oj80ANk-z2OG0xQsw_okx__U5EcU07gCI4L85Ih_mxZUICB9wc1C1pdG2L6oGLDnI0UtMkkkoTwQMxajp95InATxViLa-0wpM1GofIxQWf2iyvAvwQ82YHoTbGOB6B1Z--0XAtto5dStBZ7Sd_QU3Y4e_XXZF71OXFQamMMcCcCltsP4	{"<a href=\\"https://maps.google.com/maps/contrib/117693403085754265358\\">Alo callejero comida rrapida</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
642	851	1080	1440	AeeoHcJjD_HEeEPPRcBC9tATSgwV_J3KOZchpbwTgomKer1uoEiM8yt1JRCGuxJl0LhktwcyL0GnETlkJ3w7TGEguVd4gvO53QHJBUqBSt8nvVS5sgtRntl0Nh50CMKTKX4aFmwIXzP6vfeTtjnPREh2cixlrsveJ4x9w-0ALhYPouq8mK9Go6xSRAHymTv_88soLjpUK0QrGHF_azY6X_INwaY7rSUl_DRsHncpb5tSQcorBViBWPqbiqFs7VITtaWUd9LSuCgShVjRR83ic1wjVEZHIL1tu72byAMyBHNtIXLLxJ8WBe46f9zobNaZJ5h9EMuPbTP-HoI	{"<a href=\\"https://maps.google.com/maps/contrib/102234303363704630222\\">Taquería Acapulco</a>"}	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
\.


--
-- TOC entry 5093 (class 0 OID 17279)
-- Dependencies: 248
-- Data for Name: place_icons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.place_icons (id, place_id, icon_url, background_color, mask_base_uri, created_at, updated_at) FROM stdin;
499	500	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
500	501	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
501	502	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
502	503	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
503	504	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
504	505	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
505	506	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
506	507	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
507	508	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
508	509	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
509	510	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
510	511	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
511	512	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
512	513	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
513	514	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
514	515	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
515	516	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
516	517	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
517	518	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
518	519	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
519	520	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
520	521	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
521	522	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
522	523	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
523	524	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
524	525	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
525	526	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/cafe-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/cafe_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
526	527	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
527	528	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/pharmacy-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/pharmacy_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
528	529	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shoppingcart_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
529	530	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
530	531	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
531	532	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
532	533	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
533	534	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
534	535	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
535	536	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
536	537	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
537	538	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
538	539	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
539	540	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
540	541	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
541	542	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
542	543	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
543	544	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
544	545	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
545	546	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
546	547	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
547	548	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
548	549	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
549	550	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
550	551	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
551	552	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
552	553	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
553	554	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
554	555	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
555	556	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
556	557	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
557	558	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
558	559	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
559	560	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
560	561	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
561	562	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
562	563	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
563	564	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
564	565	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
565	566	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
566	567	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
567	568	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
568	569	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
569	570	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
570	571	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
571	572	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
572	573	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
573	574	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
574	575	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
575	576	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
576	577	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
577	578	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/park-71.png	#4DB546	https://maps.gstatic.com/mapfiles/place_api/icons/v2/tree_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
578	579	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/park-71.png	#4DB546	https://maps.gstatic.com/mapfiles/place_api/icons/v2/tree_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
579	580	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/park-71.png	#4DB546	https://maps.gstatic.com/mapfiles/place_api/icons/v2/tree_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
580	581	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/park-71.png	#4DB546	https://maps.gstatic.com/mapfiles/place_api/icons/v2/tree_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
581	582	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/park-71.png	#4DB546	https://maps.gstatic.com/mapfiles/place_api/icons/v2/tree_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
582	583	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/park-71.png	#4DB546	https://maps.gstatic.com/mapfiles/place_api/icons/v2/tree_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
583	584	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/park-71.png	#4DB546	https://maps.gstatic.com/mapfiles/place_api/icons/v2/tree_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
584	585	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/park-71.png	#4DB546	https://maps.gstatic.com/mapfiles/place_api/icons/v2/tree_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
585	586	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/park-71.png	#4DB546	https://maps.gstatic.com/mapfiles/place_api/icons/v2/tree_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
586	587	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/park-71.png	#4DB546	https://maps.gstatic.com/mapfiles/place_api/icons/v2/tree_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
587	588	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/park-71.png	#4DB546	https://maps.gstatic.com/mapfiles/place_api/icons/v2/tree_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
588	589	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
589	590	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/park-71.png	#4DB546	https://maps.gstatic.com/mapfiles/place_api/icons/v2/tree_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
590	591	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/park-71.png	#4DB546	https://maps.gstatic.com/mapfiles/place_api/icons/v2/tree_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
591	592	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
592	593	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/park-71.png	#4DB546	https://maps.gstatic.com/mapfiles/place_api/icons/v2/tree_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
593	594	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/park-71.png	#4DB546	https://maps.gstatic.com/mapfiles/place_api/icons/v2/tree_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
594	595	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/park-71.png	#4DB546	https://maps.gstatic.com/mapfiles/place_api/icons/v2/tree_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
595	596	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/park-71.png	#4DB546	https://maps.gstatic.com/mapfiles/place_api/icons/v2/tree_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
596	597	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/park-71.png	#4DB546	https://maps.gstatic.com/mapfiles/place_api/icons/v2/tree_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
597	598	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/museum-71.png	#13B5C7	https://maps.gstatic.com/mapfiles/place_api/icons/v2/museum_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
598	599	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/museum-71.png	#13B5C7	https://maps.gstatic.com/mapfiles/place_api/icons/v2/museum_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
599	600	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/museum-71.png	#13B5C7	https://maps.gstatic.com/mapfiles/place_api/icons/v2/museum_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
600	601	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#13B5C7	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
601	602	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#13B5C7	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
602	603	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/worship_general-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/worship_christian_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
603	604	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#13B5C7	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
604	605	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#13B5C7	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
605	606	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#13B5C7	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
606	607	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/museum-71.png	#13B5C7	https://maps.gstatic.com/mapfiles/place_api/icons/v2/museum_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
607	608	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#13B5C7	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
608	609	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#13B5C7	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
609	610	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#13B5C7	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
610	611	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#13B5C7	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
611	612	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#13B5C7	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
612	613	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/museum-71.png	#13B5C7	https://maps.gstatic.com/mapfiles/place_api/icons/v2/museum_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
613	614	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
614	615	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/worship_general-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/worship_christian_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
615	616	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#13B5C7	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
616	617	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/camping-71.png	#4DB546	https://maps.gstatic.com/mapfiles/place_api/icons/v2/camping_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
617	618	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/camping-71.png	#4DB546	https://maps.gstatic.com/mapfiles/place_api/icons/v2/camping_pinlet	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
618	619	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/bus-71.png	#10BDFF	https://maps.gstatic.com/mapfiles/place_api/icons/v2/bus_share_taxi_pinlet	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
619	620	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/bus-71.png	#10BDFF	https://maps.gstatic.com/mapfiles/place_api/icons/v2/bus_share_taxi_pinlet	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
620	621	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/bus-71.png	#10BDFF	https://maps.gstatic.com/mapfiles/place_api/icons/v2/bus_share_taxi_pinlet	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
621	622	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/bus-71.png	#10BDFF	https://maps.gstatic.com/mapfiles/place_api/icons/v2/bus_share_taxi_pinlet	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
622	623	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/bus-71.png	#10BDFF	https://maps.gstatic.com/mapfiles/place_api/icons/v2/bus_share_taxi_pinlet	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
623	624	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/bus-71.png	#10BDFF	https://maps.gstatic.com/mapfiles/place_api/icons/v2/bus_share_taxi_pinlet	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
624	625	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/bus-71.png	#10BDFF	https://maps.gstatic.com/mapfiles/place_api/icons/v2/bus_share_taxi_pinlet	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
625	626	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/bus-71.png	#10BDFF	https://maps.gstatic.com/mapfiles/place_api/icons/v2/bus_share_taxi_pinlet	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
626	627	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/bus-71.png	#10BDFF	https://maps.gstatic.com/mapfiles/place_api/icons/v2/bus_share_taxi_pinlet	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
627	628	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
628	629	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
629	630	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
630	631	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
631	632	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
632	633	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
633	634	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
634	635	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
635	636	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
636	637	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
637	638	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
638	639	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
639	640	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
640	641	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
641	642	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
642	643	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
643	644	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
644	645	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
645	646	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
646	647	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/hospital-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/hospital-H_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
647	648	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
648	649	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/hospital-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/hospital-H_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
649	650	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
650	651	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/hospital-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/hospital-H_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
651	652	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/hospital-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/hospital-H_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
652	653	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/hospital-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/hospital-H_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
653	654	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
654	655	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/hospital-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/hospital-H_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
655	656	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
656	657	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/hospital-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/hospital-H_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
657	658	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/hospital-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/hospital-H_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
658	659	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/hospital-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/hospital-H_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
659	660	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/hospital-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/hospital-H_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
660	661	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/hospital-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/hospital-H_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
661	662	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
662	663	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/hospital-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/hospital-H_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
663	664	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/hospital-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/hospital-H_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
664	665	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
665	666	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/hospital-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/hospital-H_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
666	667	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/pharmacy-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/pharmacy_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
667	668	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/pharmacy-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/pharmacy_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
668	669	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/pharmacy-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/pharmacy_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
669	670	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/pharmacy-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/pharmacy_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
670	671	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/pharmacy-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/pharmacy_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
671	672	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/pharmacy-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/pharmacy_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
672	673	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/pharmacy-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/pharmacy_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
673	674	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/pharmacy-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/pharmacy_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
674	675	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/pharmacy-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/pharmacy_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
675	676	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/pharmacy-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/pharmacy_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
676	677	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/pharmacy-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/pharmacy_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
677	678	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/pharmacy-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/pharmacy_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
678	679	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
679	680	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/pharmacy-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/pharmacy_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
680	681	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/pharmacy-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/pharmacy_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
681	682	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/pharmacy-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/pharmacy_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
682	683	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/pharmacy-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/pharmacy_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
683	684	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/pharmacy-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/pharmacy_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
684	685	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/pharmacy-71.png	#F88181	https://maps.gstatic.com/mapfiles/place_api/icons/v2/pharmacy_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
685	686	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
686	687	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
687	688	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
688	689	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
689	690	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
690	691	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
691	692	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
692	693	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
693	694	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
694	695	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
695	696	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
696	697	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
697	698	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
698	699	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
699	700	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
700	701	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
701	702	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
702	703	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/civic_building-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/civic-bldg_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
703	704	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/civic_building-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/civic-bldg_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
704	705	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/civic_building-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/civic-bldg_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
705	706	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/civic_building-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/civic-bldg_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
706	707	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
707	708	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
708	709	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
709	710	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
710	711	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
711	712	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
712	713	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
713	714	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
714	715	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
715	716	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
716	717	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
717	718	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
718	719	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
719	720	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
720	721	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
721	722	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
722	723	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
723	724	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
724	725	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
725	726	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
726	727	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
727	728	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
728	729	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
729	730	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
730	731	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
731	732	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
732	733	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
733	734	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
734	735	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
735	736	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
736	737	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
737	738	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
738	739	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
739	740	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
740	741	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
741	742	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
742	743	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
743	744	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
744	745	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
745	746	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/school-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/school_pinlet	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
746	747	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/lodging-71.png	#909CE1	https://maps.gstatic.com/mapfiles/place_api/icons/v2/hotel_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
747	748	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
748	749	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
749	750	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/cafe-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/cafe_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
750	751	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
751	752	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
752	753	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/bar-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/bar_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
753	754	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
754	755	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
755	756	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
756	757	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
757	758	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/bar-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/bar_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
758	759	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
759	760	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
760	761	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
761	762	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
762	763	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
763	764	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
764	765	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/bar-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/bar_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
765	766	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
766	767	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shoppingcart_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
767	768	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
768	769	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/cafe-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/cafe_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
769	770	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/cafe-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/cafe_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
770	771	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/cafe-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/cafe_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
771	772	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/cafe-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/cafe_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
772	773	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/cafe-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/cafe_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
773	774	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
774	775	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/cafe-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/cafe_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
775	776	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/cafe-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/cafe_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
776	777	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/cafe-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/cafe_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
777	778	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
778	779	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/cafe-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/cafe_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
779	780	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/cafe-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/cafe_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
780	781	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/cafe-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/cafe_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
781	782	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/cafe-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/cafe_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
782	783	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/cafe-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/cafe_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
783	784	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/cafe-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/cafe_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
784	785	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/bar-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/bar_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
785	786	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/bar-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/bar_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
786	787	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
787	788	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/bar-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/bar_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
788	789	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/bar-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/bar_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
789	790	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/bar-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/bar_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
790	791	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
791	792	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/bar-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/bar_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
792	793	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/bar-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/bar_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
793	794	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/bar-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/bar_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
794	795	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/bar-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/bar_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
795	796	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/bar-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/bar_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
796	797	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/bar-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/bar_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
797	798	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/bar-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/bar_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
798	799	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/bar-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/bar_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
799	800	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
800	801	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
801	802	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shopping_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
802	803	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
803	804	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
804	805	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
805	806	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
806	807	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
807	808	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
808	809	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
809	810	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
810	811	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
811	812	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
812	813	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/cafe-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/cafe_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
813	814	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
814	815	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
815	816	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
816	817	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
817	818	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
818	819	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
819	820	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
820	821	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
821	822	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
822	823	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
823	824	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
824	825	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/shoppingcart_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
825	826	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
826	827	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
827	828	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
828	829	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
829	830	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
830	831	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/convenience_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
831	832	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
832	833	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
833	834	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/shopping-71.png	#4B96F3	https://maps.gstatic.com/mapfiles/place_api/icons/v2/convenience_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
834	835	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
835	836	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
836	837	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
837	838	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
838	839	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
839	840	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
840	841	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
841	842	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
842	843	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
843	844	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/restaurant-71.png	#FF9E67	https://maps.gstatic.com/mapfiles/place_api/icons/v2/restaurant_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
844	845	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
845	846	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
846	847	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
847	848	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
848	849	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
849	850	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
850	851	https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/generic_business-71.png	#7B9EB0	https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
\.


--
-- TOC entry 5071 (class 0 OID 17094)
-- Dependencies: 226
-- Data for Name: place_payment_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.place_payment_methods (id, place_id, payment_method_id, created_at) FROM stdin;
\.


--
-- TOC entry 5091 (class 0 OID 17263)
-- Dependencies: 246
-- Data for Name: place_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.place_types (id, place_id, type, created_at, updated_at) FROM stdin;
2122	500	shopping_mall	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2123	500	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2124	500	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2125	501	shopping_mall	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2126	501	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2127	501	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2128	502	shopping_mall	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2129	502	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2130	502	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2131	503	shopping_mall	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2132	503	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2133	503	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2134	504	shopping_mall	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2135	504	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2136	504	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2137	505	shopping_mall	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2138	505	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2139	505	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2140	506	shopping_mall	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2141	506	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2142	506	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2143	507	shopping_mall	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2144	507	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2145	507	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2146	508	shopping_mall	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2147	508	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2148	508	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2149	509	shopping_mall	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2150	509	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2151	509	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2152	510	shopping_mall	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2153	510	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2154	510	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2155	511	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2156	511	shopping_mall	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2157	511	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2158	511	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2159	512	shopping_mall	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2160	512	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2161	512	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2162	513	shopping_mall	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2163	513	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2164	513	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2165	514	shopping_mall	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2166	514	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2167	514	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2168	515	shopping_mall	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2169	515	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2170	515	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2171	516	shopping_mall	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2172	516	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2173	516	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2174	517	shopping_mall	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2175	517	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2176	517	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2177	518	shopping_mall	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2178	518	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2179	518	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2180	519	shopping_mall	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2181	519	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2182	519	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2183	520	car_dealer	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2184	520	car_rental	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2185	520	real_estate_agency	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2186	520	travel_agency	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2187	520	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2188	520	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2189	520	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2190	521	car_dealer	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2191	521	car_repair	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2192	521	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2193	521	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2194	521	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2195	522	car_repair	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2196	522	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2197	522	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2198	522	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2199	523	shoe_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2200	523	clothing_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2201	523	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2202	523	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2203	523	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2204	524	book_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2205	524	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2206	524	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2207	524	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2208	525	car_repair	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2209	525	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2210	525	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2211	525	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2212	526	bakery	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2213	526	cafe	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2214	526	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2215	526	food	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2216	526	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2217	526	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2218	527	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2219	527	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2220	527	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2221	528	pharmacy	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2222	528	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2223	528	health	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2224	528	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2225	528	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2226	529	grocery_or_supermarket	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2227	529	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2228	529	food	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2229	529	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2230	529	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2231	530	electronics_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2232	530	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2233	530	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2234	530	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2235	531	car_repair	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2236	531	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2237	531	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2238	531	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2239	532	drugstore	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2240	532	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2241	532	health	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2242	532	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2243	532	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2244	533	drugstore	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2245	533	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2246	533	health	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2247	533	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2248	533	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2249	534	furniture_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2250	534	home_goods_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2251	534	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2252	534	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2253	534	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2254	535	shoe_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2255	535	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2256	535	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2257	535	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2258	536	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2259	536	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2260	536	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2261	537	doctor	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2262	537	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2263	537	health	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2264	537	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2265	537	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2266	538	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2267	538	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2268	538	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2269	539	car_repair	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2270	539	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2271	539	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2272	539	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2273	540	shoe_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2274	540	clothing_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2275	540	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2276	540	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2277	540	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2278	541	clothing_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2279	541	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2280	541	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2281	541	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2282	542	clothing_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2283	542	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2284	542	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2285	542	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2286	543	health	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2287	543	clothing_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2288	543	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2289	543	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2290	543	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2291	544	clothing_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2292	544	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2293	544	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2294	544	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2295	545	department_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2296	545	shoe_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2297	545	electronics_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2298	545	furniture_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2299	545	home_goods_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2300	545	clothing_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2301	545	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2302	545	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2303	545	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2304	546	clothing_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2305	546	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2306	546	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2307	546	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2308	547	clothing_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2309	547	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2310	547	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2311	547	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2312	548	clothing_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2313	548	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2314	548	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2315	548	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2316	549	clothing_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2317	549	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2318	549	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2319	549	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2320	550	department_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2321	550	clothing_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2322	550	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2323	550	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2324	550	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2325	551	clothing_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2326	551	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2327	551	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2328	551	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2329	552	clothing_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2330	552	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2331	552	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2332	552	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2333	553	department_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2334	553	clothing_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2335	553	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2336	553	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2337	553	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2338	554	clothing_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2339	554	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2340	554	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2341	554	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2342	555	florist	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2343	555	clothing_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2344	555	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2345	555	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2346	555	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2347	556	clothing_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2348	556	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2349	556	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2350	556	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2351	557	clothing_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2352	557	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2353	557	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2354	557	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2355	558	clothing_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2356	558	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2357	558	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2358	558	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2359	559	book_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2360	559	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2361	559	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2362	559	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2363	560	book_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2364	560	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2365	560	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2366	560	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2367	561	book_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2368	561	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2369	561	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2370	561	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2371	562	book_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2372	562	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2373	562	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2374	562	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2375	563	book_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2376	563	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2377	563	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2378	563	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2379	564	book_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2380	564	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2381	564	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2382	564	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2383	565	book_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2384	565	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2385	565	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2386	565	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2387	566	book_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2388	566	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2389	566	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2390	566	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2391	567	book_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2392	567	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2393	567	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2394	567	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2395	568	book_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2396	568	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2397	568	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2398	568	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2399	569	book_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2400	569	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2401	569	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2402	569	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2403	570	book_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2404	570	clothing_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2405	570	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2406	570	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2407	570	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2408	571	book_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2409	571	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2410	571	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2411	571	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2412	572	book_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2413	572	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2414	572	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2415	572	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2416	573	book_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2417	573	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2418	573	home_goods_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2419	573	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2420	573	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2421	574	book_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2422	574	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2423	574	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2424	574	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2425	575	book_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2426	575	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2427	575	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2428	575	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2429	576	book_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2430	576	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2431	576	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2432	576	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2433	577	book_store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2434	577	point_of_interest	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2435	577	store	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2436	577	establishment	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
2437	578	park	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2438	578	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2439	578	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2440	579	park	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2441	579	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2442	579	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2443	580	park	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2444	580	tourist_attraction	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2445	580	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2446	580	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2447	581	park	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2448	581	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2449	581	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2450	582	park	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2451	582	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2452	582	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2453	583	park	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2454	583	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2455	583	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2456	584	park	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2457	584	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2458	584	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2459	585	park	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2460	585	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2461	585	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2462	586	park	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2463	586	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2464	586	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2465	587	park	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2466	587	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2467	587	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2468	588	park	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2469	588	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2470	588	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2471	589	school	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2472	589	campground	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2473	589	lodging	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2474	589	park	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2475	589	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2476	589	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2477	590	park	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2478	590	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2479	590	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2480	591	park	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2481	591	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2482	591	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2483	592	real_estate_agency	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2484	592	park	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2485	592	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2486	592	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2487	593	park	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2488	593	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2489	593	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2490	594	park	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2491	594	tourist_attraction	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2492	594	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2493	594	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2494	595	park	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2495	595	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2496	595	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2497	596	park	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2498	596	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2499	596	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2500	597	park	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2501	597	tourist_attraction	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2502	597	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2503	597	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2504	598	museum	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2505	598	tourist_attraction	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2506	598	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2507	598	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2508	599	tourist_attraction	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2509	599	museum	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2510	599	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2511	599	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2512	600	museum	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2513	600	tourist_attraction	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2514	600	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2515	600	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2516	601	tourist_attraction	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2517	601	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2518	601	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2519	602	tourist_attraction	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2520	602	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2521	602	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2522	603	church	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2523	603	tourist_attraction	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2524	603	place_of_worship	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2525	603	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2526	603	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2527	604	tourist_attraction	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2528	604	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2529	604	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2530	605	tourist_attraction	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2531	605	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2532	605	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2533	606	tourist_attraction	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2534	606	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2535	606	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2536	607	museum	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2537	607	tourist_attraction	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2538	607	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2539	607	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2540	608	tourist_attraction	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2541	608	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2542	608	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2543	609	tourist_attraction	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2544	609	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2545	609	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2546	610	tourist_attraction	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2547	610	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2548	610	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2549	611	tourist_attraction	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2550	611	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2551	611	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2552	612	tourist_attraction	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2553	612	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2554	612	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2555	613	museum	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2556	613	tourist_attraction	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2557	613	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2558	613	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2559	614	tourist_attraction	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2560	614	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2561	614	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2562	615	church	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2563	615	tourist_attraction	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2564	615	place_of_worship	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2565	615	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2566	615	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2567	616	tourist_attraction	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2568	616	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2569	616	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2570	617	campground	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2571	617	park	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2572	617	lodging	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2573	617	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2574	617	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2575	618	campground	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2576	618	park	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2577	618	lodging	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2578	618	point_of_interest	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2579	618	establishment	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
2580	619	bus_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2581	619	transit_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2582	619	point_of_interest	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2583	619	establishment	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2584	620	bus_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2585	620	transit_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2586	620	point_of_interest	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2587	620	establishment	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2588	621	bus_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2589	621	transit_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2590	621	point_of_interest	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2591	621	establishment	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2592	622	bus_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2593	622	transit_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2594	622	point_of_interest	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2595	622	establishment	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2596	623	bus_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2597	623	transit_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2598	623	point_of_interest	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2599	623	establishment	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2600	624	bus_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2601	624	transit_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2602	624	point_of_interest	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2603	624	establishment	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2604	625	bus_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2605	625	transit_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2606	625	point_of_interest	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2607	625	establishment	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2608	626	bus_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2609	626	transit_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2610	626	point_of_interest	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2611	626	establishment	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2612	627	bus_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2613	627	transit_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2614	627	point_of_interest	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2615	627	establishment	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2616	628	transit_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2617	628	point_of_interest	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2618	628	establishment	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2619	629	transit_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2620	629	point_of_interest	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2621	629	establishment	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2622	630	transit_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2623	630	point_of_interest	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2624	630	establishment	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2625	631	transit_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2626	631	point_of_interest	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2627	631	establishment	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2628	632	transit_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2629	632	point_of_interest	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2630	632	establishment	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2631	633	transit_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2632	633	point_of_interest	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2633	633	establishment	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2634	634	transit_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2635	634	point_of_interest	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2636	634	establishment	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2637	635	transit_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2638	635	point_of_interest	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2639	635	establishment	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2640	636	transit_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2641	636	point_of_interest	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2642	636	establishment	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2643	637	transit_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2644	637	point_of_interest	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2645	637	establishment	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2646	638	transit_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2647	638	point_of_interest	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2648	638	establishment	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2649	639	transit_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2650	639	point_of_interest	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2651	639	establishment	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2652	640	transit_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2653	640	point_of_interest	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2654	640	establishment	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2655	641	transit_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2656	641	point_of_interest	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2657	641	establishment	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2658	642	transit_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2659	642	point_of_interest	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2660	642	establishment	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2661	643	transit_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2662	643	point_of_interest	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2663	643	establishment	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2664	644	transit_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2665	644	point_of_interest	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2666	644	establishment	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2667	645	transit_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2668	645	point_of_interest	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2669	645	establishment	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2670	646	transit_station	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2671	646	point_of_interest	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2672	646	establishment	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
2673	647	hospital	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2674	647	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2675	647	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2676	647	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2677	648	insurance_agency	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2678	648	veterinary_care	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2679	648	hospital	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2680	648	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2681	648	doctor	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2682	648	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2683	648	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2684	649	hospital	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2685	649	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2686	649	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2687	649	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2688	650	dentist	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2689	650	hospital	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2690	650	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2691	650	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2692	650	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2693	651	hospital	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2694	651	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2695	651	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2696	651	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2697	652	hospital	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2698	652	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2699	652	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2700	652	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2701	653	hospital	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2702	653	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2703	653	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2704	653	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2705	654	hospital	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2706	654	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2707	654	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2708	654	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2709	655	hospital	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2710	655	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2711	655	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2712	655	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2713	656	hospital	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2714	656	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2715	656	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2716	656	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2717	657	hospital	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2718	657	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2719	657	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2720	657	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2721	658	hospital	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2722	658	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2723	658	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2724	658	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2725	659	hospital	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2726	659	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2727	659	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2728	659	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2729	660	hospital	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2730	660	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2731	660	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2732	660	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2733	661	hospital	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2734	661	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2735	661	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2736	661	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2737	662	hospital	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2738	662	dentist	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2739	662	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2740	662	doctor	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2741	662	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2742	662	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2743	663	hospital	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2744	663	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2745	663	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2746	663	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2747	664	hospital	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2748	664	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2749	664	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2750	664	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2751	665	dentist	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2752	665	hospital	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2753	665	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2754	665	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2755	665	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2756	666	hospital	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2757	666	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2758	666	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2759	666	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2760	667	pharmacy	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2761	667	store	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2762	667	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2763	667	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2764	667	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2765	668	pharmacy	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2766	668	store	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2767	668	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2768	668	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2769	668	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2770	669	pharmacy	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2771	669	store	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2772	669	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2773	669	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2774	669	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2775	670	pharmacy	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2776	670	store	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2777	670	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2778	670	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2779	670	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2780	671	pharmacy	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2781	671	store	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2782	671	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2783	671	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2784	671	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2785	672	pharmacy	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2786	672	store	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2787	672	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2788	672	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2789	672	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2790	673	pharmacy	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2791	673	store	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2792	673	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2793	673	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2794	673	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2795	674	pharmacy	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2796	674	store	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2797	674	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2798	674	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2799	674	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2800	675	pharmacy	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2801	675	store	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2802	675	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2803	675	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2804	675	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2805	676	pharmacy	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2806	676	store	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2807	676	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2808	676	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2809	676	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2810	677	pharmacy	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2811	677	store	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2812	677	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2813	677	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2814	677	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2815	678	pharmacy	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2816	678	store	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2817	678	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2818	678	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2819	678	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2820	679	drugstore	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2821	679	pharmacy	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2822	679	store	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2823	679	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2824	679	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2825	679	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2826	680	pharmacy	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2827	680	store	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2828	680	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2829	680	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2830	680	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2831	681	pharmacy	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2832	681	store	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2833	681	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2834	681	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2835	681	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2836	682	pharmacy	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2837	682	store	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2838	682	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2839	682	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2840	682	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2841	683	pharmacy	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2842	683	store	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2843	683	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2844	683	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2845	683	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2846	684	pharmacy	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2847	684	store	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2848	684	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2849	684	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2850	684	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2851	685	pharmacy	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2852	685	store	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2853	685	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2854	685	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2855	685	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2856	686	doctor	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2857	686	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2858	686	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2859	686	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2860	687	doctor	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2861	687	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2862	687	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2863	687	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2864	688	doctor	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2865	688	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2866	688	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2867	688	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2868	689	dentist	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2869	689	doctor	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2870	689	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2871	689	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2872	689	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2873	690	doctor	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2874	690	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2875	690	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2876	690	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2877	691	doctor	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2878	691	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2879	691	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2880	691	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2881	692	doctor	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2882	692	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2883	692	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2884	692	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2885	693	doctor	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2886	693	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2887	693	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2888	693	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2889	694	doctor	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2890	694	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2891	694	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2892	694	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2893	695	doctor	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2894	695	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2895	695	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2896	695	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2897	696	dentist	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2898	696	beauty_salon	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2899	696	doctor	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2900	696	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2901	696	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2902	696	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2903	697	doctor	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2904	697	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2905	697	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2906	697	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2907	698	doctor	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2908	698	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2909	698	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2910	698	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2911	699	dentist	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2912	699	doctor	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2913	699	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2914	699	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2915	699	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2916	700	doctor	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2917	700	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2918	700	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2919	700	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2920	701	dentist	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2921	701	doctor	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2922	701	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2923	701	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2924	701	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2925	702	doctor	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2926	702	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2927	702	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2928	702	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2929	703	library	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2930	703	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2931	703	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2932	704	library	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2933	704	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2934	704	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2935	705	library	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2936	705	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2937	705	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2938	706	library	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2939	706	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2940	706	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2941	707	school	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2942	707	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2943	707	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2944	708	secondary_school	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2945	708	school	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2946	708	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2947	708	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2948	709	school	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2949	709	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2950	709	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2951	710	school	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2952	710	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2953	710	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2954	711	school	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2955	711	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2956	711	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2957	712	school	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2958	712	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2959	712	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2960	713	gym	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2961	713	school	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2962	713	health	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2963	713	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2964	713	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2965	714	school	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2966	714	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2967	714	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2968	715	school	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2969	715	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2970	715	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2971	716	primary_school	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2972	716	school	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2973	716	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2974	716	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2975	717	school	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2976	717	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2977	717	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2978	718	school	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2979	718	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2980	718	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2981	719	school	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2982	719	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2983	719	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2984	720	school	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2985	720	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2986	720	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2987	721	school	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2988	721	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2989	721	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2990	722	school	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2991	722	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2992	722	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2993	723	secondary_school	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2994	723	school	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2995	723	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2996	723	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2997	724	school	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2998	724	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
2999	724	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3000	725	school	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3001	725	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3002	725	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3003	726	school	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3004	726	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3005	726	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3006	727	university	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3007	727	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3008	727	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3009	728	university	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3010	728	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3011	728	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3012	729	university	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3013	729	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3014	729	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3015	730	university	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3016	730	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3017	730	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3018	731	university	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3019	731	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3020	731	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3021	732	university	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3022	732	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3023	732	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3024	733	university	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3025	733	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3026	733	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3027	734	university	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3028	734	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3029	734	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3030	735	university	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3031	735	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3032	735	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3033	736	university	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3034	736	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3035	736	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3036	737	university	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3037	737	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3038	737	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3039	738	university	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3040	738	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3041	738	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3042	739	university	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3043	739	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3044	739	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3045	740	university	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3046	740	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3047	740	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3048	741	university	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3049	741	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3050	741	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3051	742	university	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3052	742	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3053	742	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3054	743	university	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3055	743	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3056	743	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3057	744	university	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3058	744	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3059	744	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3060	745	university	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3061	745	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3062	745	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3063	746	university	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3064	746	point_of_interest	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3065	746	establishment	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
3066	747	lodging	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3067	747	bar	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3068	747	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3069	747	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3070	747	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3071	747	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3072	748	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3073	748	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3074	748	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3075	748	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3076	749	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3077	749	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3078	749	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3079	749	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3080	750	cafe	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3081	750	meal_delivery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3082	750	meal_takeaway	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3083	750	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3084	750	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3085	750	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3086	750	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3087	750	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3088	751	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3089	751	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3090	751	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3091	751	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3092	752	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3093	752	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3094	752	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3095	752	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3096	753	bar	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3097	753	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3098	753	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3099	753	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3100	753	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3101	754	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3102	754	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3103	754	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3104	754	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3105	755	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3106	755	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3107	755	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3108	755	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3109	756	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3110	756	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3111	756	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3112	756	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3113	757	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3114	757	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3115	757	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3116	757	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3117	758	bar	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3118	758	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3119	758	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3120	758	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3121	758	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3122	759	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3123	759	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3124	759	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3125	759	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3126	760	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3127	760	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3128	760	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3129	760	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3130	761	meal_takeaway	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3131	761	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3132	761	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3133	761	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3134	761	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3135	762	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3136	762	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3137	762	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3138	762	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3139	763	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3140	763	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3141	763	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3142	763	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3143	764	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3144	764	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3145	764	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3146	764	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3147	764	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3148	765	bar	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3149	765	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3150	765	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3151	765	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3152	765	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3153	766	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3154	766	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3155	766	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3156	766	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3157	767	cafe	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3158	767	grocery_or_supermarket	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3159	767	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3160	767	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3161	767	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3162	767	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3163	768	travel_agency	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3164	768	cafe	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3165	768	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3166	768	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3167	768	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3168	768	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3169	769	cafe	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3170	769	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3171	769	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3172	769	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3173	770	cafe	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3174	770	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3175	770	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3176	770	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3177	770	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3178	771	cafe	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3179	771	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3180	771	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3181	771	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3182	771	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3183	772	cafe	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3184	772	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3185	772	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3186	772	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3187	773	cafe	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3188	773	bakery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3189	773	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3190	773	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3191	773	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3192	773	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3193	773	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3194	774	cafe	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3195	774	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3196	774	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3197	774	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3198	775	cafe	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3199	775	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3200	775	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3201	775	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3202	775	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3203	776	cafe	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3204	776	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3205	776	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3206	776	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3207	776	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3208	777	cafe	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3209	777	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3210	777	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3211	777	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3212	777	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3213	778	cafe	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3214	778	bakery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3215	778	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3216	778	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3217	778	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3218	778	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3219	779	cafe	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3220	779	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3221	779	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3222	779	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3223	780	cafe	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3224	780	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3225	780	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3226	780	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3227	781	cafe	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3228	781	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3229	781	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3230	781	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3231	781	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3232	782	cafe	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3233	782	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3234	782	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3235	782	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3236	783	cafe	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3237	783	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3238	783	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3239	783	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3240	783	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3241	783	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3242	784	cafe	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3243	784	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3244	784	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3245	784	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3246	785	night_club	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3247	785	bar	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3248	785	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3249	785	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3250	786	bar	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3251	786	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3252	786	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3253	787	bar	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3254	787	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3255	787	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3256	787	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3257	787	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3258	788	bar	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3259	788	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3260	788	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3261	789	bar	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3262	789	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3263	789	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3264	789	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3265	789	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3266	790	bar	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3267	790	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3268	790	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3269	790	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3270	790	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3271	791	bar	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3272	791	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3273	791	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3274	791	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3275	791	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3276	792	bar	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3277	792	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3278	792	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3279	793	bar	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3280	793	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3281	793	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3282	794	bar	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3283	794	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3284	794	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3285	795	bar	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3286	795	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3287	795	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3288	795	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3289	795	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3290	796	bar	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3291	796	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3292	796	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3293	796	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3294	796	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3295	797	night_club	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3296	797	bar	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3297	797	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3298	797	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3299	798	bar	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3300	798	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3301	798	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3302	799	bar	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3303	799	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3304	799	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3305	800	shopping_mall	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3306	800	bar	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3307	800	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3308	800	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3309	800	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3310	801	bakery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3311	801	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3312	801	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3313	801	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3314	801	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3315	802	bakery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3316	802	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3317	802	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3318	802	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3319	802	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3320	803	bakery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3321	803	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3322	803	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3323	803	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3324	803	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3325	804	bakery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3326	804	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3327	804	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3328	804	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3329	804	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3330	805	bakery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3331	805	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3332	805	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3333	805	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3334	805	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3335	806	bakery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3336	806	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3337	806	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3338	806	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3339	806	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3340	807	bakery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3341	807	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3342	807	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3343	807	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3344	807	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3345	808	bakery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3346	808	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3347	808	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3348	808	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3349	808	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3350	809	bakery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3351	809	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3352	809	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3353	809	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3354	809	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3355	810	bakery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3356	810	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3357	810	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3358	810	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3359	810	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3360	811	bakery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3361	811	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3362	811	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3363	811	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3364	811	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3365	812	bakery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3366	812	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3367	812	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3368	812	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3369	812	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3370	813	bakery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3371	813	cafe	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3372	813	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3373	813	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3374	813	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3375	813	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3376	813	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3377	814	bakery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3378	814	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3379	814	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3380	814	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3381	814	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3382	815	bakery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3383	815	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3384	815	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3385	815	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3386	815	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3387	815	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3388	816	bakery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3389	816	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3390	816	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3391	816	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3392	816	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3393	817	bakery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3394	817	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3395	817	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3396	817	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3397	817	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3398	818	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3399	818	meal_takeaway	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3400	818	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3401	818	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3402	818	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3403	819	meal_takeaway	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3404	819	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3405	819	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3406	819	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3407	819	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3408	820	meal_takeaway	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3409	820	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3410	820	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3411	820	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3412	820	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3413	821	meal_delivery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3414	821	meal_takeaway	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3415	821	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3416	821	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3417	821	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3418	821	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3419	822	meal_takeaway	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3420	822	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3421	822	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3422	822	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3423	822	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3424	823	meal_delivery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3425	823	meal_takeaway	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3426	823	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3427	823	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3428	823	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3429	823	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3430	824	meal_takeaway	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3431	824	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3432	824	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3433	824	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3434	824	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3435	825	supermarket	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3436	825	grocery_or_supermarket	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3437	825	meal_takeaway	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3438	825	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3439	825	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3440	825	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3441	825	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3442	825	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3443	826	meal_takeaway	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3444	826	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3445	826	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3446	826	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3447	826	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3448	827	meal_delivery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3449	827	cafe	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3450	827	meal_takeaway	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3451	827	bakery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3452	827	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3453	827	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3454	827	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3455	827	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3456	827	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3457	828	meal_takeaway	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3458	828	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3459	828	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3460	828	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3461	828	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3462	829	meal_takeaway	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3463	829	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3464	829	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3465	829	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3466	829	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3467	830	meal_takeaway	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3468	830	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3469	830	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3470	830	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3471	830	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3472	831	convenience_store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3473	831	atm	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3474	831	cafe	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3475	831	meal_takeaway	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3476	831	finance	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3477	831	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3478	831	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3479	831	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3480	831	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3481	831	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3482	832	meal_takeaway	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3483	832	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3484	832	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3485	832	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3486	832	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3487	833	meal_takeaway	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3488	833	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3489	833	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3490	833	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3491	833	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3492	834	convenience_store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3493	834	atm	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3494	834	cafe	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3495	834	meal_takeaway	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3496	834	finance	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3497	834	store	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3498	834	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3499	834	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3500	834	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3501	834	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3502	835	meal_takeaway	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3503	835	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3504	835	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3505	835	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3506	835	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3507	836	meal_delivery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3508	836	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3509	836	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3510	836	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3511	837	meal_delivery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3512	837	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3513	837	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3514	837	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3515	837	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3516	838	meal_delivery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3517	838	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3518	838	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3519	838	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3520	839	meal_delivery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3521	839	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3522	839	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3523	839	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3524	840	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3525	840	meal_delivery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3526	840	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3527	840	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3528	840	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3529	841	meal_delivery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3530	841	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3531	841	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3532	841	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3533	841	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3534	842	meal_delivery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3535	842	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3536	842	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3537	842	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3538	843	meal_delivery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3539	843	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3540	843	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3541	843	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3542	844	meal_delivery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3543	844	meal_takeaway	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3544	844	restaurant	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3545	844	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3546	844	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3547	844	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3548	845	meal_delivery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3549	845	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3550	845	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3551	845	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3552	846	meal_delivery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3553	846	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3554	846	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3555	846	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3556	847	meal_delivery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3557	847	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3558	847	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3559	847	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3560	848	meal_delivery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3561	848	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3562	848	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3563	848	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3564	849	meal_delivery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3565	849	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3566	849	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3567	849	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3568	850	meal_delivery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3569	850	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3570	850	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3571	850	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3572	851	meal_delivery	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3573	851	food	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3574	851	point_of_interest	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
3575	851	establishment	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
\.


--
-- TOC entry 5067 (class 0 OID 17065)
-- Dependencies: 222
-- Data for Name: places; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.places (id, google_place_id, name, address, latitude, longitude, category_id, rating_avg, status, reference, scope, user_ratings_total, created_at, updated_at) FROM stdin;
500	ChIJK8nFy3fuFZYRxUp6bBFHc-s	Fem Joyas	Caupolicán 402-498, Valdivia, Valdivia	\N	\N	16	3.4	OPERATIONAL	ChIJK8nFy3fuFZYRxUp6bBFHc-s	GOOGLE	16	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
501	ChIJrVigQXfuFZYRbJtFZRqJFbk	Plaza de Los Rios	Arauco 561, Valdivia	\N	\N	16	4.1	OPERATIONAL	ChIJrVigQXfuFZYRbJtFZRqJFbk	GOOGLE	9583	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
502	ChIJ89iZbnbuFZYRan2U51Qydt8	New Taboada Center	Camilo Henríquez 466, Valdivia	\N	\N	16	4.5	OPERATIONAL	ChIJ89iZbnbuFZYRan2U51Qydt8	GOOGLE	411	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
503	ChIJvTSyCwDvFZYRY381sDyKygE	Primero Mall Chino	Independencia 528, Valdivia	\N	\N	16	4.0	OPERATIONAL	ChIJvTSyCwDvFZYRY381sDyKygE	GOOGLE	2	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
504	ChIJwTKjEHDvFZYRZ42019CnJ_A	Weinbrenner	Camilo Henríquez 458, Valdivia, Valdivia	\N	\N	16	4.5	OPERATIONAL	ChIJwTKjEHDvFZYRZ42019CnJ_A	GOOGLE	2	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
505	ChIJx-sX1hzvFZYR_-GdJYXG3Ec	COMERCIAL TREBOL FAMILIA LIMITADA（POR MAYOR POR DOCENA）	Independencia 545, Valdivia	\N	\N	16	5.0	OPERATIONAL	ChIJx-sX1hzvFZYR_-GdJYXG3Ec	GOOGLE	1	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
506	ChIJz90isZDvFZYR9pRga75Ylhc	Santiago Ferretti	Valdivia	\N	\N	16	5.0	OPERATIONAL	ChIJz90isZDvFZYR9pRga75Ylhc	GOOGLE	1	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
507	ChIJDXU-8nbuFZYRgvOXPFKQuZE	Arauco Mall	Arauco 331, Valdivia, Valdivia	\N	\N	16	4.0	OPERATIONAL	ChIJDXU-8nbuFZYRgvOXPFKQuZE	GOOGLE	446	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
508	ChIJPRwtz3fuFZYReNi545Rc0qM	Galeria Benjamin	Chacabuco 112, Valdivia	\N	\N	16	4.2	OPERATIONAL	ChIJPRwtz3fuFZYReNi545Rc0qM	GOOGLE	258	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
509	ChIJz3mVjVLvFZYRzstzXry5YRQ	Mall China	Chacabuco 341, Valdivia	\N	\N	16	4.1	OPERATIONAL	ChIJz3mVjVLvFZYRzstzXry5YRQ	GOOGLE	185	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
510	ChIJl4JBR7fvFZYRtvk3UEzCGXs	París	y - Caupolican 475 Entre las calles Ramon picarte, Chacabuco, Valdivia	\N	\N	16	3.7	OPERATIONAL	ChIJl4JBR7fvFZYRtvk3UEzCGXs	GOOGLE	18	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
511	ChIJH5ewZjfvFZYRBOiVEm6Mn9I	Librería Costanera	Arauco 132, Valdivia	\N	\N	16	4.0	OPERATIONAL	ChIJH5ewZjfvFZYRBOiVEm6Mn9I	GOOGLE	4	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
512	ChIJQTgXIgDvFZYRyWXQNzOnZug	Centro Comercial Santiago	Arauco 384, local 20, Valdivia	\N	\N	16	\N	OPERATIONAL	ChIJQTgXIgDvFZYRyWXQNzOnZug	GOOGLE	\N	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
513	ChIJmWgh5UPvFZYRZr22wYOG4nI	CENTRONUEVO Taboada	Chacabuco 369, Valdivia	\N	\N	16	\N	OPERATIONAL	ChIJmWgh5UPvFZYRZr22wYOG4nI	GOOGLE	\N	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
514	ChIJnbDYYg3vFZYRRnPRrJSXZFw	Galería Cadagan	Caupolicán 443, Valdivia	\N	\N	16	5.0	OPERATIONAL	ChIJnbDYYg3vFZYRRnPRrJSXZFw	GOOGLE	3	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
515	ChIJl4xqbADvFZYRPXKds5wBIts	Mall Chino Mazzivo	Caupolicán 550, Valdivia	\N	\N	16	5.0	OPERATIONAL	ChIJl4xqbADvFZYRPXKds5wBIts	GOOGLE	1	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
516	ChIJZzP01HXuFZYREeajvhfOwgA	J&M Seguridad	Independencia 630, Valdivia, Valdivia	\N	\N	16	3.0	OPERATIONAL	ChIJZzP01HXuFZYREeajvhfOwgA	GOOGLE	2	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
517	ChIJ4e-SynfuFZYRvq9FSzzparg	Galeria Valdivia	Caupolicán 425, Valdivia, Valdivia	\N	\N	16	4.7	OPERATIONAL	ChIJ4e-SynfuFZYRvq9FSzzparg	GOOGLE	11	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
518	ChIJTw-wJfDvFZYRvfyPVEvVEsw	Mercado Persa	Yungay 447, Valdivia, Valdivia	\N	\N	16	\N	OPERATIONAL	ChIJTw-wJfDvFZYRvfyPVEvVEsw	GOOGLE	\N	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
519	ChIJDwNW-YfvFZYR8b1pVih76o0	Mall Paseo Valdivia	Avenida Ramón Picarte 422, Valdivia	\N	\N	16	4.2	OPERATIONAL	ChIJDwNW-YfvFZYR8b1pVih76o0	GOOGLE	452	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
520	ChIJdx-0mnbuFZYRade1fG51m1s	AutoVal Rent a Car	Vicente Pérez Rosales 660, Valdivia, Valdivia	\N	\N	16	3.4	OPERATIONAL	ChIJdx-0mnbuFZYRade1fG51m1s	GOOGLE	42	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
521	ChIJyw3ZmHnuFZYRbztsQSfhFYw	Automotriz Tecnosur	Avenida Alemania 665, Valdivia, Valdivia	\N	\N	16	4.4	OPERATIONAL	ChIJyw3ZmHnuFZYRbztsQSfhFYw	GOOGLE	124	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
522	ChIJ2XRQyoLuFZYRwJD4JuLvmXk	Kaufmann Valdivia	Avenida Pedro Aguirre Cerda 585, Valdivia	\N	\N	20	4.5	OPERATIONAL	ChIJ2XRQyoLuFZYRwJD4JuLvmXk	GOOGLE	199	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
523	ChIJQcNo_HbuFZYRlDOOTCi0rCY	La Boutique del Calzado by Sarella	Кауполикан 590, Valdivia, Valdivia	\N	\N	16	2.0	OPERATIONAL	ChIJQcNo_HbuFZYRlDOOTCi0rCY	GOOGLE	2	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
524	ChIJWWInr3fuFZYR6YHV5YzbdJk	Lapiz Lopez	Avenida Ramón Picarte 417, P 1 Loc 3, Valdivia, Valdivia	\N	\N	16	3.9	OPERATIONAL	ChIJWWInr3fuFZYR6YHV5YzbdJk	GOOGLE	18	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
525	ChIJzS8y64nuFZYR8Q_TS1RZ49w	Neumaticos San Jorge	Avenida Ramón Picarte 1685, Valdivia	\N	\N	20	4.2	OPERATIONAL	ChIJzS8y64nuFZYR8Q_TS1RZ49w	GOOGLE	80	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
526	ChIJr4qb0YnuFZYR4RAw6vusS7w	Ábaco_Delifoods	Carlos Anwandter 619, Valdivia	\N	\N	13	4.3	CLOSED_TEMPORARILY	ChIJr4qb0YnuFZYR4RAw6vusS7w	GOOGLE	148	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
527	ChIJ87LtMXfuFZYRBL6cek_09Xc	Majen	Arauco 561, local 2050, Valdivia	\N	\N	16	4.5	OPERATIONAL	ChIJ87LtMXfuFZYRBL6cek_09Xc	GOOGLE	31	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
528	ChIJGyyN9HbuFZYRS8Pm8V91qi0	Farmacias del Dr. Simi	Arauco 371, 373, Valdivia	\N	\N	17	4.6	OPERATIONAL	ChIJGyyN9HbuFZYRS8Pm8V91qi0	GOOGLE	16	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
529	ChIJvYBUCHLuFZYRVapyd8RulEs	Cooperative Valdivia responsible consumption of Apple	Sotomayor 1186, Valdivia	\N	\N	16	4.9	OPERATIONAL	ChIJvYBUCHLuFZYRVapyd8RulEs	GOOGLE	88	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
530	ChIJJ25aMXbuFZYRHolBl9Bj4nw	Desarrollo y Soluciones Computacionales	Chacabuco 341, Valdivia, Valdivia	\N	\N	16	1.0	OPERATIONAL	ChIJJ25aMXbuFZYRHolBl9Bj4nw	GOOGLE	3	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
531	ChIJFX7qdXnuFZYRwpVNtUZpGJw	Gomac	Avenida Ramón Picarte 819, Valdivia, Valdivia	\N	\N	20	4.6	OPERATIONAL	ChIJFX7qdXnuFZYRwpVNtUZpGJw	GOOGLE	29	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
532	ChIJg4OoFXbuFZYRfLbtRDdIbDg	Augusto Poehlmann y Cia	Letelier 236, Valdivia, Valdivia	\N	\N	17	\N	OPERATIONAL	ChIJg4OoFXbuFZYRfLbtRDdIbDg	GOOGLE	\N	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
533	ChIJveopDYvuFZYRGhvMr8PLMo8	Vamproden Mr.	Errázuriz 2066, Valdivia, Valdivia	\N	\N	17	4.1	OPERATIONAL	ChIJveopDYvuFZYRGhvMr8PLMo8	GOOGLE	9	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
534	ChIJ_5lhlHfuFZYR_opBEOjHgeA	RAMIREZROCHA SPA	Camilo Henríquez 430, Valdivia, Valdivia	\N	\N	16	4.0	OPERATIONAL	ChIJ_5lhlHfuFZYR_opBEOjHgeA	GOOGLE	2	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
535	ChIJ2SA5Q3fuFZYRJpS27buRI9c	Comercializadora de Calzado Guante	Arauco 565, Valdivia	\N	\N	16	1.5	OPERATIONAL	ChIJ2SA5Q3fuFZYRJpS27buRI9c	GOOGLE	2	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
536	ChIJrVigQXfuFZYR-AMh7gE_zAg	Preunic	Arauco 561, Valdivia, Valdivia	\N	\N	16	3.5	OPERATIONAL	ChIJrVigQXfuFZYR-AMh7gE_zAg	GOOGLE	19	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
537	ChIJAZdDYXbuFZYRtaaatV015mk	GAES Valdivia	Avenida Ramón Picarte 702, Valdivia	\N	\N	17	4.2	OPERATIONAL	ChIJAZdDYXbuFZYRtaaatV015mk	GOOGLE	17	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
538	ChIJj_2PFXnuFZYRXVCxbJN_6fs	Aprobosque AG	Los Ciruelos 160, Valdivia, Valdivia	\N	\N	16	\N	OPERATIONAL	ChIJj_2PFXnuFZYRXVCxbJN_6fs	GOOGLE	\N	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
539	ChIJxW6agYnuFZYRY9YMYAlhj4k	Serviteca DACSA Valdivia	Avenida Ramón Picarte 639, Valdivia, Valdivia	\N	\N	20	4.2	OPERATIONAL	ChIJxW6agYnuFZYRY9YMYAlhj4k	GOOGLE	84	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
540	ChIJg3oOP3buFZYRk9J2bNCkw08	7Veinte	Camilo Henríquez 466, Local 1, Valdivia, Valdivia	\N	\N	16	4.4	OPERATIONAL	ChIJg3oOP3buFZYRk9J2bNCkw08	GOOGLE	39	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
541	ChIJ11b2IXbuFZYRjQfb5Z_ZKdo	Tienda Sublime	Chacabuco 280, Valdivia, Valdivia	\N	\N	16	4.3	OPERATIONAL	ChIJ11b2IXbuFZYRjQfb5Z_ZKdo	GOOGLE	3	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
542	ChIJn-ImdXbuFZYRtXIG4R6fSvM	CREAMWORLD	Caupolicán 443, local 10, Valdivia	\N	\N	16	4.4	OPERATIONAL	ChIJn-ImdXbuFZYRtXIG4R6fSvM	GOOGLE	34	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
543	ChIJc6LH-3buFZYRZNL9sehif08	Rincon Nutricional & Deportivo	Arauco #384 Galería SANTIAGO (local 9, Valdivia	\N	\N	17	3.7	OPERATIONAL	ChIJc6LH-3buFZYRZNL9sehif08	GOOGLE	3	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
544	ChIJmbNorHfuFZYR_LM5eiAIBkg	Flores	Avenida Ramón Picarte 417, Valdivia	\N	\N	16	3.7	OPERATIONAL	ChIJmbNorHfuFZYR_LM5eiAIBkg	GOOGLE	15	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
545	ChIJUdnhaXfuFZYRdChgP04G5fg	Ripley Mall Plaza Los Ríos	Arauco 530, Valdivia	\N	\N	16	3.8	OPERATIONAL	ChIJUdnhaXfuFZYRdChgP04G5fg	GOOGLE	3472	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
546	ChIJSwO7zYzuFZYRZ-cXGMiX4Uo	Manufacturas Gloria	Errázuriz 1981, Valdivia, Valdivia	\N	\N	16	4.5	OPERATIONAL	ChIJSwO7zYzuFZYRZ-cXGMiX4Uo	GOOGLE	92	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
547	ChIJI5p8LV7uFZYRUEBMmpURFGE	Tienda Mi Cielo	Avenida Francia 2651, Local S2, Valdivia	\N	\N	16	4.8	OPERATIONAL	ChIJI5p8LV7uFZYRUEBMmpURFGE	GOOGLE	28	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
548	ChIJZUJhfEzuFZYRr9KitWgriF8	IMPORTADORA RIVERLAND VALDIVIA	Las Avutardas 629, Valdivia, Valdivia	\N	\N	16	4.3	OPERATIONAL	ChIJZUJhfEzuFZYRr9KitWgriF8	GOOGLE	4	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
549	ChIJMSIuq3fuFZYRBTf08NXbQCw	Boutique de Perfumes	Caupolicán 532, Valdivia, Valdivia	\N	\N	16	2.0	OPERATIONAL	ChIJMSIuq3fuFZYRBTf08NXbQCw	GOOGLE	1	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
550	ChIJcwv1XHbuFZYR47BcpP8HX8I	La Polar	Camilo Henríquez 520, Valdivia, Valdivia	\N	\N	16	3.5	OPERATIONAL	ChIJcwv1XHbuFZYR47BcpP8HX8I	GOOGLE	936	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
551	ChIJATuUyHfuFZYRp-Q81L3Asww	DISFRACES EL COSTURERO	Caupolicán 374, Valdivia, Valdivia	\N	\N	16	4.0	CLOSED_TEMPORARILY	ChIJATuUyHfuFZYRp-Q81L3Asww	GOOGLE	31	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
552	ChIJ_93GpnfuFZYRy7UlBttp4bI	Tricot	Avenida Ramón Picarte 367, SUR	\N	\N	16	4.0	OPERATIONAL	ChIJ_93GpnfuFZYRy7UlBttp4bI	GOOGLE	206	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
553	ChIJYXIwr3fuFZYRiXZtYfpTqCQ	Multitiendas Corona	Avenida Ramón Picarte 422, Valdivia, Valdivia	\N	\N	16	4.0	OPERATIONAL	ChIJYXIwr3fuFZYRiXZtYfpTqCQ	GOOGLE	5	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
554	ChIJW_HUk3fuFZYRk557o_5VNHA	UMBRAL Ropa Usada (Reciclada) Europea y Americana	Chacabuco 545, Valdivia, Valdivia	\N	\N	16	4.1	OPERATIONAL	ChIJW_HUk3fuFZYRk557o_5VNHA	GOOGLE	70	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
555	ChIJN_m1EnbuFZYRyy8d24cTOJA	Florería Vioceday	Décima Cuarta, Libertad 165, Valdivia	\N	\N	16	4.8	OPERATIONAL	ChIJN_m1EnbuFZYRyy8d24cTOJA	GOOGLE	23	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
556	ChIJT7QSKQDvFZYRAJ02k4zqDk4	T.H.C.	Avenida Ramón Picarte 321, Valdivia	\N	\N	16	5.0	OPERATIONAL	ChIJT7QSKQDvFZYRAJ02k4zqDk4	GOOGLE	1	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
557	ChIJPzsh1DTvFZYRpigPgY7JlhI	Zia Moda	Camilo Henríquez 465, local 142, Valdivia	\N	\N	16	\N	OPERATIONAL	ChIJPzsh1DTvFZYRpigPgY7JlhI	GOOGLE	\N	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
558	ChIJa_bXZHbuFZYRkGhWyMxqpe8	Rockford	299, Maipú 201, Valdivia, Valdivia	\N	\N	16	3.9	OPERATIONAL	ChIJa_bXZHbuFZYRkGhWyMxqpe8	GOOGLE	13	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
559	ChIJWSugN97tFZYRmWN5URPjCEk	Qué Leo Valdivia	Local 1, Los Laureles 75, Valdivia, Valdivia	\N	\N	16	4.6	OPERATIONAL	ChIJWSugN97tFZYRmWN5URPjCEk	GOOGLE	275	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
560	ChIJu6_qpnfuFZYRH2QD9ZNVB0w	Libreria Universal	Avenida Ramón Picarte 461, Valdivia, Valdivia	\N	\N	16	4.5	OPERATIONAL	ChIJu6_qpnfuFZYRH2QD9ZNVB0w	GOOGLE	15	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
561	ChIJPY_wdePvFZYRlKXFKtzJEzU	Premium Papeleria	Camilo Henríquez 466, local 140, Valdivia	\N	\N	16	5.0	OPERATIONAL	ChIJPY_wdePvFZYRlKXFKtzJEzU	GOOGLE	1	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
562	ChIJxfX7kEPvFZYRdeTMQWeHb-Q	Paoka	Vicente Pérez Rosales 565, Valdivia	\N	\N	16	5.0	OPERATIONAL	ChIJxfX7kEPvFZYRdeTMQWeHb-Q	GOOGLE	9	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
563	ChIJbc9eP3buFZYRnWJ2_7kpYho	Feria Chilena del Libro | Valdivia	Camilo Henríquez 466, Valdivia, Valdivia	\N	\N	16	4.5	OPERATIONAL	ChIJbc9eP3buFZYRnWJ2_7kpYho	GOOGLE	167	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
564	ChIJaTc_GQDvFZYRH_r33AH6UZQ	Kiosko de colecciones, diarios y revistas	O'Higgins 442, Valdivia	\N	\N	16	\N	OPERATIONAL	ChIJaTc_GQDvFZYRH_r33AH6UZQ	GOOGLE	\N	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
565	ChIJuTD3M3buFZYRDaMaVQIQ6Kk	Libreria Cervantes	Chacabuco 347, Valdivia, Valdivia	\N	\N	16	4.0	OPERATIONAL	ChIJuTD3M3buFZYRDaMaVQIQ6Kk	GOOGLE	1	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
566	ChIJQYOt-3buFZYRGrU2SwTVd3M	Comercial Pc y Libreria Luz Nelda Monsalve Reyes E.I.R.L.,	Arauco 384, Valdivia, Valdivia	\N	\N	16	3.0	OPERATIONAL	ChIJQYOt-3buFZYRGrU2SwTVd3M	GOOGLE	1	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
567	ChIJN9b_QRXvFZYRWlhhddKzkS4	FOTOCOPIADORA "STOPRINTER"	Camilo Henríquez 631, Local #1, Valdivia, Valdivia	\N	\N	16	4.3	CLOSED_TEMPORARILY	ChIJN9b_QRXvFZYRWlhhddKzkS4	GOOGLE	3	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
568	ChIJL56IknbuFZYR3GL7RvySc4o	Copiaysen	Camilo Henríquez 637, Valdivia, Valdivia	\N	\N	16	4.4	OPERATIONAL	ChIJL56IknbuFZYR3GL7RvySc4o	GOOGLE	160	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
569	ChIJE23ry3zvFZYRyG9zdM8s_VU	LIBRERIA EL TORREON VALDIVIA	Camilo Henríquez 643, Valdivia	\N	\N	16	4.7	OPERATIONAL	ChIJE23ry3zvFZYRyG9zdM8s_VU	GOOGLE	44	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
570	ChIJ74dGrGjvFZYRS2SM4aWnny8	Casa Niños Juguetería Didáctica	San Carlos 165, Valdivia	\N	\N	16	4.5	OPERATIONAL	ChIJ74dGrGjvFZYRS2SM4aWnny8	GOOGLE	15	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
571	ChIJH_yOodvRFZYRV7n0_4DzIp0	Librería Chiloé	Caupolicán 364, Valdivia	\N	\N	16	\N	OPERATIONAL	ChIJH_yOodvRFZYRV7n0_4DzIp0	GOOGLE	\N	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
572	ChIJnZWdGPjvFZYRHeYQROcVaQA	Pormi Regalo Decoracion	Caupolicán 360, Valdivia	\N	\N	16	\N	OPERATIONAL	ChIJnZWdGPjvFZYRHeYQROcVaQA	GOOGLE	\N	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
573	ChIJMSSf1TLvFZYRJd2qvdKQpOU	Librería Cuerpo & Alma Valdivia	Caupolicán 360, Local 1, Valdivia	\N	\N	16	4.8	OPERATIONAL	ChIJMSSf1TLvFZYRJd2qvdKQpOU	GOOGLE	48	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
574	ChIJK0UuB8rvFZYR4--6sNBr1pw	Mangatoria	Caupolicán 364, local 5, Valdivia	\N	\N	16	5.0	OPERATIONAL	ChIJK0UuB8rvFZYR4--6sNBr1pw	GOOGLE	15	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
575	ChIJyzSeUNPvFZYRnU8xs5R8nk0	Libros Teresa Pueblito Comercial	Chacabuco 485, local 9, Valdivia	\N	\N	16	5.0	OPERATIONAL	ChIJyzSeUNPvFZYRnU8xs5R8nk0	GOOGLE	1	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
576	ChIJFTxlLHfuFZYRxFrCRC5Kfaw	Soc Comercial Libros del Sur	Psje Pasaje Esmeralda 670, oficina 4, Valdivia, Valdivia	\N	\N	16	\N	OPERATIONAL	ChIJFTxlLHfuFZYRxFrCRC5Kfaw	GOOGLE	\N	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
577	ChIJxbAoRGHvFZYREpVv3BRBFHQ	La papelaria	Arauco 561, Local 10, Valdivia	\N	\N	16	\N	OPERATIONAL	ChIJxbAoRGHvFZYREpVv3BRBFHQ	GOOGLE	\N	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
578	ChIJmyeRJHbuFZYRnw51PDlvzlM	Sociedad Forestal Bosques De Paimun Limitada	Chacabuco 308, Valdivia, Valdivia	\N	\N	23	\N	OPERATIONAL	ChIJmyeRJHbuFZYRnw51PDlvzlM	GOOGLE	\N	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
579	ChIJL1XtUOntFZYRcgdGE82qOE8	Arboretum UACh	Unnamed Rd,, Valdivia	\N	\N	23	4.7	OPERATIONAL	ChIJL1XtUOntFZYRcgdGE82qOE8	GOOGLE	595	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
580	ChIJ_9RiNfTuFZYROeG9n0jy0z4	Parque Krahmer	Rodolfo Beckdorf 1657, Valdivia, Valdivia	\N	\N	23	4.6	OPERATIONAL	ChIJ_9RiNfTuFZYROeG9n0jy0z4	GOOGLE	1939	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
581	ChIJi8GkbHbuFZYROiTMdGti9QQ	Republic Plaza	O'Higgins, Valdivia	\N	\N	23	4.3	OPERATIONAL	ChIJi8GkbHbuFZYROiTMdGti9QQ	GOOGLE	4627	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
582	ChIJMVmZMlXtFZYR2RqnKMagSvw	Plaza Pedro de Valdivia	Valdivia	\N	\N	23	4.4	CLOSED_TEMPORARILY	ChIJMVmZMlXtFZYR2RqnKMagSvw	GOOGLE	9	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
583	ChIJNfQpVQDtFZYRmVMQ8Owpz5I	Plaza Chile	5QQ3+36F, Valdivia	\N	\N	23	5.0	CLOSED_TEMPORARILY	ChIJNfQpVQDtFZYRmVMQ8Owpz5I	GOOGLE	1	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
584	ChIJaVt0W2XvFZYRQN1Soy8HwFo	Fiesta de la Sidra	Centro de Ferias Parque Saval, Valdivia	\N	\N	23	\N	OPERATIONAL	ChIJaVt0W2XvFZYRQN1Soy8HwFo	GOOGLE	\N	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
585	ChIJ66PTOgDvFZYR-9_8cyE05mk	EL ALEMAN	Valdivia	\N	\N	23	\N	OPERATIONAL	ChIJ66PTOgDvFZYR-9_8cyE05mk	GOOGLE	\N	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
586	ChIJAS0XaADvFZYRVUuNsqnyWgI	CABALGATAS VALDIVIA	Avenida Alemania 675, Valdivia	\N	\N	23	\N	OPERATIONAL	ChIJAS0XaADvFZYRVUuNsqnyWgI	GOOGLE	\N	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
587	ChIJlx2WtXDuFZYRDRGb9eSCK9I	Costanera Valdivia	Avenida Arturo Prat 2, 16, Valdivia, Valdivia	\N	\N	23	4.7	OPERATIONAL	ChIJlx2WtXDuFZYRDRGb9eSCK9I	GOOGLE	1477	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
588	ChIJ5Z-l19_tFZYRDB0qtdufhFQ	Parque Anwandter	Valdivia	\N	\N	23	4.7	OPERATIONAL	ChIJ5Z-l19_tFZYRDB0qtdufhFQ	GOOGLE	6	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
589	ChIJ56QJunPuFZYRiYdPR7zka68	Colegio Alonso de Ercilla	General Lagos 990, Valdivia, Valdivia	\N	\N	18	3.8	OPERATIONAL	ChIJ56QJunPuFZYRiYdPR7zka68	GOOGLE	32	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
590	ChIJZ8ihQADvFZYRV-3c688ib0w	Plaza Pastene	Vicente Pérez Rosales 1077, Valdivia	\N	\N	23	\N	OPERATIONAL	ChIJZ8ihQADvFZYRV-3c688ib0w	GOOGLE	\N	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
591	ChIJ04rcPwDvFZYRSygZHhMRvww	Plaza salesiana	Avenida Alemania 880, Valdivia	\N	\N	23	5.0	OPERATIONAL	ChIJ04rcPwDvFZYRSygZHhMRvww	GOOGLE	1	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
592	ChIJn9Vk9VHvFZYRKCyLXqrIaLk	Espacio Casa Hantke	General Lagos 1221, Valdivia	\N	\N	20	4.8	OPERATIONAL	ChIJn9Vk9VHvFZYRKCyLXqrIaLk	GOOGLE	17	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
593	ChIJKY9-yeDtFZYRVIyDC5tdZYU	Laguna de los patos	Isla Teja, Valdivia	\N	\N	23	4.8	OPERATIONAL	ChIJKY9-yeDtFZYRVIyDC5tdZYU	GOOGLE	68	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
594	ChIJ_z5-puHtFZYRLu_QuipKrwg	Santa Inés Park	Los Lingues 601-679, Valdivia, Valdivia	\N	\N	23	4.5	OPERATIONAL	ChIJ_z5-puHtFZYRLu_QuipKrwg	GOOGLE	1157	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
595	ChIJ1evDUgDtFZYRpGPvsaU68rU	Casita de los choches🩷	Las Quilas 443, Valdivia	\N	\N	23	\N	OPERATIONAL	ChIJ1evDUgDtFZYRpGPvsaU68rU	GOOGLE	\N	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
596	ChIJK8h53e7tFZYRI68EblDbQeQ	Oficina Innovat UACh	Isla Teja, Avenida Doctor Eduardo Tallman, Valdivia	\N	\N	23	\N	OPERATIONAL	ChIJK8h53e7tFZYRI68EblDbQeQ	GOOGLE	\N	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
597	ChIJn5NzjnzuFZYRrqAGm-9sNOA	Harnecker Municipal Park	Errázuriz 1101-1299, Valdivia, Valdivia	\N	\N	23	4.6	OPERATIONAL	ChIJn5NzjnzuFZYRrqAGm-9sNOA	GOOGLE	116	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
598	ChIJl1pq9N_tFZYRJ3tI4cr2DJg	Museo de la Exploración Rudolph Amandus Philippi	Isla Teja Campus de Los Museos UACh, Los Laureles 95, Valdivia	\N	\N	21	4.6	OPERATIONAL	ChIJl1pq9N_tFZYRJ3tI4cr2DJg	GOOGLE	371	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
599	ChIJmQaglHXuFZYRrBdp2smLG90	Pendulo de Foucault	Av. Costanera Arturo Prat,, Valdivia	\N	\N	22	4.5	OPERATIONAL	ChIJmQaglHXuFZYRrBdp2smLG90	GOOGLE	2779	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
600	ChIJJ-J3R3TuFZYR0f6sxGRI0ws	Centro Cultural El Austral	Yungay 733, Valdivia, Valdivia	\N	\N	21	4.6	CLOSED_TEMPORARILY	ChIJJ-J3R3TuFZYR0f6sxGRI0ws	GOOGLE	115	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
601	ChIJW7a5UHLuFZYR4YfKkRkpi3M	Cabañas General Lagos	General Lagos 1080, Valdivia, Valdivia	\N	\N	22	4.5	OPERATIONAL	ChIJW7a5UHLuFZYR4YfKkRkpi3M	GOOGLE	2	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
602	ChIJHUVapBXuFZYRe1U9UqLEiU8	Islote Haverbeck	Arica 2233, Valdivia, Valdivia	\N	\N	22	4.4	OPERATIONAL	ChIJHUVapBXuFZYRe1U9UqLEiU8	GOOGLE	250	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
603	ChIJfxKPDHbuFZYR2PbtIh9aw44	Our Lady of the Rosary Cathedral, Valdivia	O'Higgins, Valdivia, Valdivia	\N	\N	21	4.6	OPERATIONAL	ChIJfxKPDHbuFZYR2PbtIh9aw44	GOOGLE	166	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
604	ChIJF8wadADvFZYR7LLj3g1XWZQ	Stand ilustraciones y arte	Avenida Arturo Prat, Valdivia	\N	\N	22	5.0	OPERATIONAL	ChIJF8wadADvFZYR7LLj3g1XWZQ	GOOGLE	3	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
605	ChIJgZFwLt_tFZYRS6o-h0legKc	Costanera	Avenida Arturo Prat, Valdivia	\N	\N	22	4.6	OPERATIONAL	ChIJgZFwLt_tFZYRS6o-h0legKc	GOOGLE	4756	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
606	ChIJjWCPv8vtFZYRiI1wkb-_mL0	vive la excursion	Avenida Arturo Prat, Valdivia	\N	\N	22	\N	OPERATIONAL	ChIJjWCPv8vtFZYRiI1wkb-_mL0	GOOGLE	\N	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
607	ChIJGaxXtHXuFZYRLVPlq_Ksj0I	museo naval submarino O' Brien	Avenida Arturo Prat 2-20, Valdivia, Valdivia	\N	\N	21	4.4	OPERATIONAL	ChIJGaxXtHXuFZYRLVPlq_Ksj0I	GOOGLE	2546	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
608	ChIJtbfnUXTuFZYRQ1QNTAq6JTQ	Submarino O'Brien	Valdivia	\N	\N	22	4.3	OPERATIONAL	ChIJtbfnUXTuFZYRQ1QNTAq6JTQ	GOOGLE	97	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
609	ChIJgWZWWgDtFZYR3wy4n9y8dBw	Embarcacion Fenix	Avenida Arturo Prat 25, Valdivia	\N	\N	22	5.0	OPERATIONAL	ChIJgWZWWgDtFZYR3wy4n9y8dBw	GOOGLE	8	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
610	ChIJYxeIvbfvFZYR6-oJmys51N8	Muelle Panorámico	Costanera Prat 855, Valdivia	\N	\N	22	4.7	OPERATIONAL	ChIJYxeIvbfvFZYR6-oJmys51N8	GOOGLE	10	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
611	ChIJUdAL8HfuFZYRpnqtJL1vVCA	Plaza Obelisco	Avenida Alemania 500-598, Valdivia, Valdivia	\N	\N	22	4.0	OPERATIONAL	ChIJUdAL8HfuFZYRpnqtJL1vVCA	GOOGLE	169	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
612	ChIJMSmKQgDtFZYRvWZKvh88W8w	Seals Pier	Avenida Arturo Prat 100, Valdivia	\N	\N	22	4.5	OPERATIONAL	ChIJMSmKQgDtFZYRvWZKvh88W8w	GOOGLE	2	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
613	ChIJ56Mnm9_tFZYRGmugRyswACw	Museo Histórico y Antropológico Maurice van de Maele	Isla Teja Campus de Los Museos UACh, Los Laureles 95, Valdivia	\N	\N	21	4.5	OPERATIONAL	ChIJ56Mnm9_tFZYRGmugRyswACw	GOOGLE	793	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
614	ChIJ3YVmEd_tFZYRE1ljRHz-nYs	Puente Pedro de Valdivia	Río Callecalle, Valdivia	\N	\N	22	4.7	OPERATIONAL	ChIJ3YVmEd_tFZYRE1ljRHz-nYs	GOOGLE	191	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
615	ChIJYc839nPuFZYRK-s_fiN8BHY	Iglesia San Francisco de Valdivia	Yerbas Buenas 181, Valdivia, Valdivia	\N	\N	21	4.5	OPERATIONAL	ChIJYc839nPuFZYRK-s_fiN8BHY	GOOGLE	169	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
616	ChIJJWmFeQDvFZYRLxSmmgv6ziw	chuster	Los Castaños 10, Valdivia	\N	\N	22	\N	OPERATIONAL	ChIJJWmFeQDvFZYRLxSmmgv6ziw	GOOGLE	\N	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
617	ChIJ96AOF23uFZYR-6QTK_tzbjw	Camping Orilla Verde	24, E Lillo 2, Valdivia, Valdivia	\N	\N	24	4.4	OPERATIONAL	ChIJ96AOF23uFZYR-6QTK_tzbjw	GOOGLE	360	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
618	ChIJN3LokPDtFZYRpFogs16U98Y	Camping Isla Teja	Los Cipreces 1125, Valdivia	\N	\N	24	3.9	OPERATIONAL	ChIJN3LokPDtFZYRpFogs16U98Y	GOOGLE	503	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
619	ChIJCXMjAnbuFZYRzyUUsn8Jllk	Terminal L11	Chile	\N	\N	15	1.0	OPERATIONAL	ChIJCXMjAnbuFZYRzyUUsn8Jllk	GOOGLE	1	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
620	ChIJveankd3tFZYRjl8x37QkWRY	Terminal L4, L5, L20	Chile	\N	\N	15	3.0	OPERATIONAL	ChIJveankd3tFZYRjl8x37QkWRY	GOOGLE	1	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
621	ChIJ86j7hl3uFZYRexEldVhcUqY	Terminal L2	Chile	\N	\N	15	1.5	OPERATIONAL	ChIJ86j7hl3uFZYRexEldVhcUqY	GOOGLE	2	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
622	ChIJzz06DfrtFZYROAckN5OtSn4	Terminal L9	Chile	\N	\N	15	2.8	OPERATIONAL	ChIJzz06DfrtFZYROAckN5OtSn4	GOOGLE	4	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
623	ChIJc6XYUUruFZYR7F72Fcxbpfs	Terminal L1, L3	Chile	\N	\N	15	\N	OPERATIONAL	ChIJc6XYUUruFZYR7F72Fcxbpfs	GOOGLE	\N	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
624	ChIJ5093-zTuFZYR0PAw4QTCFX0	Terminal L9	Chile	\N	\N	15	3.0	OPERATIONAL	ChIJ5093-zTuFZYR0PAw4QTCFX0	GOOGLE	2	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
625	ChIJzcYhahfsFZYRVJWtWrs--xo	Terminal L1	Chile	\N	\N	15	1.0	OPERATIONAL	ChIJzcYhahfsFZYRVJWtWrs--xo	GOOGLE	1	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
626	ChIJF6z7wADvFZYRdOP-VDKPeaA	Terminal L11	Chile	\N	\N	15	\N	OPERATIONAL	ChIJF6z7wADvFZYRdOP-VDKPeaA	GOOGLE	\N	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
627	ChIJZ282hK7vFZYR1qvElh30OJ4	Terminal L20P	Chile	\N	\N	15	3.0	OPERATIONAL	ChIJZ282hK7vFZYR1qvElh30OJ4	GOOGLE	2	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
628	ChIJ5-dyOHnuFZYRITpHCMd3_gc	Valdivia	Chile	\N	\N	15	4.5	OPERATIONAL	ChIJ5-dyOHnuFZYRITpHCMd3_gc	GOOGLE	210	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
629	ChIJBQ-OCnbuFZYRF5qoK0TDKZI	P15 - Independencia / Libertad	Chile	\N	\N	15	\N	OPERATIONAL	ChIJBQ-OCnbuFZYRF5qoK0TDKZI	GOOGLE	\N	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
630	ChIJn_uNBnbuFZYRoBV6iOdmSts	P17 - Independencia / Chacabuco	Chile	\N	\N	15	\N	OPERATIONAL	ChIJn_uNBnbuFZYRoBV6iOdmSts	GOOGLE	\N	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
631	ChIJH2UGf3buFZYRueeAYmQMCLk	I - Arauco / Independencia	Chile	\N	\N	15	\N	OPERATIONAL	ChIJH2UGf3buFZYRueeAYmQMCLk	GOOGLE	\N	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
632	ChIJ8cnn8HbuFZYRadYaNIPVQ0g	P48 - Arauco / Camilo Henríquez - Caupolicán	Chile	\N	\N	15	\N	OPERATIONAL	ChIJ8cnn8HbuFZYRadYaNIPVQ0g	GOOGLE	\N	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
633	ChIJfQgmMHbuFZYR6gxZfqaGT3I	P57 - Chacabuco / Caupolicán - Camilo Henríquez	Chile	\N	\N	15	5.0	OPERATIONAL	ChIJfQgmMHbuFZYR6gxZfqaGT3I	GOOGLE	1	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
634	ChIJCYQ7hHbuFZYRJ7zh465aqqw	P27 - Pérez Rosales / San Carlos	Chile	\N	\N	15	5.0	OPERATIONAL	ChIJCYQ7hHbuFZYRJ7zh465aqqw	GOOGLE	1	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
635	ChIJDeVfzHXuFZYRZPi-ZUZdflw	P12 - Yungay / San Carlos	Chile	\N	\N	15	\N	OPERATIONAL	ChIJDeVfzHXuFZYRZPi-ZUZdflw	GOOGLE	\N	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
636	ChIJkW_unnbuFZYR7WqNwCGRHgs	P26 - Pérez Rosales / Lautarp	Chile	\N	\N	15	\N	OPERATIONAL	ChIJkW_unnbuFZYR7WqNwCGRHgs	GOOGLE	\N	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
637	ChIJl7tymtjtFZYRnx661s00WBE	P63 - Carampangue / Camilo Henríquez	Chile	\N	\N	15	3.0	OPERATIONAL	ChIJl7tymtjtFZYRnx661s00WBE	GOOGLE	1	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
638	ChIJtRpfS9_tFZYRY2n8eHmyHn4	I - Alemania / Hotel Dreams	Chile	\N	\N	15	\N	OPERATIONAL	ChIJtRpfS9_tFZYRY2n8eHmyHn4	GOOGLE	\N	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
639	ChIJo-A5IXfuFZYRlaQtjsPgg7s	I - Esmeralda	Chile	\N	\N	15	\N	OPERATIONAL	ChIJo-A5IXfuFZYRlaQtjsPgg7s	GOOGLE	\N	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
640	ChIJJ7CMd9jtFZYRKdHKAWDwACA	P64 - Carampangue / Caupolicán	Chile	\N	\N	15	\N	OPERATIONAL	ChIJJ7CMd9jtFZYRKdHKAWDwACA	GOOGLE	\N	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
641	ChIJJ29GFXfuFZYRCUXTAbBC_oI	P49 - Mall	Chile	\N	\N	15	\N	OPERATIONAL	ChIJJ29GFXfuFZYRCUXTAbBC_oI	GOOGLE	\N	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
642	ChIJDcJYknfuFZYRsahviOPCj1Y	P59 - Chacabuco / Ismael Valdés	Chile	\N	\N	15	\N	OPERATIONAL	ChIJDcJYknfuFZYRsahviOPCj1Y	GOOGLE	\N	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
643	ChIJi8JQjHfuFZYRSVSoSwr1yKk	P60 - Schmidt / Chacabuco	Chile	\N	\N	15	\N	OPERATIONAL	ChIJi8JQjHfuFZYRSVSoSwr1yKk	GOOGLE	\N	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
644	ChIJDVulAXTuFZYRPUeZtiXXFvE	P25 - Pérez Rosales / Yerbas Buenas	Chile	\N	\N	15	\N	OPERATIONAL	ChIJDVulAXTuFZYRPUeZtiXXFvE	GOOGLE	\N	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
645	ChIJD3k--HfuFZYRXnlCNi4TCao	P65 - Carampangue / Schmidt	Chile	\N	\N	15	\N	OPERATIONAL	ChIJD3k--HfuFZYRXnlCNi4TCao	GOOGLE	\N	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
646	ChIJb0m1c3TuFZYRIfrm5ChTB4g	P11 - Gral. Lagos / Yerbas Buenas	Chile	\N	\N	15	5.0	OPERATIONAL	ChIJb0m1c3TuFZYRIfrm5ChTB4g	GOOGLE	1	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
647	ChIJp4XllXvuFZYRh_e6M3JwviU	The Medical Center Towers	Beauchef 925, Valdivia, Valdivia	\N	\N	17	\N	OPERATIONAL	ChIJp4XllXvuFZYRh_e6M3JwviU	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
648	ChIJk4KYZHbuFZYR7e07LepGwww	Isapre Vida Tres	Lautaro 164, Valdivia	\N	\N	19	\N	OPERATIONAL	ChIJk4KYZHbuFZYR7e07LepGwww	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
649	ChIJhXA-6HfuFZYRWCBObaJ7lX8	Centro Médico y Dental RedSalud Valdivia	Avenida Alemania 475, Valdivia	\N	\N	17	\N	OPERATIONAL	ChIJhXA-6HfuFZYRWCBObaJ7lX8	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
650	ChIJv-ImrHfuFZYRouHefN972zs	Clínica de Ortodoncia Dr. Marco Merino Gerlach	Avenida Ramón Picarte 427, Valdivia, Valdivia	\N	\N	17	\N	OPERATIONAL	ChIJv-ImrHfuFZYRouHefN972zs	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
651	ChIJt2KHXnDuFZYR45izHfsErLY	Centro Otorrino Renaissance	Beauchef 683, Oficina 101, Valdivia, Valdivia	\N	\N	17	\N	OPERATIONAL	ChIJt2KHXnDuFZYR45izHfsErLY	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
652	ChIJy5Ejyd_tFZYRg8uUYKpXxRs	Centro de Salud Universitario UACh	Los Laureles 95, Valdivia, Valdivia	\N	\N	17	\N	OPERATIONAL	ChIJy5Ejyd_tFZYRg8uUYKpXxRs	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
653	ChIJ_Zjxo37uFZYR25FRomALYpY	Mutual Security	Avenida Arturo Prat 1005, Valdivia, Valdivia	\N	\N	17	\N	OPERATIONAL	ChIJ_Zjxo37uFZYR25FRomALYpY	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
654	ChIJlzrIL13uFZYRgNb9SOE-Kzo	Centro Medico Surmedica	5111847, Avenida Francia 1655 – Valdivia (Frente al Hospital Regional, Valdivia	\N	\N	17	\N	OPERATIONAL	ChIJlzrIL13uFZYRgNb9SOE-Kzo	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
655	ChIJFYP0wmfuFZYRT9cZ33K2xs8	Base Hospital de Valdivia	Coronel Santiago Bueras 1003, Valdivia	\N	\N	17	\N	OPERATIONAL	ChIJFYP0wmfuFZYRT9cZ33K2xs8	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
656	ChIJz-Loa3ruFZYRGUFbv1OvDew	Clínica Alemana de Valdivia	Beauchef 765, Valdivia, Valdivia	\N	\N	17	\N	OPERATIONAL	ChIJz-Loa3ruFZYRGUFbv1OvDew	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
657	ChIJST4MiHnuFZYRHoe9fF5F4Oo	Capredena	Pedro de Valdivia 595, Valdivia, Valdivia	\N	\N	17	\N	OPERATIONAL	ChIJST4MiHnuFZYRHoe9fF5F4Oo	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
658	ChIJRexvXADvFZYRz6Xqnwussl0	IST Valdivia	Independencia 491, Local 2, Valdivia	\N	\N	17	\N	OPERATIONAL	ChIJRexvXADvFZYRz6Xqnwussl0	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
659	ChIJm3ncCADvFZYRS-3j2I5B_A0	Instituto de Seguridad del Trabajo IST	Independencia 491, oficina 2, Valdivia	\N	\N	17	\N	OPERATIONAL	ChIJm3ncCADvFZYRS-3j2I5B_A0	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
660	ChIJ5d-wwEjvFZYR9lluyiq9MUA	INNOVAL Centro Clínico Integral	Libertad 491, Of. 503, Valdivia	\N	\N	17	\N	OPERATIONAL	ChIJ5d-wwEjvFZYR9lluyiq9MUA	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
775	ChIJZwbtenbuFZYREJAB26bNUtM	Cafe De Luis	Maipú 183-199, Valdivia	\N	\N	13	4.4	OPERATIONAL	ChIJZwbtenbuFZYREJAB26bNUtM	GOOGLE	1646	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
661	ChIJ2SIAhTDvFZYRK9VZzHJoe2s	Cirujano Dentista Matias Guerra	San Carlos 171, of. 318, O'Higgins 457, oficina #8, Valdivia	\N	\N	17	\N	OPERATIONAL	ChIJ2SIAhTDvFZYRK9VZzHJoe2s	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
662	ChIJ3z6WcpnvFZYRIK9tAcq7Z1E	Clínica Dr. Castillo	EDIFICIO PICARTE, Av. Ramón Picarte 427, cuarto piso, Consulta 404, Avenida Ramón Picarte, Valdivia, Valdivia	\N	\N	17	\N	OPERATIONAL	ChIJ3z6WcpnvFZYRIK9tAcq7Z1E	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
663	ChIJyYPSlUPvFZYRQL6ad7T1y5g	Dr Claudio Villegas	Lautaro 175, Valdivia	\N	\N	17	\N	OPERATIONAL	ChIJyYPSlUPvFZYRQL6ad7T1y5g	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
664	ChIJBUp5JADvFZYRoAN8pI9k798	Clínica Armónica	Pasaje José Miguel Varela 260, Valdivia	\N	\N	17	\N	OPERATIONAL	ChIJBUp5JADvFZYRoAN8pI9k798	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
665	ChIJ_Sj-bGjuFZYRblhiIh0swjQ	Isaac Quero Ortodoncia y Rehabilitación Oral	Camilo Henríquez 240, Valdivia	\N	\N	17	\N	OPERATIONAL	ChIJ_Sj-bGjuFZYRblhiIh0swjQ	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
666	ChIJ0xs3bHTuFZYRoXodhH3J4sw	Clinica Odontolgica	Yungay 783, Valdivia, Valdivia	\N	\N	17	\N	OPERATIONAL	ChIJ0xs3bHTuFZYRoXodhH3J4sw	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
667	ChIJs29VoHfuFZYRnDcqjam_3vw	Knop pharmacies - Valdivia	Avenida Ramón Picarte 489, Valdivia	\N	\N	17	4.4	OPERATIONAL	ChIJs29VoHfuFZYRnDcqjam_3vw	GOOGLE	16	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
668	ChIJrTbg5WbuFZYRCJ3pdMITVaM	Farmacias Ahumada	Local interior, Supermercado Líder, Coronel Santiago Bueras, Valdivia, Valdivia	\N	\N	17	2.9	OPERATIONAL	ChIJrTbg5WbuFZYRCJ3pdMITVaM	GOOGLE	14	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
669	ChIJ3T57RHbuFZYRiKbwgjF4H1s	Farmacias Ahumada	Arauco 561, local 144, Valdivia	\N	\N	17	3.7	OPERATIONAL	ChIJ3T57RHbuFZYRiKbwgjF4H1s	GOOGLE	18	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
670	ChIJDXj_-nnuFZYRmp532btLMNo	Salcobrand	Arauco N° 697, Valdivia	\N	\N	17	3.0	OPERATIONAL	ChIJDXj_-nnuFZYRmp532btLMNo	GOOGLE	6	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
671	ChIJj8Q8QnbuFZYR31JfD3CeTlw	Farmacias Salcobrand	Avenida Ramón Picarte 301, Valdivia	\N	\N	17	4.0	OPERATIONAL	ChIJj8Q8QnbuFZYR31JfD3CeTlw	GOOGLE	4	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
672	ChIJtTmdQXbuFZYRsn3lRFJZPoQ	Farmacias Ahumada	Av. Ramón Picarte, Camilo Henríquez 310	\N	\N	17	\N	OPERATIONAL	ChIJtTmdQXbuFZYRsn3lRFJZPoQ	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
673	ChIJkeXMFXbuFZYRXEuX1HuvyTg	Farmacia Prat	Letelier 236, Valdivia, Valdivia	\N	\N	17	4.7	OPERATIONAL	ChIJkeXMFXbuFZYRXEuX1HuvyTg	GOOGLE	15	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
674	ChIJS3rUWnbuFZYRJrXRu_YWp7A	Farmacias Cruz Verde - Av Ramón Picarte 343	Avenida Ramón Picarte 343, Valdivia, Valdivia	\N	\N	17	4.0	OPERATIONAL	ChIJS3rUWnbuFZYRJrXRu_YWp7A	GOOGLE	4	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
675	ChIJW-r5QnbuFZYRDDVWZCLBWws	Farmacias Salcobrand	Camilo Henríquez N° 450, Valdivia	\N	\N	17	4.2	OPERATIONAL	ChIJW-r5QnbuFZYRDDVWZCLBWws	GOOGLE	11	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
676	ChIJL2dhdnbuFZYRrHp5iRZaVi0	Cruz Verde pharmacy	Independencia 542, Valdivia, Valdivia	\N	\N	17	3.6	OPERATIONAL	ChIJL2dhdnbuFZYRrHp5iRZaVi0	GOOGLE	5	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
677	ChIJ29bgrXfuFZYRvBL_5LTC8m0	Farmacias Cruz Verde - Avenida Ramón Picarte 384	Avenida Ramón Picarte 384, Valdivia	\N	\N	17	2.9	OPERATIONAL	ChIJ29bgrXfuFZYRvBL_5LTC8m0	GOOGLE	18	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
678	ChIJ30dQOwDvFZYRVU-wUwHHXtw	Farmacia Las Animas	Chacabuco 320, Valdivia	\N	\N	17	3.5	OPERATIONAL	ChIJ30dQOwDvFZYRVU-wUwHHXtw	GOOGLE	2	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
679	ChIJqYreGHbuFZYRlMKGmKGfpm0	Farmacia Central de Homeopatía	Chacabuco 217, Local 17, Valdivia, Valdivia	\N	\N	17	5.0	OPERATIONAL	ChIJqYreGHbuFZYRlMKGmKGfpm0	GOOGLE	6	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
680	ChIJ8yDGyvHvFZYRxpawhfQBkdg	CIAMCH Insumos de Medicina China	Caupolicán 532, Local n° 117, Valdivia	\N	\N	17	5.0	OPERATIONAL	ChIJ8yDGyvHvFZYRxpawhfQBkdg	GOOGLE	4	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
681	ChIJnU3fVsvvFZYRBmHt9hcKTeo	Farmacia Pharmasur	Caupolicán 508, Valdivia	\N	\N	17	3.8	OPERATIONAL	ChIJnU3fVsvvFZYRBmHt9hcKTeo	GOOGLE	4	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
682	ChIJ7a4dl3nvFZYRmyImHG3A6TE	Farmacia Los Ríos	Кауполикан 579, Valdivia	\N	\N	17	5.0	CLOSED_TEMPORARILY	ChIJ7a4dl3nvFZYRmyImHG3A6TE	GOOGLE	2	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
683	ChIJWQKCVADvFZYRcUpGecu1NsA	Centro Naturista Esmeralda	Arauco 384, L. 11, Valdivia	\N	\N	17	5.0	OPERATIONAL	ChIJWQKCVADvFZYRcUpGecu1NsA	GOOGLE	1	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
684	ChIJGcio-3buFZYRT9cTAIr0kb8	Mapulawen	Arauco 384, Valdivia, Valdivia	\N	\N	17	3.0	OPERATIONAL	ChIJGcio-3buFZYRT9cTAIr0kb8	GOOGLE	1	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
685	ChIJLUwJLWLvFZYRKik81xaQuTc	Farmacias del Dr. Simi	Caupolicán, 566 B, Valdivia	\N	\N	17	4.6	OPERATIONAL	ChIJLUwJLWLvFZYRKik81xaQuTc	GOOGLE	8	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
686	ChIJg5JP3e3uFZYRZxR-xGDFuio	Sapu Gil de Castro	Avenida Ramón Picarte 2500, Valdivia, Valdivia	\N	\N	17	3.0	OPERATIONAL	ChIJg5JP3e3uFZYRZxR-xGDFuio	GOOGLE	4	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
687	ChIJ8ztf1HXuFZYRMWKxc2jtJoU	IST - Kihnos+	Independencia 491, Local 2, Valdivia	\N	\N	17	5.0	OPERATIONAL	ChIJ8ztf1HXuFZYRMWKxc2jtJoU	GOOGLE	5	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
688	ChIJJ7tIU3buFZYRXKzGfgMvsRU	Clínica Dental Cohn	Caupolicán 532, Valdivia, Valdivia	\N	\N	17	\N	OPERATIONAL	ChIJJ7tIU3buFZYRXKzGfgMvsRU	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
689	ChIJBadg6HfuFZYRW0rLgzLaHbM	One Dental Health	Avenida Alemania 485, Valdivia	\N	\N	17	4.4	OPERATIONAL	ChIJBadg6HfuFZYRW0rLgzLaHbM	GOOGLE	124	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
690	ChIJMwRdDHruFZYR9y6ppf4sW7Q	Edificio Médico Beauchef	Beauchef 723, Valdivia	\N	\N	17	2.1	OPERATIONAL	ChIJMwRdDHruFZYR9y6ppf4sW7Q	GOOGLE	67	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
691	ChIJJVn-t_TuFZYRI_W1qvI0gWg	Centro de Jóvenes	Koening 611, Valdivia, Valdivia	\N	\N	17	4.9	OPERATIONAL	ChIJJVn-t_TuFZYRI_W1qvI0gWg	GOOGLE	13	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
692	ChIJqxg6bebuFZYR4f3zWV-q184	Centro Clinico Veterinario DogtorCat	Rubén Darío 180, Valdivia, Valdivia	\N	\N	17	3.9	OPERATIONAL	ChIJqxg6bebuFZYR4f3zWV-q184	GOOGLE	15	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
693	ChIJjbe_dWjuFZYR9IneYkjBUoU	Dr. Matías Sepúlveda	Avenida Francia 1655, Valdivia, Valdivia	\N	\N	17	5.0	OPERATIONAL	ChIJjbe_dWjuFZYR9IneYkjBUoU	GOOGLE	1	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
694	ChIJyQSjkt01FpYRENCmvA0BlmY	doctorpatricioguerra	Avenida Francia 1655, Valdivia, Valdivia	\N	\N	17	\N	OPERATIONAL	ChIJyQSjkt01FpYRENCmvA0BlmY	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
695	ChIJ-ZrcHbHvFZYR5ZLY23FwtMk	Dr. Pedro Pablo Torres Godoy	Independencia 491, Valdivia	\N	\N	17	5.0	OPERATIONAL	ChIJ-ZrcHbHvFZYR5ZLY23FwtMk	GOOGLE	1	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
696	ChIJsWap0ZnvFZYRODJUh5Vcrhk	Clínica Dental y estética Ferraris	Libertad 491, oficina 406, Valdivia	\N	\N	17	4.8	OPERATIONAL	ChIJsWap0ZnvFZYRODJUh5Vcrhk	GOOGLE	71	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
697	ChIJ6TfqWzXvFZYRay5epciTs3w	VALDISALUD PODOLOGÍA Y ENFERMERÍA	Chacabuco 310, oficina 205, Valdivia, Valdivia	\N	\N	17	\N	OPERATIONAL	ChIJ6TfqWzXvFZYRay5epciTs3w	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
698	ChIJ3ZWZhnbuFZYRXA-E1LRdDwc	clinica radiologica aranjuez/ consulta dental M. Soto	frente fonasa, Vicente Pérez Rosales 640, Valdivia, Valdivia	\N	\N	17	5.0	OPERATIONAL	ChIJ3ZWZhnbuFZYRXA-E1LRdDwc	GOOGLE	2	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
699	ChIJdZl75ePvFZYRsI8DvO-lT68	Clínica Dental Exceldent Plus	Caupolicán 532, Oficina 307, Valdivia	\N	\N	17	4.9	OPERATIONAL	ChIJdZl75ePvFZYRsI8DvO-lT68	GOOGLE	71	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
700	ChIJNWagLjzvFZYRUuBmIFbcOQs	Estétika Valdivia	Caupolicán, Valdivia, Valdivia	\N	\N	17	5.0	OPERATIONAL	ChIJNWagLjzvFZYRUuBmIFbcOQs	GOOGLE	1	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
701	ChIJAbm6rC3vFZYRr8XCmBaruHI	Clínica Odontológica Linnen	Independencia 630, Oficina 403, Valdivia	\N	\N	17	5.0	OPERATIONAL	ChIJAbm6rC3vFZYRr8XCmBaruHI	GOOGLE	35	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
702	ChIJb3T21HXuFZYREls7FO4af30	Alvarez Aguilar Gina Eliset	Independencia 630, Valdivia, Valdivia	\N	\N	17	3.7	OPERATIONAL	ChIJb3T21HXuFZYREls7FO4af30	GOOGLE	6	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
703	ChIJb7_LhozuFZYRp0NwqZOZ5T8	Fray Camilo Henriquez Public Library, Valdivia	Avenida Ramón Picarte 2102, Valdivia	\N	\N	19	4.5	OPERATIONAL	ChIJb7_LhozuFZYRp0NwqZOZ5T8	GOOGLE	67	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
704	ChIJ8xHXvHPuFZYRH7akZKy6d4I	Direccion De Bibliotecas Archivos Y Muse	General Lagos 975, Valdivia, Valdivia	\N	\N	19	\N	OPERATIONAL	ChIJ8xHXvHPuFZYRH7akZKy6d4I	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
705	ChIJJVQyld3tFZYRdgvoy_2sHNM	Biblioteca Central UACh	Isla Teja, Valdivia	\N	\N	19	4.6	OPERATIONAL	ChIJJVQyld3tFZYRdgvoy_2sHNM	GOOGLE	39	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
706	ChIJo97CPxXuFZYRecAz45T9LXg	Biblioteca Facultad de Ciencias de la Ingeniería, Campus Miraflores, UACh	General Lagos N° 2086, Campus, Miraflores, Valdivia	\N	\N	19	4.8	OPERATIONAL	ChIJo97CPxXuFZYRecAz45T9LXg	GOOGLE	10	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
707	ChIJ49OBUHzuFZYR0MRRCti11oQ	Escuela México	Avenida Ramón Picarte 1212, Valdivia, Valdivia	\N	\N	18	4.1	OPERATIONAL	ChIJ49OBUHzuFZYR0MRRCti11oQ	GOOGLE	37	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
708	ChIJze-cLvPuFZYR0eemB7qNb-o	Technical School Valdivia	Avenida Ramón Picarte 2305, Valdivia	\N	\N	18	4.1	OPERATIONAL	ChIJze-cLvPuFZYR0eemB7qNb-o	GOOGLE	29	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
709	ChIJo91iDnzuFZYRWdfVYdpz9pQ	Colegio María Auxiliadora	Avenida Ramón Picarte 1092, Valdivia, Valdivia	\N	\N	18	3.7	OPERATIONAL	ChIJo91iDnzuFZYRWdfVYdpz9pQ	GOOGLE	23	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
710	ChIJPwGerijsFZYR_NE6g3cV4tg	Masters College Valdivia	19 de Junio 401, Valdivia, Valdivia	\N	\N	18	4.3	OPERATIONAL	ChIJPwGerijsFZYR_NE6g3cV4tg	GOOGLE	51	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
711	ChIJe5mvOXjuFZYRx-uAHWAjgVQ	Wall Street English	Avenida Alemania 640, Valdivia	\N	\N	18	5.0	OPERATIONAL	ChIJe5mvOXjuFZYRx-uAHWAjgVQ	GOOGLE	7	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
712	ChIJJTgkN97tFZYRguqjCGannU4	Instituto Alemán Carlos Anwandter	Los Laureles 050, Valdivia	\N	\N	18	4.5	OPERATIONAL	ChIJJTgkN97tFZYRguqjCGannU4	GOOGLE	29	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
713	ChIJpwIB-HHuFZYR0ptl9wcG-Hs	GIMNASIO PHYSICAL PADDLE & GYM	Sotomayor 1175, Valdivia, Valdivia	\N	\N	22	4.7	OPERATIONAL	ChIJpwIB-HHuFZYR0ptl9wcG-Hs	GOOGLE	34	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
714	ChIJn8I90G3uFZYR8je5gweUAGQ	Prince of Asturias College	Guillermo Frick 243, Valdivia, Valdivia	\N	\N	18	4.6	OPERATIONAL	ChIJn8I90G3uFZYR8je5gweUAGQ	GOOGLE	17	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
715	ChIJRxStm27uFZYRY5HornOxCVE	INSAT Valdivia	Domeyko 398, Valdivia, Valdivia	\N	\N	18	4.5	OPERATIONAL	ChIJRxStm27uFZYRY5HornOxCVE	GOOGLE	11	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
716	ChIJFxyNXGnuFZYRCnsqkY7sCyg	Colegio Domus-Mater	Coronel Santiago Bueras 401, Valdivia, Valdivia	\N	\N	18	3.0	OPERATIONAL	ChIJFxyNXGnuFZYRCnsqkY7sCyg	GOOGLE	45	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
717	ChIJix0ncGjuFZYR9gpP5OtdHgw	Dental Clinic UACh	Rudloff 1640, Valdivia, Valdivia	\N	\N	18	4.4	OPERATIONAL	ChIJix0ncGjuFZYR9gpP5OtdHgw	GOOGLE	8	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
718	ChIJ77bjbGjuFZYRBa6gc0xuVS0	Escuela de Kinesiología, Universidad Austral de Chile	Rudloff 1650, Valdivia, Valdivia	\N	\N	18	5.0	OPERATIONAL	ChIJ77bjbGjuFZYRBa6gc0xuVS0	GOOGLE	2	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
719	ChIJ_bE4ykLuFZYRgvJQNTQC0nc	Colegio Windsor School	Avenida Francia 1695, Valdivia, Valdivia	\N	\N	18	4.3	OPERATIONAL	ChIJ_bE4ykLuFZYRgvJQNTQC0nc	GOOGLE	50	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
720	ChIJ08--nV_uFZYRkI2YHgCXjYU	Escuela Walter Schmidt	José María Muñoz Hermosilla, Valdivia, Valdivia	\N	\N	18	5.0	OPERATIONAL	ChIJ08--nV_uFZYRkI2YHgCXjYU	GOOGLE	1	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
721	ChIJkzlvjj7uFZYRA7ia3bA5m2I	Colegio San Lucas de Valdivia	Arica 2474, Valdivia, Valdivia	\N	\N	18	3.1	OPERATIONAL	ChIJkzlvjj7uFZYRA7ia3bA5m2I	GOOGLE	17	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
722	ChIJa8KPGu7uFZYR4VQp0HpP_10	Escuela Particular Adventista Valdivia.	Calle, Errázuriz, Valdivia, Valdivia	\N	\N	18	4.3	OPERATIONAL	ChIJa8KPGu7uFZYR4VQp0HpP_10	GOOGLE	27	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
723	ChIJB6pGrPPuFZYRNBSbbEFv2pM	Liceo Industrial Valdivia	René Schneider 188, Valdivia, Valdivia	\N	\N	18	4.5	OPERATIONAL	ChIJB6pGrPPuFZYRNBSbbEFv2pM	GOOGLE	24	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
724	ChIJG-ps8kjuFZYR6WxIRaMxMRY	Jardín Infantil y Sala Cuna Caracola	Diputado Hernán Olave Verdugo 607, Valdivia, Valdivia	\N	\N	18	\N	OPERATIONAL	ChIJG-ps8kjuFZYR6WxIRaMxMRY	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
725	ChIJFUlmHWLuFZYRzAbVTEk44iw	School of Music Juan Sebastián Bach	Avenida Clemente Holzapfel 950, Valdivia	\N	\N	18	4.4	OPERATIONAL	ChIJFUlmHWLuFZYRzAbVTEk44iw	GOOGLE	26	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
726	ChIJzcDXU-nuFZYRE6P5EUs6RTM	Escuela Fernando Santivan	Andres Bello 298, s/n, Valdivia, Valdivia	\N	\N	18	2.8	OPERATIONAL	ChIJzcDXU-nuFZYRE6P5EUs6RTM	GOOGLE	18	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
727	ChIJJVQyld3tFZYRLducPnfGbsk	Universidad Austral de Chile	Independencia 631, Valdivia	\N	\N	18	4.7	OPERATIONAL	ChIJJVQyld3tFZYRLducPnfGbsk	GOOGLE	379	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
728	ChIJg6KXsnPuFZYR0IRph1G0mr8	San Sebastián University	General Lagos 1163, Valdivia	\N	\N	18	4.5	OPERATIONAL	ChIJg6KXsnPuFZYR0IRph1G0mr8	GOOGLE	118	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
729	ChIJGWWb8HnuFZYRKNn9xYPDyHo	Campus Los Canelos Universidad Austral de Chile	Yerbas Buenas 181, Valdivia	\N	\N	18	4.0	OPERATIONAL	ChIJGWWb8HnuFZYRKNn9xYPDyHo	GOOGLE	4	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
730	ChIJHz5LU9ntFZYRkMM6OjnDI4o	Sub Unidad de Terapia Ocupacional UACh	Valdivia	\N	\N	18	\N	OPERATIONAL	ChIJHz5LU9ntFZYRkMM6OjnDI4o	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
731	ChIJG6vuTtztFZYRYNpPCM4YSII	Facultad De Derecho, Universidad Austral De Chile	Avenida Rector Eduardo Morales Miranda 23, Valdivia, Valdivia	\N	\N	18	4.4	OPERATIONAL	ChIJG6vuTtztFZYRYNpPCM4YSII	GOOGLE	20	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
732	ChIJN2nTnt3tFZYRlPpf5eHmIXQ	Dirección de Personal UACh	Valdivia	\N	\N	18	5.0	OPERATIONAL	ChIJN2nTnt3tFZYRlPpf5eHmIXQ	GOOGLE	4	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
733	ChIJu1d4B93tFZYRLbAfqgTxNnI	Escuela de Química y Farmacia	Valdivia	\N	\N	18	5.0	OPERATIONAL	ChIJu1d4B93tFZYRLbAfqgTxNnI	GOOGLE	1	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
734	ChIJpXNLnuftFZYRsKv79QlVX6c	Planta Piloto de Alimentos (Ex-CTL)	Valdivia	\N	\N	18	5.0	OPERATIONAL	ChIJpXNLnuftFZYRsKv79QlVX6c	GOOGLE	1	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
735	ChIJQXK_GyfvFZYR2Kk4F-2vLGc	Universidad Santo Tomas	Avenida Ramón Picarte 1160, Valdivia	\N	\N	18	4.3	OPERATIONAL	ChIJQXK_GyfvFZYR2Kk4F-2vLGc	GOOGLE	92	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
736	ChIJDUx9veftFZYRHkCBUkyGRG8	Faculty of Agricultural Sciences	Campus Isla Teja Uach, Valdivia, Valdivia	\N	\N	18	4.6	OPERATIONAL	ChIJDUx9veftFZYRHkCBUkyGRG8	GOOGLE	9	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
737	ChIJ0VR0IWjuFZYRqRvxeqrXgFM	Campus Miraflores UACH	Rudloff 2130-2156, Valdivia, Valdivia	\N	\N	18	4.7	OPERATIONAL	ChIJ0VR0IWjuFZYRqRvxeqrXgFM	GOOGLE	29	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
738	ChIJKT8gGUDuFZYRJyEKzdhITAg	Campus Miraflores, UACh	General Lagos 2086, Valdivia, Valdivia	\N	\N	18	4.7	OPERATIONAL	ChIJKT8gGUDuFZYRJyEKzdhITAg	GOOGLE	67	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
739	ChIJE1jCKnTuFZYRmGCmmBDbcq0	Universidad Austral de Chile, Casa Central	Independencia 641, Valdivia, Valdivia	\N	\N	18	3.9	OPERATIONAL	ChIJE1jCKnTuFZYRmGCmmBDbcq0	GOOGLE	14	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
740	ChIJ_2H0dXbuFZYR2hQ3EPzYrgg	Pastoral Educación Superior Valdivia	Independencia 544, Valdivia, Valdivia	\N	\N	18	\N	OPERATIONAL	ChIJ_2H0dXbuFZYR2hQ3EPzYrgg	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
741	ChIJVWRJNgDtFZYR3tm8UoJT8Mw	santatomas	Carampangue 343, Valdivia	\N	\N	18	\N	OPERATIONAL	ChIJVWRJNgDtFZYR3tm8UoJT8Mw	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
742	ChIJU1PzL5TvFZYRvz73R00oHOs	Centro de Extensión Campus Los Canelos UACh	Yerbas Buenas 181, Valdivia, Valdivia	\N	\N	18	\N	OPERATIONAL	ChIJU1PzL5TvFZYRvz73R00oHOs	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
743	ChIJU7XXXXLuFZYRFtN0B7mt99s	Universidad Austral de Chile Vinculación Con el Medio	Yerbas Buenas 181, Valdivia, Valdivia	\N	\N	18	\N	OPERATIONAL	ChIJU7XXXXLuFZYRFtN0B7mt99s	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
744	ChIJSxy8CQDvFZYRcGEuIpotdTI	universidad de cine	Valdivia	\N	\N	18	\N	OPERATIONAL	ChIJSxy8CQDvFZYRcGEuIpotdTI	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
745	ChIJWXjRM53vFZYRVzKnEF1aS9g	Prorrectoría Universidad Austral De Chile	Valdivia	\N	\N	18	5.0	OPERATIONAL	ChIJWXjRM53vFZYRVzKnEF1aS9g	GOOGLE	1	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
746	ChIJbaVc8HnuFZYRViwMSJyYOQ4	Universidad Arturo Prat	Arauco 709, Valdivia, Valdivia	\N	\N	18	\N	OPERATIONAL	ChIJbaVc8HnuFZYRViwMSJyYOQ4	GOOGLE	\N	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
747	ChIJ2ZRtnNbtFZYRPztvAo5mlg0	Hotel Villa del Río	Avenida España 1025, Valdivia	\N	\N	24	4.4	OPERATIONAL	ChIJ2ZRtnNbtFZYRPztvAo5mlg0	GOOGLE	2153	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
748	ChIJz9tMdXbuFZYRCnjWZGiA__I	Comunidad Edificio Libertad	Independencia 521, Valdivia, Valdivia	\N	\N	14	\N	OPERATIONAL	ChIJz9tMdXbuFZYRCnjWZGiA__I	GOOGLE	\N	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
749	ChIJLzHZI3fuFZYRZK8fZ_pT6D8	New Orleans	Esmeralda 682, Valdivia	\N	\N	14	4.6	OPERATIONAL	ChIJLzHZI3fuFZYRZK8fZ_pT6D8	GOOGLE	386	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
750	ChIJrYv8iXbuFZYRmclE74WAW7c	Cafe Cotidiano	Arauco 280, Valdivia, Valdivia	\N	\N	13	4.6	OPERATIONAL	ChIJrYv8iXbuFZYRmclE74WAW7c	GOOGLE	549	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
751	ChIJi6gHfXbuFZYRbvCkcDxw4dk	Café Palace	Pérez Rosales 580, Valdivia, Valdivia	\N	\N	14	4.0	OPERATIONAL	ChIJi6gHfXbuFZYRbvCkcDxw4dk	GOOGLE	2072	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
752	ChIJi_ZC_HbuFZYRg74VlD5dHEk	La Bomba Bar	Кауполикан 594, Valdivia, Valdivia	\N	\N	14	3.9	OPERATIONAL	ChIJi_ZC_HbuFZYRg74VlD5dHEk	GOOGLE	180	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
753	ChIJ0YSQrnfuFZYRDQX1c8vFrNU	Crucial Café	Caupolicán 374, Valdivia, Valdivia	\N	\N	14	4.3	OPERATIONAL	ChIJ0YSQrnfuFZYRDQX1c8vFrNU	GOOGLE	228	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
754	ChIJq-ww4XbuFZYR82etIDLX0hI	Mas Rio Restobar	Esmeralda 654, Valdivia, Valdivia	\N	\N	14	4.5	OPERATIONAL	ChIJq-ww4XbuFZYR82etIDLX0hI	GOOGLE	454	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
755	ChIJdYvDpnfuFZYRRvlVsJXXMfY	Subway	Avenida Ramón Picarte 473, Valdivia	\N	\N	14	4.1	OPERATIONAL	ChIJdYvDpnfuFZYRRvlVsJXXMfY	GOOGLE	1189	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
756	ChIJYbzbxnfuFZYRfvqsoep979Q	Restaurant Los Leños	Chacabuco 454, Valdivia, Valdivia	\N	\N	14	4.3	OPERATIONAL	ChIJYbzbxnfuFZYRfvqsoep979Q	GOOGLE	1567	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
757	ChIJz6JOHSfvFZYRf7UTPCMEn_4	Fuente Valdiviana	Esmeralda 684, Valdivia	\N	\N	14	4.4	OPERATIONAL	ChIJz6JOHSfvFZYRf7UTPCMEn_4	GOOGLE	981	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
758	ChIJo4sXQHTuFZYRoU_z0hnd8zA	Tilo Restobar	Yungay 745, Valdivia	\N	\N	14	3.9	OPERATIONAL	ChIJo4sXQHTuFZYRoU_z0hnd8zA	GOOGLE	922	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
759	ChIJmRvXvt7tFZYRQu_wGwTbCZ8	Marina Lounge River Bar	Al Fenix, Valdivia	\N	\N	14	4.0	CLOSED_TEMPORARILY	ChIJmRvXvt7tFZYRQu_wGwTbCZ8	GOOGLE	188	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
760	ChIJObdIy9_tFZYRLPeNxnMPb_A	Telepizza	Avenida Los Robles 86, Valdivia, Valdivia	\N	\N	14	3.4	CLOSED_TEMPORARILY	ChIJObdIy9_tFZYRLPeNxnMPb_A	GOOGLE	676	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
761	ChIJ_wCL8nDuFZYRL-8F9yL2P-Q	Hot Roll Sushi Delivery	Aníbal Pinto 909, Valdivia, Valdivia	\N	\N	14	4.5	OPERATIONAL	ChIJ_wCL8nDuFZYRL-8F9yL2P-Q	GOOGLE	129	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
762	ChIJW3aTmuDtFZYR-7244flbZxs	Café Haussmann Isla teja	Avenida Los Robles 202, Valdivia	\N	\N	14	4.2	OPERATIONAL	ChIJW3aTmuDtFZYR-7244flbZxs	GOOGLE	2743	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
763	ChIJObQ4lODtFZYRhrARZrgOUs4	El Huarique - Sanguchería y Restaurant Peruano	Saelzer 20, Valdivia, Valdivia	\N	\N	14	4.1	OPERATIONAL	ChIJObQ4lODtFZYRhrARZrgOUs4	GOOGLE	451	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
764	ChIJM48CveDtFZYRZ5Z-afCv938	La Pizzeria de Renzo	Saelzer 40, Valdivia	\N	\N	14	4.6	OPERATIONAL	ChIJM48CveDtFZYRZ5Z-afCv938	GOOGLE	1810	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
765	ChIJAdcuwuDtFZYRlrirYipYc6o	450 Bar Pizzería	Los Alerces 20, Valdivia	\N	\N	14	4.6	OPERATIONAL	ChIJAdcuwuDtFZYRlrirYipYc6o	GOOGLE	339	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
766	ChIJK6vOcF3uFZYRmeAH9dRQVHM	El Pewen	Avenida Simpson 1000, Valdivia, Valdivia	\N	\N	14	4.4	OPERATIONAL	ChIJK6vOcF3uFZYRmeAH9dRQVHM	GOOGLE	93	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
767	ChIJt4e2V3nuFZYRxLToGADDmJU	Tienda Mundo Rural Valdivia	Maipú 129, Valdivia	\N	\N	13	4.5	CLOSED_TEMPORARILY	ChIJt4e2V3nuFZYRxLToGADDmJU	GOOGLE	213	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
768	ChIJ1_f-DOTtFZYRQZnKyvALo28	VIVELO EXCURSIONES VALDIVIA	Avenida Los Robles 620, Valdivia, Valdivia	\N	\N	20	5.0	OPERATIONAL	ChIJ1_f-DOTtFZYRQZnKyvALo28	GOOGLE	26	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
769	ChIJOdR0yWruFZYR9ZI-FKlSGVs	Casino Faculty of Engineering UACh	Rudloff, Valdivia, Valdivia	\N	\N	13	3.8	OPERATIONAL	ChIJOdR0yWruFZYR9ZI-FKlSGVs	GOOGLE	368	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
770	ChIJo2gKDXbuFZYRjuzg-j5-G8I	Café Moro	Libertad 174, Valdivia	\N	\N	13	4.5	OPERATIONAL	ChIJo2gKDXbuFZYRjuzg-j5-G8I	GOOGLE	1334	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
771	ChIJJ5hhAcbvFZYRFrvYW8iu9lU	Santo Café	O'Higgins S/N, Valdivia	\N	\N	13	4.4	OPERATIONAL	ChIJJ5hhAcbvFZYRFrvYW8iu9lU	GOOGLE	7	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
772	ChIJvy4LZ3buFZYR3hHCsjUILb0	Cioccolato	Camilo Henríquez 540, Valdivia, Valdivia	\N	\N	13	3.9	OPERATIONAL	ChIJvy4LZ3buFZYR3hHCsjUILb0	GOOGLE	50	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
773	ChIJf2EiBnDvFZYRsGn5gBSHo0U	Dunkin'	Camilo Henríquez 466, Local 5, Valdivia, Valdivia	\N	\N	13	3.7	OPERATIONAL	ChIJf2EiBnDvFZYRsGn5gBSHo0U	GOOGLE	57	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
774	ChIJkfrhXXbuFZYRZGMtrmpnQR8	Der Baer	Camilo Henríquez 540, Valdivia, Valdivia	\N	\N	13	4.3	OPERATIONAL	ChIJkfrhXXbuFZYRZGMtrmpnQR8	GOOGLE	77	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
776	ChIJ2TUMAwDvFZYRPWjG8mnX0Yg	Conexión Cafetería	Maipú 187, Valdivia	\N	\N	13	5.0	OPERATIONAL	ChIJ2TUMAwDvFZYRPWjG8mnX0Yg	GOOGLE	5	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
777	ChIJJ_oOgIXvFZYRliR4ScuRbwg	Filter Lab	Camilo Henríquez, Valdivia	\N	\N	13	\N	OPERATIONAL	ChIJJ_oOgIXvFZYRliR4ScuRbwg	GOOGLE	\N	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
778	ChIJxZpkPQDvFZYRBmB_XzYp-ZM	La Passione De Manu	Maipú 168, Valdivia	\N	\N	13	4.8	OPERATIONAL	ChIJxZpkPQDvFZYRBmB_XzYp-ZM	GOOGLE	44	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
779	ChIJj8jGXnbuFZYRVza2T0eiX6I	Café Agrupación Artesanos y Artesanas	Maipú 301-399, Valdivia	\N	\N	13	5.0	OPERATIONAL	ChIJj8jGXnbuFZYRVza2T0eiX6I	GOOGLE	1	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
780	ChIJrYv8iXbuFZYRvnw1bC7DeFI	Cafeteria Y Servicios Gastronomicos Sandra Gonzale	Arauco 280, Valdivia, Valdivia	\N	\N	13	5.0	OPERATIONAL	ChIJrYv8iXbuFZYRvnw1bC7DeFI	GOOGLE	2	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
781	ChIJAbjKFpDvFZYRqfUdWMikuvs	Café el Escritorio	Jardín botánico UACh, Camilo Henríquez, Valdivia	\N	\N	13	5.0	OPERATIONAL	ChIJAbjKFpDvFZYRqfUdWMikuvs	GOOGLE	13	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
782	ChIJJ5xWN2nvFZYRkYsoSCB6krM	ValdiGreen Coffee	Valdivia	\N	\N	13	3.7	OPERATIONAL	ChIJJ5xWN2nvFZYRkYsoSCB6krM	GOOGLE	17	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
783	ChIJOX2KqaHvFZYRCJ4ipqm6ygw	Cassis Valdivia	Caupolicán 465, local 232, Valdivia	\N	\N	13	4.4	OPERATIONAL	ChIJOX2KqaHvFZYRCJ4ipqm6ygw	GOOGLE	535	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
784	ChIJE0UyGPnvFZYRJs5G6XL_oqY	Cafetería Mi Cafecito	Caupolicán 443, local 11, Valdivia	\N	\N	13	4.8	OPERATIONAL	ChIJE0UyGPnvFZYRJs5G6XL_oqY	GOOGLE	20	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
785	ChIJFQhR33XuFZYR3iE3q6HyO8w	Bimba	Independencia 543, Valdivia	\N	\N	14	4.4	OPERATIONAL	ChIJFQhR33XuFZYR3iE3q6HyO8w	GOOGLE	1240	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
786	ChIJsw-S4HbuFZYRlf-gh3zEhy8	Cave Restobar	Esmeralda 660, Valdivia	\N	\N	14	4.1	OPERATIONAL	ChIJsw-S4HbuFZYRlf-gh3zEhy8	GOOGLE	510	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
787	ChIJtemQg-HuFZYRXvFQ2yqGd3Q	Cerveza Entre Ríos - Granel, barril, botella. Cervecería Artesanal.	Volcán Michimahuida 4669, Valdivia	\N	\N	14	4.5	OPERATIONAL	ChIJtemQg-HuFZYRXvFQ2yqGd3Q	GOOGLE	61	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
788	ChIJ7RNPUHLuFZYRpDmkaIBT9_k	Discoteca Jota Tres	General Lagos 1083, Valdivia, Valdivia	\N	\N	14	5.0	CLOSED_TEMPORARILY	ChIJ7RNPUHLuFZYRpDmkaIBT9_k	GOOGLE	1	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
789	ChIJFbt0l9jtFZYRs6dyNfvPKf0	Strike Karaoke Restobar	Carampangue 208, Valdivia	\N	\N	14	4.1	OPERATIONAL	ChIJFbt0l9jtFZYRs6dyNfvPKf0	GOOGLE	796	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
790	ChIJ8dgiW0DvFZYRfTyR0p-LZro	Bivaldi RestoBar	Camilo Henríquez 436, segundo piso, Valdivia	\N	\N	14	2.2	OPERATIONAL	ChIJ8dgiW0DvFZYRfTyR0p-LZro	GOOGLE	12	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
791	ChIJ5-7qoDTvFZYR6Rm4A958UY4	Café Bar La Firma	Bernardo O'Higgins 422, Valdivia	\N	\N	14	4.3	OPERATIONAL	ChIJ5-7qoDTvFZYR6Rm4A958UY4	GOOGLE	399	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
792	ChIJA25TSgDvFZYRDwMcrfLgejQ	Klandstinov Bar	Maipú 137, Valdivia	\N	\N	14	5.0	OPERATIONAL	ChIJA25TSgDvFZYRDwMcrfLgejQ	GOOGLE	23	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
793	ChIJ-1Vo0HXuFZYR0n8Z_XdBFS0	Casino Bar Y Pool	Arauco 128, Valdivia	\N	\N	14	4.4	OPERATIONAL	ChIJ-1Vo0HXuFZYR0n8Z_XdBFS0	GOOGLE	67	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
794	ChIJIbA0BWvvFZYRw3EKo-WsY0M	Club Berlín	Camilo Henríquez 648, Valdivia	\N	\N	14	3.9	OPERATIONAL	ChIJIbA0BWvvFZYRw3EKo-WsY0M	GOOGLE	54	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
795	ChIJ-4FMeirtFZYRVcAC9htm01c	Krunga	Avenida Alemania 270, Valdivia	\N	\N	14	3.8	OPERATIONAL	ChIJ-4FMeirtFZYRVcAC9htm01c	GOOGLE	111	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
796	ChIJIb29nNjtFZYR3plL_SSctro	Restobar Delivery Toi´Tentao	Camilo Henríquez 326, Valdivia	\N	\N	14	4.5	OPERATIONAL	ChIJIb29nNjtFZYR3plL_SSctro	GOOGLE	8	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
797	ChIJ91oGNLXvFZYRZiclXM5Ov3o	Scorpion Rojo	Avenida Alemania 342, Valdivia, Valdivia	\N	\N	14	3.0	OPERATIONAL	ChIJ91oGNLXvFZYRZiclXM5Ov3o	GOOGLE	2	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
798	ChIJwb-oQfzvFZYRqxtys8OWWjk	chacabuco 796, valdivia	Avenida Alemania 348, Valdivia	\N	\N	14	\N	OPERATIONAL	ChIJwb-oQfzvFZYRqxtys8OWWjk	GOOGLE	\N	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
799	ChIJ4Ukt53buFZYRDtkSN6ah7V8	Shot Karaoke	Esmeralda 657, Valdivia	\N	\N	14	4.4	OPERATIONAL	ChIJ4Ukt53buFZYRDtkSN6ah7V8	GOOGLE	1219	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
800	ChIJsywORyLvFZYRFGzhuq4LJ-A	Tabaquería Quitra	Caupolicán 364, local 4, Valdivia	\N	\N	16	4.7	OPERATIONAL	ChIJsywORyLvFZYRFGzhuq4LJ-A	GOOGLE	59	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
801	ChIJk5CjiXbuFZYRlxVVHCeeQt4	Chocolatería y Pastelería Peumayen	Arauco 241, Valdivia, Valdivia	\N	\N	13	4.4	OPERATIONAL	ChIJk5CjiXbuFZYRlxVVHCeeQt4	GOOGLE	264	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
802	ChIJH8YLuzLvFZYRCnGLbvS02lI	Chocolatería Entrelagos	Pérez Rosales 622, Valdivia	\N	\N	13	4.5	OPERATIONAL	ChIJH8YLuzLvFZYRCnGLbvS02lI	GOOGLE	5890	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
803	ChIJRw9ElODtFZYRfwMSmAyguPs	Café Cappuccino Company & Pastelería (Isla Teja)	Saelzer 20, Valdivia	\N	\N	13	4.2	OPERATIONAL	ChIJRw9ElODtFZYRfwMSmAyguPs	GOOGLE	190	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
804	ChIJ--74yH_uFZYRVjaU2WxNb3E	Delisur S.A	Avenida España 860, Valdivia	\N	\N	13	4.3	OPERATIONAL	ChIJ--74yH_uFZYRVjaU2WxNb3E	GOOGLE	177	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
805	ChIJI0NP0ljuFZYR3cmERSdxPoQ	Vainilla y Cacao	Avenida Circunvalación Sur 2115, Valdivia	\N	\N	13	4.9	OPERATIONAL	ChIJI0NP0ljuFZYR3cmERSdxPoQ	GOOGLE	17	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
806	ChIJiXqnyNzuFZYRIjkdBYJSYmg	Panadería "Javi"	Pasaje Francisco Gil 412, Valdivia	\N	\N	13	4.8	OPERATIONAL	ChIJiXqnyNzuFZYRIjkdBYJSYmg	GOOGLE	20	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
807	ChIJuTD3M3buFZYRAdLfhSvCT_Q	Delisur	Chacabuco 369, Valdivia	\N	\N	13	4.1	OPERATIONAL	ChIJuTD3M3buFZYRAdLfhSvCT_Q	GOOGLE	38	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
808	ChIJUfwFO3buFZYRvhviuguAnUI	Soc Alfredo Morales y María Veroni Ca Martínez	Camilo Henríquez 402, Valdivia, Valdivia	\N	\N	13	\N	OPERATIONAL	ChIJUfwFO3buFZYRvhviuguAnUI	GOOGLE	\N	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
809	ChIJP80Gw23vFZYRmWTOSSPEIiw	Galletas Tip Top	Caupolicán 465, Valdivia	\N	\N	13	5.0	OPERATIONAL	ChIJP80Gw23vFZYRmWTOSSPEIiw	GOOGLE	12	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
810	ChIJmxep-IvvFZYRBVlgByh9KHo	Pastelería Tentados	Yungay 522, Valdivia	\N	\N	13	5.0	OPERATIONAL	ChIJmxep-IvvFZYRBVlgByh9KHo	GOOGLE	1	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
811	ChIJzeiyg07vFZYRPJK_hRg835I	Tortas y Postres Manjares	Chacabuco 324, Valdivia, Valdivia	\N	\N	13	3.4	OPERATIONAL	ChIJzeiyg07vFZYRPJK_hRg835I	GOOGLE	15	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
812	ChIJ93RRJHbuFZYR4gf2mTwiuQU	Priviet Smolko	Camilo Henríquez 380, Valdivia	\N	\N	13	3.4	OPERATIONAL	ChIJ93RRJHbuFZYR4gf2mTwiuQU	GOOGLE	24	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
813	ChIJhcOvWxbvFZYRyDiGNKdEOQ0	Salón de Té & Cafetería Entrelagos	Vicente Pérez Rosales 640, Valdivia	\N	\N	13	3.6	OPERATIONAL	ChIJhcOvWxbvFZYRyDiGNKdEOQ0	GOOGLE	129	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
814	ChIJqcdtBADvFZYRfdQr6rAK0Hk	Delicias Porteñas	Chacabuco 340, Valdivia	\N	\N	13	4.1	OPERATIONAL	ChIJqcdtBADvFZYRfdQr6rAK0Hk	GOOGLE	9	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
815	ChIJP03eaPLvFZYROHQjLTxD6xs	La Empanadissima Valdivia - Fabricación y venta de empanadas	Кауполикан 588, Valdivia	\N	\N	13	5.0	OPERATIONAL	ChIJP03eaPLvFZYROHQjLTxD6xs	GOOGLE	21	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
816	ChIJgSMDMXfuFZYR5szokJA7g3E	Novasur Alimentos Spa	Esmeralda 613, Valdivia, Valdivia	\N	\N	13	1.0	OPERATIONAL	ChIJgSMDMXfuFZYR5szokJA7g3E	GOOGLE	1	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
817	ChIJg4DZOCXvFZYRhe5YRVlsArM	Dónde Chile	Chacabuco 400, Valdivia	\N	\N	13	\N	OPERATIONAL	ChIJg4DZOCXvFZYRhe5YRVlsArM	GOOGLE	\N	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
818	ChIJ77dFwe_uFZYRD-ZUalkM9ig	Sushileno Valdivia	Valle Hondo 2790, Valdivia, Valdivia	\N	\N	14	4.5	OPERATIONAL	ChIJ77dFwe_uFZYRD-ZUalkM9ig	GOOGLE	188	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
819	ChIJLXRgGnbuFZYRAZD6Q-BxJvM	McDonald's	Camilo Henríquez, Valdivia	\N	\N	14	3.8	OPERATIONAL	ChIJLXRgGnbuFZYRAZD6Q-BxJvM	GOOGLE	4517	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
820	ChIJDXnW1XDvFZYREJ79DygLrbw	Pacasty Sushi Costanera	esquina ARAUCO, Avenida Arturo Prat S/N, Valdivia	\N	\N	14	4.3	OPERATIONAL	ChIJDXnW1XDvFZYREJ79DygLrbw	GOOGLE	43	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
821	ChIJE0rV3a_vFZYRPCUhr-iMHvs	Pizza Hut	Arauco 561, Local 361, Valdivia	\N	\N	14	2.4	OPERATIONAL	ChIJE0rV3a_vFZYRPCUhr-iMHvs	GOOGLE	18	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
822	ChIJIx-sJszvFZYRJzhDvOONL5g	Bohemia Bar & Terraza	Beauchef 637, Valdivia	\N	\N	14	1.0	OPERATIONAL	ChIJIx-sJszvFZYRJzhDvOONL5g	GOOGLE	3	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
823	ChIJ0cmIfjrvFZYRXXB6ZQhzDHc	La mechada real	Baquedano 621, Valdivia, Valdivia	\N	\N	14	4.4	CLOSED_TEMPORARILY	ChIJ0cmIfjrvFZYRXXB6ZQhzDHc	GOOGLE	55	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
824	ChIJ-7ZfrMPtFZYRjZFF0pOPbb8	Conde Montagu	Yerbas Buenas 412, Valdivia	\N	\N	14	4.0	CLOSED_TEMPORARILY	ChIJ-7ZfrMPtFZYRjZFF0pOPbb8	GOOGLE	6	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
825	ChIJhbtjkyztFZYRYw4uVsrXPWQ	La Mami Abueli (minimercado)	Caupolicán 176, Valdivia	\N	\N	16	4.8	OPERATIONAL	ChIJhbtjkyztFZYRYw4uVsrXPWQ	GOOGLE	13	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
826	ChIJJQVZrvvvFZYRCLoOQqwCjm8	Sushi mix Cochrane	Valdivia	\N	\N	14	1.9	OPERATIONAL	ChIJJQVZrvvvFZYRCLoOQqwCjm8	GOOGLE	9	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
827	ChIJm945OC3tFZYRopzeKx6MD4Q	Happy Days Waffles	Isla Teja, Avenida Los Robles 061, Valdivia	\N	\N	14	4.6	OPERATIONAL	ChIJm945OC3tFZYRopzeKx6MD4Q	GOOGLE	59	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
828	ChIJ05swFeDvFZYREgSZvn66n-U	Sushi Valdivia Tremün	5090000 Valdivia	\N	\N	14	4.8	OPERATIONAL	ChIJ05swFeDvFZYREgSZvn66n-U	GOOGLE	28	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
829	ChIJL5fPNb7vFZYRIk1BwF2qRi4	Pizzas El Cordobés	Cochrane 499, Valdivia	\N	\N	14	4.8	OPERATIONAL	ChIJL5fPNb7vFZYRIk1BwF2qRi4	GOOGLE	20	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
830	ChIJ61lrFiLvFZYRoMkxHxA36d4	Ikigai Sushi Valdivia	Pedro de Valdivia 491, Valdivia	\N	\N	14	4.7	OPERATIONAL	ChIJ61lrFiLvFZYRoMkxHxA36d4	GOOGLE	21	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
831	ChIJ60FCp_HvFZYRwzPenX6UDnc	Punto Copec	Picarte, Anfión Muñoz, N° 895, Valdivia	\N	\N	16	5.0	OPERATIONAL	ChIJ60FCp_HvFZYRwzPenX6UDnc	GOOGLE	2	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
832	ChIJw7OukhHvFZYRWfEm0niVu50	Shokunin Roll	Aníbal Pinto 1685, Valdivia, Valdivia	\N	\N	14	4.7	OPERATIONAL	ChIJw7OukhHvFZYRWfEm0niVu50	GOOGLE	16	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
833	ChIJydPeAgDvFZYRIjDohckpUx0	Nuevo Approach	Baquedano 800, Valdivia	\N	\N	14	4.6	OPERATIONAL	ChIJydPeAgDvFZYRIjDohckpUx0	GOOGLE	10	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
834	ChIJa43UYQDvFZYR-ewP-_WMETk	Pronto Express Aníbal Pinto N° 2007-Valdivia	Esq - Anibal Pinto, Bulnes N° 2007, Valdivia	\N	\N	16	5.0	OPERATIONAL	ChIJa43UYQDvFZYR-ewP-_WMETk	GOOGLE	1	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
835	ChIJuU2t3PjvFZYRuGfGJTBC9PQ	HK Hakai	Coronel Santiago Bueras 1178, Valdivia	\N	\N	14	4.1	OPERATIONAL	ChIJuU2t3PjvFZYRuGfGJTBC9PQ	GOOGLE	203	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
836	ChIJp4DRSkvuFZYRYfqRmepThSI	SUSHICANO ROLL'S	Pasaje Millacura 702, Valdivia, Valdivia	\N	\N	14	\N	OPERATIONAL	ChIJp4DRSkvuFZYRYfqRmepThSI	GOOGLE	\N	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
837	ChIJQ273f37tFZYRxRHjYuDQC8E	GARDENTRUCK	Valdivia aa, Valdivia	\N	\N	14	\N	OPERATIONAL	ChIJQ273f37tFZYRxRHjYuDQC8E	GOOGLE	\N	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
838	ChIJzTUvYO7vFZYRKASJLpSHmTI	CTM comida a domicilio	Beauchef 637, Valdivia	\N	\N	14	4.0	OPERATIONAL	ChIJzTUvYO7vFZYRKASJLpSHmTI	GOOGLE	64	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
839	ChIJjfOJHf_vFZYRxd69PfrvKO4	Sushi-An Delivery	Yerbas Buenas 412, Valdivia	\N	\N	14	4.7	OPERATIONAL	ChIJjfOJHf_vFZYRxd69PfrvKO4	GOOGLE	27	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
840	ChIJSzXc6xDvFZYR6uvtWIBWGo4	Klasser Burger	esquina - Cochrane, Philippi 427, Valdivia	\N	\N	14	4.6	OPERATIONAL	ChIJSzXc6xDvFZYR6uvtWIBWGo4	GOOGLE	303	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
841	ChIJnQPnTgDtFZYRzpYLt4xHIBM	Heian Sushi Valdivia	Isla Teja - Los Laureles, Paseo Los Colonos 80, Valdivia	\N	\N	14	3.9	OPERATIONAL	ChIJnQPnTgDtFZYRzpYLt4xHIBM	GOOGLE	10	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
842	ChIJK6P8oQfvFZYRFl9nxy4wnB0	El Carrito Sabroso	Clemente Escobar 1118, Valdivia	\N	\N	14	5.0	OPERATIONAL	ChIJK6P8oQfvFZYRFl9nxy4wnB0	GOOGLE	2	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
843	ChIJ__damO_vFZYRZDC0ExQj4P8	El Toldo Amarillo	General Lagos 2086, Valdivia, Valdivia	\N	\N	14	5.0	OPERATIONAL	ChIJ__damO_vFZYRZDC0ExQj4P8	GOOGLE	1	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
844	ChIJPcaDn1zuFZYRAySkRnM3Amg	Los vecinos	Irlanda 1901, Valdivia, Valdivia	\N	\N	14	4.3	OPERATIONAL	ChIJPcaDn1zuFZYRAySkRnM3Amg	GOOGLE	331	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
845	ChIJLdhI-1_vFZYR7psqohOlv4Y	Sushi Hangiri Valdivia	Avenida Simpson 1672B, Valdivia	\N	\N	14	4.9	OPERATIONAL	ChIJLdhI-1_vFZYR7psqohOlv4Y	GOOGLE	19	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
846	ChIJBy95h4jpFZYRuiw0fu376Ls	Mesón Nómade	Valdivia, Valdivia	\N	\N	14	4.0	OPERATIONAL	ChIJBy95h4jpFZYRuiw0fu376Ls	GOOGLE	4	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
847	ChIJ14OP7ZjvFZYRalLT3acgYC8	Pascale Sushi Valdivia	Errázuriz 2387, Valdivia	\N	\N	14	3.9	OPERATIONAL	ChIJ14OP7ZjvFZYRalLT3acgYC8	GOOGLE	14	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
848	ChIJbfFlNcX8_QQR68lcvRKvOyc	Ayutthaya Thai Cuisine - Valdivia	Valle de Lluta 2579, Valdivia	\N	\N	14	4.7	OPERATIONAL	ChIJbfFlNcX8_QQR68lcvRKvOyc	GOOGLE	7	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
849	ChIJV6OvjvHvFZYR_8bPSxD2dbw	Sazón del Calle Calle	Avenida Francia, Valdivia, Valdivia	\N	\N	14	4.8	OPERATIONAL	ChIJV6OvjvHvFZYR_8bPSxD2dbw	GOOGLE	59	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
850	ChIJc7SsyRzvFZYR0NRCt-2ZgJY	Alo callejero comida rrapida	Población los Jazmine, Colombia 302, Valdivia	\N	\N	14	\N	CLOSED_TEMPORARILY	ChIJc7SsyRzvFZYR0NRCt-2ZgJY	GOOGLE	\N	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
851	ChIJJUlVr_rvFZYR1Fk8eKsZix0	Taquería Acapulco	bosque sur, Doctor Marcelo Serra Soyer 648, Valdivia	\N	\N	14	5.0	OPERATIONAL	ChIJJUlVr_rvFZYR1Fk8eKsZix0	GOOGLE	1	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
\.


--
-- TOC entry 5089 (class 0 OID 17247)
-- Dependencies: 244
-- Data for Name: plus_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plus_codes (id, place_id, compound_code, global_code, created_at, updated_at) FROM stdin;
498	500	5QP4+JF Valdivia, Chile	47G85QP4+JF	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
499	501	5QM5+H3 Valdivia, Chile	47G85QM5+H3	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
500	502	5QP3+GV Valdivia, Chile	47G85QP3+GV	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
501	503	5QP3+96 Valdivia, Chile	47G85QP3+96	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
502	504	5QP3+GW Valdivia, Chile	47G85QP3+GW	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
503	505	5QP3+74 Valdivia, Chile	47G85QP3+74	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
504	506	5QP4+G6 Valdivia, Chile	47G85QP4+G6	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
505	507	5QM3+RR Valdivia, Chile	47G85QM3+RR	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
506	508	5QP3+R9 Valdivia, Chile	47G85QP3+R9	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
507	509	5QP4+M4 Valdivia, Chile	47G85QP4+M4	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
508	510	5QP4+C8 Valdivia, Chile	47G85QP4+C8	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
509	511	5QP2+2X Valdivia, Chile	47G85QP2+2X	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
510	512	5QM4+W5 Valdivia, Chile	47G85QM4+W5	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
511	513	5QP4+M7 Valdivia, Chile	47G85QP4+M7	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
512	514	5QP4+F9 Valdivia, Chile	47G85QP4+F9	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
513	515	5QP4+28 Valdivia, Chile	47G85QP4+28	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
514	516	5QM3+R4 Valdivia, Chile	47G85QM3+R4	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
515	517	5QP4+HC Valdivia, Chile	47G85QP4+HC	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
516	518	5QP2+MW Valdivia, Chile	47G85QP2+MW	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
517	519	5QP4+8G Valdivia, Chile	47G85QP4+8G	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
518	520	5QM3+JC Valdivia, Chile	47G85QM3+JC	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
519	521	5QP5+MM Valdivia, Chile	47G85QP5+MM	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
520	522	5QQJ+RC Valdivia, Chile	47G85QQJ+RC	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
521	523	5QM4+V7 Valdivia, Chile	47G85QM4+V7	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
522	524	5QP4+5G Valdivia, Chile	47G85QP4+5G	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
523	525	5QGC+CQ Valdivia, Chile	47G85QGC+CQ	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
524	526	5QQ5+3V Valdivia, Chile	47G85QQ5+3V	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
525	527	5QM5+G2 Valdivia, Chile	47G85QM5+G2	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
526	528	5QM3+RX Valdivia, Chile	47G85QM3+RX	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
527	529	5QG3+XC Valdivia, Chile	47G85QG3+XC	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
528	530	5QP4+M6 Valdivia, Chile	47G85QP4+M6	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
529	531	5QM6+QM Valdivia, Chile	47G85QM6+QM	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
530	532	5QP3+HP Valdivia, Chile	47G85QP3+HP	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
531	533	5QFF+8J Valdivia, Chile	47G85QFF+8J	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
532	534	5QP3+JW Valdivia, Chile	47G85QP3+JW	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
533	535	5QM5+H6 Valdivia, Chile	47G85QM5+H6	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
534	536	5QM5+H3 Valdivia, Chile	47G85QM5+H3	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
535	537	5QP5+3W Valdivia, Chile	47G85QP5+3W	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
536	538	5PHV+WJ Valdivia, Chile	47G85PHV+WJ	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
537	539	5QM5+XG Valdivia, Chile	47G85QM5+XG	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
538	540	5QP3+FW Valdivia, Chile	47G85QP3+FW	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
539	541	5QP3+RQ Valdivia, Chile	47G85QP3+RQ	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
540	542	5QP4+F9 Valdivia, Chile	47G85QP4+F9	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
541	543	5QM4+R5 Valdivia, Chile	47G85QM4+R5	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
542	544	5QP4+5F Valdivia, Chile	47G85QP4+5F	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
543	545	5QM5+H7 Valdivia, Chile	47G85QM5+H7	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
544	546	5QFF+F6 Valdivia, Chile	47G85QFF+F6	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
545	547	5Q69+XH Valdivia, Chile	47G85Q69+XH	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
546	548	4QX3+X9 Valdivia, Chile	47G84QX3+X9	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
547	549	5QP4+49 Valdivia, Chile	47G85QP4+49	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
548	550	5QP3+5Q Valdivia, Chile	47G85QP3+5Q	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
549	551	5QP4+QG Valdivia, Chile	47G85QP4+QG	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
550	552	5QP4+65 Valdivia, Chile	47G85QP4+65	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
551	553	5QP4+5G Valdivia, Chile	47G85QP4+5G	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
552	554	5QP5+G4 Valdivia, Chile	47G85QP5+G4	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
553	555	5QP3+CC Valdivia, Chile	47G85QP3+CC	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
554	556	5QP3+7V Valdivia, Chile	47G85QP3+7V	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
555	557	5QP3+FR Valdivia, Chile	47G85QP3+FR	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
556	558	5QP3+3F Valdivia, Chile	47G85QP3+3F	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
557	559	5PQX+V7 Valdivia, Chile	47G85PQX+V7	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
558	560	5QP4+5M Valdivia, Chile	47G85QP4+5M	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
559	561	5QP3+FV Valdivia, Chile	47G85QP3+FV	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
560	562	5QP3+39 Valdivia, Chile	47G85QP3+39	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
561	563	5QP3+GX Valdivia, Chile	47G85QP3+GX	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
562	564	5QP3+MH Valdivia, Chile	47G85QP3+MH	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
563	565	5QP4+M6 Valdivia, Chile	47G85QP4+M6	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
564	566	5QM4+V5 Valdivia, Chile	47G85QM4+V5	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
565	567	5QM3+MM Valdivia, Chile	47G85QM3+MM	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
566	568	5QM3+MM Valdivia, Chile	47G85QM3+MM	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
567	569	5QM3+JM Valdivia, Chile	47G85QM3+JM	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
568	570	5QM3+M3 Valdivia, Chile	47G85QM3+M3	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
569	571	5QP4+RG Valdivia, Chile	47G85QP4+RG	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
570	572	5QP4+VH Valdivia, Chile	47G85QP4+VH	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
571	573	5QP4+VH Valdivia, Chile	47G85QP4+VH	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
572	574	5QP4+RM Valdivia, Chile	47G85QP4+RM	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
573	575	5QP4+HX Valdivia, Chile	47G85QP4+HX	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
574	576	5QM4+89 Valdivia, Chile	47G85QM4+89	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
575	577	5QM5+G2 Valdivia, Chile	47G85QM5+G2	2025-05-15 20:49:04.209757-04	2025-05-15 20:49:04.209757-04
576	578	5QP3+QX Valdivia, Chile	47G85QP3+QX	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
577	579	6P2R+2P Valdivia, Chile	47G86P2R+2P	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
578	580	5Q9C+VQ Valdivia, Chile	47G85Q9C+VQ	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
579	581	5QP3+8J Valdivia, Chile	47G85QP3+8J	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
580	582	5QP3+XG Valdivia, Chile	47G85QP3+XG	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
581	584	5QM4+2X Valdivia, Chile	47G85QM4+2X	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
582	585	5QM4+2X Valdivia, Chile	47G85QM4+2X	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
583	586	5QP5+JW Valdivia, Chile	47G85QP5+JW	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
584	587	5QR4+9H Valdivia, Chile	47G85QR4+9H	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
585	588	5PQW+8V Valdivia, Chile	47G85PQW+8V	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
586	589	5QJ2+49 Valdivia, Chile	47G85QJ2+49	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
587	590	5QH2+QV Valdivia, Chile	47G85QH2+QV	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
588	591	5QM7+V7 Valdivia, Chile	47G85QM7+V7	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
589	592	5PHX+3X Valdivia, Chile	47G85PHX+3X	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
590	593	5PRV+2J Valdivia, Chile	47G85PRV+2J	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
591	594	5PQV+P4 Valdivia, Chile	47G85PQV+P4	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
592	595	5PPR+FM Valdivia, Chile	47G85PPR+FM	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
593	596	5PVX+H3 Valdivia, Chile	47G85PVX+H3	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
594	597	5QJ8+C2 Valdivia, Chile	47G85QJ8+C2	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
595	598	5PPX+M8 Valdivia, Chile	47G85PPX+M8	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
596	599	5QP2+9H Valdivia, Chile	47G85QP2+9H	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
597	600	5QM2+FH Valdivia, Chile	47G85QM2+FH	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
598	601	5QH2+R8 Valdivia, Chile	47G85QH2+R8	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
599	602	5P9V+G8 Valdivia, Chile	47G85P9V+G8	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
600	603	5QP3+CF Valdivia, Chile	47G85QP3+CF	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
601	604	5QP2+7H Valdivia, Chile	47G85QP2+7H	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
602	605	5QP2+PJ Valdivia, Chile	47G85QP2+PJ	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
603	606	5QQ2+4Q Valdivia, Chile	47G85QQ2+4Q	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
604	607	5QM2+Q8 Valdivia, Chile	47G85QM2+Q8	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
605	608	5QM2+H7 Valdivia, Chile	47G85QM2+H7	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
606	609	5QQ2+GX Valdivia, Chile	47G85QQ2+GX	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
607	610	5QQ3+H3 Valdivia, Chile	47G85QQ3+H3	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
608	611	5QP5+W7 Valdivia, Chile	47G85QP5+W7	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
609	612	5QQ3+P3 Valdivia, Chile	47G85QQ3+P3	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
610	613	5PPX+HP Valdivia, Chile	47G85PPX+HP	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
611	614	5QQ2+C6 Valdivia, Chile	47G85QQ2+C6	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
612	615	5QJ2+RX Valdivia, Chile	47G85QJ2+RX	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
613	616	5PPX+7H Valdivia, Chile	47G85PPX+7H	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
614	617	5PFX+WC Valdivia, Chile	47G85PFX+WC	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
615	618	5PRJ+CP Valdivia, Chile	47G85PRJ+CP	2025-05-15 20:49:04.561204-04	2025-05-15 20:49:04.561204-04
616	619	5QP3+V8 Valdivia, Chile	47G85QP3+V8	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
617	620	5PVX+65 Valdivia, Chile	47G85PVX+65	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
618	621	5Q96+8W Valdivia, Chile	47G85Q96+8W	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
619	622	5PVJ+98 Valdivia, Chile	47G85PVJ+98	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
620	623	4PXX+VR Valdivia, Chile	47G84PXX+VR	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
621	624	4PXV+4F Valdivia, Chile	47G84PXV+4F	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
622	625	6Q3X+XC Valdivia, Chile	47G86Q3X+XC	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
623	626	4QWC+CW Valdivia, Chile	47G84QWC+CW	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
624	627	4QV6+6W Valdivia, Chile	47G84QV6+6W	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
625	628	5QP7+2H Valdivia, Chile	47G85QP7+2H	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
626	629	5QP3+C6 Valdivia, Chile	47G85QP3+C6	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
627	630	5QP3+P7 Valdivia, Chile	47G85QP3+P7	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
628	631	5QM3+W6 Valdivia, Chile	47G85QM3+W6	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
629	632	5QM4+R2 Valdivia, Chile	47G85QM4+R2	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
630	633	5QP4+P4 Valdivia, Chile	47G85QP4+P4	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
631	634	5QM3+Q9 Valdivia, Chile	47G85QM3+Q9	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
632	635	5QM2+VQ Valdivia, Chile	47G85QM2+VQ	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
633	636	5QM3+F7 Valdivia, Chile	47G85QM3+F7	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
634	637	5QQ3+6X Valdivia, Chile	47G85QQ3+6X	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
635	638	5QQ3+64 Valdivia, Chile	47G85QQ3+64	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
636	639	5QM4+CF Valdivia, Chile	47G85QM4+CF	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
637	640	5QQ4+4M Valdivia, Chile	47G85QQ4+4M	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
638	641	5QM4+MW Valdivia, Chile	47G85QM4+MW	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
639	642	5QP5+J5 Valdivia, Chile	47G85QP5+J5	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
640	643	5QP5+J8 Valdivia, Chile	47G85QP5+J8	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
641	644	5QJ3+W4 Valdivia, Chile	47G85QJ3+W4	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
642	645	5QP5+XF Valdivia, Chile	47G85QP5+XF	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
643	646	5QJ2+WF Valdivia, Chile	47G85QJ2+WF	2025-05-15 20:49:04.723133-04	2025-05-15 20:49:04.723133-04
644	647	5QJ7+W4 Valdivia, Chile	47G85QJ7+W4	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
645	648	5QM3+H2 Valdivia, Chile	47G85QM3+H2	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
646	649	5QP4+QW Valdivia, Chile	47G85QP4+QW	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
647	650	5QP4+5F Valdivia, Chile	47G85QP4+5F	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
648	651	5QJ5+RJ Valdivia, Chile	47G85QJ5+RJ	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
649	652	5PQX+C4 Valdivia, Chile	47G85PQX+C4	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
650	653	5QM8+QF Valdivia, Chile	47G85QM8+QF	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
651	654	5Q95+RC Valdivia, Chile	47G85Q95+RC	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
652	655	5Q95+CX Valdivia, Chile	47G85Q95+CX	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
653	656	5QJ6+M4 Valdivia, Chile	47G85QJ6+M4	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
654	657	5QM6+F8 Valdivia, Chile	47G85QM6+F8	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
655	658	5QP3+G6 Valdivia, Chile	47G85QP3+G6	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
656	659	5QP3+H6 Valdivia, Chile	47G85QP3+H6	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
657	660	5QP3+G5 Valdivia, Chile	47G85QP3+G5	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
658	661	5QP3+QG Valdivia, Chile	47G85QP3+QG	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
659	662	5QP4+5F Valdivia, Chile	47G85QP4+5F	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
660	663	5QM3+F3 Valdivia, Chile	47G85QM3+F3	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
661	664	5QM3+8G Valdivia, Chile	47G85QM3+8G	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
662	665	5QQ4+C5 Valdivia, Chile	47G85QQ4+C5	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
663	666	5QM2+3F Valdivia, Chile	47G85QM2+3F	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
664	667	5QP4+4W Valdivia, Chile	47G85QP4+4W	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
665	668	5QC7+W8 Valdivia, Chile	47G85QC7+W8	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
666	669	5QM5+G2 Valdivia, Chile	47G85QM5+G2	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
667	670	5QM5+FF Valdivia, Chile	47G85QM5+FF	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
668	671	5QP3+7R Valdivia, Chile	47G85QP3+7R	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
669	672	5QP3+9R Valdivia, Chile	47G85QP3+9R	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
670	673	5QP3+HM Valdivia, Chile	47G85QP3+HM	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
671	674	5QP4+62 Valdivia, Chile	47G85QP4+62	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
672	675	5QP3+HW Valdivia, Chile	47G85QP3+HW	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
673	676	5QP3+66 Valdivia, Chile	47G85QP3+66	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
674	677	5QP4+87 Valdivia, Chile	47G85QP4+87	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
675	678	5QP3+QX Valdivia, Chile	47G85QP3+QX	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
676	679	5QP3+VQ Valdivia, Chile	47G85QP3+VQ	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
677	680	5QP4+49 Valdivia, Chile	47G85QP4+49	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
678	681	5QP4+59 Valdivia, Chile	47G85QP4+59	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
679	682	5QM4+W6 Valdivia, Chile	47G85QM4+W6	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
680	683	5QM4+V5 Valdivia, Chile	47G85QM4+V5	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
681	684	5QM4+V5 Valdivia, Chile	47G85QM4+V5	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
682	685	5QM4+X8 Valdivia, Chile	47G85QM4+X8	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
683	686	5Q9M+3J Valdivia, Chile	47G85Q9M+3J	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
684	687	5QP3+J6 Valdivia, Chile	47G85QP3+J6	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
685	688	5QP4+49 Valdivia, Chile	47G85QP4+49	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
686	689	5QP5+R3 Valdivia, Chile	47G85QP5+R3	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
687	690	5QJ5+RQ Valdivia, Chile	47G85QJ5+RQ	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
688	691	5Q9G+W2 Valdivia, Chile	47G85Q9G+W2	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
689	692	5Q7V+H8 Valdivia, Chile	47G85Q7V+H8	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
690	693	5Q95+QG Valdivia, Chile	47G85Q95+QG	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
691	694	5Q95+QG Valdivia, Chile	47G85Q95+QG	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
692	695	5QP3+G6 Valdivia, Chile	47G85QP3+G6	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
693	696	5QP3+G6 Valdivia, Chile	47G85QP3+G6	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
694	697	5QP3+QX Valdivia, Chile	47G85QP3+QX	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
695	698	5QM3+Q9 Valdivia, Chile	47G85QM3+Q9	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
696	699	5QP4+49 Valdivia, Chile	47G85QP4+49	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
697	700	5QP4+49 Valdivia, Chile	47G85QP4+49	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
698	701	5QM3+R4 Valdivia, Chile	47G85QM3+R4	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
699	702	5QM3+R4 Valdivia, Chile	47G85QM3+R4	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
700	703	5QFG+5Q Valdivia, Chile	47G85QFG+5Q	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
701	704	5QJ2+56 Valdivia, Chile	47G85QJ2+56	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
702	705	5PVX+9J Valdivia, Chile	47G85PVX+9J	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
703	706	5Q94+65 Miraflores, Valdivia, Chile	47G85Q94+65	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
704	707	5QJ8+XX Valdivia, Chile	47G85QJ8+XX	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
705	708	5QCH+4Q Valdivia, Chile	47G85QCH+4Q	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
706	709	5QM8+4F Valdivia, Chile	47G85QM8+4F	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
707	710	5QWJ+GJ Valdivia, Chile	47G85QWJ+GJ	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
708	711	5QP5+VX Valdivia, Chile	47G85QP5+VX	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
709	712	5PQW+5M Valdivia, Chile	47G85PQW+5M	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
710	713	5QH3+37 Valdivia, Chile	47G85QH3+37	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
711	714	5QG2+4M Valdivia, Chile	47G85QG2+4M	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
712	715	5QF3+HF Valdivia, Chile	47G85QF3+HF	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
713	716	5QC3+HC Valdivia, Chile	47G85QC3+HC	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
714	717	5Q95+W7 Valdivia, Chile	47G85Q95+W7	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
715	718	5Q95+P5 Valdivia, Chile	47G85Q95+P5	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
716	719	5Q85+M9 Valdivia, Chile	47G85Q85+M9	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
717	720	5Q87+G5 Valdivia, Chile	47G85Q87+G5	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
718	721	5P7V+M8 Valdivia, Chile	47G85P7V+M8	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
719	722	5Q9G+HW Valdivia, Chile	47G85Q9G+HW	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
720	723	5Q9H+7M Valdivia, Chile	47G85Q9H+7M	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
721	724	5Q42+7Q Valdivia, Chile	47G85Q42+7Q	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
722	725	5QFV+53 Valdivia, Chile	47G85QFV+53	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
723	726	5Q8Q+MC Valdivia, Chile	47G85Q8Q+MC	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
724	727	5PVX+G8 Valdivia, Chile	47G85PVX+G8	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
725	728	5QH2+92 Valdivia, Chile	47G85QH2+92	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
726	729	5QJ2+QR Valdivia, Chile	47G85QJ2+QR	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
727	730	5QV3+46 Valdivia, Chile	47G85QV3+46	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
728	731	5QV2+95 Valdivia, Chile	47G85QV2+95	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
729	732	5PVX+F8 Valdivia, Chile	47G85PVX+F8	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
730	733	5PVX+MQ Valdivia, Chile	47G85PVX+MQ	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
731	734	5PVW+F8 Valdivia, Chile	47G85PVW+F8	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
732	735	5QM8+2P Valdivia, Chile	47G85QM8+2P	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
733	736	5PWW+5F Valdivia, Chile	47G85PWW+5F	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
734	737	5Q83+WW Valdivia, Chile	47G85Q83+WW	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
735	738	5P8X+RG Valdivia, Chile	47G85P8X+RG	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
736	739	5QM3+R2 Valdivia, Chile	47G85QM3+R2	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
737	740	5QP3+76 Valdivia, Chile	47G85QP3+76	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
738	741	5QQ4+47 Valdivia, Chile	47G85QQ4+47	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
739	742	5QJ2+VR Valdivia, Chile	47G85QJ2+VR	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
740	743	5QJ2+VR Valdivia, Chile	47G85QJ2+VR	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
741	744	5QM4+3X Valdivia, Chile	47G85QM4+3X	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
742	745	5QJ2+W7 Valdivia, Chile	47G85QJ2+W7	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
743	746	5QM5+FV Valdivia, Chile	47G85QM5+FV	2025-05-15 20:49:04.832923-04	2025-05-15 20:49:04.832923-04
744	747	5QR7+VQ Valdivia, Chile	47G85QR7+VQ	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
745	748	5QP3+84 Valdivia, Chile	47G85QP3+84	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
746	749	5QM4+FG Valdivia, Chile	47G85QM4+FG	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
747	750	5QM3+WJ Valdivia, Chile	47G85QM3+WJ	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
748	751	5QM3+XC Valdivia, Chile	47G85QM3+XC	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
749	752	5QM4+R7 Valdivia, Chile	47G85QM4+R7	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
750	753	5QP4+QG Valdivia, Chile	47G85QP4+QG	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
751	754	5QM4+J7 Valdivia, Chile	47G85QM4+J7	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
752	755	5QP4+5Q Valdivia, Chile	47G85QP4+5Q	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
753	756	5QP4+MQ Valdivia, Chile	47G85QP4+MQ	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
754	757	5QM4+FF Valdivia, Chile	47G85QM4+FF	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
755	758	5QM2+8H Valdivia, Chile	47G85QM2+8H	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
756	759	5QR2+9P Valdivia, Chile	47G85QR2+9P	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
757	760	5PQX+J9 Valdivia, Chile	47G85PQX+J9	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
758	761	5QJ4+8R Valdivia, Chile	47G85QJ4+8R	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
759	762	5PQW+QG Valdivia, Chile	47G85PQW+QG	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
760	763	5PQW+V9 Valdivia, Chile	47G85PQW+V9	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
761	764	5PQW+XF Valdivia, Chile	47G85PQW+XF	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
762	765	5PQW+X4 Valdivia, Chile	47G85PQW+X4	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
763	766	5Q96+5G Valdivia, Chile	47G85Q96+5G	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
764	767	5QP3+52 Valdivia, Chile	47G85QP3+52	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
765	768	5PRR+82 Valdivia, Chile	47G85PRR+82	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
766	769	5P9X+43 Valdivia, Chile	47G85P9X+43	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
767	770	5QP3+G9 Valdivia, Chile	47G85QP3+G9	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
768	771	5QP3+9C Valdivia, Chile	47G85QP3+9C	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
769	772	5QP3+4Q Valdivia, Chile	47G85QP3+4Q	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
770	773	5QP3+FV Valdivia, Chile	47G85QP3+FV	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
771	774	5QP3+3R Valdivia, Chile	47G85QP3+3R	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
772	775	5QP3+3C Valdivia, Chile	47G85QP3+3C	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
773	776	5QP3+48 Valdivia, Chile	47G85QP3+48	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
774	777	5QP3+2V Valdivia, Chile	47G85QP3+2V	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
775	778	5QP3+56 Valdivia, Chile	47G85QP3+56	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
776	779	5QP3+2V Valdivia, Chile	47G85QP3+2V	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
777	780	5QM3+WJ Valdivia, Chile	47G85QM3+WJ	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
778	781	5QP3+2W Valdivia, Chile	47G85QP3+2W	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
779	782	5QP4+H4 Valdivia, Chile	47G85QP4+H4	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
780	783	5QP4+F8 Valdivia, Chile	47G85QP4+F8	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
781	784	5QP4+F9 Valdivia, Chile	47G85QP4+F9	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
782	785	5QP3+74 Valdivia, Chile	47G85QP3+74	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
783	786	5QM4+J6 Valdivia, Chile	47G85QM4+J6	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
784	787	5Q3Q+VG Valdivia, Chile	47G85Q3Q+VG	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
785	788	5QH2+G7 Valdivia, Chile	47G85QH2+G7	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
786	789	5QQ3+8R Valdivia, Chile	47G85QQ3+8R	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
787	790	5QP3+JW Valdivia, Chile	47G85QP3+JW	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
788	791	5QP3+QJ Valdivia, Chile	47G85QP3+QJ	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
789	792	5QP3+52 Valdivia, Chile	47G85QP3+52	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
790	793	5QP2+3X Valdivia, Chile	47G85QP2+3X	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
791	794	5QM3+MQ Valdivia, Chile	47G85QM3+MQ	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
792	795	5QQ3+2V Valdivia, Chile	47G85QQ3+2V	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
793	796	5QQ4+32 Valdivia, Chile	47G85QQ4+32	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
794	797	5QQ4+27 Valdivia, Chile	47G85QQ4+27	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
795	798	5QQ4+28 Valdivia, Chile	47G85QQ4+28	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
796	799	5QM4+G5 Valdivia, Chile	47G85QM4+G5	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
797	800	5QP4+RJ Valdivia, Chile	47G85QP4+RJ	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
798	801	5QM3+VF Valdivia, Chile	47G85QM3+VF	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
799	802	5QM3+RC Valdivia, Chile	47G85QM3+RC	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
800	803	5PQW+V9 Valdivia, Chile	47G85PQW+V9	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
801	804	5QR8+6M Valdivia, Chile	47G85QR8+6M	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
802	805	5Q45+VF Valdivia, Chile	47G85Q45+VF	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
803	806	5Q7X+78 Valdivia, Chile	47G85Q7X+78	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
804	807	5QP4+M7 Valdivia, Chile	47G85QP4+M7	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
805	808	5QP3+MX Valdivia, Chile	47G85QP3+MX	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
806	809	5QP4+F8 Valdivia, Chile	47G85QP4+F8	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
807	810	5QP2+CW Valdivia, Chile	47G85QP2+CW	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
808	811	5QP4+Q2 Valdivia, Chile	47G85QP4+Q2	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
809	812	5QP3+RX Valdivia, Chile	47G85QP3+RX	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
810	813	5QM3+Q9 Valdivia, Chile	47G85QM3+Q9	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
811	814	5QP4+Q5 Valdivia, Chile	47G85QP4+Q5	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
812	815	5QM4+V8 Valdivia, Chile	47G85QM4+V8	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
813	816	5QM4+P5 Valdivia, Chile	47G85QM4+P5	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
814	817	5QP4+PH Valdivia, Chile	47G85QP4+PH	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
815	818	5Q7M+6C Valdivia, Chile	47G85Q7M+6C	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
816	819	5QP3+QG Valdivia, Chile	47G85QP3+QG	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
817	820	5QP2+4H Valdivia, Chile	47G85QP2+4H	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
818	821	5QM5+J4 Valdivia, Chile	47G85QM5+J4	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
819	822	5QM4+3Q Valdivia, Chile	47G85QM4+3Q	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
820	823	5QJ3+R4 Valdivia, Chile	47G85QJ3+R4	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
821	824	5QJ4+R2 Valdivia, Chile	47G85QJ4+R2	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
822	825	5QQ4+MQ Valdivia, Chile	47G85QQ4+MQ	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
823	826	5QJ3+84 Valdivia, Chile	47G85QJ3+84	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
824	827	5PQX+FC Valdivia, Chile	47G85PQX+FC	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
825	828	5QJ4+7R Valdivia, Chile	47G85QJ4+7R	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
826	829	5QJ4+37 Valdivia, Chile	47G85QJ4+37	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
827	830	5QM6+XJ Valdivia, Chile	47G85QM6+XJ	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
828	831	5QM7+J6 Valdivia, Chile	47G85QM7+J6	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
829	832	5QG5+JX Valdivia, Chile	47G85QG5+JX	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
830	833	5QG7+J9 Valdivia, Chile	47G85QG7+J9	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
831	834	5QC5+VW Valdivia, Chile	47G85QC5+VW	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
832	835	5QC6+8V Valdivia, Chile	47G85QC6+8V	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
833	836	4QW2+RJ Valdivia, Chile	47G84QW2+RJ	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
834	837	5QQ3+HV Valdivia, Chile	47G85QQ3+HV	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
835	838	5QM4+3Q Valdivia, Chile	47G85QM4+3Q	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
836	839	5QJ4+R2 Valdivia, Chile	47G85QJ4+R2	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
837	840	5QJ3+5W Valdivia, Chile	47G85QJ3+5W	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
838	841	5PQW+RX Valdivia, Chile	47G85PQW+RX	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
839	842	5QG4+XQ Valdivia, Chile	47G85QG4+XQ	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
840	843	5P8X+RH Valdivia, Chile	47G85P8X+RH	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
841	844	5Q75+CW Valdivia, Chile	47G85Q75+CW	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
842	845	5Q9F+QR Valdivia, Chile	47G85Q9F+QR	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
843	846	5Q8F+H2 Valdivia, Chile	47G85Q8F+H2	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
844	847	5Q9H+CJ Valdivia, Chile	47G85Q9H+CJ	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
845	848	5Q7C+65 Valdivia, Chile	47G85Q7C+65	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
846	849	5Q6G+R2 Valdivia, Chile	47G85Q6G+R2	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
847	850	5QHR+83 Valdivia, Chile	47G85QHR+83	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
848	851	5Q42+H7 Valdivia, Chile	47G85Q42+H7	2025-05-15 20:49:05.297517-04	2025-05-15 20:49:05.297517-04
\.


--
-- TOC entry 5081 (class 0 OID 17181)
-- Dependencies: 236
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, user_id, place_id, rating, comment, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5079 (class 0 OID 17162)
-- Dependencies: 234
-- Data for Name: route_places; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.route_places (id, route_id, place_id, "position", created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5077 (class 0 OID 17146)
-- Dependencies: 232
-- Data for Name: routes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.routes (id, user_id, name, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5063 (class 0 OID 17041)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5117 (class 0 OID 0)
-- Dependencies: 219
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 24, true);


--
-- TOC entry 5118 (class 0 OID 0)
-- Dependencies: 227
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 1, false);


--
-- TOC entry 5119 (class 0 OID 0)
-- Dependencies: 229
-- Name: favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favorites_id_seq', 1, false);


--
-- TOC entry 5120 (class 0 OID 0)
-- Dependencies: 237
-- Name: geometry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.geometry_id_seq', 850, true);


--
-- TOC entry 5121 (class 0 OID 0)
-- Dependencies: 239
-- Name: opening_hours_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.opening_hours_id_seq', 616, true);


--
-- TOC entry 5122 (class 0 OID 0)
-- Dependencies: 223
-- Name: payment_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_methods_id_seq', 1, false);


--
-- TOC entry 5123 (class 0 OID 0)
-- Dependencies: 241
-- Name: photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.photos_id_seq', 642, true);


--
-- TOC entry 5124 (class 0 OID 0)
-- Dependencies: 247
-- Name: place_icons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.place_icons_id_seq', 850, true);


--
-- TOC entry 5125 (class 0 OID 0)
-- Dependencies: 225
-- Name: place_payment_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.place_payment_methods_id_seq', 1, false);


--
-- TOC entry 5126 (class 0 OID 0)
-- Dependencies: 245
-- Name: place_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.place_types_id_seq', 3575, true);


--
-- TOC entry 5127 (class 0 OID 0)
-- Dependencies: 221
-- Name: places_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.places_id_seq', 851, true);


--
-- TOC entry 5128 (class 0 OID 0)
-- Dependencies: 243
-- Name: plus_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plus_codes_id_seq', 848, true);


--
-- TOC entry 5129 (class 0 OID 0)
-- Dependencies: 235
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_id_seq', 1, false);


--
-- TOC entry 5130 (class 0 OID 0)
-- Dependencies: 233
-- Name: route_places_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.route_places_id_seq', 1, false);


--
-- TOC entry 5131 (class 0 OID 0)
-- Dependencies: 231
-- Name: routes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.routes_id_seq', 1, false);


--
-- TOC entry 5132 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 4869 (class 2606 OID 17063)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4879 (class 2606 OID 17121)
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- TOC entry 4881 (class 2606 OID 17134)
-- Name: favorites favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (id);


--
-- TOC entry 4889 (class 2606 OID 17210)
-- Name: geometry geometry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geometry
    ADD CONSTRAINT geometry_pkey PRIMARY KEY (id);


--
-- TOC entry 4891 (class 2606 OID 17224)
-- Name: opening_hours opening_hours_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opening_hours
    ADD CONSTRAINT opening_hours_pkey PRIMARY KEY (id);


--
-- TOC entry 4875 (class 2606 OID 17092)
-- Name: payment_methods payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (id);


--
-- TOC entry 4893 (class 2606 OID 17240)
-- Name: photos photos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id);


--
-- TOC entry 4899 (class 2606 OID 17288)
-- Name: place_icons place_icons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.place_icons
    ADD CONSTRAINT place_icons_pkey PRIMARY KEY (id);


--
-- TOC entry 4877 (class 2606 OID 17100)
-- Name: place_payment_methods place_payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.place_payment_methods
    ADD CONSTRAINT place_payment_methods_pkey PRIMARY KEY (id);


--
-- TOC entry 4897 (class 2606 OID 17272)
-- Name: place_types place_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.place_types
    ADD CONSTRAINT place_types_pkey PRIMARY KEY (id);


--
-- TOC entry 4871 (class 2606 OID 17076)
-- Name: places places_google_place_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.places
    ADD CONSTRAINT places_google_place_id_key UNIQUE (google_place_id);


--
-- TOC entry 4873 (class 2606 OID 17074)
-- Name: places places_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.places
    ADD CONSTRAINT places_pkey PRIMARY KEY (id);


--
-- TOC entry 4895 (class 2606 OID 17256)
-- Name: plus_codes plus_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plus_codes
    ADD CONSTRAINT plus_codes_pkey PRIMARY KEY (id);


--
-- TOC entry 4887 (class 2606 OID 17191)
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- TOC entry 4885 (class 2606 OID 17169)
-- Name: route_places route_places_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route_places
    ADD CONSTRAINT route_places_pkey PRIMARY KEY (id);


--
-- TOC entry 4883 (class 2606 OID 17155)
-- Name: routes routes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_pkey PRIMARY KEY (id);


--
-- TOC entry 4865 (class 2606 OID 17052)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4867 (class 2606 OID 17050)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4903 (class 2606 OID 17122)
-- Name: events events_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.places(id) ON DELETE CASCADE;


--
-- TOC entry 4904 (class 2606 OID 17140)
-- Name: favorites favorites_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.places(id) ON DELETE CASCADE;


--
-- TOC entry 4905 (class 2606 OID 17135)
-- Name: favorites favorites_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4911 (class 2606 OID 17211)
-- Name: geometry geometry_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geometry
    ADD CONSTRAINT geometry_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.places(id) ON DELETE CASCADE;


--
-- TOC entry 4912 (class 2606 OID 17225)
-- Name: opening_hours opening_hours_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.opening_hours
    ADD CONSTRAINT opening_hours_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.places(id) ON DELETE CASCADE;


--
-- TOC entry 4913 (class 2606 OID 17241)
-- Name: photos photos_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.places(id) ON DELETE CASCADE;


--
-- TOC entry 4916 (class 2606 OID 17289)
-- Name: place_icons place_icons_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.place_icons
    ADD CONSTRAINT place_icons_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.places(id) ON DELETE CASCADE;


--
-- TOC entry 4901 (class 2606 OID 17106)
-- Name: place_payment_methods place_payment_methods_payment_method_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.place_payment_methods
    ADD CONSTRAINT place_payment_methods_payment_method_id_fkey FOREIGN KEY (payment_method_id) REFERENCES public.payment_methods(id) ON DELETE CASCADE;


--
-- TOC entry 4902 (class 2606 OID 17101)
-- Name: place_payment_methods place_payment_methods_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.place_payment_methods
    ADD CONSTRAINT place_payment_methods_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.places(id) ON DELETE CASCADE;


--
-- TOC entry 4915 (class 2606 OID 17273)
-- Name: place_types place_types_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.place_types
    ADD CONSTRAINT place_types_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.places(id) ON DELETE CASCADE;


--
-- TOC entry 4900 (class 2606 OID 17077)
-- Name: places places_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.places
    ADD CONSTRAINT places_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- TOC entry 4914 (class 2606 OID 17257)
-- Name: plus_codes plus_codes_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plus_codes
    ADD CONSTRAINT plus_codes_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.places(id) ON DELETE CASCADE;


--
-- TOC entry 4909 (class 2606 OID 17197)
-- Name: reviews reviews_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.places(id) ON DELETE CASCADE;


--
-- TOC entry 4910 (class 2606 OID 17192)
-- Name: reviews reviews_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4907 (class 2606 OID 17175)
-- Name: route_places route_places_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route_places
    ADD CONSTRAINT route_places_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.places(id) ON DELETE CASCADE;


--
-- TOC entry 4908 (class 2606 OID 17170)
-- Name: route_places route_places_route_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route_places
    ADD CONSTRAINT route_places_route_id_fkey FOREIGN KEY (route_id) REFERENCES public.routes(id) ON DELETE CASCADE;


--
-- TOC entry 4906 (class 2606 OID 17156)
-- Name: routes routes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5100 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2025-05-15 20:51:20

--
-- PostgreSQL database dump complete
--

