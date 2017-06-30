--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO frcake;

--
-- Name: average_caches; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE average_caches (
    id integer NOT NULL,
    rater_id integer,
    rateable_type character varying,
    rateable_id integer,
    avg double precision NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE average_caches OWNER TO frcake;

--
-- Name: average_caches_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE average_caches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE average_caches_id_seq OWNER TO frcake;

--
-- Name: average_caches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE average_caches_id_seq OWNED BY average_caches.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying,
    parent_id integer,
    lft integer NOT NULL,
    rgt integer NOT NULL,
    depth integer DEFAULT 0 NOT NULL,
    children_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE categories OWNER TO frcake;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO frcake;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: classifieds; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE classifieds (
    id integer NOT NULL,
    make character varying,
    model character varying,
    year character varying,
    color character varying,
    title character varying,
    condition character varying,
    offer character varying,
    make_country character varying,
    description text,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    category_id integer,
    sold boolean DEFAULT false,
    hold boolean DEFAULT false,
    price_cents integer,
    giveaway boolean DEFAULT false,
    trade boolean DEFAULT false,
    sell boolean DEFAULT true,
    askingfor boolean DEFAULT false
);


ALTER TABLE classifieds OWNER TO frcake;

--
-- Name: classifieds_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE classifieds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE classifieds_id_seq OWNER TO frcake;

--
-- Name: classifieds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE classifieds_id_seq OWNED BY classifieds.id;


--
-- Name: favorite_classifieds; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE favorite_classifieds (
    id integer NOT NULL,
    user_id integer,
    classified_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE favorite_classifieds OWNER TO frcake;

--
-- Name: favorite_classifieds_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE favorite_classifieds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE favorite_classifieds_id_seq OWNER TO frcake;

--
-- Name: favorite_classifieds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE favorite_classifieds_id_seq OWNED BY favorite_classifieds.id;


--
-- Name: flags; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE flags (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    classified_id integer
);


ALTER TABLE flags OWNER TO frcake;

--
-- Name: flags_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE flags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE flags_id_seq OWNER TO frcake;

--
-- Name: flags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE flags_id_seq OWNED BY flags.id;


--
-- Name: mailboxer_conversation_opt_outs; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE mailboxer_conversation_opt_outs (
    id integer NOT NULL,
    unsubscriber_type character varying,
    unsubscriber_id integer,
    conversation_id integer
);


ALTER TABLE mailboxer_conversation_opt_outs OWNER TO frcake;

--
-- Name: mailboxer_conversation_opt_outs_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE mailboxer_conversation_opt_outs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mailboxer_conversation_opt_outs_id_seq OWNER TO frcake;

--
-- Name: mailboxer_conversation_opt_outs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE mailboxer_conversation_opt_outs_id_seq OWNED BY mailboxer_conversation_opt_outs.id;


--
-- Name: mailboxer_conversations; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE mailboxer_conversations (
    id integer NOT NULL,
    subject character varying DEFAULT ''::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE mailboxer_conversations OWNER TO frcake;

--
-- Name: mailboxer_conversations_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE mailboxer_conversations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mailboxer_conversations_id_seq OWNER TO frcake;

--
-- Name: mailboxer_conversations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE mailboxer_conversations_id_seq OWNED BY mailboxer_conversations.id;


--
-- Name: mailboxer_notifications; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE mailboxer_notifications (
    id integer NOT NULL,
    type character varying,
    body text,
    subject character varying DEFAULT ''::character varying,
    sender_type character varying,
    sender_id integer,
    conversation_id integer,
    draft boolean DEFAULT false,
    notification_code character varying,
    notified_object_type character varying,
    notified_object_id integer,
    attachment character varying,
    updated_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    global boolean DEFAULT false,
    expires timestamp without time zone
);


ALTER TABLE mailboxer_notifications OWNER TO frcake;

--
-- Name: mailboxer_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE mailboxer_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mailboxer_notifications_id_seq OWNER TO frcake;

--
-- Name: mailboxer_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE mailboxer_notifications_id_seq OWNED BY mailboxer_notifications.id;


--
-- Name: mailboxer_receipts; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE mailboxer_receipts (
    id integer NOT NULL,
    receiver_type character varying,
    receiver_id integer,
    notification_id integer NOT NULL,
    is_read boolean DEFAULT false,
    trashed boolean DEFAULT false,
    deleted boolean DEFAULT false,
    mailbox_type character varying(25),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_delivered boolean DEFAULT false,
    delivery_method character varying,
    message_id character varying
);


ALTER TABLE mailboxer_receipts OWNER TO frcake;

--
-- Name: mailboxer_receipts_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE mailboxer_receipts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mailboxer_receipts_id_seq OWNER TO frcake;

--
-- Name: mailboxer_receipts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE mailboxer_receipts_id_seq OWNED BY mailboxer_receipts.id;


--
-- Name: makes; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE makes (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE makes OWNER TO frcake;

--
-- Name: makes_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE makes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE makes_id_seq OWNER TO frcake;

--
-- Name: makes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE makes_id_seq OWNED BY makes.id;


--
-- Name: overall_averages; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE overall_averages (
    id integer NOT NULL,
    rateable_type character varying,
    rateable_id integer,
    overall_avg double precision NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE overall_averages OWNER TO frcake;

--
-- Name: overall_averages_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE overall_averages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE overall_averages_id_seq OWNER TO frcake;

--
-- Name: overall_averages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE overall_averages_id_seq OWNED BY overall_averages.id;


--
-- Name: photos; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE photos (
    id integer NOT NULL,
    classified_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone,
    service_id integer
);


ALTER TABLE photos OWNER TO frcake;

--
-- Name: photos_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE photos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE photos_id_seq OWNER TO frcake;

--
-- Name: photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE photos_id_seq OWNED BY photos.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE posts (
    id integer NOT NULL,
    title character varying,
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE posts OWNER TO frcake;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE posts_id_seq OWNER TO frcake;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE posts_id_seq OWNED BY posts.id;


--
-- Name: rates; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE rates (
    id integer NOT NULL,
    rater_id integer,
    rateable_type character varying,
    rateable_id integer,
    stars double precision NOT NULL,
    dimension character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE rates OWNER TO frcake;

--
-- Name: rates_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rates_id_seq OWNER TO frcake;

--
-- Name: rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE rates_id_seq OWNED BY rates.id;


--
-- Name: rating_caches; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE rating_caches (
    id integer NOT NULL,
    cacheable_type character varying,
    cacheable_id integer,
    avg double precision NOT NULL,
    qty integer NOT NULL,
    dimension character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE rating_caches OWNER TO frcake;

--
-- Name: rating_caches_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE rating_caches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rating_caches_id_seq OWNER TO frcake;

--
-- Name: rating_caches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE rating_caches_id_seq OWNED BY rating_caches.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO frcake;

--
-- Name: services; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE services (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    categ character varying,
    specialty character varying,
    regions character varying,
    price_cents integer,
    title character varying,
    description text,
    user_id integer
);


ALTER TABLE services OWNER TO frcake;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE services_id_seq OWNER TO frcake;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE services_id_seq OWNED BY services.id;


--
-- Name: taggings; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE taggings (
    id integer NOT NULL,
    tag_id integer,
    taggable_type character varying,
    taggable_id integer,
    tagger_type character varying,
    tagger_id integer,
    context character varying(128),
    created_at timestamp without time zone
);


ALTER TABLE taggings OWNER TO frcake;

--
-- Name: taggings_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE taggings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE taggings_id_seq OWNER TO frcake;

--
-- Name: taggings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE taggings_id_seq OWNED BY taggings.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE tags (
    id integer NOT NULL,
    name character varying,
    taggings_count integer DEFAULT 0
);


ALTER TABLE tags OWNER TO frcake;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tags_id_seq OWNER TO frcake;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE users (
    id integer NOT NULL,
    first_name character varying,
    email character varying DEFAULT ''::character varying NOT NULL,
    region character varying,
    telephone character varying,
    stars character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying
);


ALTER TABLE users OWNER TO frcake;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO frcake;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY average_caches ALTER COLUMN id SET DEFAULT nextval('average_caches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY classifieds ALTER COLUMN id SET DEFAULT nextval('classifieds_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY favorite_classifieds ALTER COLUMN id SET DEFAULT nextval('favorite_classifieds_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY flags ALTER COLUMN id SET DEFAULT nextval('flags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY mailboxer_conversation_opt_outs ALTER COLUMN id SET DEFAULT nextval('mailboxer_conversation_opt_outs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY mailboxer_conversations ALTER COLUMN id SET DEFAULT nextval('mailboxer_conversations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY mailboxer_notifications ALTER COLUMN id SET DEFAULT nextval('mailboxer_notifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY mailboxer_receipts ALTER COLUMN id SET DEFAULT nextval('mailboxer_receipts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY makes ALTER COLUMN id SET DEFAULT nextval('makes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY overall_averages ALTER COLUMN id SET DEFAULT nextval('overall_averages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY photos ALTER COLUMN id SET DEFAULT nextval('photos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY posts ALTER COLUMN id SET DEFAULT nextval('posts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY rates ALTER COLUMN id SET DEFAULT nextval('rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY rating_caches ALTER COLUMN id SET DEFAULT nextval('rating_caches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY services ALTER COLUMN id SET DEFAULT nextval('services_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY taggings ALTER COLUMN id SET DEFAULT nextval('taggings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2016-11-22 19:22:39.329434	2016-11-22 19:22:39.329434
\.


--
-- Data for Name: average_caches; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY average_caches (id, rater_id, rateable_type, rateable_id, avg, created_at, updated_at) FROM stdin;
\.


--
-- Name: average_caches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('average_caches_id_seq', 1, false);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY categories (id, name, parent_id, lft, rgt, depth, children_count) FROM stdin;
170	Ολόκληρα συστήματα	8	140	141	1	0
41	Ηλεκτρικές	2	4	5	1	0
46	Κάλυμα ενισχυτή	3	16	17	1	0
42	Ακουστικές	2	6	7	1	0
43	Κλασσικές	2	8	9	1	0
47	Καλώδια	3	18	19	1	0
44	Αριστερόχειρες	2	10	11	1	0
163	Μείκτης	7	124	125	1	0
45	7-χορδες +	2	12	13	1	0
48	Κάπο and Slides	3	20	21	1	0
153	Βιόλα	5	90	91	1	0
169	CD Players	7	136	137	1	0
164	Εφέ	7	126	127	1	0
190	Μηχανήματα καπνού	183	179	180	2	0
79	Καμπίνες Μπάσου	4	74	75	1	0
165	Πικάπ	7	128	129	1	0
184	Εξοπλισμός φωτισμού	183	167	168	2	0
65	Χορδές Ηλεκτρικής Κιθάρας	58	49	50	2	0
61	Σκληρές Θήκες Κιθάρας	49	23	24	2	0
166	Controllers	7	130	131	1	0
194	Midi Controllers	13	306	307	1	0
167	Ολόκληρα Set	7	132	133	1	0
185	Προβολείς	183	169	170	2	0
75	Ακουστικών οργάνων	4	66	67	1	0
209	Μικρόφωνα	15	366	367	1	0
76	Attenuators	4	68	69	1	0
210	Κάρτες ήχου	15	368	369	1	0
66	Χορδές Κλασσικής Κιθάρας	58	51	52	2	0
186	Κινούμενα φώτα	183	171	172	2	0
193	Eurorack	13	304	305	1	0
211	Κονβέρτορες (AD/DA)	15	370	371	1	0
77	Μπάσου	4	70	71	1	0
62	Θήκες Κιθάρας	49	25	26	2	0
212	Monitors	15	372	373	1	0
187	LED	183	173	174	2	0
78	Κεφαλές Μπάσου 	4	72	73	1	0
80	Κιθάρας	4	76	77	1	0
152	Βιολί	5	88	89	1	0
63	Σκληρές Θήκες Μπάσου	49	27	28	2	0
213	DI Boxes	15	374	375	1	0
168	Ακουστικά	7	134	135	1	0
49	Θήκες and Gig Bags	3	22	31	1	0
50	Ακουστικά	3	32	33	1	0
51	Αφυγραντήρες	3	34	35	1	0
52	Merchandise	3	36	37	1	0
53	Μετρονόμοι	3	38	39	1	0
54	Πένες	3	40	41	1	0
55	Τροφοδοτικά	3	42	43	1	0
56	Stands	3	44	45	1	0
57	Ζώνες	3	46	47	1	0
64	Θήκες Μπάσου	49	29	30	2	0
81	Κεφαλές Κιθάρας 	4	78	79	1	0
214	Έπιπλα & Racks	15	376	377	1	0
67	Χορδές Ακουστικής Κιθάρας	58	53	54	2	0
188	Strobo	183	175	176	2	0
68	Χορδές Μπάσου	58	55	56	2	0
58	Χορδές	3	48	59	1	0
59	Εργαλεία	3	60	61	1	0
60	Κουρδιστήρια	3	62	63	1	0
69	Άλλες Χορδές	58	57	58	2	0
82	Καμπίνες Κιθάρας	4	80	81	1	0
195	Ψηφιακά Synths	13	308	309	1	0
215	Κονσόλες	15	378	379	1	0
189	Laser	183	177	178	2	0
197	Αναλογικά Synths	13	312	313	1	0
83	Πλήκτρων	4	82	83	1	0
216	Προενισχυτές	15	380	381	1	0
84	Modeling Amps	4	84	85	1	0
154	Τσέλλο	5	92	93	1	0
196	Ψηφιακά πιάνο	13	310	311	1	0
217	Summing Box	15	382	383	1	0
198	Workstations	13	314	315	1	0
15	ProAudio	\N	365	402	0	0
191	Κονσόλες φωτισμού	183	181	182	2	0
199	Modular Synths	13	316	317	1	0
11	Παραδοσιακά	\N	241	272	0	0
12	Hi-Fi	\N	273	302	0	0
10	Πετάλια	\N	205	240	0	0
95	Κασετόφωνα	12	294	295	1	0
183	Φώτα	8	166	185	1	0
119	Parts and Accessories	9	202	203	1	0
192	Σκελετοί	183	183	184	2	0
200	Cases	13	318	319	1	0
201	Ηλεκτρικά πιάνο	13	320	321	1	0
202	Organs	13	322	323	1	0
203	Stands	13	324	325	1	0
204	Rackmount Synths	13	326	327	1	0
205	Pedals	13	328	329	1	0
206	Γκραν πιάνο	13	330	331	1	0
207	Καθίσματα	13	332	333	1	0
208	Όρθια πιάνο	13	334	335	1	0
111	Διάφορα	14	362	363	1	0
13	Synths	\N	303	336	0	0
107	Pickguards	14	354	355	1	0
108	Ηχεία	14	356	357	1	0
110	Κλειδιά	14	360	361	1	0
14	Parts	\N	337	364	0	0
218	500 Series	15	384	385	1	0
219	Κομπρέσσορες	15	386	387	1	0
220	EQ	15	388	389	1	0
221	Reverb & Delay	15	390	391	1	0
222	Ηχομόνωση	15	392	393	1	0
223	PatchBay	15	394	395	1	0
224	Gates/Expanders	15	396	397	1	0
225	Ταινίες – Πολυκάναλα	15	398	399	1	0
226	DAT	15	400	401	1	0
171	Ηχεία	8	142	143	1	0
176	Ασύρματος εξοπλισμός	8	152	153	1	0
172	Μείκτες – Κονσόλες	8	144	145	1	0
102	Σώματα Κιθάρας	14	344	345	1	0
104	Μαγνήτες Κιθάρας	14	348	349	1	0
173	Τελικοί Ενισχυτές	8	146	147	1	0
178	Stands	8	156	157	1	0
174	Crossovers	8	148	149	1	0
2	Ηλεκτρικές κιθάρες	\N	3	14	0	0
156	Σαξόφωνο	5	96	97	1	0
175	Μικρόφωνα	8	150	151	1	0
177	In-Ear Monitors	8	154	155	1	0
155	Τρομπέτα	5	94	95	1	0
3	Αξεσουάρ	\N	15	64	0	0
90	Προενισχυτές	12	284	285	1	0
151	Ούτι	11	270	271	1	0
149	Λαούτο	11	266	267	1	0
141	Ακορντεόν	11	250	251	1	0
142	Μπουζούκι	11	252	253	1	0
137	Γιουκαλίλι	11	242	243	1	0
120	Overdrive	10	206	207	1	0
121	Distortion	10	208	209	1	0
122	Fuzz	10	210	211	1	0
123	Delay	10	212	213	1	0
157	Τούμπα	5	98	99	1	0
4	Ενισχυτές	\N	65	86	0	0
105	Knobs	14	350	351	1	0
179	Καλώδια	8	158	159	1	0
106	Εξαρτήματα Πεταλιών	14	352	353	1	0
180	Βύσματα	8	160	161	1	0
158	Φλάουτο	5	100	101	1	0
160	Όμποε	5	104	105	1	0
159	Κλαρινέτο	5	102	103	1	0
161	Τρομπόνι	5	106	107	1	0
89	Ακουστικά	12	282	283	1	0
143	Μπαγλαμάς	11	254	255	1	0
144	Λύρα	11	256	257	1	0
112	Διάφορα Κρουστά	9	188	189	1	0
91	Δέκτες	12	286	287	1	0
145	Κλαρίνο	11	258	259	1	0
92	Ηχεία	12	288	289	1	0
146	Τζουράς	11	260	261	1	0
96	Ραδιόφωνα	12	296	297	1	0
113	Κύμβαλα	9	190	191	1	0
97	Πικάπ	12	298	299	1	0
115	Κομμάτια Set	9	194	195	1	0
98	Εξαρτήματα και Αξεσουάρ	12	300	301	1	0
117	Τύμπανα χειρός	9	198	199	1	0
118	Pad Controllers	9	200	201	1	0
134	Noise Gate	10	234	235	1	0
135	Bass FX	10	236	237	1	0
136	Harmonizer	10	238	239	1	0
70	4-χορδο	6	112	113	1	0
71	5-χορδο+	6	114	115	1	0
72	Ακουστικό	6	116	117	1	0
73	Αριστερόχειρες	6	118	119	1	0
74	Κόντρα Μπάσο	6	120	121	1	0
6	Μπάσο	\N	111	122	0	0
5	Ορχηστρικά	\N	87	110	0	0
162	Κόντρα Μπάσο	5	108	109	1	0
99	Parts Ενισχυτών	14	338	339	1	0
103	Parts Κιθάρας	14	346	347	1	0
101	Μαγνήτες Μπάσου	14	342	343	1	0
109	Λάμπες	14	358	359	1	0
100	Parts Μπάσου	14	340	341	1	0
7	DJ	\N	123	138	0	0
150	Σάζι	11	268	269	1	0
94	Μπομπινόφωνα	12	292	293	1	0
85	Ενισχυτές	12	274	275	1	0
86	Καλώδια	12	276	277	1	0
87	Digital Players	12	278	279	1	0
88	Equalizers	12	280	281	1	0
116	Ηλεκτρονικά Τύμπανα	9	196	197	1	0
114	Drum Machines και Samplers	9	192	193	1	0
181	Εγκαταστάσεις	8	162	163	1	0
148	Καχόν	11	264	265	1	0
8	PA	\N	139	186	0	0
9	Τύμπανα	\N	187	204	0	0
182	DI Boxes	8	164	165	1	0
127	Octave and Pitch	10	220	221	1	0
124	Reverb	10	214	215	1	0
138	Φυσαρμόνικα	11	244	245	1	0
125	Loopers	10	216	217	1	0
131	Pedalboards	10	228	229	1	0
126	Wahs and Filters	10	218	219	1	0
128	Chorus	10	222	223	1	0
133	EQ	10	232	233	1	0
129	Πολυ-εφέ	10	224	225	1	0
130	Κουρδιστήρια	10	226	227	1	0
139	Μπάντζο	11	246	247	1	0
132	Tremolo	10	230	231	1	0
140	Μαντολίνο	11	248	249	1	0
147	Γκάιντα	11	262	263	1	0
93	Subwoofers	12	290	291	1	0
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('categories_id_seq', 226, true);


--
-- Data for Name: classifieds; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY classifieds (id, make, model, year, color, title, condition, offer, make_country, description, user_id, created_at, updated_at, category_id, sold, hold, price_cents, giveaway, trade, sell, askingfor) FROM stdin;
10	Stairville	LED		\N	Stairville LED Flood Panel 150 40° RGB	Καινούριο	\N	China	<p>&nbsp;</p>\r\n<div id="cnp">\r\n<ul>\r\n<li>Floodlight: 150 LEDs, &Oslash; 10 mm</li>\r\n<li>With display to set the functions</li>\r\n<li>DMX Controller, additionally operates in Stand-Alone mode</li>\r\n<li>Very versatile due to thomann its compact size</li>\r\n<li>Through the multi-function bracket can be mounted both on the ground or hanged up</li>\r\n<li>Power supply: AC 240V, 50 Hz</li>\r\n<li>Max Power consumption: 18 W</li>\r\n<li>Dispersion: 40&deg;</li>\r\n<li>DMX In/Output: 3 pol. XLR</li>\r\n<li>Power-Out function during power outage</li>\r\n<li>Control: Display, DMX Address, DMX Mode, Master/Slave Mode, Auto Run Mode, Sound-to-Light Mode</li>\r\n<li>Dimensions: 260 x thomann 68 x 210 mm</li>\r\n<li>Weight: 1,8 kg</li>\r\n</ul>\r\n</div>	2	2016-12-09 13:28:05.333734	2016-12-09 13:28:05.333734	187	f	f	16000	f	f	t	f
11	Korg	Volca fm		\N	Volca fm	Άψογη	\N	Japan	<p>Polite volca fm</p>	2	2016-12-09 14:10:35.634849	2016-12-09 14:10:35.634849	195	f	f	10000	f	f	t	f
8	Gibson	Les Paul	2010	\N	Gibson Les Paul Traditional + fender twin	Άψογη	\N	USA	<p>&Pi;&omega;&lambda;&epsilon;&iota;&tau;&alpha;&iota; ή &alpha;&nu;&tau;&alpha;&lambda;&lambda;&alpha;&sigma;&epsilon;&tau;&alpha;&iota; Gibson Les Paul Traditional 2015 Honey Burst &sigma;&epsilon; &kappa;&alpha;&tau;ά&sigma;&tau;&alpha;&sigma;&eta; &beta;&iota;&tau;&rho;ί&nu;&alpha;&sigmaf; &alpha;&pi;&epsilon;ί&rho;&alpha;&chi;&tau;&eta; &mu;&epsilon; &tau;&eta;&nu; &sigma;&kappa;&lambda;&eta;&rho;ή &tau;&eta;&sigmaf; &theta;ή&kappa;&eta; &kappa;&alpha;&iota; &mu;&epsilon; &tau;έ&lambda;&epsilon;&iota;&omicron; &chi;&alpha;&mu;&eta;&lambda;ό &sigma;&epsilon;&tau;ά&rho;&iota;&sigma;&mu;&alpha;. &Epsilon;ί&nu;&alpha;&iota; &sigma;&alpha;&nu; &nu;&alpha; &tau;&eta;&nu; &alpha;&gamma;&omicron;&rho;ά&zeta;&epsilon;&tau;&epsilon; &tau;ώ&rho;&alpha; &alpha;&pi;ό &mu;&alpha;&gamma;&alpha;&zeta;ί. &Tau;&omicron; &chi;&rho;ώ&mu;&alpha; &epsilon;ί&nu;&alpha;&iota; &kappa;&alpha;&tau;&alpha;&pi;&lambda;&eta;&kappa;&tau;&iota;&kappa;ό &kappa;&alpha;&iota; &omicron; &mu;&eta;&chi;&alpha;&nu;&iota;&sigma;&mu;&omicron;&sigmaf; &alpha;&upsilon;&tau;ό&mu;&alpha;&tau;&omicron;&upsilon; &kappa;&omicron;&upsilon;&rho;&delta;ί&sigma;&mu;&alpha;&tau;&omicron;&sigmaf; &alpha;&pi;&lambda;ά &tau;έ&lambda;&epsilon;&iota;&omicron;&sigmaf;!!! &Epsilon;&pi;ί&sigma;&eta;&sigmaf; &epsilon;&chi;&epsilon;&iota; &gamma;ί&nu;&epsilon;&iota; &alpha;&nu;&alpha;&beta;ά&theta;&mu;&iota;&sigma;&eta; &sigma;&tau;&omicron;&upsilon;&sigmaf; &mu;&alpha;&gamma;&nu;&eta;&tau;&epsilon;&sigmaf; &mu;&epsilon; Seymour Duncan SH-1N &kappa;&alpha;&iota; SH-1B.&Omicron;&iota; &mu;&alpha;&gamma;&nu;ή&tau;&epsilon;&sigmaf; &mu;ό&nu;&omicron; έ&chi;&omicron;&upsilon;&nu; &gamma;ύ&rho;&omega; &sigma;&tau;&alpha; 250 &epsilon;&upsilon;&rho;ώ <br />https://www.youtube.com/watch?v=JIpjFKdYthA <br />&Eta; &kappa;&iota;&theta;&alpha;&rho;&alpha; έ&chi;&epsilon;&iota; &alpha;&gamma;&omicron;&rho;&alpha;&sigma;&theta;&epsilon;&iota; 2000 &epsilon;&upsilon;&rho;ώ &alpha;&pi;ό &epsilon;&lambda;&lambda;&eta;&nu;&iota;&kappa;ό &kappa;&alpha;&tau;ά&sigma;&tau;&eta;&mu;&alpha;. <br />&Pi;&omega;&lambda;&epsilon;ί&tau;&alpha;&iota; 1300 &epsilon;&upsilon;&rho;ώ. <br />&Alpha;&xi;ί&alpha; &alpha;&nu;&tau;&alpha;&lambda;&lambda;&alpha;&gamma;ή&sigmaf; &tau;&omicron;&upsilon;&lambda;ά&chi;&iota;&sigma;&tau;&omicron;&nu; 1650 &epsilon;&upsilon;&rho;ώ. <br />Ή &kappa;&iota;&theta;ά&rho;&alpha; &sigma;&upsilon;&nu;&omicron;&delta;&epsilon;ύ&epsilon;&tau;&alpha;&iota; &alpha;&pi;ό ό&lambda;&alpha; &tau;&alpha; &epsilon;&pi;ί&sigma;&eta;&mu;&alpha; &chi;&alpha;&rho;&tau;&iota;ά &tau;&eta;&sigmaf; &kappa;&alpha;&theta;ώ&sigmaf; &kappa;&alpha;&iota; &alpha;&pi;ό &tau;&eta;&nu; &alpha;&pi;ό&delta;&epsilon;&iota;&xi;&eta; &alpha;&gamma;&omicron;&rho;ά&sigmaf; <br /> <br />&Gamma;&iota;&alpha; &alpha;&nu;&tau;&alpha;&lambda;&lambda;&alpha;&gamma;έ&sigmaf; &theta;&alpha; &mu;&epsilon; &epsilon;&nu;&delta;&iota;έ&phi;&epsilon;&rho;&epsilon; &kappa;ά&pi;&omicron;&iota;&alpha; &alpha;&pi;ό &tau;&iota;&sigmaf; &pi;&alpha;&rho;&alpha;&kappa;ά&tau;&omega;: <br />&Mu;usicman jp6 ή Luke <br />PRS custom 22/24 ή PRS Santana <br />Suhr modern pro/ classic pro <br />Fender Eric Johnson stratocaster <br />Fender custom shop strat ή Fender deluxe strat 2012 &kappa;&alpha;&iota; &mu;&epsilon;&tau;ά <br /> <br />&sigma;&epsilon; &pi;&alpha;&rho;ό&mu;&omicron;&iota;&alpha; &kappa;&alpha;&tau;ά&sigma;&tau;&alpha;&sigma;&eta; &mu;&epsilon; &tau;&eta;&nu; &delta;&iota;&kappa;ή &mu;&omicron;&upsilon; &kappa;&iota;&theta;ά&rho;&alpha;. <br />&Epsilon;&pi;ί&sigma;&eta;&sigmaf; &alpha;&nu; ή&tau;&alpha;&nu; &kappa;&alpha;&iota; &sigma;&epsilon; &kappa;&alpha;&tau;ά&sigma;&tau;&alpha;&sigma;&eta; Relic &delta;&epsilon;&nu; &theta;&alpha; &mu;&epsilon; &pi;ή&rho;&alpha;&zeta;&epsilon;. <br /> <br />&Gamma;&iota;&alpha; &kappa;ά&tau;&iota; &tau;&omicron; &epsilon;&xi;&alpha;&iota;&rho;&epsilon;&tau;&iota;&kappa;ό &theta;&alpha; &mu;&pi;&omicron;&rho;&omicron;ύ&sigma;&alpha; &nu;&alpha; &delta;&iota;&alpha;&theta;έ&sigma;&omega; &kappa;&alpha;&iota; έ&nu;&alpha;&nu; &kappa;&alpha;&tau;&alpha;&pi;&lambda;&eta;&kappa;&tau;&iota;&kappa;ό &epsilon;&nu;&iota;&sigma;&chi;&upsilon;&tau;ή Fender the twin Red Knobs &sigma;&epsilon; &pi;ά&rho;&alpha; &pi;&omicron;&lambda;ύ &kappa;&alpha;&lambda;ή &kappa;&alpha;&tau;ά&sigma;&tau;&alpha;&sigma;&eta; &gamma;&iota;&alpha; &alpha;&nu;&tau;&alpha;&lambda;&lambda;&alpha;&gamma;ή &pi;&omicron;&upsilon; &mu;&pi;&omicron;&rho;&epsilon;ί &nu;&alpha; &sigma;&upsilon;&nu;&delta;&upsilon;&alpha;&sigma;&tau;&epsilon;ί &mu;&epsilon; &tau;&eta;&nu; &pi;&alpha;&rho;&alpha;&pi;ά&nu;&omega; Gibson</p>	2	2016-11-25 14:08:53.557504	2017-01-10 17:01:50.683333	41	f	f	110000	f	f	t	f
32	2nd Sense Audio	24	423	\N	326	Άψογη	\N	USA	<p>326</p>	1	2017-02-18 13:32:18.32778	2017-02-18 13:32:18.32778	42	f	f	23600	f	f	t	f
33	Advance Music	saf	2156	\N	awfawf	Καινούριο	\N	Canada	<p>awfgagawgag</p>	1	2017-02-20 02:14:18.167837	2017-02-20 02:14:18.167837	2	f	f	125600	f	f	t	f
19	Acoustic Image	case	1256	\N	case	Καλή	\N	England	<p>case</p>	1	2017-02-07 21:33:41.360346	2017-02-18 12:26:08.342444	63	f	f	12500	f	f	t	f
34	Fender	Twin Reverb Silverface	1784	\N	Πωλείται Fender Twin Reverb	Άψογη	\N	USA	<p>ags</p>	1	2017-02-20 02:24:17.770899	2017-02-20 02:24:17.770899	80	f	f	126600	f	f	t	f
35	3D Verlag	125	wag	\N	wga	Καλή	\N	France	<p>awgawg</p>	1	2017-02-20 02:27:53.728768	2017-02-20 02:27:53.728768	43	f	f	21500	f	f	t	f
37	Gibson	sg	1262	\N	aswdfaw	Άψογη	\N	USA	<p>wagawg</p>	1	2017-02-20 02:33:37.48521	2017-02-20 02:33:37.48521	41	f	f	2161200	f	f	t	f
38	Roland	TB-303	1980	\N	TB-303	Πολύ καλή	\N	Japan	<p>TB-303TB-303</p>	1	2017-02-20 12:04:38.085649	2017-02-20 12:04:38.085649	197	f	f	300000	f	f	t	f
39	Korg	Volca FM	2016	\N	Volca FM	Καινούριο	\N	Japan	<p>Volca FM</p>	1	2017-02-20 12:06:53.143159	2017-02-20 12:06:53.143159	195	f	f	12000	f	f	t	f
\.


--
-- Name: classifieds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('classifieds_id_seq', 39, true);


--
-- Data for Name: favorite_classifieds; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY favorite_classifieds (id, user_id, classified_id, created_at, updated_at) FROM stdin;
192	1	19	2017-02-09 21:03:20.125192	2017-02-09 21:03:20.125192
199	1	39	2017-04-10 06:34:14.057223	2017-04-10 06:34:14.057223
200	1	8	2017-04-30 19:23:21.19177	2017-04-30 19:23:21.19177
201	1	37	2017-04-30 19:23:22.420942	2017-04-30 19:23:22.420942
\.


--
-- Name: favorite_classifieds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('favorite_classifieds_id_seq', 201, true);


--
-- Data for Name: flags; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY flags (id, created_at, updated_at, user_id, classified_id) FROM stdin;
131	2017-02-07 13:27:13.985583	2017-02-07 13:27:13.985583	1	11
132	2017-02-07 13:27:14.983659	2017-02-07 13:27:14.983659	1	10
98	2017-02-06 23:43:02.708753	2017-02-06 23:43:02.708753	5	11
\.


--
-- Name: flags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('flags_id_seq', 138, true);


--
-- Data for Name: mailboxer_conversation_opt_outs; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY mailboxer_conversation_opt_outs (id, unsubscriber_type, unsubscriber_id, conversation_id) FROM stdin;
\.


--
-- Name: mailboxer_conversation_opt_outs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('mailboxer_conversation_opt_outs_id_seq', 1, false);


--
-- Data for Name: mailboxer_conversations; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY mailboxer_conversations (id, subject, created_at, updated_at) FROM stdin;
1	Volca fm	2016-12-17 13:12:18.376859	2016-12-17 13:12:18.376859
2	Αναλυτική περιγραφή Buffet	2017-01-09 12:01:51.717212	2017-01-09 12:01:51.717212
3	Πωλείται καμπίνα κιθάρας Marshall...	2017-01-09 12:07:20.868745	2017-01-09 12:07:20.868745
4	Πωλείται καμπίνα κιθάρας Marshall...	2017-01-09 12:08:07.232796	2017-01-09 12:08:07.232796
5	Αναλυτική περιγραφή Buffet	2017-01-09 12:10:23.428013	2017-01-09 12:13:28.643749
6	Volca fm	2017-02-07 01:48:04.140924	2017-02-07 01:48:04.140924
7	Volca FM	2017-06-08 18:43:26.571079	2017-06-08 18:43:26.571079
8	326	2017-06-13 20:03:07.769148	2017-06-13 20:03:07.769148
\.


--
-- Name: mailboxer_conversations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('mailboxer_conversations_id_seq', 8, true);


--
-- Data for Name: mailboxer_notifications; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY mailboxer_notifications (id, type, body, subject, sender_type, sender_id, conversation_id, draft, notification_code, notified_object_type, notified_object_id, attachment, updated_at, created_at, global, expires) FROM stdin;
1	Mailboxer::Message	<p>Χαίρεται mpdev , Ενδιαφέρομαι για την αγγελία : Volca fm</p>	Volca fm	User	1	1	f	\N	\N	\N	\N	2016-12-17 13:12:18.376859	2016-12-17 13:12:18.376859	f	\N
2	Mailboxer::Message	<p>Χαίρεται Michael , Ενδιαφέρομαι για την αγγελία : Αναλυτική περιγραφή Buffet</p>\r\n<p> </p>\r\n<p>POSO RE</p>	Αναλυτική περιγραφή Buffet	User	2	2	f	\N	\N	\N	\N	2017-01-09 12:01:51.717212	2017-01-09 12:01:51.717212	f	\N
3	Mailboxer::Message	<p>Χαίρεται Michael , Ενδιαφέρομαι για την αγγελία : Πωλείται καμπίνα κιθάρας Marshall...</p>\r\n<p>asgasgas</p>\r\n<p>gasg</p>\r\n<p>asg</p>\r\n<p>asg</p>\r\n<p>asg</p>\r\n<p>as</p>\r\n<p>gas</p>\r\n<p>gas</p>\r\n<p>g</p>	Πωλείται καμπίνα κιθάρας Marshall...	User	2	3	f	\N	\N	\N	\N	2017-01-09 12:07:20.868745	2017-01-09 12:07:20.868745	f	\N
4	Mailboxer::Message	<p>Χαίρεται Michael , Ενδιαφέρομαι για την αγγελία : Πωλείται καμπίνα κιθάρας Marshall...</p>\r\n<p>test</p>\r\n<p>test</p>	Πωλείται καμπίνα κιθάρας Marshall...	User	2	4	f	\N	\N	\N	\N	2017-01-09 12:08:07.232796	2017-01-09 12:08:07.232796	f	\N
5	Mailboxer::Message	<p>Χαίρεται Michael , Ενδιαφέρομαι για την αγγελία : Αναλυτική περιγραφή Buffet</p>\r\n<p> </p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>	Αναλυτική περιγραφή Buffet	User	2	5	f	\N	\N	\N	\N	2017-01-09 12:10:23.428013	2017-01-09 12:10:23.428013	f	\N
6	Mailboxer::Message	<p>Ok</p>	Αναλυτική περιγραφή Buffet	User	1	5	f	\N	\N	\N	\N	2017-01-09 12:13:26.920337	2017-01-09 12:13:26.920337	f	\N
7	Mailboxer::Message	<p>Χαίρετε mpdev , Ενδιαφέρομαι για την αγγελία : Volca fm</p>\r\n<p>poso re mouni</p>	Volca fm	User	1	6	f	\N	\N	\N	\N	2017-02-07 01:48:04.140924	2017-02-07 01:48:04.140924	f	\N
8	Mailboxer::Message	<p>Χαίρετε Michael , Ενδιαφέρομαι για την αγγελία : Volca FM</p>	Volca FM	User	7	7	f	\N	\N	\N	\N	2017-06-08 18:43:26.571079	2017-06-08 18:43:26.571079	f	\N
9	Mailboxer::Message	<p>Χαίρετε Michael , Ενδιαφέρομαι για την αγγελία : 326</p>	326	User	7	8	f	\N	\N	\N	\N	2017-06-13 20:03:07.769148	2017-06-13 20:03:07.769148	f	\N
\.


--
-- Name: mailboxer_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('mailboxer_notifications_id_seq', 9, true);


--
-- Data for Name: mailboxer_receipts; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY mailboxer_receipts (id, receiver_type, receiver_id, notification_id, is_read, trashed, deleted, mailbox_type, created_at, updated_at, is_delivered, delivery_method, message_id) FROM stdin;
1	User	2	1	f	f	f	inbox	2016-12-17 13:12:18.481426	2016-12-17 13:12:18.481426	f	\N	\N
3	User	1	2	f	f	f	inbox	2017-01-09 12:01:51.812787	2017-01-09 12:01:51.812787	f	\N	\N
5	User	1	3	f	f	f	inbox	2017-01-09 12:07:20.88012	2017-01-09 12:07:20.88012	f	\N	\N
6	User	2	3	t	f	f	sentbox	2017-01-09 12:07:20.881417	2017-01-09 12:07:20.881417	f	\N	\N
8	User	2	4	t	f	f	sentbox	2017-01-09 12:08:07.244971	2017-01-09 12:08:07.244971	f	\N	\N
10	User	2	5	t	f	f	sentbox	2017-01-09 12:10:23.443518	2017-01-09 12:10:23.443518	f	\N	\N
11	User	2	6	f	f	f	inbox	2017-01-09 12:13:26.922914	2017-01-09 12:13:26.922914	f	\N	\N
13	User	2	7	f	f	f	inbox	2017-02-07 01:48:04.170155	2017-02-07 01:48:04.170155	f	\N	\N
14	User	1	7	t	t	t	sentbox	2017-02-07 01:48:04.173144	2017-02-07 01:48:04.173144	f	\N	\N
12	User	1	6	t	t	t	sentbox	2017-01-09 12:13:26.924875	2017-01-09 12:13:26.924875	f	\N	\N
9	User	1	5	f	t	t	inbox	2017-01-09 12:10:23.441316	2017-01-09 12:10:23.441316	f	\N	\N
7	User	1	4	t	t	t	inbox	2017-01-09 12:08:07.243442	2017-01-09 12:08:07.243442	f	\N	\N
2	User	1	1	t	t	t	sentbox	2016-12-17 13:12:18.483993	2016-12-17 13:12:18.483993	f	\N	\N
4	User	2	2	t	t	f	sentbox	2017-01-09 12:01:51.815603	2017-01-09 12:01:51.815603	f	\N	\N
15	User	1	8	f	f	f	inbox	2017-06-08 18:43:26.671559	2017-06-08 18:43:26.671559	f	\N	\N
16	User	7	8	t	f	f	sentbox	2017-06-08 18:43:26.673688	2017-06-08 18:43:26.673688	f	\N	\N
17	User	1	9	f	f	f	inbox	2017-06-13 20:03:07.881983	2017-06-13 20:03:07.881983	f	\N	\N
18	User	7	9	t	f	f	sentbox	2017-06-13 20:03:07.88585	2017-06-13 20:03:07.88585	f	\N	\N
\.


--
-- Name: mailboxer_receipts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('mailboxer_receipts_id_seq', 18, true);


--
-- Data for Name: makes; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY makes (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: makes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('makes_id_seq', 1, false);


--
-- Data for Name: overall_averages; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY overall_averages (id, rateable_type, rateable_id, overall_avg, created_at, updated_at) FROM stdin;
\.


--
-- Name: overall_averages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('overall_averages_id_seq', 1, false);


--
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY photos (id, classified_id, created_at, updated_at, image_file_name, image_content_type, image_file_size, image_updated_at, service_id) FROM stdin;
25	10	2016-12-09 13:28:05.400379	2016-12-09 13:28:05.400379	11588319_800.jpg	image/jpeg	109757	2016-12-09 13:28:05.389174	\N
26	11	2016-12-09 14:10:35.67585	2016-12-09 14:10:35.67585	1481292614665847916676.jpg	image/jpeg	3509675	2016-12-09 14:10:35.659367	\N
94	32	2017-02-20 01:22:39.4483	2017-02-20 01:22:39.4483	Fender-American-Standard-Stratocaster-in-oiled-ash-finish-978x400.jpg	image/jpeg	72921	2017-02-20 01:22:39.435659	\N
95	32	2017-02-20 01:22:39.463115	2017-02-20 01:22:39.463115	images.jpeg	image/jpeg	4512	2017-02-20 01:22:39.455901	\N
96	33	2017-02-20 02:14:18.200322	2017-02-20 02:14:18.200322	universal_audio_710_twin_finity-1469704390-407-e.jpg	image/jpeg	37972	2017-02-20 02:14:18.189787	\N
97	33	2017-02-20 02:14:18.226752	2017-02-20 02:14:18.226752	universal_audio_710_twin_finity-1469704391-198-e.jpg	image/jpeg	58526	2017-02-20 02:14:18.217265	\N
35	19	2017-02-07 21:33:41.398282	2017-02-07 21:33:41.398282	USE_CASE.jpg	image/jpeg	65070	2017-02-07 21:33:41.384108	\N
36	8	2017-02-10 14:27:14.527313	2017-02-18 13:11:45.289985	\N	\N	\N	2017-02-10 14:27:14.517049	\N
98	33	2017-02-20 02:14:18.241671	2017-02-20 02:14:18.241671	universal_audio_710_twin_finity-1469704392-106-e.jpg	image/jpeg	69333	2017-02-20 02:14:18.233068	\N
99	34	2017-02-20 02:24:17.818132	2017-02-20 02:24:17.818132	neumann_kh120_aw_studio_monitors_pair-1473623598-558-e.jpg	image/jpeg	13790	2017-02-20 02:24:17.808067	\N
100	34	2017-02-20 02:24:17.834517	2017-02-20 02:24:17.834517	neumann_kh120_aw_studio_monitors_pair-1473623600-558-e.jpg	image/jpeg	55494	2017-02-20 02:24:17.825766	\N
41	19	2017-02-18 17:55:27.125328	2017-02-18 17:55:27.125328	cabin.jpg	image/jpeg	22830	2017-02-18 17:55:27.11374	\N
42	19	2017-02-18 17:55:27.139961	2017-02-18 17:55:27.139961	li6.jpg	image/jpeg	17951	2017-02-18 17:55:27.132893	\N
43	19	2017-02-18 17:55:27.156925	2017-02-18 17:55:27.156925	li6crop.jpg	image/jpeg	6632	2017-02-18 17:55:27.148983	\N
105	35	2017-02-20 02:31:37.817165	2017-02-20 02:31:37.817165	prs_se_24_7__CE_9A_CE_91_CE_99_CE_9D_CE_-1477405945-996-e.jpg	image/jpeg	10908	2017-02-20 02:31:37.806296	\N
106	37	2017-02-20 02:33:37.519441	2017-02-20 02:33:37.519441	ac7c2722af4e0d57f1ed744029bcc2dd.jpg	image/jpeg	171335	2017-02-20 02:33:37.508649	\N
107	38	2017-02-20 12:04:38.125508	2017-02-20 12:04:38.125508	li6.jpg	image/jpeg	17951	2017-02-20 12:04:38.117626	\N
108	39	2017-02-20 12:06:53.17701	2017-02-20 12:06:53.17701	li6.jpg	image/jpeg	25709	2017-02-20 12:06:53.167296	\N
\.


--
-- Name: photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('photos_id_seq', 108, true);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY posts (id, title, body, created_at, updated_at) FROM stdin;
5	Lorem Ipsum	<div>\r\n<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n</div>\r\n<div>\r\n<h2>Why do we use it?</h2>\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n</div>\r\n<p>&nbsp;</p>\r\n<div>\r\n<h2>Where does it come from?</h2>\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\r\n</div>\r\n<h2>Where can I get some?</h2>\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>	2017-02-05 19:01:35.588722	2017-02-05 19:01:35.588722
6	hsdhsd	<p>hsdhsdh</p>	2017-02-06 23:52:46.433961	2017-02-06 23:52:46.433961
\.


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('posts_id_seq', 6, true);


--
-- Data for Name: rates; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY rates (id, rater_id, rateable_type, rateable_id, stars, dimension, created_at, updated_at) FROM stdin;
1	1	User	2	5	rating	2017-01-09 12:00:23.939211	2017-01-09 12:00:23.939211
2	5	User	2	2	rating	2017-02-06 23:59:34.441774	2017-02-06 23:59:34.441774
\.


--
-- Name: rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('rates_id_seq', 2, true);


--
-- Data for Name: rating_caches; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY rating_caches (id, cacheable_type, cacheable_id, avg, qty, dimension, created_at, updated_at) FROM stdin;
1	User	2	3.5	2	rating	2017-01-09 12:00:23.962549	2017-02-06 23:59:34.456287
\.


--
-- Name: rating_caches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('rating_caches_id_seq', 1, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY schema_migrations (version) FROM stdin;
20160721081333
20160721081347
20160814114153
20160819123448
20160822182302
20160823104754
20160907125137
20160908090401
20160908151507
20160909075328
20160909075329
20160909075330
20160909075331
20160913113922
20160921152330
20160921172816
20160927114356
20160927133845
20160927134446
20160929130633
20160929190602
20160929190603
20160929190604
20160929190605
20161005105707
20161005124954
20161005125011
20161011174633
20161019232321
20161130222027
20161201081649
20161201081650
20161201081651
20161201081652
20161201081653
20161201081654
20161201082334
20161201082458
20161201082517
20161201082616
20161201082638
20161201083615
20161202095712
20161202100911
20161202101253
20170204193519
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY services (id, created_at, updated_at, categ, specialty, regions, price_cents, title, description, user_id) FROM stdin;
\.


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('services_id_seq', 13, true);


--
-- Data for Name: taggings; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY taggings (id, tag_id, taggable_type, taggable_id, tagger_type, tagger_id, context, created_at) FROM stdin;
\.


--
-- Name: taggings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('taggings_id_seq', 31, true);


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY tags (id, name, taggings_count) FROM stdin;
3	καθηγητής	0
2	μάθημα	0
4	καθηγητής μάθημα κιθάρα	0
11	three two one	0
19	recording	0
18	mastering	0
17	mixing	0
1	κιθάρα	0
14	Τύμπανα	0
20	Φλάουτο	0
13	μαθήματα	0
12	μπάσο	0
16	μπάσου	0
15	κιθάρας	0
7	kithara	0
5	kathigitis	0
6	mathima	0
8	one	0
9	two	0
10	three	0
22	asg	0
21	Φωνητικής	0
\.


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('tags_id_seq', 22, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY users (id, first_name, email, region, telephone, stars, created_at, updated_at, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip) FROM stdin;
6	tsoko	tsoko@tsoko.com	\N	\N	\N	2017-02-18 16:37:27.41665	2017-02-18 16:37:27.421907	$2a$11$rzlgDMGAwkiGbANig2Fb6.hRUPUqG8c7xG1v8hQy16Zo27hga5W.y	\N	\N	\N	1	2017-02-18 16:37:27.421328	2017-02-18 16:37:27.421328	127.0.0.1	127.0.0.1
2	mpdev	mpdevcake@gmail.com	Marousi	2108080800	\N	2016-11-25 13:07:58.318342	2017-02-18 17:26:28.298976	$2a$11$dAsXpkTs/cHYidEaxWkq8.zFn13zUGeQpAtzyk2vtqlfcILAtn9ay	\N	\N	\N	13	2017-02-18 17:26:28.297488	2017-02-10 14:26:07.819439	192.168.1.2	127.0.0.1
5	jojo	mayer@mail.com	\N	\N	\N	2017-02-06 23:16:24.197351	2017-02-06 23:16:24.204954	$2a$11$ZqV0rZI2iuDmhhTY4ZB3huwhqCB33AoYfmN2lEltAj5Xkhjof6CYu	\N	\N	\N	1	2017-02-06 23:16:24.203951	2017-02-06 23:16:24.203951	127.0.0.1	127.0.0.1
1	Michael	mpapasimeon@outlook.com	Μαρούσι	2102805082	\N	2016-11-22 19:40:10.170956	2017-05-20 14:12:22.165842	$2a$11$/8Z7Io1eSnKMV/INK.YZkO8VeWLyxbYNTbl/nFRvyxlQ8yN.izhZK	\N	\N	\N	52	2017-05-20 14:12:22.16444	2017-04-30 19:22:42.45362	79.129.21.25	127.0.0.1
7	teo	theofilosst@hotmail.com	\N	\N	\N	2017-06-08 18:42:30.178226	2017-06-13 20:02:39.647285	$2a$11$KS7jCXmmy7bidVXBsGzIl.eYXVhUnnOZS3WmRv2glE3USLNFcNjZi	\N	\N	\N	2	2017-06-13 20:02:39.645477	2017-06-08 18:42:30.184658	94.66.221.70	192.168.1.12
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('users_id_seq', 7, true);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: average_caches_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY average_caches
    ADD CONSTRAINT average_caches_pkey PRIMARY KEY (id);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: classifieds_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY classifieds
    ADD CONSTRAINT classifieds_pkey PRIMARY KEY (id);


--
-- Name: favorite_classifieds_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY favorite_classifieds
    ADD CONSTRAINT favorite_classifieds_pkey PRIMARY KEY (id);


--
-- Name: flags_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY flags
    ADD CONSTRAINT flags_pkey PRIMARY KEY (id);


--
-- Name: mailboxer_conversation_opt_outs_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY mailboxer_conversation_opt_outs
    ADD CONSTRAINT mailboxer_conversation_opt_outs_pkey PRIMARY KEY (id);


--
-- Name: mailboxer_conversations_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY mailboxer_conversations
    ADD CONSTRAINT mailboxer_conversations_pkey PRIMARY KEY (id);


--
-- Name: mailboxer_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY mailboxer_notifications
    ADD CONSTRAINT mailboxer_notifications_pkey PRIMARY KEY (id);


--
-- Name: mailboxer_receipts_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY mailboxer_receipts
    ADD CONSTRAINT mailboxer_receipts_pkey PRIMARY KEY (id);


--
-- Name: makes_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY makes
    ADD CONSTRAINT makes_pkey PRIMARY KEY (id);


--
-- Name: overall_averages_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY overall_averages
    ADD CONSTRAINT overall_averages_pkey PRIMARY KEY (id);


--
-- Name: photos_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id);


--
-- Name: posts_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: rates_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY rates
    ADD CONSTRAINT rates_pkey PRIMARY KEY (id);


--
-- Name: rating_caches_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY rating_caches
    ADD CONSTRAINT rating_caches_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: services_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: taggings_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY taggings
    ADD CONSTRAINT taggings_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_categories_on_lft; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_categories_on_lft ON categories USING btree (lft);


--
-- Name: index_categories_on_parent_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_categories_on_parent_id ON categories USING btree (parent_id);


--
-- Name: index_categories_on_rgt; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_categories_on_rgt ON categories USING btree (rgt);


--
-- Name: index_classifieds_on_category_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_classifieds_on_category_id ON classifieds USING btree (category_id);


--
-- Name: index_classifieds_on_user_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_classifieds_on_user_id ON classifieds USING btree (user_id);


--
-- Name: index_favorite_classifieds_on_classified_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_favorite_classifieds_on_classified_id ON favorite_classifieds USING btree (classified_id);


--
-- Name: index_favorite_classifieds_on_user_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_favorite_classifieds_on_user_id ON favorite_classifieds USING btree (user_id);


--
-- Name: index_flags_on_classified_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_flags_on_classified_id ON flags USING btree (classified_id);


--
-- Name: index_flags_on_user_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_flags_on_user_id ON flags USING btree (user_id);


--
-- Name: index_mailboxer_conversation_opt_outs_on_conversation_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_mailboxer_conversation_opt_outs_on_conversation_id ON mailboxer_conversation_opt_outs USING btree (conversation_id);


--
-- Name: index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type ON mailboxer_conversation_opt_outs USING btree (unsubscriber_id, unsubscriber_type);


--
-- Name: index_mailboxer_notifications_on_conversation_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_mailboxer_notifications_on_conversation_id ON mailboxer_notifications USING btree (conversation_id);


--
-- Name: index_mailboxer_notifications_on_notified_object_id_and_type; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_mailboxer_notifications_on_notified_object_id_and_type ON mailboxer_notifications USING btree (notified_object_id, notified_object_type);


--
-- Name: index_mailboxer_notifications_on_sender_id_and_sender_type; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_mailboxer_notifications_on_sender_id_and_sender_type ON mailboxer_notifications USING btree (sender_id, sender_type);


--
-- Name: index_mailboxer_notifications_on_type; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_mailboxer_notifications_on_type ON mailboxer_notifications USING btree (type);


--
-- Name: index_mailboxer_receipts_on_notification_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_mailboxer_receipts_on_notification_id ON mailboxer_receipts USING btree (notification_id);


--
-- Name: index_mailboxer_receipts_on_receiver_id_and_receiver_type; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_mailboxer_receipts_on_receiver_id_and_receiver_type ON mailboxer_receipts USING btree (receiver_id, receiver_type);


--
-- Name: index_photos_on_classified_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_photos_on_classified_id ON photos USING btree (classified_id);


--
-- Name: index_photos_on_service_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_photos_on_service_id ON photos USING btree (service_id);


--
-- Name: index_rates_on_rateable_id_and_rateable_type; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_rates_on_rateable_id_and_rateable_type ON rates USING btree (rateable_id, rateable_type);


--
-- Name: index_rates_on_rater_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_rates_on_rater_id ON rates USING btree (rater_id);


--
-- Name: index_rating_caches_on_cacheable_id_and_cacheable_type; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_rating_caches_on_cacheable_id_and_cacheable_type ON rating_caches USING btree (cacheable_id, cacheable_type);


--
-- Name: index_services_on_user_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_services_on_user_id ON services USING btree (user_id);


--
-- Name: index_taggings_on_context; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_taggings_on_context ON taggings USING btree (context);


--
-- Name: index_taggings_on_tag_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_taggings_on_tag_id ON taggings USING btree (tag_id);


--
-- Name: index_taggings_on_taggable_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_taggings_on_taggable_id ON taggings USING btree (taggable_id);


--
-- Name: index_taggings_on_taggable_id_and_taggable_type_and_context; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_taggings_on_taggable_id_and_taggable_type_and_context ON taggings USING btree (taggable_id, taggable_type, context);


--
-- Name: index_taggings_on_taggable_type; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_taggings_on_taggable_type ON taggings USING btree (taggable_type);


--
-- Name: index_taggings_on_tagger_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_taggings_on_tagger_id ON taggings USING btree (tagger_id);


--
-- Name: index_taggings_on_tagger_id_and_tagger_type; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_taggings_on_tagger_id_and_tagger_type ON taggings USING btree (tagger_id, tagger_type);


--
-- Name: index_tags_on_name; Type: INDEX; Schema: public; Owner: frcake
--

CREATE UNIQUE INDEX index_tags_on_name ON tags USING btree (name);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: frcake
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: frcake
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: taggings_idx; Type: INDEX; Schema: public; Owner: frcake
--

CREATE UNIQUE INDEX taggings_idx ON taggings USING btree (tag_id, taggable_id, taggable_type, context, tagger_id, tagger_type);


--
-- Name: taggings_idy; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX taggings_idy ON taggings USING btree (taggable_id, taggable_type, tagger_id, context);


--
-- Name: fk_rails_1946c0b189; Type: FK CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY classifieds
    ADD CONSTRAINT fk_rails_1946c0b189 FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- Name: fk_rails_51a813203f; Type: FK CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY services
    ADD CONSTRAINT fk_rails_51a813203f FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_98f514a643; Type: FK CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT fk_rails_98f514a643 FOREIGN KEY (service_id) REFERENCES services(id);


--
-- Name: fk_rails_beb6ea6cb0; Type: FK CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY flags
    ADD CONSTRAINT fk_rails_beb6ea6cb0 FOREIGN KEY (classified_id) REFERENCES classifieds(id);


--
-- Name: fk_rails_d7842de637; Type: FK CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY flags
    ADD CONSTRAINT fk_rails_d7842de637 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: mb_opt_outs_on_conversations_id; Type: FK CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY mailboxer_conversation_opt_outs
    ADD CONSTRAINT mb_opt_outs_on_conversations_id FOREIGN KEY (conversation_id) REFERENCES mailboxer_conversations(id);


--
-- Name: notifications_on_conversation_id; Type: FK CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY mailboxer_notifications
    ADD CONSTRAINT notifications_on_conversation_id FOREIGN KEY (conversation_id) REFERENCES mailboxer_conversations(id);


--
-- Name: receipts_on_notification_id; Type: FK CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY mailboxer_receipts
    ADD CONSTRAINT receipts_on_notification_id FOREIGN KEY (notification_id) REFERENCES mailboxer_notifications(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

