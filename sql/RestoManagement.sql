--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Ubuntu 16.1-1.pgdg20.04+1)
-- Dumped by pg_dump version 16.0

-- Started on 2024-01-08 23:24:01

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
-- TOC entry 216 (class 1259 OID 16688)
-- Name: branch; Type: TABLE; Schema: public; Owner: kuitkatnekat
--

CREATE TABLE public.branch (
    id integer NOT NULL,
    location character varying(255) NOT NULL
);


ALTER TABLE public.branch OWNER TO kuitkatnekat;

--
-- TOC entry 215 (class 1259 OID 16687)
-- Name: branch_id_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.branch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.branch_id_seq OWNER TO kuitkatnekat;

--
-- TOC entry 3445 (class 0 OID 0)
-- Dependencies: 215
-- Name: branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.branch_id_seq OWNED BY public.branch.id;


--
-- TOC entry 219 (class 1259 OID 16744)
-- Name: employee; Type: TABLE; Schema: public; Owner: kuitkatnekat
--

CREATE TABLE public.employee (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    branch_id integer NOT NULL
);


ALTER TABLE public.employee OWNER TO kuitkatnekat;

--
-- TOC entry 218 (class 1259 OID 16743)
-- Name: employee_branch_id_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.employee_branch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employee_branch_id_seq OWNER TO kuitkatnekat;

--
-- TOC entry 3446 (class 0 OID 0)
-- Dependencies: 218
-- Name: employee_branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.employee_branch_id_seq OWNED BY public.employee.branch_id;


--
-- TOC entry 217 (class 1259 OID 16742)
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
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 217
-- Name: employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.employee_id_seq OWNED BY public.employee.id;


--
-- TOC entry 226 (class 1259 OID 16768)
-- Name: menu; Type: TABLE; Schema: public; Owner: kuitkatnekat
--

CREATE TABLE public.menu (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    price integer NOT NULL,
    menu_type_id integer NOT NULL,
    branch_id integer,
    location character varying(255)
);


ALTER TABLE public.menu OWNER TO kuitkatnekat;

--
-- TOC entry 225 (class 1259 OID 16767)
-- Name: menu_branch_id_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.menu_branch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_branch_id_seq OWNER TO kuitkatnekat;

--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 225
-- Name: menu_branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.menu_branch_id_seq OWNED BY public.menu.branch_id;


--
-- TOC entry 222 (class 1259 OID 16764)
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
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 222
-- Name: menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.menu_id_seq OWNED BY public.menu.id;


--
-- TOC entry 224 (class 1259 OID 16766)
-- Name: menu_menu_type_id_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.menu_menu_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_menu_type_id_seq OWNER TO kuitkatnekat;

--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 224
-- Name: menu_menu_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.menu_menu_type_id_seq OWNED BY public.menu.menu_type_id;


--
-- TOC entry 223 (class 1259 OID 16765)
-- Name: menu_price_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.menu_price_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_price_seq OWNER TO kuitkatnekat;

--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 223
-- Name: menu_price_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.menu_price_seq OWNED BY public.menu.price;


--
-- TOC entry 221 (class 1259 OID 16758)
-- Name: menu_type; Type: TABLE; Schema: public; Owner: kuitkatnekat
--

