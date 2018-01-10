--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: chkpass; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS chkpass WITH SCHEMA public;


--
-- Name: EXTENSION chkpass; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION chkpass IS 'data type for auto-encrypted passwords';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: contenedores_externos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contenedores_externos (
    id_ct_externo integer NOT NULL,
    fid_inventario integer,
    nombre_ct_externo text,
    dimensiones_ct_externo integer[],
    props_ct_externo jsonb,
    link_imagen character varying
);


--
-- Name: contenedores_externos_id_ct_externo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contenedores_externos_id_ct_externo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contenedores_externos_id_ct_externo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contenedores_externos_id_ct_externo_seq OWNED BY contenedores_externos.id_ct_externo;


--
-- Name: contenedores_internos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contenedores_internos (
    id_ct_interno integer NOT NULL,
    fid_ct_externo integer,
    nombre_ct_interno text,
    dimensiones_ct_interno integer[],
    props_ct_interno jsonb,
    link_imagen character varying
);


--
-- Name: contenedores_internos_id_ct_interno_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contenedores_internos_id_ct_interno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contenedores_internos_id_ct_interno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contenedores_internos_id_ct_interno_seq OWNED BY contenedores_internos.id_ct_interno;


--
-- Name: inventarios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE inventarios (
    id_inventario integer NOT NULL,
    fid_usuario integer,
    nombre_inventario text,
    props_inventario jsonb,
    compartido boolean DEFAULT false
);


--
-- Name: inventarios_id_inventario_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE inventarios_id_inventario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: inventarios_id_inventario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE inventarios_id_inventario_seq OWNED BY inventarios.id_inventario;


--
-- Name: objetos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE objetos (
    id_objeto integer NOT NULL,
    fid_ct_interno integer,
    nombre_objeto text,
    img_link text,
    props_objeto jsonb
);


--
-- Name: objetos_id_objeto_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE objetos_id_objeto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: objetos_id_objeto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE objetos_id_objeto_seq OWNED BY objetos.id_objeto;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE usuarios (
    id_usuario integer NOT NULL,
    nombre_usuario character varying,
    contrasena_usuario chkpass
);


--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE usuarios_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE usuarios_id_usuario_seq OWNED BY usuarios.id_usuario;


--
-- Name: contenedores_externos id_ct_externo; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contenedores_externos ALTER COLUMN id_ct_externo SET DEFAULT nextval('contenedores_externos_id_ct_externo_seq'::regclass);


--
-- Name: contenedores_internos id_ct_interno; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contenedores_internos ALTER COLUMN id_ct_interno SET DEFAULT nextval('contenedores_internos_id_ct_interno_seq'::regclass);


--
-- Name: inventarios id_inventario; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY inventarios ALTER COLUMN id_inventario SET DEFAULT nextval('inventarios_id_inventario_seq'::regclass);


--
-- Name: objetos id_objeto; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY objetos ALTER COLUMN id_objeto SET DEFAULT nextval('objetos_id_objeto_seq'::regclass);


--
-- Name: usuarios id_usuario; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('usuarios_id_usuario_seq'::regclass);


--
-- Data for Name: contenedores_externos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contenedores_externos (id_ct_externo, fid_inventario, nombre_ct_externo, dimensiones_ct_externo, props_ct_externo, link_imagen) FROM stdin;
1	1	cajon gaveta	{1,1,1}	{"lugar": "primer cajon a la derecha"}	\N
2	1	cajon gaveta 2	{1,1,1}	{"lugar": "segundo cajon a la derecha"}	\N
3	1	repisa inferior	{1,1,1}	{"lugar": "bajo el lavabo", "notas": "conseguir articulos de limpieza"}	\N
\.


--
-- Name: contenedores_externos_id_ct_externo_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('contenedores_externos_id_ct_externo_seq', 3, true);


--
-- Data for Name: contenedores_internos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY contenedores_internos (id_ct_interno, fid_ct_externo, nombre_ct_interno, dimensiones_ct_interno, props_ct_interno, link_imagen) FROM stdin;
\.


--
-- Name: contenedores_internos_id_ct_interno_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('contenedores_internos_id_ct_interno_seq', 1, false);


