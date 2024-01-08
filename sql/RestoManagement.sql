--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Ubuntu 16.1-1.pgdg20.04+1)
-- Dumped by pg_dump version 16.1 (Ubuntu 16.1-1.pgdg20.04+1)

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

--
-- Name: locationtype; Type: TYPE; Schema: public; Owner: kuitkatnekat
--

CREATE TYPE public.locationtype AS ENUM (
    'Bandung',
    'Jakarta',
    'Bali',
    'Surabaya',
    'Samarinda',
    'Padang'
);


ALTER TYPE public.locationtype OWNER TO kuitkatnekat;

--
-- Name: menucategorytype; Type: TYPE; Schema: public; Owner: kuitkatnekat
--

CREATE TYPE public.menucategorytype AS ENUM (
    'General',
    'Special',
    'Local Special'
);


ALTER TYPE public.menucategorytype OWNER TO kuitkatnekat;

--
-- Name: orderstatustype; Type: TYPE; Schema: public; Owner: kuitkatnekat
--

CREATE TYPE public.orderstatustype AS ENUM (
    'In Reserve',
    'In Order',
    'Finalized'
);


ALTER TYPE public.orderstatustype OWNER TO kuitkatnekat;

--
-- Name: restauranttype; Type: TYPE; Schema: public; Owner: kuitkatnekat
--

CREATE TYPE public.restauranttype AS ENUM (
    'All Restaurant',
    'Main Restaurant'
);


ALTER TYPE public.restauranttype OWNER TO kuitkatnekat;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: employee; Type: TABLE; Schema: public; Owner: kuitkatnekat
--

CREATE TABLE public.employee (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    restaurantid integer NOT NULL
);


ALTER TABLE public.employee OWNER TO kuitkatnekat;

--
-- Name: employee_id_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employee_id_seq OWNER TO kuitkatnekat;

--
-- Name: employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.employee_id_seq OWNED BY public.employee.id;


--
-- Name: employee_restaurantid_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.employee_restaurantid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employee_restaurantid_seq OWNER TO kuitkatnekat;

--
-- Name: employee_restaurantid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.employee_restaurantid_seq OWNED BY public.employee.restaurantid;


--
-- Name: menu; Type: TABLE; Schema: public; Owner: kuitkatnekat
--

CREATE TABLE public.menu (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    category public.menucategorytype NOT NULL,
    description character varying(255),
    location public.locationtype,
    specificlocation character varying(255)
);


ALTER TABLE public.menu OWNER TO kuitkatnekat;

--
-- Name: menu_id_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_id_seq OWNER TO kuitkatnekat;

--
-- Name: menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.menu_id_seq OWNED BY public.menu.id;


--
-- Name: orderdetailmenu; Type: TABLE; Schema: public; Owner: kuitkatnekat
--