CREATE TABLE public.menu_type (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.menu_type OWNER TO kuitkatnekat;

--
-- TOC entry 220 (class 1259 OID 16757)
-- Name: menu_type_id_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.menu_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_type_id_seq OWNER TO kuitkatnekat;

--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 220
-- Name: menu_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.menu_type_id_seq OWNED BY public.menu_type.id;


--
-- TOC entry 231 (class 1259 OID 16799)
-- Name: order_status_type; Type: TABLE; Schema: public; Owner: kuitkatnekat
--

CREATE TABLE public.order_status_type (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.order_status_type OWNER TO kuitkatnekat;

--
-- TOC entry 230 (class 1259 OID 16798)
-- Name: order_status_type_id_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.order_status_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_status_type_id_seq OWNER TO kuitkatnekat;

--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 230
-- Name: order_status_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.order_status_type_id_seq OWNED BY public.order_status_type.id;


--
-- TOC entry 229 (class 1259 OID 16791)
-- Name: seat_type; Type: TABLE; Schema: public; Owner: kuitkatnekat
--

CREATE TABLE public.seat_type (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    capacity integer NOT NULL
);


ALTER TABLE public.seat_type OWNER TO kuitkatnekat;

--
-- TOC entry 228 (class 1259 OID 16790)
-- Name: seat_type_capacity_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.seat_type_capacity_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seat_type_capacity_seq OWNER TO kuitkatnekat;

--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 228
-- Name: seat_type_capacity_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.seat_type_capacity_seq OWNED BY public.seat_type.capacity;


--
-- TOC entry 227 (class 1259 OID 16789)
-- Name: seat_type_id_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.seat_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seat_type_id_seq OWNER TO kuitkatnekat;

--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 227
-- Name: seat_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.seat_type_id_seq OWNED BY public.seat_type.id;


--
-- TOC entry 242 (class 1259 OID 16867)
-- Name: transaction_detail_menu; Type: TABLE; Schema: public; Owner: kuitkatnekat
--

CREATE TABLE public.transaction_detail_menu (
    transaction_id integer NOT NULL,
    menu_id integer NOT NULL,
    quantity integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.transaction_detail_menu OWNER TO kuitkatnekat;

--
-- TOC entry 241 (class 1259 OID 16866)
-- Name: transaction_detail_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.transaction_detail_menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaction_detail_menu_id_seq OWNER TO kuitkatnekat;

--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 241
-- Name: transaction_detail_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.transaction_detail_menu_id_seq OWNED BY public.transaction_detail_menu.transaction_id;


--
-- TOC entry 240 (class 1259 OID 16836)
-- Name: transaction_detail_seat; Type: TABLE; Schema: public; Owner: kuitkatnekat
--

CREATE TABLE public.transaction_detail_seat (
    transaction_id integer NOT NULL,
    seat_type_id integer NOT NULL,
    person integer NOT NULL,
    id integer
);


ALTER TABLE public.transaction_detail_seat OWNER TO kuitkatnekat;

--
-- TOC entry 237 (class 1259 OID 16833)
-- Name: transaction_detail_seat_id_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.transaction_detail_seat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaction_detail_seat_id_seq OWNER TO kuitkatnekat;

--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 237
-- Name: transaction_detail_seat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.transaction_detail_seat_id_seq OWNED BY public.transaction_detail_seat.transaction_id;


--
-- TOC entry 239 (class 1259 OID 16835)
-- Name: transaction_detail_seat_person_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.transaction_detail_seat_person_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaction_detail_seat_person_seq OWNER TO kuitkatnekat;

--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 239
-- Name: transaction_detail_seat_person_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.transaction_detail_seat_person_seq OWNED BY public.transaction_detail_seat.person;


--
-- TOC entry 238 (class 1259 OID 16834)
-- Name: transaction_detail_seat_seat_type_id_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.transaction_detail_seat_seat_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaction_detail_seat_seat_type_id_seq OWNER TO kuitkatnekat;

--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 238
-- Name: transaction_detail_seat_seat_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.transaction_detail_seat_seat_type_id_seq OWNED BY public.transaction_detail_seat.seat_type_id;


--
-- TOC entry 236 (class 1259 OID 16809)
-- Name: transaction_header; Type: TABLE; Schema: public; Owner: kuitkatnekat
--

CREATE TABLE public.transaction_header (
    id integer NOT NULL,
    branch_id integer NOT NULL,
    employee_id integer NOT NULL,
    customer_name character varying(255) NOT NULL,
    order_status_id integer NOT NULL
);


ALTER TABLE public.transaction_header OWNER TO kuitkatnekat;

--
-- TOC entry 233 (class 1259 OID 16806)
-- Name: transaction_header_branch_id_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.transaction_header_branch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaction_header_branch_id_seq OWNER TO kuitkatnekat;

--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 233
-- Name: transaction_header_branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.transaction_header_branch_id_seq OWNED BY public.transaction_header.branch_id;


--
-- TOC entry 234 (class 1259 OID 16807)
-- Name: transaction_header_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.transaction_header_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaction_header_employee_id_seq OWNER TO kuitkatnekat;

--
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 234
-- Name: transaction_header_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.transaction_header_employee_id_seq OWNED BY public.transaction_header.employee_id;


--
-- TOC entry 232 (class 1259 OID 16805)
-- Name: transaction_header_id_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.transaction_header_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaction_header_id_seq OWNER TO kuitkatnekat;

--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 232
-- Name: transaction_header_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.transaction_header_id_seq OWNED BY public.transaction_header.id;


--
-- TOC entry 235 (class 1259 OID 16808)
-- Name: transaction_header_order_status_id_seq; Type: SEQUENCE; Schema: public; Owner: kuitkatnekat
--

CREATE SEQUENCE public.transaction_header_order_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaction_header_order_status_id_seq OWNER TO kuitkatnekat;

--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 235
-- Name: transaction_header_order_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kuitkatnekat
--

ALTER SEQUENCE public.transaction_header_order_status_id_seq OWNED BY public.transaction_header.order_status_id;


--
-- TOC entry 3233 (class 2604 OID 16691)
-- Name: branch id; Type: DEFAULT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.branch ALTER COLUMN id SET DEFAULT nextval('public.branch_id_seq'::regclass);


--
-- TOC entry 3234 (class 2604 OID 16747)
-- Name: employee id; Type: DEFAULT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.employee ALTER COLUMN id SET DEFAULT nextval('public.employee_id_seq'::regclass);


--
-- TOC entry 3235 (class 2604 OID 16748)
-- Name: employee branch_id; Type: DEFAULT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.employee ALTER COLUMN branch_id SET DEFAULT nextval('public.employee_branch_id_seq'::regclass);


--
-- TOC entry 3237 (class 2604 OID 16771)
-- Name: menu id; Type: DEFAULT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.menu ALTER COLUMN id SET DEFAULT nextval('public.menu_id_seq'::regclass);


--
-- TOC entry 3236 (class 2604 OID 16761)
-- Name: menu_type id; Type: DEFAULT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.menu_type ALTER COLUMN id SET DEFAULT nextval('public.menu_type_id_seq'::regclass);


--
-- TOC entry 3239 (class 2604 OID 16802)
-- Name: order_status_type id; Type: DEFAULT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.order_status_type ALTER COLUMN id SET DEFAULT nextval('public.order_status_type_id_seq'::regclass);


--
-- TOC entry 3238 (class 2604 OID 16794)
-- Name: seat_type id; Type: DEFAULT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.seat_type ALTER COLUMN id SET DEFAULT nextval('public.seat_type_id_seq'::regclass);


--
-- TOC entry 3242 (class 2604 OID 16899)
-- Name: transaction_detail_menu id; Type: DEFAULT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.transaction_detail_menu ALTER COLUMN id SET DEFAULT nextval('public.transaction_detail_menu_id_seq'::regclass);


--
-- TOC entry 3241 (class 2604 OID 16894)
-- Name: transaction_detail_seat id; Type: DEFAULT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.transaction_detail_seat ALTER COLUMN id SET DEFAULT nextval('public.transaction_detail_seat_id_seq'::regclass);


--
-- TOC entry 3240 (class 2604 OID 16812)
-- Name: transaction_header id; Type: DEFAULT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.transaction_header ALTER COLUMN id SET DEFAULT nextval('public.transaction_header_id_seq'::regclass);


--
-- TOC entry 3413 (class 0 OID 16688)
-- Dependencies: 216
-- Data for Name: branch; Type: TABLE DATA; Schema: public; Owner: kuitkatnekat
--

COPY public.branch (id, location) FROM stdin;
1	Bandung
2	Jakarta
3	Bali
4	Surabaya
5	Samarinda
6	Padang
\.


--
-- TOC entry 3416 (class 0 OID 16744)
-- Dependencies: 219
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: kuitkatnekat
--

COPY public.employee (id, name, branch_id) FROM stdin;
1	Aditya	1
2	Karina	2
3	Luke	3
4	Fajri	4
5	Mulia	5
6	Mangala	6
\.


--
-- TOC entry 3423 (class 0 OID 16768)
-- Dependencies: 226
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: kuitkatnekat
--

COPY public.menu (id, name, description, price, menu_type_id, branch_id, location) FROM stdin;
1	Sate Kambing	\N	35000	1	\N	\N
2	Es Teler	\N	20000	1	\N	\N
3	Bakso Ayam	\N	25000	1	\N	\N
4	Nasi Goreng Gila LaperAh	Nasi goreng gila nan spesial dengan bumbu khas Restoran LaperAh	20000	2	\N	\N
5	Bebek Betutu Gila LaperAh	Bebek Betutu khas Bali dengan bumbu rahasia Restoran LaperAh	35000	2	\N	\N
6	Lawar Ayam Gila LaperAh	Lawar ayam dengan bumbu pedas Bali nan rahasia khas Restoran LaperAh	28000	2	\N	\N
7	Sate Karak	Sate Karak khas Ampel ni bos	20000	3	4	Ampel
8	Tahu Tek	Tahu dan lontong yang di potong-potong dan disiram dengan saus kacang	18000	3	4	Lamongan
9	Gence Ruan	Masakan rica-rica ikan gabus khas dari Kutai	26000	3	5	Kutai
10	Sate Payau	Ikan gabus yang disajikan bersama siraman sambal goreng	35000	3	5	Kutai
11	Rendang	Makanan terenak di dunia pokoknya	30000	3	6	Minangkabau
12	Sate Padang	Sate daging dengan bumbu kuah kacang kental pedas	25000	3	6	Padang Panjang
\.


--
-- TOC entry 3418 (class 0 OID 16758)
-- Dependencies: 221
-- Data for Name: menu_type; Type: TABLE DATA; Schema: public; Owner: kuitkatnekat
--

COPY public.menu_type (id, name) FROM stdin;
1	General
2	Special
3	Local Special
\.


--
-- TOC entry 3428 (class 0 OID 16799)
-- Dependencies: 231
-- Data for Name: order_status_type; Type: TABLE DATA; Schema: public; Owner: kuitkatnekat
--

COPY public.order_status_type (id, name) FROM stdin;
1	In Reserve
2	In Order
3	Finalized
\.


--
-- TOC entry 3426 (class 0 OID 16791)
-- Dependencies: 229
-- Data for Name: seat_type; Type: TABLE DATA; Schema: public; Owner: kuitkatnekat
--

COPY public.seat_type (id, name, capacity) FROM stdin;
1	Romantic	2
2	General	4
3	Family	10
\.


--
-- TOC entry 3439 (class 0 OID 16867)
-- Dependencies: 242
-- Data for Name: transaction_detail_menu; Type: TABLE DATA; Schema: public; Owner: kuitkatnekat
--

COPY public.transaction_detail_menu (transaction_id, menu_id, quantity, id) FROM stdin;
1	1	2	4
1	2	4	1
\.


--
-- TOC entry 3437 (class 0 OID 16836)
-- Dependencies: 240
-- Data for Name: transaction_detail_seat; Type: TABLE DATA; Schema: public; Owner: kuitkatnekat
--

COPY public.transaction_detail_seat (transaction_id, seat_type_id, person, id) FROM stdin;
1	1	2	1
\.


--
-- TOC entry 3433 (class 0 OID 16809)
-- Dependencies: 236
-- Data for Name: transaction_header; Type: TABLE DATA; Schema: public; Owner: kuitkatnekat
--

COPY public.transaction_header (id, branch_id, employee_id, customer_name, order_status_id) FROM stdin;
2	2	2	Kirana	1
1	1	1	bob	3
\.


--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 215
-- Name: branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.branch_id_seq', 6, true);


--
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 218
-- Name: employee_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.employee_branch_id_seq', 1, false);


--
-- TOC entry 3466 (class 0 OID 0)
-- Dependencies: 217
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.employee_id_seq', 6, true);


--
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 225
-- Name: menu_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.menu_branch_id_seq', 1, false);


--
-- TOC entry 3468 (class 0 OID 0)
-- Dependencies: 222
-- Name: menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.menu_id_seq', 12, true);


--
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 224
-- Name: menu_menu_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.menu_menu_type_id_seq', 1, false);


--
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 223
-- Name: menu_price_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.menu_price_seq', 1, false);


--
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 220
-- Name: menu_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.menu_type_id_seq', 3, true);


--
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 230
-- Name: order_status_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.order_status_type_id_seq', 3, true);


--
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 228
-- Name: seat_type_capacity_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.seat_type_capacity_seq', 1, false);


--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 227
-- Name: seat_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.seat_type_id_seq', 4, true);


--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 241
-- Name: transaction_detail_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.transaction_detail_menu_id_seq', 1, true);


--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 237
-- Name: transaction_detail_seat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.transaction_detail_seat_id_seq', 1, true);


--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 239
-- Name: transaction_detail_seat_person_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.transaction_detail_seat_person_seq', 1, false);


--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 238
-- Name: transaction_detail_seat_seat_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.transaction_detail_seat_seat_type_id_seq', 1, false);


--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 233
-- Name: transaction_header_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.transaction_header_branch_id_seq', 1, false);


--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 234
-- Name: transaction_header_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.transaction_header_employee_id_seq', 1, false);


--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 232
-- Name: transaction_header_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.transaction_header_id_seq', 2, true);


--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 235
-- Name: transaction_header_order_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kuitkatnekat
--

SELECT pg_catalog.setval('public.transaction_header_order_status_id_seq', 1, false);


--
-- TOC entry 3244 (class 2606 OID 16693)
-- Name: branch branch_pkey; Type: CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_pkey PRIMARY KEY (id);


--
-- TOC entry 3246 (class 2606 OID 16750)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- TOC entry 3250 (class 2606 OID 16778)
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id);


--
-- TOC entry 3248 (class 2606 OID 16763)
-- Name: menu_type menu_type_pkey; Type: CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.menu_type
    ADD CONSTRAINT menu_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3254 (class 2606 OID 16804)
-- Name: order_status_type order_status_type_pkey; Type: CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.order_status_type
    ADD CONSTRAINT order_status_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3252 (class 2606 OID 16797)
-- Name: seat_type seat_type_pkey; Type: CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.seat_type
    ADD CONSTRAINT seat_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3258 (class 2606 OID 16892)
-- Name: transaction_detail_menu transaction_detail_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.transaction_detail_menu
    ADD CONSTRAINT transaction_detail_menu_pkey PRIMARY KEY (id);


--
-- TOC entry 3256 (class 2606 OID 16817)
-- Name: transaction_header transaction_header_pkey; Type: CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.transaction_header
    ADD CONSTRAINT transaction_header_pkey PRIMARY KEY (id);


--
-- TOC entry 3259 (class 2606 OID 16751)
-- Name: employee employee_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3260 (class 2606 OID 16784)
-- Name: menu menu_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3261 (class 2606 OID 16779)
-- Name: menu menu_menu_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_menu_type_id_fkey FOREIGN KEY (menu_type_id) REFERENCES public.menu_type(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3267 (class 2606 OID 16873)
-- Name: transaction_detail_menu transaction_detail_menu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.transaction_detail_menu
    ADD CONSTRAINT transaction_detail_menu_id_fkey FOREIGN KEY (transaction_id) REFERENCES public.transaction_header(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3268 (class 2606 OID 16878)
-- Name: transaction_detail_menu transaction_detail_menu_menu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.transaction_detail_menu
    ADD CONSTRAINT transaction_detail_menu_menu_id_fkey FOREIGN KEY (menu_id) REFERENCES public.menu(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3265 (class 2606 OID 16844)
-- Name: transaction_detail_seat transaction_detail_seat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.transaction_detail_seat
    ADD CONSTRAINT transaction_detail_seat_id_fkey FOREIGN KEY (transaction_id) REFERENCES public.transaction_header(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3266 (class 2606 OID 16849)
-- Name: transaction_detail_seat transaction_detail_seat_seat_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.transaction_detail_seat
    ADD CONSTRAINT transaction_detail_seat_seat_type_id_fkey FOREIGN KEY (seat_type_id) REFERENCES public.seat_type(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3262 (class 2606 OID 16818)
-- Name: transaction_header transaction_header_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.transaction_header
    ADD CONSTRAINT transaction_header_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3263 (class 2606 OID 16823)
-- Name: transaction_header transaction_header_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.transaction_header
    ADD CONSTRAINT transaction_header_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3264 (class 2606 OID 16828)
-- Name: transaction_header transaction_header_order_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kuitkatnekat
--

ALTER TABLE ONLY public.transaction_header
    ADD CONSTRAINT transaction_header_order_status_id_fkey FOREIGN KEY (order_status_id) REFERENCES public.order_status_type(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2024-01-08 23:24:11

--
-- PostgreSQL database dump complete
--