--
-- Data for Name: inventarios; Type: TABLE DATA; Schema: public; Owner: -
--

COPY inventarios (id_inventario, fid_usuario, nombre_inventario, props_inventario, compartido) FROM stdin;
1	1	habitación	{"compartir": true, "descripción": "inventario para mi cuarto"}	f
2	1	cocina	{"compartir": false, "descripción": "inventario para los utensilios nuevos de cocina"}	f
3	2	cochera	{"excluir": ["cosas del coche", "cosas del jardin"], "compartir": false, "descripción": "registro de la cochera"}	f
4	3	garage	{"compartir": true, "descripción": "nueva mudanza, registro de estado inicial", "observaciones": ["es un garage más chico", "no tiene puerta automática"]}	f
8	2	cocina comedor	{"localizacion": "planta alta, primera puerta a la derecha"}	f
9	1	caleb is dumb	["cant believe my fucking luck"]	f
11	12	Inventario	{"tel": "21321321"}	f
12	12	Inventario	{"tel": "21321321"}	f
14	1	asdfsdf	{}	f
15	1	asdfsdf	{}	f
16	4	inventario 92	["inventario de revistas", "caja 4", "año 2014"]	f
\.


--
-- Name: inventarios_id_inventario_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('inventarios_id_inventario_seq', 16, true);


--
-- Data for Name: objetos; Type: TABLE DATA; Schema: public; Owner: -
--

COPY objetos (id_objeto, fid_ct_interno, nombre_objeto, img_link, props_objeto) FROM stdin;
\.


--
-- Name: objetos_id_objeto_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('objetos_id_objeto_seq', 1, false);


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: -
--

COPY usuarios (id_usuario, nombre_usuario, contrasena_usuario) FROM stdin;
2	Isaac Avila	:zdt65Qx86rZyU
3	Jorge Maldonado	:MlIGilcMiNLK2
4	Maestro Reyes	:CHdogkhsRhQVI
1	Miguel Flores	:inOv1deni7cyc
12	Cara de Pe2	:ZAnM172DPFN9E
\.


--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('usuarios_id_usuario_seq', 7, true);


--
-- Name: contenedores_externos contenedores_externos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

 
ALTER TABLE ONLY contenedores_externos
    ADD CONSTRAINT contenedores_externos_pkey PRIMARY KEY (id_ct_externo);


--
-- Name: contenedores_internos contenedores_internos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contenedores_internos
    ADD CONSTRAINT contenedores_internos_pkey PRIMARY KEY (id_ct_interno);


--
-- Name: inventarios inventarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY inventarios
    ADD CONSTRAINT inventarios_pkey PRIMARY KEY (id_inventario);


--
-- Name: objetos objetos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY objetos
    ADD CONSTRAINT objetos_pkey PRIMARY KEY (id_objeto);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- Name: contenedores_externos contenedores_externos_fid_inventario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

DROP CONSTRAINT contenedores_externos_fid_inventario_fkey;

ALTER TABLE ONLY contenedores_externos
    ADD CONSTRAINT contenedores_externos_fid_inventario_fkey FOREIGN KEY (fid_inventario) REFERENCES inventarios(id_inventario) ON DELETE CASCADE;


--
-- Name: contenedores_internos contenedores_internos_fid_ct_externo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--
DROP CONSTRAINT contenedores_internos_fid_ct_externo_fkey;

ALTER TABLE ONLY contenedores_internos
    ADD CONSTRAINT contenedores_internos_fid_ct_externo_fkey FOREIGN KEY (fid_ct_externo) REFERENCES contenedores_externos(id_ct_externo) ON DELETE CASCADE;


--
-- Name: inventarios inventarios_fid_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

DROP CONSTRAINT inventarios_fid_usuario_fkey;
ALTER TABLE ONLY inventarios
    ADD CONSTRAINT inventarios_fid_usuario_fkey FOREIGN KEY (fid_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE;


--
-- Name: objetos objetos_fid_ct_interno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--
DROP CONSTRAINT inventarios_fid_ct_interno_fkey;

ALTER TABLE ONLY objetos
    ADD CONSTRAINT objetos_fid_ct_interno_fkey FOREIGN KEY (fid_ct_interno) REFERENCES contenedores_internos(id_ct_interno) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

