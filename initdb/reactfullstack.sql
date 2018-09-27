--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: products; Type: TABLE; Schema: public; Owner: jimfrain
--

CREATE TABLE public.products (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    category character varying(255)[],
    current_price double precision NOT NULL,
    description text NOT NULL,
    availability boolean NOT NULL,
    inventory integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.products OWNER TO jimfrain;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: jimfrain
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO jimfrain;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jimfrain
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: jimfrain
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    rating integer DEFAULT 5 NOT NULL,
    review_text text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    product_id integer
);


ALTER TABLE public.reviews OWNER TO jimfrain;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: jimfrain
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO jimfrain;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jimfrain
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: jimfrain
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: jimfrain
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: jimfrain
--

COPY public.products (id, title, category, current_price, description, availability, inventory, created_at, updated_at) FROM stdin;
1	Hats	{Clothes,Accessories}	16	Fedora with a feather	t	100	2018-09-20 16:38:44.232-04	2018-09-20 16:38:44.232-04
2	Ski Suits	{Athletics,Clothes}	11	Full body ski suit	f	5	2018-09-20 16:38:44.232-04	2018-09-20 16:38:44.232-04
3	Fanny Pack	{Accessories}	12	Bright neon in all colors	t	64	2018-09-20 16:38:44.233-04	2018-09-20 16:38:44.233-04
4	Chuck Taylors	{Clothes,Shoes}	15	A variation on a classsic	f	35	2018-09-20 16:38:44.233-04	2018-09-20 16:38:44.233-04
5	Hairspray	{Beauty}	41	Full of CFCs	t	22	2018-09-20 16:38:44.233-04	2018-09-20 16:38:44.233-04
6	Socks	{Clothes}	51	Big wooly socks	t	21	2018-09-20 16:38:44.233-04	2018-09-20 16:38:44.233-04
7	Wigs	{Accessories,Beauty}	21	Business in the front, party in the back	f	100	2018-09-20 16:38:44.233-04	2018-09-20 16:38:44.233-04
8	Chanel	{Beauty}	49	Chanel loose powder	t	100	2018-09-20 16:38:44.233-04	2018-09-20 16:38:44.233-04
9	Cosmetics	{Beauty}	31	Revlon violet pink set	t	100	2018-09-20 16:38:44.234-04	2018-09-20 16:38:44.234-04
10	Covergirl	{Beauty}	21	Cosmetics for the young generation	f	100	2018-09-20 16:38:44.234-04	2018-09-20 16:38:44.234-04
11	Dior	{Beauty}	49	Luxury for your face	t	100	2018-09-20 16:38:44.234-04	2018-09-20 16:38:44.234-04
12	Dolls	{Accessories}	9	For your room	f	100	2018-09-20 16:38:44.234-04	2018-09-20 16:38:44.234-04
13	HighHeels	{Shoes}	27	Edge on your heel	t	100	2018-09-20 16:38:44.234-04	2018-09-20 16:38:44.234-04
14	PinkSuit	{Accessories,Clothes}	22	Everything for your pink day	f	100	2018-09-20 16:38:44.234-04	2018-09-20 16:38:44.234-04
15	Technicolor	{Accessories,Clothes}	31	Freedom	f	100	2018-09-20 16:38:44.234-04	2018-09-20 16:38:44.234-04
16	Sneakers	{Shoes,Athletics}	62	Comply with your style	f	100	2018-09-20 16:38:44.234-04	2018-09-20 16:38:44.234-04
17	FlyWatch	{Accessories}	20	What time is it now? 19: 08 ! 	f	100	2018-09-20 16:38:44.235-04	2018-09-20 16:38:44.235-04
18	ThatWig	{Accessories,Beauty}	21	Party people	f	100	2018-09-20 16:38:44.235-04	2018-09-20 16:38:44.235-04
19	Training set	{Athletics,Clothes}	21	Lion look	f	100	2018-09-20 16:38:44.235-04	2018-09-20 16:38:44.235-04
20	Training suit for couple	{Athletics,Clothes}	21	Lion look	f	100	2018-09-20 16:38:44.235-04	2018-09-20 16:38:44.235-04
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: jimfrain
--

COPY public.reviews (id, rating, review_text, created_at, updated_at, product_id) FROM stdin;
1	1	if you have too much extra money 	2018-09-20 16:38:44.294-04	2018-09-20 16:38:44.294-04	1
6	3	should be better	2018-09-20 16:38:44.295-04	2018-09-20 16:38:44.295-04	6
3	5	the best!	2018-09-20 16:38:44.294-04	2018-09-20 16:38:44.294-04	2
4	2	waste of money	2018-09-20 16:38:44.294-04	2018-09-20 16:38:44.294-04	3
5	3	can be better	2018-09-20 16:38:44.294-04	2018-09-20 16:38:44.294-04	4
7	4	good price	2018-09-20 16:38:44.295-04	2018-09-20 16:38:44.295-04	7
8	4	just like description	2018-09-20 16:38:44.295-04	2018-09-20 16:38:44.295-04	1
2	1	awful	2018-09-20 16:38:44.294-04	2018-09-20 16:38:44.294-04	5
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jimfrain
--

SELECT pg_catalog.setval('public.products_id_seq', 33, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jimfrain
--

SELECT pg_catalog.setval('public.reviews_id_seq', 33, true);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: jimfrain
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: jimfrain
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jimfrain
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