CREATE TABLE public.orderdetailmenu (
    orderid integer NOT NULL,
    menuid integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.orderdetailmenu OWNER TO kuitkatnekat;

--
-- Name: orderdetailmenu_menuid_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.orderdetailmenu_menuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orderdetailmenu_menuid_seq OWNER TO kuitkatnekat;

--
-- Name: orderdetailmenu_menuid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.orderdetailmenu_menuid_seq OWNED BY public.orderdetailmenu.menuid;


--
-- Name: orderdetailmenu_orderid_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.orderdetailmenu_orderid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orderdetailmenu_orderid_seq OWNER TO kuitkatnekat;

--
-- Name: orderdetailmenu_orderid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.orderdetailmenu_orderid_seq OWNED BY public.orderdetailmenu.orderid;


--
-- Name: orderdetailmenu_quantity_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.orderdetailmenu_quantity_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orderdetailmenu_quantity_seq OWNER TO kuitkatnekat;

--
-- Name: orderdetailmenu_quantity_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.orderdetailmenu_quantity_seq OWNED BY public.orderdetailmenu.quantity;


--
-- Name: orderdetailseat; Type: TABLE; Schema: public; Owner: kuitkatnekat
--

CREATE TABLE public.orderdetailseat (
    orderid integer NOT NULL,
    seattypeid integer NOT NULL,
    customerseated integer NOT NULL
);


ALTER TABLE public.orderdetailseat OWNER TO kuitkatnekat;

--
-- Name: orderdetailseat_customerseated_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.orderdetailseat_customerseated_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orderdetailseat_customerseated_seq OWNER TO kuitkatnekat;

--
-- Name: orderdetailseat_customerseated_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.orderdetailseat_customerseated_seq OWNED BY public.orderdetailseat.customerseated;


--
-- Name: orderdetailseat_orderid_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.orderdetailseat_orderid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orderdetailseat_orderid_seq OWNER TO kuitkatnekat;

--
-- Name: orderdetailseat_orderid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.orderdetailseat_orderid_seq OWNED BY public.orderdetailseat.orderid;


--
-- Name: orderdetailseat_seattypeid_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.orderdetailseat_seattypeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orderdetailseat_seattypeid_seq OWNER TO kuitkatnekat;

--
-- Name: orderdetailseat_seattypeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.orderdetailseat_seattypeid_seq OWNED BY public.orderdetailseat.seattypeid;


--
-- Name: orderheader; Type: TABLE; Schema: public; Owner: kuitkatnekat
--

CREATE TABLE public.orderheader (
    id integer NOT NULL,
    customername character varying(255) NOT NULL,
    status public.orderstatustype NOT NULL,
    employeeid integer NOT NULL
);


ALTER TABLE public.orderheader OWNER TO kuitkatnekat;

--
-- Name: orderheader_employeeid_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.orderheader_employeeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orderheader_employeeid_seq OWNER TO kuitkatnekat;

--
-- Name: orderheader_employeeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.orderheader_employeeid_seq OWNED BY public.orderheader.employeeid;


--
-- Name: orderheader_id_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.orderheader_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orderheader_id_seq OWNER TO kuitkatnekat;

--
-- Name: orderheader_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.orderheader_id_seq OWNED BY public.orderheader.id;


--
-- Name: restaurant; Type: TABLE; Schema: public; Owner: kuitkatnekat
--

CREATE TABLE public.restaurant (
    id integer NOT NULL,
    address character varying(255) NOT NULL,
    location public.locationtype NOT NULL
);


ALTER TABLE public.restaurant OWNER TO kuitkatnekat;

--
-- Name: restaurant_id_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.restaurant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.restaurant_id_seq OWNER TO kuitkatnekat;

--
-- Name: restaurant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.restaurant_id_seq OWNED BY public.restaurant.id;


--
-- Name: seattype; Type: TABLE; Schema: public; Owner: kuitkatnekat
--

CREATE TABLE public.seattype (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    capacity integer NOT NULL
);


ALTER TABLE public.seattype OWNER TO kuitkatnekat;

--
-- Name: seattype_id_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.seattype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seattype_id_seq OWNER TO kuitkatnekat;

--
-- Name: seattype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.seattype_id_seq OWNED BY public.seattype.id;


--
-- Name: employee id; Type: DEFAULT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.employee ALTER COLUMN id SET DEFAULT nextval('public.employee_id_seq'::regclass);


--
-- Name: employee restaurantid; Type: DEFAULT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.employee ALTER COLUMN restaurantid SET DEFAULT nextval('public.employee_restaurantid_seq'::regclass);


--
-- Name: menu id; Type: DEFAULT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.menu ALTER COLUMN id SET DEFAULT nextval('public.menu_id_seq'::regclass);


--
-- Name: orderdetailmenu orderid; Type: DEFAULT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.orderdetailmenu ALTER COLUMN orderid SET DEFAULT nextval('public.orderdetailmenu_orderid_seq'::regclass);


--
-- Name: orderdetailmenu menuid; Type: DEFAULT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.orderdetailmenu ALTER COLUMN menuid SET DEFAULT nextval('public.orderdetailmenu_menuid_seq'::regclass);


--
-- Name: orderdetailmenu quantity; Type: DEFAULT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.orderdetailmenu ALTER COLUMN quantity SET DEFAULT nextval('public.orderdetailmenu_quantity_seq'::regclass);


--
-- Name: orderdetailseat orderid; Type: DEFAULT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.orderdetailseat ALTER COLUMN orderid SET DEFAULT nextval('public.orderdetailseat_orderid_seq'::regclass);


--
-- Name: orderdetailseat seattypeid; Type: DEFAULT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.orderdetailseat ALTER COLUMN seattypeid SET DEFAULT nextval('public.orderdetailseat_seattypeid_seq'::regclass);


--
-- Name: orderdetailseat customerseated; Type: DEFAULT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.orderdetailseat ALTER COLUMN customerseated SET DEFAULT nextval('public.orderdetailseat_customerseated_seq'::regclass);


--
-- Name: orderheader id; Type: DEFAULT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.orderheader ALTER COLUMN id SET DEFAULT nextval('public.orderheader_id_seq'::regclass);


--
-- Name: orderheader employeeid; Type: DEFAULT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.orderheader ALTER COLUMN employeeid SET DEFAULT nextval('public.orderheader_employeeid_seq'::regclass);


--
-- Name: restaurant id; Type: DEFAULT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.restaurant ALTER COLUMN id SET DEFAULT nextval('public.restaurant_id_seq'::regclass);


--
-- Name: seattype id; Type: DEFAULT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.seattype ALTER COLUMN id SET DEFAULT nextval('public.seattype_id_seq'::regclass);


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: kuitkatnekat
--

COPY public.employee (id, name, restaurantid) FROM stdin;
1	Aditya	1
2	Karina	2
3	Luke	3
4	Fajri	4
5	Mulia	5
6	Mangala	6
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: kuitkatnekat
--

COPY public.menu (id, name, price, category, description, location, specificlocation) FROM stdin;
1	Sate Kambing	35000	General	\N	\N	\N
2	Es Teler	20000	General	\N	\N	\N
3	Bakso Ayam	25000	General	\N	\N	\N
4	Nasi Goreng Special	20000	Special	Nasi goreng spesial dengan bumbu khas Restoran LaperAh	\N	\N
5	Sate Maranggi Special	30000	Special	Sate khas Maranggi dengan bumbu pedas khas Restoran LaperAh	\N	\N
6	Lawar Ayam Special	28000	Special	Lawar ayam dengan bumbu pedas Bali khas Restoran LaperAh	\N	\N
7	Sate Karak	20000	Local Special	Sate Karak khas Ampel ni bos	Surabaya	Ampel
8	Tahu Tek	18000	Local Special	Tahu dan lontong yang di potong-potong dan disiram dengan saus kacang	Surabaya	Lamongan
9	Gence ruan	26000	Local Special	Masakan rica-rica ikan gabus khas dari Kutai	Bali	Kutai
10	Sate Payau	35000	Local Special	Ikan gabus yang disajikan bersama siraman sambal goreng	Bali	Kutai
11	Rendang	30000	Local Special	Makanan terenak di dunia pokoknya	Padang	Minangkabau
12	Sate Padang	25000	Local Special	Sate daging dengan bumbu kuah kacang kental pedas	Padang	Padang Panjang
\.


--
-- Data for Name: orderdetailmenu; Type: TABLE DATA; Schema: public; Owner: kuitkatnekat
--

COPY public.orderdetailmenu (orderid, menuid, quantity) FROM stdin;
\.


--
-- Data for Name: orderdetailseat; Type: TABLE DATA; Schema: public; Owner: kuitkatnekat
--

COPY public.orderdetailseat (orderid, seattypeid, customerseated) FROM stdin;
\.


--
-- Data for Name: orderheader; Type: TABLE DATA; Schema: public; Owner: kuitkatnekat
--

COPY public.orderheader (id, customername, status, employeeid) FROM stdin;
\.


--
-- Data for Name: restaurant; Type: TABLE DATA; Schema: public; Owner: kuitkatnekat
--

COPY public.restaurant (id, address, location) FROM stdin;
1	Jalan Raya No. 123	Bandung
2	Jalan Sudirman No. 456	Jakarta
3	Jalan Legian No. 789	Bali
4	Jalan Diponegoro No. 101	Surabaya
5	Jalan Pahlawan No. 202	Samarinda
6	Jalan Merdeka No. 303	Padang
\.


--
-- Data for Name: seattype; Type: TABLE DATA; Schema: public; Owner: kuitkatnekat
--

COPY public.seattype (id, name, capacity) FROM stdin;
1	Romantic	2
2	General	4
3	Family	10
\.


--
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.employee_id_seq', 1, false);


--
-- Name: employee_restaurantid_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.employee_restaurantid_seq', 1, false);


--
-- Name: menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.menu_id_seq', 12, true);


--
-- Name: orderdetailmenu_menuid_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.orderdetailmenu_menuid_seq', 1, false);


--
-- Name: orderdetailmenu_orderid_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.orderdetailmenu_orderid_seq', 1, false);


--
-- Name: orderdetailmenu_quantity_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.orderdetailmenu_quantity_seq', 1, false);


--
-- Name: orderdetailseat_customerseated_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.orderdetailseat_customerseated_seq', 1, false);


--
-- Name: orderdetailseat_orderid_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.orderdetailseat_orderid_seq', 1, false);


--
-- Name: orderdetailseat_seattypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.orderdetailseat_seattypeid_seq', 1, false);


--
-- Name: orderheader_employeeid_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.orderheader_employeeid_seq', 1, false);


--
-- Name: orderheader_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.orderheader_id_seq', 1, false);


--
-- Name: restaurant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.restaurant_id_seq', 1, false);


--
-- Name: seattype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.seattype_id_seq', 3, true);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id);


--
-- Name: orderdetailmenu orderdetailmenu_pkey; Type: CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.orderdetailmenu
    ADD CONSTRAINT orderdetailmenu_pkey PRIMARY KEY (orderid);


--
-- Name: orderdetailseat orderdetailseat_pkey; Type: CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.orderdetailseat
    ADD CONSTRAINT orderdetailseat_pkey PRIMARY KEY (orderid);


--
-- Name: orderheader orderheader_pkey; Type: CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.orderheader
    ADD CONSTRAINT orderheader_pkey PRIMARY KEY (id);


--
-- Name: restaurant restaurant_pkey; Type: CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.restaurant
    ADD CONSTRAINT restaurant_pkey PRIMARY KEY (id);


--
-- Name: seattype seattype_pkey; Type: CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.seattype
    ADD CONSTRAINT seattype_pkey PRIMARY KEY (id);


--
-- Name: employee employee_restaurantid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_restaurantid_fkey FOREIGN KEY (restaurantid) REFERENCES public.restaurant(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: orderdetailmenu orderdetailmenu_menuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.orderdetailmenu
    ADD CONSTRAINT orderdetailmenu_menuid_fkey FOREIGN KEY (menuid) REFERENCES public.menu(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: orderdetailmenu orderdetailmenu_orderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.orderdetailmenu
    ADD CONSTRAINT orderdetailmenu_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.orderheader(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: orderdetailseat orderdetailseat_orderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.orderdetailseat
    ADD CONSTRAINT orderdetailseat_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.orderheader(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: orderdetailseat orderdetailseat_seattypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.orderdetailseat
    ADD CONSTRAINT orderdetailseat_seattypeid_fkey FOREIGN KEY (seattypeid) REFERENCES public.seattype(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: orderheader orderheader_employeeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.orderheader
    ADD CONSTRAINT orderheader_employeeid_fkey FOREIGN KEY (employeeid) REFERENCES public.employee(id);


--
-- PostgreSQL database dump complete
--

