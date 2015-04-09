--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: courses; Type: TABLE; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

CREATE TABLE courses (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE courses OWNER TO jeremysklarsky;

--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: jeremysklarsky
--

CREATE SEQUENCE courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE courses_id_seq OWNER TO jeremysklarsky;

--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jeremysklarsky
--

ALTER SEQUENCE courses_id_seq OWNED BY courses.id;


--
-- Name: cuisines; Type: TABLE; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

CREATE TABLE cuisines (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE cuisines OWNER TO jeremysklarsky;

--
-- Name: cuisines_id_seq; Type: SEQUENCE; Schema: public; Owner: jeremysklarsky
--

CREATE SEQUENCE cuisines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cuisines_id_seq OWNER TO jeremysklarsky;

--
-- Name: cuisines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jeremysklarsky
--

ALTER SEQUENCE cuisines_id_seq OWNED BY cuisines.id;


--
-- Name: dinner_guests; Type: TABLE; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

CREATE TABLE dinner_guests (
    id integer NOT NULL,
    guest_id integer,
    dinner_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE dinner_guests OWNER TO jeremysklarsky;

--
-- Name: dinner_guests_id_seq; Type: SEQUENCE; Schema: public; Owner: jeremysklarsky
--

CREATE SEQUENCE dinner_guests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dinner_guests_id_seq OWNER TO jeremysklarsky;

--
-- Name: dinner_guests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jeremysklarsky
--

ALTER SEQUENCE dinner_guests_id_seq OWNED BY dinner_guests.id;


--
-- Name: dinners; Type: TABLE; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

CREATE TABLE dinners (
    id integer NOT NULL,
    host_id integer,
    name character varying,
    datetime timestamp without time zone,
    location character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE dinners OWNER TO jeremysklarsky;

--
-- Name: dinners_id_seq; Type: SEQUENCE; Schema: public; Owner: jeremysklarsky
--

CREATE SEQUENCE dinners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dinners_id_seq OWNER TO jeremysklarsky;

--
-- Name: dinners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jeremysklarsky
--

ALTER SEQUENCE dinners_id_seq OWNED BY dinners.id;


--
-- Name: menu_recipes; Type: TABLE; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

CREATE TABLE menu_recipes (
    id integer NOT NULL,
    menu_id integer,
    recipe_id integer,
    chef_id integer,
    votes integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    course_name character varying
);


ALTER TABLE menu_recipes OWNER TO jeremysklarsky;

--
-- Name: menu_recipes_id_seq; Type: SEQUENCE; Schema: public; Owner: jeremysklarsky
--

CREATE SEQUENCE menu_recipes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE menu_recipes_id_seq OWNER TO jeremysklarsky;

--
-- Name: menu_recipes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jeremysklarsky
--

ALTER SEQUENCE menu_recipes_id_seq OWNED BY menu_recipes.id;


--
-- Name: menus; Type: TABLE; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

CREATE TABLE menus (
    id integer NOT NULL,
    dinner_id integer,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    finalized boolean DEFAULT false
);


ALTER TABLE menus OWNER TO jeremysklarsky;

--
-- Name: menus_id_seq; Type: SEQUENCE; Schema: public; Owner: jeremysklarsky
--

CREATE SEQUENCE menus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE menus_id_seq OWNER TO jeremysklarsky;

--
-- Name: menus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jeremysklarsky
--

ALTER SEQUENCE menus_id_seq OWNED BY menus.id;


--
-- Name: recipe_courses; Type: TABLE; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

CREATE TABLE recipe_courses (
    id integer NOT NULL,
    recipe_id integer,
    course_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE recipe_courses OWNER TO jeremysklarsky;

--
-- Name: recipe_courses_id_seq; Type: SEQUENCE; Schema: public; Owner: jeremysklarsky
--

CREATE SEQUENCE recipe_courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recipe_courses_id_seq OWNER TO jeremysklarsky;

--
-- Name: recipe_courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jeremysklarsky
--

ALTER SEQUENCE recipe_courses_id_seq OWNED BY recipe_courses.id;


--
-- Name: recipe_cuisines; Type: TABLE; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

CREATE TABLE recipe_cuisines (
    id integer NOT NULL,
    recipe_id integer,
    cuisine_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE recipe_cuisines OWNER TO jeremysklarsky;

--
-- Name: recipe_cuisines_id_seq; Type: SEQUENCE; Schema: public; Owner: jeremysklarsky
--

CREATE SEQUENCE recipe_cuisines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recipe_cuisines_id_seq OWNER TO jeremysklarsky;

--
-- Name: recipe_cuisines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jeremysklarsky
--

ALTER SEQUENCE recipe_cuisines_id_seq OWNED BY recipe_cuisines.id;


--
-- Name: recipes; Type: TABLE; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

CREATE TABLE recipes (
    id integer NOT NULL,
    name character varying,
    source_url character varying,
    instructions text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    primary_ingredient character varying,
    rating double precision,
    image_url character varying,
    review_count integer,
    cook_time integer,
    servings character varying,
    ingredients text,
    description character varying,
    big_oven_id character varying,
    cuisine_id integer,
    appetizer boolean DEFAULT false,
    main boolean DEFAULT false,
    side boolean DEFAULT false,
    dessert boolean DEFAULT false
);


ALTER TABLE recipes OWNER TO jeremysklarsky;

--
-- Name: recipes_id_seq; Type: SEQUENCE; Schema: public; Owner: jeremysklarsky
--

CREATE SEQUENCE recipes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recipes_id_seq OWNER TO jeremysklarsky;

--
-- Name: recipes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jeremysklarsky
--

ALTER SEQUENCE recipes_id_seq OWNED BY recipes.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO jeremysklarsky;

--
-- Name: users; Type: TABLE; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying,
    email character varying,
    password_digest character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE users OWNER TO jeremysklarsky;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: jeremysklarsky
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO jeremysklarsky;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jeremysklarsky
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jeremysklarsky
--

ALTER TABLE ONLY courses ALTER COLUMN id SET DEFAULT nextval('courses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jeremysklarsky
--

ALTER TABLE ONLY cuisines ALTER COLUMN id SET DEFAULT nextval('cuisines_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jeremysklarsky
--

ALTER TABLE ONLY dinner_guests ALTER COLUMN id SET DEFAULT nextval('dinner_guests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jeremysklarsky
--

ALTER TABLE ONLY dinners ALTER COLUMN id SET DEFAULT nextval('dinners_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jeremysklarsky
--

ALTER TABLE ONLY menu_recipes ALTER COLUMN id SET DEFAULT nextval('menu_recipes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jeremysklarsky
--

ALTER TABLE ONLY menus ALTER COLUMN id SET DEFAULT nextval('menus_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jeremysklarsky
--

ALTER TABLE ONLY recipe_courses ALTER COLUMN id SET DEFAULT nextval('recipe_courses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jeremysklarsky
--

ALTER TABLE ONLY recipe_cuisines ALTER COLUMN id SET DEFAULT nextval('recipe_cuisines_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jeremysklarsky
--

ALTER TABLE ONLY recipes ALTER COLUMN id SET DEFAULT nextval('recipes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jeremysklarsky
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: jeremysklarsky
--

COPY courses (id, name, created_at, updated_at) FROM stdin;
1	Main Dish	2015-04-07 18:50:11.170651	2015-04-07 18:50:11.170651
2	Tacos, Burritos and Enchiladas	2015-04-07 18:50:11.185758	2015-04-07 18:50:11.185758
3	Pasta	2015-04-07 18:50:12.509189	2015-04-07 18:50:12.509189
4	Meatloaf	2015-04-07 18:50:13.328563	2015-04-07 18:50:13.328563
5	Casseroles	2015-04-07 18:50:13.886488	2015-04-07 18:50:13.886488
6	Meat - Steaks and Chops	2015-04-07 18:50:14.618638	2015-04-07 18:50:14.618638
7	Side Dish	2015-04-07 18:50:15.494725	2015-04-07 18:50:15.494725
8	Dumplings	2015-04-07 18:50:15.500048	2015-04-07 18:50:15.500048
9	Burgers	2015-04-07 18:50:17.261035	2015-04-07 18:50:17.261035
10	Soups, Stews and Chili	2015-04-07 18:50:17.870428	2015-04-07 18:50:17.870428
11	Chowders	2015-04-07 18:50:17.884123	2015-04-07 18:50:17.884123
12	Fish and Shellfish	2015-04-07 18:51:04.537732	2015-04-07 18:51:04.537732
13	\N	2015-04-07 18:51:07.644225	2015-04-07 18:51:07.644225
14	Grill and BBQ	2015-04-07 18:51:10.223354	2015-04-07 18:51:10.223354
15	Meatless	2015-04-07 18:51:10.524158	2015-04-07 18:51:10.524158
16	Appetizers	2015-04-07 18:51:11.831323	2015-04-07 18:51:11.831323
17	Appetizers - Other	2015-04-07 18:51:11.837871	2015-04-07 18:51:11.837871
18	Rice	2015-04-07 18:51:44.149778	2015-04-07 18:51:44.149778
19	Chili	2015-04-07 18:51:44.470388	2015-04-07 18:51:44.470388
20	Beans and Legumes	2015-04-07 18:51:45.170254	2015-04-07 18:51:45.170254
21	Stir-Fries	2015-04-07 18:51:45.530111	2015-04-07 18:51:45.530111
22	Soups and Stews - Other	2015-04-07 18:51:53.091076	2015-04-07 18:51:53.091076
23	Meat and Poultry	2015-04-07 18:51:53.422935	2015-04-07 18:51:53.422935
24	Stews	2015-04-07 18:51:54.118162	2015-04-07 18:51:54.118162
25	Vegetable	2015-04-07 18:51:54.758965	2015-04-07 18:51:54.758965
26	Main Dish - Other	2015-04-07 18:51:56.276385	2015-04-07 18:51:56.276385
27	Cheese Soups	2015-04-07 18:51:56.598285	2015-04-07 18:51:56.598285
28	Cream-style Soups	2015-04-07 18:51:56.965722	2015-04-07 18:51:56.965722
29	Seafood non-chowder	2015-04-07 18:51:57.398144	2015-04-07 18:51:57.398144
30	Meat	2015-04-07 18:52:04.125991	2015-04-07 18:52:04.125991
31	Meat - Other	2015-04-07 18:52:04.463739	2015-04-07 18:52:04.463739
32	Marinades and Sauces	2015-04-07 18:52:06.311674	2015-04-07 18:52:06.311674
33	Marinade	2015-04-07 18:52:06.326405	2015-04-07 18:52:06.326405
34	Salad	2015-04-07 18:52:31.953592	2015-04-07 18:52:31.953592
35	Potato Salads	2015-04-07 18:52:31.976503	2015-04-07 18:52:31.976503
36	Green Salads	2015-04-07 18:52:32.636672	2015-04-07 18:52:32.636672
37	Grains	2015-04-07 18:52:32.984868	2015-04-07 18:52:32.984868
38	Salads - Other	2015-04-07 18:52:33.262684	2015-04-07 18:52:33.262684
39	Vegetable Salads	2015-04-07 18:52:35.050509	2015-04-07 18:52:35.050509
40	Poultry - Chicken	2015-04-07 18:52:51.75948	2015-04-07 18:52:51.75948
41	Pizza and Calzones	2015-04-07 18:52:54.10587	2015-04-07 18:52:54.10587
42	Desserts	2015-04-07 18:52:59.380227	2015-04-07 18:52:59.380227
43	Desserts - Other	2015-04-07 18:52:59.404003	2015-04-07 18:52:59.404003
44	Custards and Puddings	2015-04-07 18:53:00.469305	2015-04-07 18:53:00.469305
45	Frozen Treats	2015-04-07 18:53:02.92406	2015-04-07 18:53:02.92406
46	Vegetables	2015-04-07 18:53:42.659162	2015-04-07 18:53:42.659162
47	Bread	2015-04-07 18:54:03.864187	2015-04-07 18:54:03.864187
48	White Bread	2015-04-07 18:54:03.876774	2015-04-07 18:54:03.876774
49	Breads - Other	2015-04-07 18:54:04.224133	2015-04-07 18:54:04.224133
50	Bread Machine	2015-04-07 18:54:04.620084	2015-04-07 18:54:04.620084
51	Sourdough and Starters	2015-04-07 18:54:05.041649	2015-04-07 18:54:05.041649
52	Breakfast	2015-04-07 18:54:06.047771	2015-04-07 18:54:06.047771
53	Pancakes	2015-04-07 18:54:06.062037	2015-04-07 18:54:06.062037
54	Canapes and Bruschetta	2015-04-07 18:54:06.378811	2015-04-07 18:54:06.378811
55	Yeast Bread	2015-04-07 18:54:06.727956	2015-04-07 18:54:06.727956
56	Cornbread	2015-04-07 18:54:07.072534	2015-04-07 18:54:07.072534
57	Wraps and Rolls	2015-04-09 13:32:10.332845	2015-04-09 13:32:10.332845
58	Cheese	2015-04-09 13:32:11.028721	2015-04-09 13:32:11.028721
59	Snacks for Kids	2015-04-09 13:32:11.615695	2015-04-09 13:32:11.615695
60	Drinks	2015-04-09 13:35:03.871485	2015-04-09 13:35:03.871485
61	Cocktails	2015-04-09 13:35:03.888047	2015-04-09 13:35:03.888047
62	Side Dish - Other	2015-04-09 13:35:04.368164	2015-04-09 13:35:04.368164
63	Roasts	2015-04-09 13:37:11.872778	2015-04-09 13:37:11.872778
64	Dips and Spreads	2015-04-09 13:37:54.391124	2015-04-09 13:37:54.391124
65	Sandwiches and Wraps	2015-04-09 13:38:20.274027	2015-04-09 13:38:20.274027
66	Slow Cooker	2015-04-09 13:38:21.713626	2015-04-09 13:38:21.713626
\.


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jeremysklarsky
--

SELECT pg_catalog.setval('courses_id_seq', 66, true);


--
-- Data for Name: cuisines; Type: TABLE DATA; Schema: public; Owner: jeremysklarsky
--

COPY cuisines (id, name, created_at, updated_at) FROM stdin;
1	Mexican	2015-04-07 18:50:11.120817	2015-04-07 18:50:11.120817
2	Italian	2015-04-07 18:50:12.488615	2015-04-07 18:50:12.488615
3	American	2015-04-07 18:50:13.307841	2015-04-07 18:50:13.307841
4	African	2015-04-07 18:50:13.876912	2015-04-07 18:50:13.876912
5	Hungary	2015-04-07 18:50:15.485621	2015-04-07 18:50:15.485621
6	American-South	2015-04-07 18:50:16.538364	2015-04-07 18:50:16.538364
7	Hawaiian	2015-04-07 18:51:04.483533	2015-04-07 18:51:04.483533
8		2015-04-07 18:51:05.937537	2015-04-07 18:51:05.937537
9	\N	2015-04-07 18:51:08.456723	2015-04-07 18:51:08.456723
10	Brazilian	2015-04-07 18:51:10.204317	2015-04-07 18:51:10.204317
11	English	2015-04-07 18:51:11.815566	2015-04-07 18:51:11.815566
12	Japanese	2015-04-07 18:51:44.083788	2015-04-07 18:51:44.083788
13	Asian	2015-04-07 18:51:44.841937	2015-04-07 18:51:44.841937
14	Chinese-canadian	2015-04-07 18:51:45.510683	2015-04-07 18:51:45.510683
15	Spanish	2015-04-07 18:51:45.840805	2015-04-07 18:51:45.840805
16	american	2015-04-07 18:51:46.184642	2015-04-07 18:51:46.184642
17	Chinese	2015-04-07 18:51:46.520921	2015-04-07 18:51:46.520921
18	Caribbean	2015-04-07 18:52:04.444304	2015-04-07 18:52:04.444304
19	Middle Eastern	2015-04-07 18:52:05.981058	2015-04-07 18:52:05.981058
20	South African	2015-04-07 18:52:06.981832	2015-04-07 18:52:06.981832
21	Greek	2015-04-07 18:52:32.965365	2015-04-07 18:52:32.965365
22	German	2015-04-07 18:52:33.615073	2015-04-07 18:52:33.615073
23	Thai	2015-04-07 18:52:51.346414	2015-04-07 18:52:51.346414
24	French	2015-04-07 18:52:52.519453	2015-04-07 18:52:52.519453
25	Dessert	2015-04-07 18:53:01.305524	2015-04-07 18:53:01.305524
26	Vegetarian	2015-04-09 13:31:25.610897	2015-04-09 13:31:25.610897
27	Tex-Mex	2015-04-09 13:31:25.981736	2015-04-09 13:31:25.981736
28	Indian	2015-04-09 13:37:10.723664	2015-04-09 13:37:10.723664
29	Mediterranean	2015-04-09 13:38:19.430001	2015-04-09 13:38:19.430001
30	Lebanese	2015-04-09 13:38:20.255034	2015-04-09 13:38:20.255034
31	Moroccan 	2015-04-09 13:38:22.713797	2015-04-09 13:38:22.713797
32	Moroccan	2015-04-09 13:38:23.070646	2015-04-09 13:38:23.070646
\.


--
-- Name: cuisines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jeremysklarsky
--

SELECT pg_catalog.setval('cuisines_id_seq', 32, true);


--
-- Data for Name: dinner_guests; Type: TABLE DATA; Schema: public; Owner: jeremysklarsky
--

COPY dinner_guests (id, guest_id, dinner_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: dinner_guests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jeremysklarsky
--

SELECT pg_catalog.setval('dinner_guests_id_seq', 1, false);


--
-- Data for Name: dinners; Type: TABLE DATA; Schema: public; Owner: jeremysklarsky
--

COPY dinners (id, host_id, name, datetime, location, created_at, updated_at) FROM stdin;
1	1	Birthday Dinner	2015-05-05 19:00:00	Flatiron School, 11 Broadway	2015-04-07 20:37:06.982619	2015-04-07 20:37:06.982619
2	1	party	2015-05-05 19:00:00	my house	2015-04-07 20:42:50.38361	2015-04-07 20:42:50.38361
3	1	another party	2015-05-05 19:00:00	Brooklyn	2015-04-07 20:43:48.788248	2015-04-07 20:43:48.788248
4	1	another party	2015-05-05 19:00:00	Brooklyn	2015-04-07 20:44:06.639062	2015-04-07 20:44:06.639062
5	1	another party	2015-05-05 19:00:00	Brooklyn	2015-04-07 20:44:25.491289	2015-04-07 20:44:25.491289
6	1	another party	2015-05-05 19:00:00	Brooklyn	2015-04-07 20:44:31.399119	2015-04-07 20:44:31.399119
7	1	another party	2015-05-05 19:00:00	Brooklyn	2015-04-07 20:45:10.7392	2015-04-07 20:45:10.7392
8	1	Pizza Party!	2015-05-05 19:00:00	School	2015-04-07 20:47:02.682766	2015-04-07 20:47:02.682766
9	1	dinner	2015-05-05 00:00:00	here	2015-04-07 21:44:10.628006	2015-04-07 21:44:10.628006
10	1	dinner	2015-05-05 00:00:00	here	2015-04-07 21:48:49.948615	2015-04-07 21:48:49.948615
11	1	dinner	2015-05-05 00:00:00	here	2015-04-07 21:49:50.902579	2015-04-07 21:49:50.902579
12	1	dinner	2015-05-05 00:00:00	here	2015-04-07 21:51:16.242599	2015-04-07 21:51:16.242599
13	2	Dinner Party of Life	2015-05-01 00:00:00	here	2015-04-07 21:58:25.950961	2015-04-07 21:58:25.950961
14	2	Dinner Party of Life	2015-05-01 00:00:00	here	2015-04-07 22:04:04.733054	2015-04-07 22:04:04.733054
15	2	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 11:19:03.734416	2015-04-08 11:19:03.734416
16	2	kjhsdf	0001-01-22 00:00:00	kjshdf	2015-04-08 12:57:30.313517	2015-04-08 12:57:30.313517
17	2	here	0001-01-16 00:00:00	there	2015-04-08 16:11:23.556903	2015-04-08 16:11:23.556903
18	2	here	0001-01-16 00:00:00	there	2015-04-08 16:14:47.203758	2015-04-08 16:14:47.203758
19	2	here	0001-01-16 00:00:00	there	2015-04-08 16:17:33.418158	2015-04-08 16:17:33.418158
20	2	here	0001-01-16 00:00:00	there	2015-04-08 16:18:12.610403	2015-04-08 16:18:12.610403
21	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 18:17:01.351563	2015-04-08 18:17:01.351563
22	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 18:36:23.465192	2015-04-08 18:36:23.465192
23	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 18:42:19.840889	2015-04-08 18:42:19.840889
24	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 18:42:58.669294	2015-04-08 18:42:58.669294
25	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 18:44:28.347294	2015-04-08 18:44:28.347294
26	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 18:46:20.160066	2015-04-08 18:46:20.160066
27	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 18:47:12.437822	2015-04-08 18:47:12.437822
28	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 18:57:36.391067	2015-04-08 18:57:36.391067
29	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 19:02:34.272196	2015-04-08 19:02:34.272196
30	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 19:03:39.107232	2015-04-08 19:03:39.107232
31	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 19:09:40.987676	2015-04-08 19:09:40.987676
32	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 19:10:47.249372	2015-04-08 19:10:47.249372
33	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 19:17:06.315853	2015-04-08 19:17:06.315853
34	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 19:18:48.907783	2015-04-08 19:18:48.907783
35	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 19:26:38.706649	2015-04-08 19:26:38.706649
36	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 19:28:20.141229	2015-04-08 19:28:20.141229
37	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 19:29:11.021161	2015-04-08 19:29:11.021161
38	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 19:33:55.181446	2015-04-08 19:33:55.181446
39	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 19:34:53.148605	2015-04-08 19:34:53.148605
40	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 19:37:10.679137	2015-04-08 19:37:10.679137
41	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 19:39:05.076731	2015-04-08 19:39:05.076731
42	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 19:47:38.490823	2015-04-08 19:47:38.490823
43	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 19:48:20.400968	2015-04-08 19:48:20.400968
44	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 19:51:31.32277	2015-04-08 19:51:31.32277
45	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 19:53:46.070612	2015-04-08 19:53:46.070612
46	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 19:56:01.093492	2015-04-08 19:56:01.093492
47	1	Jeremy Sklarsky	0001-02-16 00:00:00	Brooklyn	2015-04-08 19:57:04.209929	2015-04-08 19:57:04.209929
48	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 19:57:32.467985	2015-04-08 19:57:32.467985
49	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 19:59:59.284305	2015-04-08 19:59:59.284305
50	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 20:03:10.687254	2015-04-08 20:03:10.687254
51	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 20:05:07.874799	2015-04-08 20:05:07.874799
52	1	Jeremy Sklarsky	0001-01-20 00:00:00	Brooklyn	2015-04-08 20:07:54.607687	2015-04-08 20:07:54.607687
53	1	Jeremy Sklarsky	0001-01-15 00:00:00	Brooklyn	2015-04-08 20:09:38.935529	2015-04-08 20:09:38.935529
54	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 20:12:39.26129	2015-04-08 20:12:39.26129
55	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 20:13:59.990127	2015-04-08 20:13:59.990127
56	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 20:20:59.2654	2015-04-08 20:20:59.2654
57	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 20:25:35.743725	2015-04-08 20:25:35.743725
58	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 20:28:05.704079	2015-04-08 20:28:05.704079
59	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 20:33:32.562659	2015-04-08 20:33:32.562659
60	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 20:37:11.146303	2015-04-08 20:37:11.146303
61	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 20:41:31.272902	2015-04-08 20:41:31.272902
62	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 20:44:00.542651	2015-04-08 20:44:00.542651
63	1	Jeremy Dinner party	0001-01-17 00:00:00	Brooklyn	2015-04-08 21:04:37.986298	2015-04-08 21:04:37.986298
64	1	jeremy	0001-01-18 00:00:00	brooklyn	2015-04-08 21:07:36.655364	2015-04-08 21:07:36.655364
65	1	jeremy	0001-01-18 00:00:00	brooklyn	2015-04-08 21:09:29.356599	2015-04-08 21:09:29.356599
66	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 21:16:30.854544	2015-04-08 21:16:30.854544
67	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 21:23:09.291828	2015-04-08 21:23:09.291828
68	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 21:36:20.255778	2015-04-08 21:36:20.255778
69	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 21:37:46.007644	2015-04-08 21:37:46.007644
70	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 21:41:50.041438	2015-04-08 21:41:50.041438
71	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 21:42:40.08812	2015-04-08 21:42:40.08812
72	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 21:48:38.654161	2015-04-08 21:48:38.654161
73	1	Jeremy Sklarsky	0001-01-15 00:00:00	Brooklyn	2015-04-08 21:50:11.876334	2015-04-08 21:50:11.876334
74	1	Jeremy Sklarsky	0001-01-15 00:00:00	Brooklyn	2015-04-08 21:51:52.779052	2015-04-08 21:51:52.779052
75	1	Jeremy Sklarsky	0001-01-15 00:00:00	Brooklyn	2015-04-08 21:53:50.570622	2015-04-08 21:53:50.570622
76	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 21:59:28.441703	2015-04-08 21:59:28.441703
77	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 22:01:58.950859	2015-04-08 22:01:58.950859
78	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 22:08:02.209596	2015-04-08 22:08:02.209596
79	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 22:15:28.655363	2015-04-08 22:15:28.655363
80	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 22:24:55.321711	2015-04-08 22:24:55.321711
81	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 23:32:42.81248	2015-04-08 23:32:42.81248
82	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 23:36:58.75579	2015-04-08 23:36:58.75579
83	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-08 23:39:18.613347	2015-04-08 23:39:18.613347
84	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-09 00:07:30.54398	2015-04-09 00:07:30.54398
85	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-09 00:08:16.849641	2015-04-09 00:08:16.849641
86	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-09 00:08:39.634402	2015-04-09 00:08:39.634402
87	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-09 00:10:06.648684	2015-04-09 00:10:06.648684
88	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-09 00:13:03.589995	2015-04-09 00:13:03.589995
89	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-09 00:13:41.538782	2015-04-09 00:13:41.538782
90	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-09 00:17:20.346305	2015-04-09 00:17:20.346305
91	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-09 00:20:44.654009	2015-04-09 00:20:44.654009
92	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-09 00:22:48.893532	2015-04-09 00:22:48.893532
93	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-09 00:24:50.764938	2015-04-09 00:24:50.764938
94	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-09 00:26:43.893181	2015-04-09 00:26:43.893181
95	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-09 00:32:39.41926	2015-04-09 00:32:39.41926
96	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-09 00:36:45.058928	2015-04-09 00:36:45.058928
97	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-09 00:41:34.376539	2015-04-09 00:41:34.376539
98	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-09 00:42:02.114053	2015-04-09 00:42:02.114053
99	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-09 00:45:20.032741	2015-04-09 00:45:20.032741
100	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-09 00:47:03.267163	2015-04-09 00:47:03.267163
101	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-09 00:51:14.529609	2015-04-09 00:51:14.529609
102	1	Jeremy Sklarsky	0001-01-16 00:00:00	Brooklyn	2015-04-09 00:52:39.959989	2015-04-09 00:52:39.959989
103	1	Jeremy	0001-02-10 00:00:00	here	2015-04-09 14:01:58.314737	2015-04-09 14:01:58.314737
104	1	Jeremy	0001-02-14 00:00:00	here	2015-04-09 14:05:05.885146	2015-04-09 14:05:05.885146
\.


--
-- Name: dinners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jeremysklarsky
--

SELECT pg_catalog.setval('dinners_id_seq', 104, true);


--
-- Data for Name: menu_recipes; Type: TABLE DATA; Schema: public; Owner: jeremysklarsky
--

COPY menu_recipes (id, menu_id, recipe_id, chef_id, votes, created_at, updated_at, course_name) FROM stdin;
1	12	1	\N	\N	2015-04-08 18:26:41.373715	2015-04-08 18:26:41.373715	Side
2	26	93	\N	\N	2015-04-08 19:17:41.299423	2015-04-08 19:17:41.299423	Appetizer
3	27	41	\N	\N	2015-04-08 19:19:22.889672	2015-04-08 19:19:22.889672	Appetizer
4	27	60	\N	\N	2015-04-08 19:19:33.059447	2015-04-08 19:19:33.059447	Appetizer
5	28	93	\N	\N	2015-04-08 19:26:29.863069	2015-04-08 19:26:29.863069	Appetizer
6	28	41	\N	\N	2015-04-08 19:26:29.936642	2015-04-08 19:26:29.936642	Appetizer
7	28	44	\N	\N	2015-04-08 19:26:29.968122	2015-04-08 19:26:29.968122	Side
8	28	55	\N	\N	2015-04-08 19:26:30.152375	2015-04-08 19:26:30.152375	Side
9	28	1	\N	\N	2015-04-08 19:26:30.331212	2015-04-08 19:26:30.331212	Main
10	28	32	\N	\N	2015-04-08 19:26:30.400509	2015-04-08 19:26:30.400509	Main
11	28	72	\N	\N	2015-04-08 19:26:30.411318	2015-04-08 19:26:30.411318	Dessert
12	28	69	\N	\N	2015-04-08 19:26:30.425405	2015-04-08 19:26:30.425405	Dessert
13	29	50	\N	\N	2015-04-08 19:27:00.207125	2015-04-08 19:27:00.207125	Appetizer
14	29	52	\N	\N	2015-04-08 19:27:00.259387	2015-04-08 19:27:00.259387	Appetizer
15	29	53	\N	\N	2015-04-08 19:27:00.290401	2015-04-08 19:27:00.290401	Appetizer
16	29	60	\N	\N	2015-04-08 19:27:00.346929	2015-04-08 19:27:00.346929	Appetizer
17	29	55	\N	\N	2015-04-08 19:27:00.408913	2015-04-08 19:27:00.408913	Side
19	34	60	\N	\N	2015-04-08 19:37:19.722878	2015-04-08 19:37:19.722878	Appetizer
20	34	51	\N	\N	2015-04-08 19:37:31.28722	2015-04-08 19:37:31.28722	Appetizer
22	35	20	\N	\N	2015-04-08 19:39:35.976529	2015-04-08 19:39:35.976529	Appetizer
23	35	50	\N	\N	2015-04-08 19:39:36.063772	2015-04-08 19:39:36.063772	Appetizer
24	35	51	\N	\N	2015-04-08 19:39:36.096674	2015-04-08 19:39:36.096674	Appetizer
26	36	20	\N	\N	2015-04-08 19:48:26.947437	2015-04-08 19:48:26.947437	Appetizer
27	36	7	\N	\N	2015-04-08 19:48:26.987107	2015-04-08 19:48:26.987107	Appetizer
28	37	20	\N	\N	2015-04-08 19:51:38.866225	2015-04-08 19:51:38.866225	Appetizer
29	38	20	\N	\N	2015-04-08 19:54:15.094553	2015-04-08 19:54:15.094553	Appetizer
30	38	60	\N	\N	2015-04-08 19:54:15.180711	2015-04-08 19:54:15.180711	Appetizer
31	38	55	\N	\N	2015-04-08 19:54:23.785707	2015-04-08 19:54:23.785707	Side
32	38	3	\N	\N	2015-04-08 19:54:23.852621	2015-04-08 19:54:23.852621	Side
33	38	25	\N	\N	2015-04-08 19:54:31.715847	2015-04-08 19:54:31.715847	Main
34	38	83	\N	\N	2015-04-08 19:54:31.832371	2015-04-08 19:54:31.832371	Main
35	39	55	\N	\N	2015-04-08 19:56:09.327418	2015-04-08 19:56:09.327418	Appetizer
36	39	60	\N	\N	2015-04-08 19:56:09.40683	2015-04-08 19:56:09.40683	Appetizer
37	39	50	\N	\N	2015-04-08 19:56:09.474823	2015-04-08 19:56:09.474823	Side
38	39	26	\N	\N	2015-04-08 19:56:09.501475	2015-04-08 19:56:09.501475	Side
39	39	9	\N	\N	2015-04-08 19:56:09.538949	2015-04-08 19:56:09.538949	Main
40	39	25	\N	\N	2015-04-08 19:56:09.560285	2015-04-08 19:56:09.560285	Main
41	40	60	\N	\N	2015-04-08 19:57:12.499437	2015-04-08 19:57:12.499437	Appetizer
42	40	53	\N	\N	2015-04-08 19:57:12.544909	2015-04-08 19:57:12.544909	Appetizer
43	40	21	\N	\N	2015-04-08 19:57:12.598849	2015-04-08 19:57:12.598849	Side
44	40	23	\N	\N	2015-04-08 19:57:12.668814	2015-04-08 19:57:12.668814	Side
45	40	39	\N	\N	2015-04-08 19:57:12.695749	2015-04-08 19:57:12.695749	Main
46	40	25	\N	\N	2015-04-08 19:57:12.716883	2015-04-08 19:57:12.716883	Main
47	40	71	\N	\N	2015-04-08 19:57:12.724699	2015-04-08 19:57:12.724699	Dessert
48	40	76	\N	\N	2015-04-08 19:57:12.736115	2015-04-08 19:57:12.736115	Dessert
49	41	51	\N	\N	2015-04-08 19:57:37.248411	2015-04-08 19:57:37.248411	Appetizer
50	41	50	\N	\N	2015-04-08 19:57:37.311722	2015-04-08 19:57:37.311722	Appetizer
51	41	26	\N	\N	2015-04-08 19:57:37.431392	2015-04-08 19:57:37.431392	Side
52	41	84	\N	\N	2015-04-08 19:57:37.460036	2015-04-08 19:57:37.460036	Side
53	41	11	\N	\N	2015-04-08 19:57:37.483242	2015-04-08 19:57:37.483242	Main
54	42	60	\N	\N	2015-04-08 20:01:45.656385	2015-04-08 20:01:45.656385	Appetizer
55	42	10	\N	\N	2015-04-08 20:01:45.706762	2015-04-08 20:01:45.706762	Appetizer
56	42	56	\N	\N	2015-04-08 20:01:45.726483	2015-04-08 20:01:45.726483	Side
57	42	84	\N	\N	2015-04-08 20:01:45.80097	2015-04-08 20:01:45.80097	Side
58	42	83	\N	\N	2015-04-08 20:01:45.820189	2015-04-08 20:01:45.820189	Main
59	42	4	\N	\N	2015-04-08 20:01:45.856557	2015-04-08 20:01:45.856557	Main
60	42	77	\N	\N	2015-04-08 20:01:45.869258	2015-04-08 20:01:45.869258	Dessert
61	42	78	\N	\N	2015-04-08 20:01:45.878523	2015-04-08 20:01:45.878523	Dessert
62	43	50	\N	\N	2015-04-08 20:03:15.778838	2015-04-08 20:03:15.778838	Appetizer
63	43	52	\N	\N	2015-04-08 20:03:15.874684	2015-04-08 20:03:15.874684	Appetizer
64	43	96	\N	\N	2015-04-08 20:03:15.922419	2015-04-08 20:03:15.922419	Appetizer
65	43	55	\N	\N	2015-04-08 20:03:15.95092	2015-04-08 20:03:15.95092	Appetizer
66	44	53	\N	\N	2015-04-08 20:05:12.278269	2015-04-08 20:05:12.278269	Appetizer
67	44	20	\N	\N	2015-04-08 20:05:12.410862	2015-04-08 20:05:12.410862	Appetizer
68	44	10	\N	\N	2015-04-08 20:05:12.490012	2015-04-08 20:05:12.490012	Appetizer
69	45	10	\N	\N	2015-04-08 20:08:10.425119	2015-04-08 20:08:10.425119	Appetizer
70	46	41	\N	\N	2015-04-08 20:09:52.08034	2015-04-08 20:09:52.08034	Appetizer
71	46	53	\N	\N	2015-04-08 20:09:52.156147	2015-04-08 20:09:52.156147	Appetizer
72	46	44	\N	\N	2015-04-08 20:09:54.165028	2015-04-08 20:09:54.165028	Side
73	47	52	\N	\N	2015-04-08 20:12:45.017144	2015-04-08 20:12:45.017144	Appetizer
74	48	93	\N	\N	2015-04-08 20:20:16.77314	2015-04-08 20:20:16.77314	Appetizer
75	48	52	\N	\N	2015-04-08 20:20:18.533945	2015-04-08 20:20:18.533945	Appetizer
76	48	51	\N	\N	2015-04-08 20:20:19.801588	2015-04-08 20:20:19.801588	Side
77	49	52	\N	\N	2015-04-08 20:21:07.872109	2015-04-08 20:21:07.872109	Appetizer
78	49	96	\N	\N	2015-04-08 20:21:09.933236	2015-04-08 20:21:09.933236	Appetizer
79	49	51	\N	\N	2015-04-08 20:21:11.508705	2015-04-08 20:21:11.508705	Appetizer
80	49	41	\N	\N	2015-04-08 20:21:12.679574	2015-04-08 20:21:12.679574	Appetizer
81	51	50	\N	\N	2015-04-08 20:28:57.836497	2015-04-08 20:28:57.836497	Appetizer
82	51	41	\N	\N	2015-04-08 20:29:02.599182	2015-04-08 20:29:02.599182	Appetizer
83	51	52	\N	\N	2015-04-08 20:29:05.970954	2015-04-08 20:29:05.970954	Appetizer
84	56	52	\N	\N	2015-04-08 21:05:04.935803	2015-04-08 21:05:04.935803	Appetizer
85	56	51	\N	\N	2015-04-08 21:05:24.578642	2015-04-08 21:05:24.578642	Appetizer
86	57	50	\N	\N	2015-04-08 21:07:48.769948	2015-04-08 21:07:48.769948	Appetizer
87	58	50	\N	\N	2015-04-08 21:09:35.849145	2015-04-08 21:09:35.849145	Appetizer
88	58	51	\N	\N	2015-04-08 21:09:49.282381	2015-04-08 21:09:49.282381	Appetizer
91	59	10	\N	\N	2015-04-08 21:16:48.731786	2015-04-08 21:16:48.731786	Appetizer
92	60	57	\N	\N	2015-04-08 21:35:01.725389	2015-04-08 21:35:01.725389	Appetizer
94	62	54	\N	\N	2015-04-08 21:38:48.610791	2015-04-08 21:38:48.610791	Appetizer
96	63	20	\N	\N	2015-04-08 21:42:27.470707	2015-04-08 21:42:27.470707	Appetizer
97	64	10	\N	\N	2015-04-08 21:43:03.586853	2015-04-08 21:43:03.586853	Appetizer
98	64	54	\N	\N	2015-04-08 21:43:32.454922	2015-04-08 21:43:32.454922	Appetizer
99	65	54	\N	\N	2015-04-08 21:48:45.938808	2015-04-08 21:48:45.938808	Appetizer
100	65	53	\N	\N	2015-04-08 21:48:47.722518	2015-04-08 21:48:47.722518	Appetizer
101	65	30	\N	\N	2015-04-08 21:48:49.417943	2015-04-08 21:48:49.417943	Side
102	65	5	\N	\N	2015-04-08 21:48:51.491552	2015-04-08 21:48:51.491552	Side
103	65	25	\N	\N	2015-04-08 21:49:01.768583	2015-04-08 21:49:01.768583	Main
104	65	4	\N	\N	2015-04-08 21:49:03.512532	2015-04-08 21:49:03.512532	Main
105	66	20	\N	\N	2015-04-08 21:50:17.247587	2015-04-08 21:50:17.247587	Appetizer
106	66	7	\N	\N	2015-04-08 21:50:17.292755	2015-04-08 21:50:17.292755	Appetizer
107	66	84	\N	\N	2015-04-08 21:50:17.314879	2015-04-08 21:50:17.314879	Side
108	66	3	\N	\N	2015-04-08 21:50:17.331431	2015-04-08 21:50:17.331431	Side
109	66	46	\N	\N	2015-04-08 21:50:17.360322	2015-04-08 21:50:17.360322	Main
110	66	56	\N	\N	2015-04-08 21:50:17.403524	2015-04-08 21:50:17.403524	Main
111	66	77	\N	\N	2015-04-08 21:51:12.12943	2015-04-08 21:51:12.12943	Dessert
112	66	78	\N	\N	2015-04-08 21:51:32.273068	2015-04-08 21:51:32.273068	Dessert
114	67	7	\N	\N	2015-04-08 21:52:16.856001	2015-04-08 21:52:16.856001	Appetizer
115	67	54	\N	\N	2015-04-08 21:52:16.903942	2015-04-08 21:52:16.903942	Appetizer
116	67	21	\N	\N	2015-04-08 21:52:16.929015	2015-04-08 21:52:16.929015	Side
117	67	56	\N	\N	2015-04-08 21:52:16.972914	2015-04-08 21:52:16.972914	Side
118	67	22	\N	\N	2015-04-08 21:52:17.014768	2015-04-08 21:52:17.014768	Main
119	67	11	\N	\N	2015-04-08 21:52:17.06402	2015-04-08 21:52:17.06402	Main
120	67	71	\N	\N	2015-04-08 21:53:14.535637	2015-04-08 21:53:14.535637	Dessert
121	69	52	\N	\N	2015-04-08 21:59:33.84795	2015-04-08 21:59:33.84795	Appetizer
122	69	93	\N	\N	2015-04-08 21:59:33.875848	2015-04-08 21:59:33.875848	Appetizer
123	69	10	\N	\N	2015-04-08 21:59:33.907495	2015-04-08 21:59:33.907495	Appetizer
124	70	60	\N	\N	2015-04-08 22:06:36.341622	2015-04-08 22:06:36.341622	Appetizer
125	71	60	\N	\N	2015-04-08 22:08:05.472217	2015-04-08 22:08:05.472217	Appetizer
126	71	50	\N	\N	2015-04-08 22:09:20.672852	2015-04-08 22:09:20.672852	Appetizer
127	71	57	\N	\N	2015-04-08 22:11:27.189234	2015-04-08 22:11:27.189234	Appetizer
128	71	55	\N	\N	2015-04-08 22:12:15.863827	2015-04-08 22:12:15.863827	Appetizer
129	71	53	\N	\N	2015-04-08 22:12:15.925377	2015-04-08 22:12:15.925377	Side
130	71	23	\N	\N	2015-04-08 22:12:15.941183	2015-04-08 22:12:15.941183	Side
131	71	52	\N	\N	2015-04-08 22:12:15.990736	2015-04-08 22:12:15.990736	Side
132	71	24	\N	\N	2015-04-08 22:12:16.031104	2015-04-08 22:12:16.031104	Side
133	71	25	\N	\N	2015-04-08 22:12:16.073969	2015-04-08 22:12:16.073969	Main
134	71	79	\N	\N	2015-04-08 22:12:16.118812	2015-04-08 22:12:16.118812	Main
135	71	5	\N	\N	2015-04-08 22:12:16.136567	2015-04-08 22:12:16.136567	Main
136	71	8	\N	\N	2015-04-08 22:12:16.171906	2015-04-08 22:12:16.171906	Main
137	71	78	\N	\N	2015-04-08 22:12:16.182955	2015-04-08 22:12:16.182955	Dessert
138	71	74	\N	\N	2015-04-08 22:12:16.191706	2015-04-08 22:12:16.191706	Dessert
139	71	72	\N	\N	2015-04-08 22:12:16.200833	2015-04-08 22:12:16.200833	Dessert
141	72	20	\N	\N	2015-04-08 22:15:40.007661	2015-04-08 22:15:40.007661	Appetizer
142	72	50	\N	\N	2015-04-08 22:15:40.036756	2015-04-08 22:15:40.036756	Appetizer
143	72	10	\N	\N	2015-04-08 22:15:40.069276	2015-04-08 22:15:40.069276	Appetizer
144	72	96	\N	\N	2015-04-08 22:15:40.100929	2015-04-08 22:15:40.100929	Appetizer
145	72	52	\N	\N	2015-04-08 22:15:40.136847	2015-04-08 22:15:40.136847	Side
146	72	84	\N	\N	2015-04-08 22:15:40.163784	2015-04-08 22:15:40.163784	Side
147	72	23	\N	\N	2015-04-08 22:15:40.196588	2015-04-08 22:15:40.196588	Side
148	72	59	\N	\N	2015-04-08 22:15:40.22932	2015-04-08 22:15:40.22932	Side
149	72	8	\N	\N	2015-04-08 22:15:40.25844	2015-04-08 22:15:40.25844	Main
150	72	79	\N	\N	2015-04-08 22:15:40.275925	2015-04-08 22:15:40.275925	Main
151	73	93	\N	\N	2015-04-08 22:36:10.943772	2015-04-08 22:36:10.943772	Appetizer
152	73	60	\N	\N	2015-04-08 22:36:13.56992	2015-04-08 22:36:13.56992	Appetizer
153	73	41	\N	\N	2015-04-08 22:36:15.671101	2015-04-08 22:36:15.671101	Appetizer
154	75	53	\N	\N	2015-04-08 23:36:25.379078	2015-04-08 23:36:25.379078	Appetizer
155	76	7	\N	\N	2015-04-08 23:37:14.775741	2015-04-08 23:37:14.775741	Appetizer
156	77	93	\N	\N	2015-04-09 00:07:02.855966	2015-04-09 00:07:02.855966	Appetizer
157	86	50	\N	\N	2015-04-09 00:23:57.510791	2015-04-09 00:23:57.510791	Appetizer
158	88	60	\N	\N	2015-04-09 00:26:55.701864	2015-04-09 00:26:55.701864	Appetizer
159	89	20	\N	\N	2015-04-09 00:32:47.878845	2015-04-09 00:32:47.878845	Appetizer
160	89	53	\N	\N	2015-04-09 00:32:48.941213	2015-04-09 00:32:48.941213	Appetizer
161	89	51	\N	\N	2015-04-09 00:32:49.853044	2015-04-09 00:32:49.853044	Appetizer
162	89	60	\N	\N	2015-04-09 00:32:50.833415	2015-04-09 00:32:50.833415	Appetizer
163	89	86	\N	\N	2015-04-09 00:32:50.845401	2015-04-09 00:32:50.845401	Side
165	90	53	\N	\N	2015-04-09 00:36:48.810916	2015-04-09 00:36:48.810916	Appetizer
166	90	55	\N	\N	2015-04-09 00:36:48.823346	2015-04-09 00:36:48.823346	Appetizer
167	90	26	\N	\N	2015-04-09 00:36:48.82636	2015-04-09 00:36:48.82636	Side
169	91	53	\N	\N	2015-04-09 00:41:37.226714	2015-04-09 00:41:37.226714	Appetizer
170	91	59	\N	\N	2015-04-09 00:41:37.230594	2015-04-09 00:41:37.230594	Appetizer
171	91	60	\N	\N	2015-04-09 00:41:37.233359	2015-04-09 00:41:37.233359	Appetizer
172	91	57	\N	\N	2015-04-09 00:41:37.236	2015-04-09 00:41:37.236	Appetizer
174	92	41	\N	\N	2015-04-09 00:42:05.33081	2015-04-09 00:42:05.33081	Appetizer
175	92	52	\N	\N	2015-04-09 00:42:05.333827	2015-04-09 00:42:05.333827	Appetizer
176	92	51	\N	\N	2015-04-09 00:42:05.33689	2015-04-09 00:42:05.33689	Appetizer
177	92	96	\N	\N	2015-04-09 00:42:05.339988	2015-04-09 00:42:05.339988	Appetizer
179	93	60	\N	\N	2015-04-09 00:45:23.140321	2015-04-09 00:45:23.140321	Appetizer
180	93	55	\N	\N	2015-04-09 00:45:23.142858	2015-04-09 00:45:23.142858	Appetizer
181	93	53	\N	\N	2015-04-09 00:45:23.145573	2015-04-09 00:45:23.145573	Appetizer
182	93	52	\N	\N	2015-04-09 00:45:23.149765	2015-04-09 00:45:23.149765	Appetizer
183	93	21	\N	\N	2015-04-09 00:45:23.152752	2015-04-09 00:45:23.152752	Side
185	94	10	\N	\N	2015-04-09 00:47:11.940116	2015-04-09 00:47:11.940116	Appetizer
186	94	52	\N	\N	2015-04-09 00:47:11.95115	2015-04-09 00:47:11.95115	Appetizer
187	94	53	\N	\N	2015-04-09 00:47:11.956359	2015-04-09 00:47:11.956359	Appetizer
188	94	20	\N	\N	2015-04-09 00:47:11.960079	2015-04-09 00:47:11.960079	Appetizer
189	94	30	\N	\N	2015-04-09 00:47:11.966312	2015-04-09 00:47:11.966312	Side
190	94	21	\N	\N	2015-04-09 00:47:11.96977	2015-04-09 00:47:11.96977	Side
191	94	29	\N	\N	2015-04-09 00:47:11.97411	2015-04-09 00:47:11.97411	Side
193	95	7	\N	\N	2015-04-09 00:51:17.408611	2015-04-09 00:51:17.408611	Appetizer
194	95	54	\N	\N	2015-04-09 00:51:17.411842	2015-04-09 00:51:17.411842	Appetizer
195	95	55	\N	\N	2015-04-09 00:51:17.414495	2015-04-09 00:51:17.414495	Appetizer
196	95	57	\N	\N	2015-04-09 00:51:17.417204	2015-04-09 00:51:17.417204	Appetizer
197	95	3	\N	\N	2015-04-09 00:51:17.419786	2015-04-09 00:51:17.419786	Side
198	95	59	\N	\N	2015-04-09 00:51:17.422654	2015-04-09 00:51:17.422654	Side
199	95	21	\N	\N	2015-04-09 00:51:17.425432	2015-04-09 00:51:17.425432	Side
200	95	86	\N	\N	2015-04-09 00:51:17.428261	2015-04-09 00:51:17.428261	Side
201	95	19	\N	\N	2015-04-09 00:51:17.431726	2015-04-09 00:51:17.431726	Main
202	95	17	\N	\N	2015-04-09 00:51:17.434826	2015-04-09 00:51:17.434826	Main
203	95	46	\N	\N	2015-04-09 00:51:17.437692	2015-04-09 00:51:17.437692	Main
204	95	39	\N	\N	2015-04-09 00:51:17.44042	2015-04-09 00:51:17.44042	Main
205	96	20	\N	\N	2015-04-09 00:52:42.563211	2015-04-09 00:52:42.563211	Appetizer
206	96	51	\N	\N	2015-04-09 00:52:42.566716	2015-04-09 00:52:42.566716	Appetizer
207	96	60	\N	\N	2015-04-09 00:52:42.569325	2015-04-09 00:52:42.569325	Appetizer
208	96	7	\N	\N	2015-04-09 00:52:42.571965	2015-04-09 00:52:42.571965	Appetizer
209	96	24	\N	\N	2015-04-09 00:52:42.574551	2015-04-09 00:52:42.574551	Side
210	96	44	\N	\N	2015-04-09 00:52:42.577099	2015-04-09 00:52:42.577099	Side
211	96	26	\N	\N	2015-04-09 00:52:42.57979	2015-04-09 00:52:42.57979	Side
212	96	50	\N	\N	2015-04-09 00:52:42.582507	2015-04-09 00:52:42.582507	Side
213	96	63	\N	\N	2015-04-09 00:52:42.585396	2015-04-09 00:52:42.585396	Main
214	96	61	\N	\N	2015-04-09 00:52:42.588556	2015-04-09 00:52:42.588556	Main
215	96	22	\N	\N	2015-04-09 00:52:42.591434	2015-04-09 00:52:42.591434	Main
216	96	64	\N	\N	2015-04-09 00:52:42.594073	2015-04-09 00:52:42.594073	Main
217	96	71	\N	\N	2015-04-09 00:52:42.596698	2015-04-09 00:52:42.596698	Dessert
218	96	73	\N	\N	2015-04-09 00:52:42.59924	2015-04-09 00:52:42.59924	Dessert
219	96	78	\N	\N	2015-04-09 00:52:42.601759	2015-04-09 00:52:42.601759	Dessert
220	96	75	\N	\N	2015-04-09 00:52:42.604429	2015-04-09 00:52:42.604429	Dessert
221	97	50	\N	\N	2015-04-09 14:02:08.593685	2015-04-09 14:02:08.593685	Appetizer
222	97	53	\N	\N	2015-04-09 14:02:08.598261	2015-04-09 14:02:08.598261	Appetizer
223	97	26	\N	\N	2015-04-09 14:02:08.601441	2015-04-09 14:02:08.601441	Side
224	97	84	\N	\N	2015-04-09 14:02:08.60468	2015-04-09 14:02:08.60468	Side
225	97	61	\N	\N	2015-04-09 14:02:08.607718	2015-04-09 14:02:08.607718	Main
226	97	142	\N	\N	2015-04-09 14:02:08.610818	2015-04-09 14:02:08.610818	Main
227	97	71	\N	\N	2015-04-09 14:02:08.614454	2015-04-09 14:02:08.614454	Dessert
228	97	94	\N	\N	2015-04-09 14:02:08.617526	2015-04-09 14:02:08.617526	Dessert
229	98	119	\N	\N	2015-04-09 14:05:14.47877	2015-04-09 14:05:14.47877	Appetizer
230	98	103	\N	\N	2015-04-09 14:05:14.483094	2015-04-09 14:05:14.483094	Appetizer
231	98	27	\N	\N	2015-04-09 14:05:14.487412	2015-04-09 14:05:14.487412	Side
232	98	111	\N	\N	2015-04-09 14:05:14.491283	2015-04-09 14:05:14.491283	Side
233	98	143	\N	\N	2015-04-09 14:05:14.497756	2015-04-09 14:05:14.497756	Main
234	98	37	\N	\N	2015-04-09 14:05:14.50136	2015-04-09 14:05:14.50136	Main
235	98	76	\N	\N	2015-04-09 14:05:14.505359	2015-04-09 14:05:14.505359	Dessert
236	98	69	\N	\N	2015-04-09 14:05:14.508242	2015-04-09 14:05:14.508242	Dessert
\.


--
-- Name: menu_recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jeremysklarsky
--

SELECT pg_catalog.setval('menu_recipes_id_seq', 236, true);


--
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: jeremysklarsky
--

COPY menus (id, dinner_id, name, created_at, updated_at, finalized) FROM stdin;
1	1	Lovely Menu	2015-04-07 21:03:07.937471	2015-04-07 21:03:07.937471	f
2	14	\N	2015-04-07 22:04:39.959193	2015-04-07 22:04:39.959193	f
3	\N	\N	2015-04-08 11:26:10.119015	2015-04-08 11:28:05.954174	f
4	15	\N	2015-04-08 11:28:05.968279	2015-04-08 11:28:05.968279	f
5	\N	\N	2015-04-08 13:00:20.659547	2015-04-08 13:03:48.236677	f
6	16	\N	2015-04-08 13:03:48.248381	2015-04-08 13:03:48.248381	f
7	\N	\N	2015-04-08 16:11:53.010345	2015-04-08 16:12:21.381073	f
8	17	\N	2015-04-08 16:12:21.393092	2015-04-08 16:12:21.393092	f
9	18	\N	2015-04-08 16:14:59.394321	2015-04-08 16:14:59.394321	f
10	19	\N	2015-04-08 16:17:43.1499	2015-04-08 16:17:43.1499	f
11	20	\N	2015-04-08 16:18:18.978776	2015-04-08 16:18:18.978776	f
12	21	\N	2015-04-08 18:23:56.554113	2015-04-08 18:23:56.554113	f
13	22	\N	2015-04-08 18:36:41.536139	2015-04-08 18:36:41.536139	f
14	23	\N	2015-04-08 18:42:29.824083	2015-04-08 18:42:29.824083	f
15	24	\N	2015-04-08 18:43:08.696432	2015-04-08 18:43:08.696432	f
16	25	\N	2015-04-08 18:45:53.976422	2015-04-08 18:45:53.976422	f
17	26	\N	2015-04-08 18:46:31.723105	2015-04-08 18:46:31.723105	f
18	\N	\N	2015-04-08 18:47:18.932251	2015-04-08 18:47:33.812472	f
19	27	\N	2015-04-08 18:47:33.826643	2015-04-08 18:47:33.826643	f
20	28	\N	2015-04-08 18:58:28.854022	2015-04-08 18:58:28.854022	f
21	29	\N	2015-04-08 19:02:41.716798	2015-04-08 19:02:41.716798	f
22	\N	\N	2015-04-08 19:03:44.984995	2015-04-08 19:04:43.608725	f
23	30	\N	2015-04-08 19:04:43.623661	2015-04-08 19:04:43.623661	f
24	31	\N	2015-04-08 19:09:48.672866	2015-04-08 19:09:48.672866	f
25	32	\N	2015-04-08 19:10:54.163696	2015-04-08 19:10:54.163696	f
26	33	\N	2015-04-08 19:17:13.540478	2015-04-08 19:17:13.540478	f
27	\N	\N	2015-04-08 19:19:22.696658	2015-04-08 19:26:29.573803	f
28	34	\N	2015-04-08 19:26:29.587797	2015-04-08 19:26:29.587797	f
29	35	\N	2015-04-08 19:27:00.062926	2015-04-08 19:27:00.062926	f
30	36	\N	2015-04-08 19:28:25.784392	2015-04-08 19:28:25.784392	f
31	37	\N	2015-04-08 19:29:17.784376	2015-04-08 19:29:17.784376	f
32	38	\N	2015-04-08 19:34:01.750108	2015-04-08 19:34:01.750108	f
33	39	\N	2015-04-08 19:34:59.828521	2015-04-08 19:34:59.828521	f
34	40	\N	2015-04-08 19:37:19.570334	2015-04-08 19:37:19.570334	f
35	41	\N	2015-04-08 19:39:35.844316	2015-04-08 19:39:35.844316	f
36	43	\N	2015-04-08 19:48:26.799393	2015-04-08 19:48:26.799393	f
37	44	\N	2015-04-08 19:51:38.69093	2015-04-08 19:51:38.69093	f
38	45	\N	2015-04-08 19:54:14.878288	2015-04-08 19:54:14.878288	f
39	46	\N	2015-04-08 19:56:09.196432	2015-04-08 19:56:09.196432	f
40	47	\N	2015-04-08 19:57:12.323917	2015-04-08 19:57:12.323917	f
41	48	\N	2015-04-08 19:57:37.129589	2015-04-08 19:57:37.129589	f
42	49	\N	2015-04-08 20:00:03.664711	2015-04-08 20:00:03.664711	f
43	50	\N	2015-04-08 20:03:15.562078	2015-04-08 20:03:15.562078	f
44	51	\N	2015-04-08 20:05:12.071565	2015-04-08 20:05:12.071565	f
45	52	\N	2015-04-08 20:07:59.196094	2015-04-08 20:07:59.196094	f
46	53	\N	2015-04-08 20:09:43.31779	2015-04-08 20:09:43.31779	f
47	54	\N	2015-04-08 20:12:44.78089	2015-04-08 20:12:44.78089	f
48	55	\N	2015-04-08 20:14:02.722782	2015-04-08 20:14:02.722782	f
49	56	\N	2015-04-08 20:21:02.352357	2015-04-08 20:21:02.352357	f
50	57	\N	2015-04-08 20:25:39.370513	2015-04-08 20:25:39.370513	f
51	58	\N	2015-04-08 20:28:08.452885	2015-04-08 20:28:08.452885	f
52	59	\N	2015-04-08 20:33:36.298747	2015-04-08 20:33:36.298747	f
53	60	\N	2015-04-08 20:37:14.063493	2015-04-08 20:37:14.063493	f
54	61	\N	2015-04-08 20:41:33.710628	2015-04-08 20:41:33.710628	f
55	62	\N	2015-04-08 20:44:03.532197	2015-04-08 20:44:03.532197	f
56	63	\N	2015-04-08 21:04:52.376979	2015-04-08 21:04:52.376979	f
57	64	\N	2015-04-08 21:07:48.671422	2015-04-08 21:07:48.671422	f
58	65	\N	2015-04-08 21:09:35.75926	2015-04-08 21:09:35.75926	f
59	66	\N	2015-04-08 21:16:48.264602	2015-04-08 21:16:48.264602	f
60	67	\N	2015-04-08 21:23:16.644621	2015-04-08 21:23:16.644621	f
61	68	\N	2015-04-08 21:36:22.965154	2015-04-08 21:36:22.965154	f
62	69	\N	2015-04-08 21:37:48.683045	2015-04-08 21:37:48.683045	f
63	70	\N	2015-04-08 21:41:53.599341	2015-04-08 21:41:53.599341	f
64	71	\N	2015-04-08 21:42:44.656402	2015-04-08 21:42:44.656402	f
65	72	\N	2015-04-08 21:48:43.361196	2015-04-08 21:48:43.361196	f
66	73	\N	2015-04-08 21:50:17.137294	2015-04-08 21:50:17.137294	f
67	74	\N	2015-04-08 21:52:16.730949	2015-04-08 21:52:16.730949	f
68	75	\N	2015-04-08 21:53:58.92337	2015-04-08 21:53:58.92337	f
69	76	\N	2015-04-08 21:59:33.724431	2015-04-08 21:59:33.724431	f
70	77	\N	2015-04-08 22:05:48.336512	2015-04-08 22:05:48.336512	f
71	78	\N	2015-04-08 22:08:05.333272	2015-04-08 22:08:05.333272	f
72	79	\N	2015-04-08 22:15:39.888418	2015-04-08 22:15:39.888418	f
73	80	\N	2015-04-08 22:25:03.694597	2015-04-08 22:25:03.694597	f
74	\N	\N	2015-04-08 23:32:56.356297	2015-04-08 23:36:25.268395	f
75	81	\N	2015-04-08 23:36:25.283642	2015-04-08 23:36:25.283642	f
76	82	\N	2015-04-08 23:37:14.438865	2015-04-08 23:37:14.438865	f
77	83	\N	2015-04-08 23:39:22.410471	2015-04-08 23:39:22.410471	f
78	84	\N	2015-04-09 00:07:35.351398	2015-04-09 00:07:35.351398	f
79	85	\N	2015-04-09 00:08:19.683004	2015-04-09 00:08:19.683004	f
80	86	\N	2015-04-09 00:08:49.088875	2015-04-09 00:08:49.088875	f
81	87	\N	2015-04-09 00:10:10.076104	2015-04-09 00:10:10.076104	f
82	88	\N	2015-04-09 00:13:13.990898	2015-04-09 00:13:13.990898	f
83	89	\N	2015-04-09 00:13:44.112789	2015-04-09 00:13:44.112789	f
84	90	\N	2015-04-09 00:17:22.846138	2015-04-09 00:17:22.846138	f
85	91	\N	2015-04-09 00:20:46.954183	2015-04-09 00:20:46.954183	f
86	92	\N	2015-04-09 00:22:51.115932	2015-04-09 00:22:51.115932	f
87	93	\N	2015-04-09 00:24:53.275074	2015-04-09 00:24:53.275074	f
88	94	\N	2015-04-09 00:26:48.391978	2015-04-09 00:26:48.391978	f
89	95	\N	2015-04-09 00:32:42.067132	2015-04-09 00:32:42.067132	f
90	96	\N	2015-04-09 00:36:48.687124	2015-04-09 00:36:48.687124	f
91	97	\N	2015-04-09 00:41:37.134753	2015-04-09 00:41:37.134753	f
92	98	\N	2015-04-09 00:42:05.247304	2015-04-09 00:42:05.247304	f
93	99	\N	2015-04-09 00:45:23.045409	2015-04-09 00:45:23.045409	f
94	100	\N	2015-04-09 00:47:11.804154	2015-04-09 00:47:11.804154	f
95	101	\N	2015-04-09 00:51:17.313296	2015-04-09 00:51:17.313296	f
96	102	\N	2015-04-09 00:52:42.481355	2015-04-09 00:52:42.481355	f
97	103	\N	2015-04-09 14:02:08.467724	2015-04-09 14:02:08.467724	f
98	104	\N	2015-04-09 14:05:14.39338	2015-04-09 14:05:14.39338	f
\.


--
-- Name: menus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jeremysklarsky
--

SELECT pg_catalog.setval('menus_id_seq', 98, true);


--
-- Data for Name: recipe_courses; Type: TABLE DATA; Schema: public; Owner: jeremysklarsky
--

COPY recipe_courses (id, recipe_id, course_id, created_at, updated_at) FROM stdin;
1	1	1	2015-04-07 18:50:11.191934	2015-04-07 18:50:11.191934
2	1	2	2015-04-07 18:50:11.194795	2015-04-07 18:50:11.194795
3	2	1	2015-04-07 18:50:11.882791	2015-04-07 18:50:11.882791
4	2	2	2015-04-07 18:50:11.88448	2015-04-07 18:50:11.88448
5	3	1	2015-04-07 18:50:12.51675	2015-04-07 18:50:12.51675
6	3	3	2015-04-07 18:50:12.518295	2015-04-07 18:50:12.518295
7	4	1	2015-04-07 18:50:13.335387	2015-04-07 18:50:13.335387
8	4	4	2015-04-07 18:50:13.336652	2015-04-07 18:50:13.336652
9	5	1	2015-04-07 18:50:13.893144	2015-04-07 18:50:13.893144
10	5	5	2015-04-07 18:50:13.896015	2015-04-07 18:50:13.896015
11	6	1	2015-04-07 18:50:14.634806	2015-04-07 18:50:14.634806
12	6	6	2015-04-07 18:50:14.636917	2015-04-07 18:50:14.636917
13	7	7	2015-04-07 18:50:15.505478	2015-04-07 18:50:15.505478
14	7	8	2015-04-07 18:50:15.506889	2015-04-07 18:50:15.506889
15	8	1	2015-04-07 18:50:16.551423	2015-04-07 18:50:16.551423
16	8	6	2015-04-07 18:50:16.552808	2015-04-07 18:50:16.552808
17	9	1	2015-04-07 18:50:17.27839	2015-04-07 18:50:17.27839
18	9	9	2015-04-07 18:50:17.281146	2015-04-07 18:50:17.281146
19	10	10	2015-04-07 18:50:17.891674	2015-04-07 18:50:17.891674
20	10	11	2015-04-07 18:50:17.893979	2015-04-07 18:50:17.893979
21	11	1	2015-04-07 18:51:04.546657	2015-04-07 18:51:04.546657
22	11	12	2015-04-07 18:51:04.550111	2015-04-07 18:51:04.550111
23	12	1	2015-04-07 18:51:05.962515	2015-04-07 18:51:05.962515
24	12	12	2015-04-07 18:51:05.964773	2015-04-07 18:51:05.964773
25	13	1	2015-04-07 18:51:06.794294	2015-04-07 18:51:06.794294
26	13	2	2015-04-07 18:51:06.795887	2015-04-07 18:51:06.795887
27	14	1	2015-04-07 18:51:07.664812	2015-04-07 18:51:07.664812
28	14	13	2015-04-07 18:51:07.666586	2015-04-07 18:51:07.666586
29	15	13	2015-04-07 18:51:08.479278	2015-04-07 18:51:08.479278
30	16	1	2015-04-07 18:51:09.27927	2015-04-07 18:51:09.27927
31	16	12	2015-04-07 18:51:09.282063	2015-04-07 18:51:09.282063
32	17	1	2015-04-07 18:51:10.229305	2015-04-07 18:51:10.229305
33	17	14	2015-04-07 18:51:10.230523	2015-04-07 18:51:10.230523
34	18	1	2015-04-07 18:51:10.539514	2015-04-07 18:51:10.539514
35	18	15	2015-04-07 18:51:10.541665	2015-04-07 18:51:10.541665
36	19	1	2015-04-07 18:51:11.482268	2015-04-07 18:51:11.482268
37	19	12	2015-04-07 18:51:11.48352	2015-04-07 18:51:11.48352
38	20	16	2015-04-07 18:51:11.84581	2015-04-07 18:51:11.84581
39	20	17	2015-04-07 18:51:11.84802	2015-04-07 18:51:11.84802
40	21	7	2015-04-07 18:51:44.155662	2015-04-07 18:51:44.155662
41	21	18	2015-04-07 18:51:44.157468	2015-04-07 18:51:44.157468
42	22	10	2015-04-07 18:51:44.485701	2015-04-07 18:51:44.485701
43	22	19	2015-04-07 18:51:44.487622	2015-04-07 18:51:44.487622
44	23	7	2015-04-07 18:51:44.866876	2015-04-07 18:51:44.866876
45	23	18	2015-04-07 18:51:44.868644	2015-04-07 18:51:44.868644
46	24	10	2015-04-07 18:51:45.186379	2015-04-07 18:51:45.186379
47	24	20	2015-04-07 18:51:45.188569	2015-04-07 18:51:45.188569
48	25	1	2015-04-07 18:51:45.538344	2015-04-07 18:51:45.538344
49	25	21	2015-04-07 18:51:45.540608	2015-04-07 18:51:45.540608
50	26	7	2015-04-07 18:51:45.866011	2015-04-07 18:51:45.866011
51	26	18	2015-04-07 18:51:45.867706	2015-04-07 18:51:45.867706
52	27	1	2015-04-07 18:51:46.207029	2015-04-07 18:51:46.207029
53	27	5	2015-04-07 18:51:46.20859	2015-04-07 18:51:46.20859
54	28	1	2015-04-07 18:51:46.536349	2015-04-07 18:51:46.536349
55	28	13	2015-04-07 18:51:46.538752	2015-04-07 18:51:46.538752
56	29	7	2015-04-07 18:51:46.865399	2015-04-07 18:51:46.865399
57	29	18	2015-04-07 18:51:46.867122	2015-04-07 18:51:46.867122
58	30	7	2015-04-07 18:51:47.172576	2015-04-07 18:51:47.172576
59	30	18	2015-04-07 18:51:47.173825	2015-04-07 18:51:47.173825
60	31	10	2015-04-07 18:51:53.110173	2015-04-07 18:51:53.110173
61	31	22	2015-04-07 18:51:53.113129	2015-04-07 18:51:53.113129
62	32	10	2015-04-07 18:51:53.439283	2015-04-07 18:51:53.439283
63	32	23	2015-04-07 18:51:53.44176	2015-04-07 18:51:53.44176
64	33	10	2015-04-07 18:51:53.80048	2015-04-07 18:51:53.80048
65	33	23	2015-04-07 18:51:53.801795	2015-04-07 18:51:53.801795
66	34	10	2015-04-07 18:51:54.133775	2015-04-07 18:51:54.133775
67	34	24	2015-04-07 18:51:54.135626	2015-04-07 18:51:54.135626
68	35	10	2015-04-07 18:51:54.775004	2015-04-07 18:51:54.775004
69	35	25	2015-04-07 18:51:54.777984	2015-04-07 18:51:54.777984
70	36	1	2015-04-07 18:51:56.291085	2015-04-07 18:51:56.291085
71	36	26	2015-04-07 18:51:56.292781	2015-04-07 18:51:56.292781
72	37	10	2015-04-07 18:51:56.618038	2015-04-07 18:51:56.618038
73	37	27	2015-04-07 18:51:56.620948	2015-04-07 18:51:56.620948
74	38	10	2015-04-07 18:51:56.980958	2015-04-07 18:51:56.980958
75	38	28	2015-04-07 18:51:56.982855	2015-04-07 18:51:56.982855
76	39	10	2015-04-07 18:51:57.405197	2015-04-07 18:51:57.405197
77	39	29	2015-04-07 18:51:57.407074	2015-04-07 18:51:57.407074
78	40	1	2015-04-07 18:52:03.795566	2015-04-07 18:52:03.795566
79	40	6	2015-04-07 18:52:03.797916	2015-04-07 18:52:03.797916
80	41	16	2015-04-07 18:52:04.142134	2015-04-07 18:52:04.142134
81	41	30	2015-04-07 18:52:04.144869	2015-04-07 18:52:04.144869
82	42	1	2015-04-07 18:52:04.469475	2015-04-07 18:52:04.469475
83	42	31	2015-04-07 18:52:04.470734	2015-04-07 18:52:04.470734
84	43	1	2015-04-07 18:52:04.801954	2015-04-07 18:52:04.801954
85	43	6	2015-04-07 18:52:04.803574	2015-04-07 18:52:04.803574
86	44	1	2015-04-07 18:52:05.222157	2015-04-07 18:52:05.222157
87	44	5	2015-04-07 18:52:05.224235	2015-04-07 18:52:05.224235
88	45	1	2015-04-07 18:52:05.604923	2015-04-07 18:52:05.604923
89	45	31	2015-04-07 18:52:05.608562	2015-04-07 18:52:05.608562
90	46	1	2015-04-07 18:52:06.003252	2015-04-07 18:52:06.003252
91	46	9	2015-04-07 18:52:06.005153	2015-04-07 18:52:06.005153
92	47	32	2015-04-07 18:52:06.333167	2015-04-07 18:52:06.333167
93	47	33	2015-04-07 18:52:06.334731	2015-04-07 18:52:06.334731
94	48	1	2015-04-07 18:52:06.648551	2015-04-07 18:52:06.648551
95	48	21	2015-04-07 18:52:06.649751	2015-04-07 18:52:06.649751
96	49	13	2015-04-07 18:52:07.003463	2015-04-07 18:52:07.003463
97	50	34	2015-04-07 18:52:31.983636	2015-04-07 18:52:31.983636
98	50	35	2015-04-07 18:52:31.985699	2015-04-07 18:52:31.985699
99	51	34	2015-04-07 18:52:32.306877	2015-04-07 18:52:32.306877
100	51	35	2015-04-07 18:52:32.308108	2015-04-07 18:52:32.308108
101	52	34	2015-04-07 18:52:32.65227	2015-04-07 18:52:32.65227
102	52	36	2015-04-07 18:52:32.654041	2015-04-07 18:52:32.654041
103	53	34	2015-04-07 18:52:32.990791	2015-04-07 18:52:32.990791
104	53	37	2015-04-07 18:52:32.992828	2015-04-07 18:52:32.992828
105	54	34	2015-04-07 18:52:33.278945	2015-04-07 18:52:33.278945
106	54	38	2015-04-07 18:52:33.281163	2015-04-07 18:52:33.281163
107	55	34	2015-04-07 18:52:33.636869	2015-04-07 18:52:33.636869
108	55	35	2015-04-07 18:52:33.63842	2015-04-07 18:52:33.63842
109	56	1	2015-04-07 18:52:34.025208	2015-04-07 18:52:34.025208
110	56	3	2015-04-07 18:52:34.027057	2015-04-07 18:52:34.027057
111	57	34	2015-04-07 18:52:34.378314	2015-04-07 18:52:34.378314
112	57	36	2015-04-07 18:52:34.380815	2015-04-07 18:52:34.380815
113	58	1	2015-04-07 18:52:34.723642	2015-04-07 18:52:34.723642
114	58	3	2015-04-07 18:52:34.725181	2015-04-07 18:52:34.725181
115	59	34	2015-04-07 18:52:35.066166	2015-04-07 18:52:35.066166
116	59	39	2015-04-07 18:52:35.067729	2015-04-07 18:52:35.067729
117	60	16	2015-04-07 18:52:51.420253	2015-04-07 18:52:51.420253
118	60	17	2015-04-07 18:52:51.422194	2015-04-07 18:52:51.422194
119	61	1	2015-04-07 18:52:51.776566	2015-04-07 18:52:51.776566
120	61	40	2015-04-07 18:52:51.778968	2015-04-07 18:52:51.778968
121	62	1	2015-04-07 18:52:52.170302	2015-04-07 18:52:52.170302
122	62	40	2015-04-07 18:52:52.171613	2015-04-07 18:52:52.171613
123	63	1	2015-04-07 18:52:52.541438	2015-04-07 18:52:52.541438
124	63	40	2015-04-07 18:52:52.542991	2015-04-07 18:52:52.542991
125	64	1	2015-04-07 18:52:52.828309	2015-04-07 18:52:52.828309
126	64	40	2015-04-07 18:52:52.830841	2015-04-07 18:52:52.830841
127	65	1	2015-04-07 18:52:53.129656	2015-04-07 18:52:53.129656
128	65	40	2015-04-07 18:52:53.131175	2015-04-07 18:52:53.131175
129	66	1	2015-04-07 18:52:53.475069	2015-04-07 18:52:53.475069
130	66	40	2015-04-07 18:52:53.476646	2015-04-07 18:52:53.476646
131	67	1	2015-04-07 18:52:53.763604	2015-04-07 18:52:53.763604
132	67	40	2015-04-07 18:52:53.764911	2015-04-07 18:52:53.764911
133	68	1	2015-04-07 18:52:54.1213	2015-04-07 18:52:54.1213
134	68	41	2015-04-07 18:52:54.123059	2015-04-07 18:52:54.123059
135	69	42	2015-04-07 18:52:59.412391	2015-04-07 18:52:59.412391
136	69	43	2015-04-07 18:52:59.415197	2015-04-07 18:52:59.415197
137	70	42	2015-04-07 18:52:59.752819	2015-04-07 18:52:59.752819
138	70	43	2015-04-07 18:52:59.75508	2015-04-07 18:52:59.75508
139	71	42	2015-04-07 18:53:00.043776	2015-04-07 18:53:00.043776
140	71	43	2015-04-07 18:53:00.045877	2015-04-07 18:53:00.045877
141	72	42	2015-04-07 18:53:00.485783	2015-04-07 18:53:00.485783
142	72	44	2015-04-07 18:53:00.487452	2015-04-07 18:53:00.487452
143	73	42	2015-04-07 18:53:00.758384	2015-04-07 18:53:00.758384
144	73	43	2015-04-07 18:53:00.759946	2015-04-07 18:53:00.759946
145	74	42	2015-04-07 18:53:01.041702	2015-04-07 18:53:01.041702
146	74	43	2015-04-07 18:53:01.042894	2015-04-07 18:53:01.042894
147	75	42	2015-04-07 18:53:01.328692	2015-04-07 18:53:01.328692
148	75	43	2015-04-07 18:53:01.330882	2015-04-07 18:53:01.330882
149	76	42	2015-04-07 18:53:01.667425	2015-04-07 18:53:01.667425
150	76	44	2015-04-07 18:53:01.668768	2015-04-07 18:53:01.668768
151	77	42	2015-04-07 18:53:01.890976	2015-04-07 18:53:01.890976
152	77	43	2015-04-07 18:53:01.892495	2015-04-07 18:53:01.892495
153	78	42	2015-04-07 18:53:02.93893	2015-04-07 18:53:02.93893
154	78	45	2015-04-07 18:53:02.941035	2015-04-07 18:53:02.941035
155	79	1	2015-04-07 18:53:41.691018	2015-04-07 18:53:41.691018
156	79	12	2015-04-07 18:53:41.693428	2015-04-07 18:53:41.693428
157	80	13	2015-04-07 18:53:42.029414	2015-04-07 18:53:42.029414
158	81	13	2015-04-07 18:53:42.393106	2015-04-07 18:53:42.393106
159	82	7	2015-04-07 18:53:42.675249	2015-04-07 18:53:42.675249
160	82	46	2015-04-07 18:53:42.677405	2015-04-07 18:53:42.677405
161	83	1	2015-04-07 18:53:42.991255	2015-04-07 18:53:42.991255
162	83	12	2015-04-07 18:53:42.992622	2015-04-07 18:53:42.992622
163	84	7	2015-04-07 18:53:43.322291	2015-04-07 18:53:43.322291
164	84	18	2015-04-07 18:53:43.324163	2015-04-07 18:53:43.324163
165	85	1	2015-04-07 18:53:43.631115	2015-04-07 18:53:43.631115
166	85	40	2015-04-07 18:53:43.63274	2015-04-07 18:53:43.63274
167	86	7	2015-04-07 18:53:43.960165	2015-04-07 18:53:43.960165
168	86	18	2015-04-07 18:53:43.961522	2015-04-07 18:53:43.961522
169	87	7	2015-04-07 18:53:44.330425	2015-04-07 18:53:44.330425
170	87	18	2015-04-07 18:53:44.332367	2015-04-07 18:53:44.332367
171	88	1	2015-04-07 18:53:44.710201	2015-04-07 18:53:44.710201
172	88	15	2015-04-07 18:53:44.711681	2015-04-07 18:53:44.711681
173	89	47	2015-04-07 18:54:03.884715	2015-04-07 18:54:03.884715
174	89	48	2015-04-07 18:54:03.88698	2015-04-07 18:54:03.88698
175	90	47	2015-04-07 18:54:04.239844	2015-04-07 18:54:04.239844
176	90	49	2015-04-07 18:54:04.241549	2015-04-07 18:54:04.241549
177	91	47	2015-04-07 18:54:04.636135	2015-04-07 18:54:04.636135
178	91	50	2015-04-07 18:54:04.638713	2015-04-07 18:54:04.638713
179	92	47	2015-04-07 18:54:05.057136	2015-04-07 18:54:05.057136
180	92	51	2015-04-07 18:54:05.059791	2015-04-07 18:54:05.059791
181	93	16	2015-04-07 18:54:05.318712	2015-04-07 18:54:05.318712
182	93	17	2015-04-07 18:54:05.319936	2015-04-07 18:54:05.319936
183	94	42	2015-04-07 18:54:05.708674	2015-04-07 18:54:05.708674
184	94	44	2015-04-07 18:54:05.709987	2015-04-07 18:54:05.709987
185	95	52	2015-04-07 18:54:06.069091	2015-04-07 18:54:06.069091
186	95	53	2015-04-07 18:54:06.070556	2015-04-07 18:54:06.070556
187	96	16	2015-04-07 18:54:06.39452	2015-04-07 18:54:06.39452
188	96	54	2015-04-07 18:54:06.396723	2015-04-07 18:54:06.396723
189	97	47	2015-04-07 18:54:06.744213	2015-04-07 18:54:06.744213
190	97	55	2015-04-07 18:54:06.74574	2015-04-07 18:54:06.74574
191	98	47	2015-04-07 18:54:07.088167	2015-04-07 18:54:07.088167
192	98	56	2015-04-07 18:54:07.090403	2015-04-07 18:54:07.090403
193	99	7	2015-04-09 13:31:24.509454	2015-04-09 13:31:24.509454
194	99	46	2015-04-09 13:31:24.512991	2015-04-09 13:31:24.512991
195	100	1	2015-04-09 13:31:25.230751	2015-04-09 13:31:25.230751
196	100	41	2015-04-09 13:31:25.231989	2015-04-09 13:31:25.231989
197	101	1	2015-04-09 13:31:25.632891	2015-04-09 13:31:25.632891
198	101	15	2015-04-09 13:31:25.634328	2015-04-09 13:31:25.634328
199	102	1	2015-04-09 13:31:26.00417	2015-04-09 13:31:26.00417
200	102	40	2015-04-09 13:31:26.005751	2015-04-09 13:31:26.005751
201	103	16	2015-04-09 13:32:10.013566	2015-04-09 13:32:10.013566
202	103	17	2015-04-09 13:32:10.016025	2015-04-09 13:32:10.016025
203	104	16	2015-04-09 13:32:10.349142	2015-04-09 13:32:10.349142
204	104	57	2015-04-09 13:32:10.352444	2015-04-09 13:32:10.352444
205	105	16	2015-04-09 13:32:11.045539	2015-04-09 13:32:11.045539
206	105	58	2015-04-09 13:32:11.048402	2015-04-09 13:32:11.048402
207	106	16	2015-04-09 13:32:11.328349	2015-04-09 13:32:11.328349
208	106	30	2015-04-09 13:32:11.330489	2015-04-09 13:32:11.330489
209	107	16	2015-04-09 13:32:11.631745	2015-04-09 13:32:11.631745
210	107	59	2015-04-09 13:32:11.63382	2015-04-09 13:32:11.63382
211	108	16	2015-04-09 13:32:12.230797	2015-04-09 13:32:12.230797
212	108	58	2015-04-09 13:32:12.232334	2015-04-09 13:32:12.232334
213	109	16	2015-04-09 13:32:12.579598	2015-04-09 13:32:12.579598
214	109	20	2015-04-09 13:32:12.580812	2015-04-09 13:32:12.580812
215	110	60	2015-04-09 13:35:03.894847	2015-04-09 13:35:03.894847
216	110	61	2015-04-09 13:35:03.897202	2015-04-09 13:35:03.897202
217	111	7	2015-04-09 13:35:04.385297	2015-04-09 13:35:04.385297
218	111	62	2015-04-09 13:35:04.387055	2015-04-09 13:35:04.387055
219	112	7	2015-04-09 13:35:05.268752	2015-04-09 13:35:05.268752
220	112	62	2015-04-09 13:35:05.270133	2015-04-09 13:35:05.270133
221	113	7	2015-04-09 13:35:08.851571	2015-04-09 13:35:08.851571
222	113	13	2015-04-09 13:35:08.85393	2015-04-09 13:35:08.85393
223	114	1	2015-04-09 13:37:10.79405	2015-04-09 13:37:10.79405
224	114	31	2015-04-09 13:37:10.79716	2015-04-09 13:37:10.79716
225	115	1	2015-04-09 13:37:11.135377	2015-04-09 13:37:11.135377
226	115	9	2015-04-09 13:37:11.136673	2015-04-09 13:37:11.136673
227	116	1	2015-04-09 13:37:11.879219	2015-04-09 13:37:11.879219
228	116	63	2015-04-09 13:37:11.880499	2015-04-09 13:37:11.880499
229	117	1	2015-04-09 13:37:53.088929	2015-04-09 13:37:53.088929
230	117	14	2015-04-09 13:37:53.091516	2015-04-09 13:37:53.091516
231	118	1	2015-04-09 13:37:53.690702	2015-04-09 13:37:53.690702
232	118	12	2015-04-09 13:37:53.692255	2015-04-09 13:37:53.692255
233	119	16	2015-04-09 13:37:54.399377	2015-04-09 13:37:54.399377
234	119	64	2015-04-09 13:37:54.401625	2015-04-09 13:37:54.401625
235	120	1	2015-04-09 13:37:54.761187	2015-04-09 13:37:54.761187
236	120	12	2015-04-09 13:37:54.762889	2015-04-09 13:37:54.762889
237	121	42	2015-04-09 13:37:55.061997	2015-04-09 13:37:55.061997
238	121	13	2015-04-09 13:37:55.063286	2015-04-09 13:37:55.063286
239	122	7	2015-04-09 13:37:55.390962	2015-04-09 13:37:55.390962
240	122	46	2015-04-09 13:37:55.392238	2015-04-09 13:37:55.392238
241	123	32	2015-04-09 13:37:55.739466	2015-04-09 13:37:55.739466
242	123	13	2015-04-09 13:37:55.741152	2015-04-09 13:37:55.741152
243	124	1	2015-04-09 13:37:56.111706	2015-04-09 13:37:56.111706
244	124	6	2015-04-09 13:37:56.112962	2015-04-09 13:37:56.112962
245	125	1	2015-04-09 13:37:56.42961	2015-04-09 13:37:56.42961
246	125	31	2015-04-09 13:37:56.430887	2015-04-09 13:37:56.430887
247	126	1	2015-04-09 13:37:56.767577	2015-04-09 13:37:56.767577
248	126	12	2015-04-09 13:37:56.768828	2015-04-09 13:37:56.768828
249	127	1	2015-04-09 13:37:57.369487	2015-04-09 13:37:57.369487
250	127	14	2015-04-09 13:37:57.370748	2015-04-09 13:37:57.370748
251	128	1	2015-04-09 13:37:58.533953	2015-04-09 13:37:58.533953
252	128	15	2015-04-09 13:37:58.535189	2015-04-09 13:37:58.535189
253	129	32	2015-04-09 13:37:58.899757	2015-04-09 13:37:58.899757
254	129	33	2015-04-09 13:37:58.901603	2015-04-09 13:37:58.901603
255	130	42	2015-04-09 13:37:59.192366	2015-04-09 13:37:59.192366
256	130	43	2015-04-09 13:37:59.193598	2015-04-09 13:37:59.193598
257	131	1	2015-04-09 13:38:19.497507	2015-04-09 13:38:19.497507
258	131	26	2015-04-09 13:38:19.500857	2015-04-09 13:38:19.500857
259	132	1	2015-04-09 13:38:19.877463	2015-04-09 13:38:19.877463
260	132	3	2015-04-09 13:38:19.879369	2015-04-09 13:38:19.879369
261	133	1	2015-04-09 13:38:20.28119	2015-04-09 13:38:20.28119
262	133	65	2015-04-09 13:38:20.282901	2015-04-09 13:38:20.282901
263	134	1	2015-04-09 13:38:21.730595	2015-04-09 13:38:21.730595
264	134	66	2015-04-09 13:38:21.733013	2015-04-09 13:38:21.733013
265	135	1	2015-04-09 13:38:22.513804	2015-04-09 13:38:22.513804
266	135	13	2015-04-09 13:38:22.515065	2015-04-09 13:38:22.515065
267	136	13	2015-04-09 13:38:22.73548	2015-04-09 13:38:22.73548
268	137	1	2015-04-09 13:38:23.092852	2015-04-09 13:38:23.092852
269	137	6	2015-04-09 13:38:23.094452	2015-04-09 13:38:23.094452
270	138	1	2015-04-09 13:38:23.305558	2015-04-09 13:38:23.305558
271	138	31	2015-04-09 13:38:23.306954	2015-04-09 13:38:23.306954
272	139	1	2015-04-09 13:38:23.620625	2015-04-09 13:38:23.620625
273	139	31	2015-04-09 13:38:23.621813	2015-04-09 13:38:23.621813
274	140	1	2015-04-09 13:38:24.00389	2015-04-09 13:38:24.00389
275	140	26	2015-04-09 13:38:24.005216	2015-04-09 13:38:24.005216
276	141	13	2015-04-09 13:38:24.376146	2015-04-09 13:38:24.376146
277	142	1	2015-04-09 13:39:19.992555	2015-04-09 13:39:19.992555
278	142	12	2015-04-09 13:39:19.99512	2015-04-09 13:39:19.99512
279	143	1	2015-04-09 13:39:20.359231	2015-04-09 13:39:20.359231
280	143	12	2015-04-09 13:39:20.360565	2015-04-09 13:39:20.360565
281	144	10	2015-04-09 13:39:21.337969	2015-04-09 13:39:21.337969
282	144	29	2015-04-09 13:39:21.339556	2015-04-09 13:39:21.339556
283	145	1	2015-04-09 13:39:21.628612	2015-04-09 13:39:21.628612
284	145	12	2015-04-09 13:39:21.630256	2015-04-09 13:39:21.630256
285	146	1	2015-04-09 13:39:21.958144	2015-04-09 13:39:21.958144
286	146	12	2015-04-09 13:39:21.959656	2015-04-09 13:39:21.959656
\.


--
-- Name: recipe_courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jeremysklarsky
--

SELECT pg_catalog.setval('recipe_courses_id_seq', 286, true);


--
-- Data for Name: recipe_cuisines; Type: TABLE DATA; Schema: public; Owner: jeremysklarsky
--

COPY recipe_cuisines (id, recipe_id, cuisine_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: recipe_cuisines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jeremysklarsky
--

SELECT pg_catalog.setval('recipe_cuisines_id_seq', 1, false);


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: jeremysklarsky
--

COPY recipes (id, name, source_url, instructions, created_at, updated_at, primary_ingredient, rating, image_url, review_count, cook_time, servings, ingredients, description, big_oven_id, cuisine_id, appetizer, main, side, dessert) FROM stdin;
2	Main - Fish Tacos	http://www.bigoven.com/recipe/main-fish-tacos/179503	Squeeze lime, olive oil and salt on fish.  Grill fish 5 min on each side.  Alternatively:  dip in batter and fry.Mix sour cream, milk, garlic and spices for the sauce.Tear the fish into chunks and pile on warmed torillas.  Steam the shredded cabbage, and top the fish.  Add a scoop of the sauce and a scoop of salsa.  Roll the tortilla and enjoy.	2015-04-07 18:50:11.87941	2015-04-08 23:24:19.579435	Fish	4	http://redirect.bigoven.com/pics/rs/640/main-fish-tacos.jpg	3	0	4 Servings	2 lbs Grouper Fish * 1/4 cup Olive oil * 1 ea Lime * 1/2 ea cabbage * 6 ea Flour tortillas * 1 cup Sour cream * 1/2 cup Milk * 1 clove Garlic * 1 tablespoon Oregano * 1 tablespoon Cilantro * 1 teaspoon Salt * 1 cup Salsa * 		179503	1	f	t	f	f
3	Main - Manicotti (Message from BigOven)	http://www.bigoven.com/recipe/main-manicotti/179507	We hope you are enjoying this free experimental developer key at api.bigoven.com.  Production usage of the BigOven API requires a paid plan, which helps offset BigOven's considerable hosting costs.  This message will not appear on any paid plan; visit your developer console at http://api.bigoven.com to purchase an upgraded key. Thank you!	2015-04-07 18:50:12.51396	2015-04-08 23:24:19.584521	Manicotti	4.40000000000000036	http://redirect.bigoven.com/pics/rs/640/main-manicotti.jpg	5	0	4 Servings		Wish I had an icing tube for this one!	179507	2	f	t	t	f
4	Main - Meatloaf	http://www.bigoven.com/recipe/main-meatloaf/179508	Mix by hand all ingredients except 1/4 of the ketchup.  Put in a loaf pan and top with the remaining ketchup.Bake 350F for 1 hour.  Let stand 10min prior to serving.	2015-04-07 18:50:13.333177	2015-04-08 23:24:19.588969	Beef	5	http://redirect.bigoven.com/pics/rs/640/main-meatloaf.jpg	4	0	4 Servings	2 lbs Ground beef * 1 cup Bread crumbs * 1 package Onion soup mix * 2 ea Egg * 1 cup Ketchup * 	Always a hit...especially as a sandwich!	179508	3	f	t	f	f
6	Main - Ribs	http://www.bigoven.com/recipe/main-ribs/179516	Rub the ribs (see all different kinds of rubs on the internet!)  and wrap in foil tight.  Bake 250F for 3 hours.Remove the foil and grill by basting with BBQ sauce 8 minutes/side.  The best!	2015-04-07 18:50:14.631716	2015-04-08 23:24:19.597314	Beef	5	http://redirect.bigoven.com/pics/rs/640/main-ribs.jpg	1	0	4 Servings	1 rack Ribs * 1/4 cup Rub * 	Falls off the bone!	179516	3	f	t	f	f
7	Main - Pierogies	http://www.bigoven.com/recipe/main-pierogies/278366	In a stand mixer with the Hook attachment, mix the flour, salt, egg, sour cream and margarine.  Wrap up in plastic wrap and let it sit in the fridge overnight. This is a great time to make your fillings if you haven?t already. Typical pierogie fillings include potato, cheese and onion. Best:  Mashed potato, cheese and mushroom.  Cook all and mix and let cool.  Ground beef and velvetta came out great!Go get your dough out of the fridge and using a pastry cutter, cut off a manageable piece. Start rolling to very thin. Cut circles out of the dough.  Place a spoonful of filling in the dough, fold in half, seal the edges with water, rollover the edge and crimp.Cook 4min in boiling water, or saute until browned.  Sauted is the best!  Serve with sour cream or plain.	2015-04-07 18:50:15.503361	2015-04-08 23:24:19.601091	Ground Beef	5	http://redirect.bigoven.com/pics/rs/640/main-pierogies.jpg	1	0	4 Servings	2 cup Flour * 1 teaspoon Salt * 1 ea Egg * 1/2 cup Sour cream * 1/4 cup Margarine *   -- Fillings -- * 1/2 pound Ground beef * 1 ea Onion * 1/4 cup Velveeta * 1 cup Potato * 1 cup Cream cheese * 1 cup Mushroom * 	Very Hungarian! A pocket filled with cheese, potato or meat.	278366	5	t	f	f	f
8	Main - Chicken Fried Steak	http://www.bigoven.com/recipe/main-chicken-fried-steak/179491	Steaks--Juice the lemon, and grate some lemon zest.  Pound the round steak to thin cuts and season with salt & pepper. Whisk the eggs, lemon zest, lemon juice, 1/8 cup milk and salt & pepper together.Place the egg mixture in a shallow dish.  Place the flour in another shallow dish.Heat a generous amout of oil in a skillet.  Dip the steak in the flour on both sides, then tenderize some more.  Once tenderized, dredge the meat again in the flour, followed by the egg and finally in the flour again. Repeat with all the pieces of meat. Place the meat onto a plate and allow it to sit for 10 to 15 minutes before cooking.Once the oil begins to shimmer in the skillet, add the meat in batches, being careful not to overcrowd the pan. Cook each piece on both sides until golden brown, approximately 4 minutes per side. Remove the steaks to a wire rack set in a half sheet pan and place into the oven. Repeat until all of the meat is browned.Gravy--Add  at least 1 tablespoon more of oil to the pan. Whisk in 3 tablespoons of the flour left over from the dredging. Add water and deglaze the pan. Add the boullion cube. Whisk until the gravy comes to a boil and begins to thicken. Add the milk and thyme and whisk until the gravy coats the back of a spoon, approximately 5 to 10 minutes. Season to taste, with more salt and pepper, if needed. Serve the gravy over the steaks.Optional: Serve garlic Mashed Potates on the side, also with the gravy.  	2015-04-07 18:50:16.549339	2015-04-08 23:24:19.606078	Steak	4	http://redirect.bigoven.com/pics/rs/640/main-chicken-fried-steak.jpg	8	0	4 Servings	1 1/2 lb Round Steak * 2 ea Egg * 1 ea Lemon *  to taste Salt and pepper * 1 cup Flour * 1/4 cup Olive oil * 1 cup Water * 1 ea Boullion cube * 1/4 cup Milk * 1 teaspoon Thyme * 		179491	6	f	t	f	f
15	Fish Tacos	http://www.bigoven.com/recipe/fish-tacos/666397	Instructions are at http://allrecipes.com/recipe/fish-tacos/	2015-04-07 18:51:08.476796	2015-04-07 18:51:08.476796	\N	0	http://redirect.bigoven.com/pics/rs/640/fish-tacos-97.jpg	0	0	8 servings	1 cup all-purpose flour * 2 tablespoons cornstarch * 1 teaspoon baking powder * 1/2 teaspoon salt * 1  egg * 1 cup beer * 1/2 cup plain yogurt * 1/2 cup mayonnaise * 1  lime juiced * 1  jalapeno pepper * 1 teaspoon minced capers * 1/2 teaspoon dried oregano * 1/2 teaspoon ground cumin * 1/2 teaspoon dried dill weed * 1 teaspoon ground cayenne pepper * 1 quart oil for frying * 1 pound cod fillets * 1 (12 ounce) package corn tortillas * 1/2 medium head cabbage * 	"I'm from San Diego and these taste just like home! We live in the south now, and nobody has heard of these! Serve with homemade pico de gallo, and lime wedges to squeeze on top!"	666397	9	f	f	f	f
11	Grilled Hawaiian Fish with Papaya Relish	http://www.bigoven.com/recipe/grilled-hawaiian-fish-with-papaya-relish/94110	* - cut into 6 equal portions   ======================================================= ============== ===   Arrange papaya relish and hot fish equally on 6 warm plates. Garnish plates  with cilantro. Add salt and pepper to taste.      *** PAPAYA RELISH ***   In a fine strainer, rinse white onion. Soak onion in ice water for 30  minutes; drain. Mix with rest of relish ingredients.    	2015-04-07 18:51:04.543046	2015-04-08 23:24:19.619994	Seafood-Other	4.5	http://redirect.bigoven.com/pics/grilled-hawaiian-fish-with-papaya-r.jpg	2	\N	6 Servings	  PAPAYA RELISH * 1/4 c white onion * 2 tb olive oil * 2 lb Hawaiian fish* * 1 tb fresh ginger *   Pepper * 1/2 c Fresh cilantro leaves * 1/4 c Fresh Cilantro *   Salt * 2 tb Lemon juice * 3/4 c Red Bell Pepper * 1 1/4 c papaya * 		94110	7	f	t	f	f
12	Quick Fish Fillets 	http://www.bigoven.com/recipe/quick-fish-fillets/819597	Directions: Combine breadcrumbs, parsley, and paprika in a shallow dish. Combine yogurt and mustard. Dip fish in yogurt mixture, and dredge in breadcrumb mixture; Spray 4-inch rack and place fish on rack. Cook on power level high for 3-4 minutes per side. The fish should be flakey and moist. Squeeze fresh lemon over fish. Tips: If cooking from frozen, cook on power level high for 5-7 minutes per side. 	2015-04-07 18:51:05.959189	2015-04-08 23:24:19.625495	orange roughy fillets	5	http://redirect.bigoven.com/pics/rs/640/quick-fish-fillets.jpg	1	15	4 Servings	4 6 oz orange roughy fillets * 1/4 cup fine, dry breadcrumbs * 1 teaspoon Fresh parsley chopped * 1/2 teaspoon Paprika * 1/4 cup low fat plain yogurt * 1 teaspoon Dry mustard *   non stick cooking spray * 		819597	8	f	t	f	f
13	Fish Tacos	http://www.bigoven.com/recipe/fish-tacos/186031	Puree the tartar sauce ingredients in a blender or food processor until smooth, chill.Prepare fish by cutting fillets into 1x3" strips.  Season with salt and pepper.Combine eggs and milk in a shallow dish. Place flour on a plate and panko on another plate.  Dredge each fish strip in flour, tapping off excess.  Dip in egg mixture, letting excess drip back into dish.  Coat with panko, pressing to make crumbs adhere,  Heat 1/2 cup oil to 360 degrees in a sauté pan.  Fry half the fish on both sides until golden, turning once, about 6 minutes total.  Transfer to a baking sheet and keep warm in 200 degree oven.  Repeat procedure with remaining fish strips.Fry each tortilla until slightly crisp, yet still pliable.Assemble tacos and top with tartar sauce.	2015-04-07 18:51:06.792169	2015-04-08 23:24:19.631281	Fish	4	http://redirect.bigoven.com/pics/rs/640/fish-tacos-4.jpg	3	\N	8 Servings	  Puree for the Tatar Sauce: * 1 cup mayonnaise * 1 cup tomato * 2 Tbsp fresh lime juice * 1  jalapeño * 2 Tbsp Dijon mustard *   Prepare: * 1 lb. white fish fillets *   Combine: * 2  Eggs * 1/4 cup whole milk * 1/4 cup all-purpose flour * 2 cups panko bread crumbs * 1/2 cup vegetable oil *   Fry: * 8  flour tortillas * 	Amazingly easy and delicious way to eat more fish!	186031	1	f	t	f	f
14	Fish Tacos	http://www.bigoven.com/recipe/fish-tacos/572440	1. The day before, make the creme fraiche: Mix together the whipping cream and buttermilk (plain yogurt also works). Let sit out at room temperature for ~18 hours. 2. Mix together the mayonaise, creme fraiche, sriracha, lime juice and zest. Cut the fish into chunks or strips depending on your preference, and place into the mayonaise mixture. Let sit for 30 minutes while you prepare the remaining ingredients. 3. Mix together the shredded cabbage, carrot, lime juice, rice vinegar, cumin and cayenne chile powder. Toss well and set aside for flavors to meld.4. To finish the fish, bread the pieces with panko and either pan fry or deep fry. If you mix a little of the marinade into the panko to moisten it a bit, it makes it a little easier to pack the breading around the fish (for extra fryaliciousess). Take care not to overcook the fish-- a quick dip in hot oil is sufficient. Set on paper towels to drain.5. To assemble the tacos, warm tortillas in a small saucepan one at a time, 30 seconds or so just to make them more pliable. Top with your favorite ingredients. Here is how mine usually looks: fish topped with some of the cabbage mixture, then avocado, garnished with a drizzle of the creme fraiche, tomatilo salsa and a dash of green tabasco. Enjoy!	2015-04-07 18:51:07.657774	2015-04-08 23:24:19.635763	Fish	5	http://redirect.bigoven.com/pics/rs/640/fish-tacos-70.jpg	1	0	4 Servings	1 package  small corn or flour tortillas *   For the creme fraiche: * 1 cup whipping cream * 1 tbsp buttermilk *   For the fish: * 1 lb fish of choice * 1/2 cup mayonaise * 1/2 cup creme fraiche * 4 tbsp sriracha chile garlic sauce * 2  limes * 2 cups panko bread crumbs *   Vegetable oil *   Garnishes: * 3 cups shredded red or green cabbage * 2  carrots * 2  limes * 2 tbsp rice vinegar * 1/2 tsp cumin * dash  cayenne chili powder * 1  avocado *   Pickled jalepenos *   Salsa of Choice *   Green Tabsaco Sauce * 	A combination of heat from multiple sources, these are a favorite in our house.	572440	1	f	t	f	f
17	Grilled Fish with Brazilian Garlic Marinade	http://www.bigoven.com/recipe/grilled-fish-with-brazilian-garlic-marinade/158508	1) Rinse the fish steaks under cold running water, then drain and blot dry with paper towels. Place in a nonreactive baking dish just large enough to hold them flat in a single layer and set asside while you prepare the marinade.2) Combine the garlic, onion, bell pepper, oil, wine, ketchup, paprika, salt, and black pepper in a blender and process to a smooth puree. Add the cilantro and pulse just to mix. Marinate fish for 1 to 1 1/2 hours.3) Preheat the grill to high.4) When ready to cook, oil the grill grate. Remove the fish steaks from the marinade and arrange, facing the same direction, on the hot grate. If using tuna, grill until cooked to taste, 3 to 4 minutes per side for medium rare, turning over carefully with a long spatula. For and attractive crosshatch of grill marks, rotate the steaks 90 after the first 2 minutes on each side.5) Transfer the steaks to serving plates or a platter and serve immediately.Note: When cooking Swordfish or Salmon, cook the steaks until opaque in the center when pierced with a knife, 4 to 6 minutes per side.	2015-04-07 18:51:10.227221	2015-04-08 23:24:19.650519	Salmon	4.24324324324324031	http://redirect.bigoven.com/pics/grilled-fish-with-brazilian-garlic--4.jpg	37	5	4 Servings	4 each Fish Steaks * 6 cloves Garlic * 1/2 medium Onion * 1/2 medium Red bell pepper * 1/4 cup olive oil * 1/4 cup Dry white wine * 2 tablespoon Ketchup * 2 tablespoon Paprika * 1 teaspoon Salt * 1/2 teaspoon Black Pepper * 1/4 cup Cilantro * 		158508	10	f	t	f	f
18	Shrimp or Fish Burritos (Tacos) Mexican, seafood	http://www.bigoven.com/recipe/shrimp-or-fish-burritos-tacos-mexican-seafood/804663	MAHI MAHI BURRITORubios Copycat RecipeServe 11 tortilla1 ounce guacamole1 ounce monterey jack cheese1 ounce cheddar cheese5 1/2 ounces refried beansseasoned Rice (opt.)3 ounces grilled mahi mahi or shrimp1/4 ounce cilantro1/4 ounce onion1 ounce salsa fresca3/4 ounce cabbageChipotle Cream Sauce12 dried chipotle chilies, stemmed1/2 cup unsalted butter1/2 cup diced onion1 tablespoon fresh rosemary, minced1 1/4 teaspoons fresh ground pepper1 teaspoon minced shallot1/2 teaspoon minced garlic1 cup dry white wine2 cups whipping cream1/2 teaspoon cornstarch, dissolved in 2 teaspoons waterLayer cheese, beans and mahi in tortilla. Add cilantro, onion and cabbage.Top with guacamole, chipotle white sauce and salsa.Roll tightly into burrito shape.To make Chipotle Cream Sauce: Bring large pot of water to boil.Add chilies and boil until tender, about 15 minutes.Drain, reserving 1/4 cup cooking liquid. Puree chilies with 1/4 cup cooking liquid in blender. Strain through sieve. Set aside. Melt butter in heavy large skillet over medium heat. Add 1 tablespoon chipotle paste, onion, rosemary, pepper, shallot and garlic and stir 2 minutes.Add wine and boil until reduced by half.Add cream and boil until reduced to thin sauce consistency, stirring occasionally, about 10 minutes. Taste, adding more chipotle paste if desired. Add cornstarch mixture and boil 1 minute, stirring constantly. (Can be prepared 1 day ahead. Cool completely. Cover and refrigerate. Rewarm before using.) Add chipotle cream sauce to your burrito to give it that creamy and tangy Rubio's flavor.	2015-04-07 18:51:10.536198	2015-04-08 23:24:19.654579	fish	0	http://redirect.bigoven.com/pics/rs/640/shrimp-or-fish-burritos-tacos-mexic.jpg	0	0	1 Serving			804663	9	f	t	f	f
19	Fish	http://www.bigoven.com/recipe/fish/335079	wrap in tin foil and grill until white...	2015-04-07 18:51:11.480193	2015-04-08 23:24:19.658642	Fish	0	http://redirect.bigoven.com/pics/rs/640/fish-3.jpg	0	\N	1 Serving	  dill weed *   Garlic powder *   Lemon pepper *   rosemary *   sage *   butter *   Fresh lemon juice * 		335079	8	f	t	f	f
20	Simple Fish Cakes	http://www.bigoven.com/recipe/simple-fish-cakes/166705	Put the onion in a large frying pan, sit the fish on top and pour the wine or stock over. Bring to a gentle simmer, cover and cook the fish for 6-8 minutes or until cooked through. Remove and cool. Strain out the onion and mix into the mashed potato with the herbs. Flake in the fish in decent-sized chunks and season. Gently mix everything and, using floured hands, shape into 8 cakes. Lightly dust with flour, dip in egg and then in breadcrumbs. Chill for at least 30 minutes (important or they will come apart in the pan). Heat 1cm oil in a large frying pan. Fry the fish cakes in batches for 3-4 minutes each side or until they are golden, crisp and heated through. Drain on kitchen paper.	2015-04-07 18:51:11.842745	2015-04-08 23:24:19.662274	Fish	4.33333333333333037	http://redirect.bigoven.com/pics/rs/640/simple-fish-cakes-2.jpg	13	0	4 Servings	1 small Onion * 500 grams fish fillets * 350 mililiters white wine * 500 grams potatoes * 1 tbsp parsley * 1 qty flour * 1 large egg * 1 qty fresh or dried breadcrumb * 1 qty Oil for frying * 	Once the preserve of dodgy chippies, fish cakes are now smart dinner party fodder.	166705	11	t	f	f	f
21	Simple Steamed Rice (Rice Cooker)	http://www.bigoven.com/recipe/simple-steamed-rice-rice-cooker/162187	If you have a rice cooker, the only thing you need to worry about is the ratio between water and rice.With Nikko-Calrose rice, which is a rice I prefer, it''s easy.  Water equals slightly less than two times the volume of rice you''re cooking.  Specifically, for 1 cup of rice, use about 1 3/4 cups of water.  I simply double the rice volume and back it off a little.Put rice in the cooker; add water.  Set the switch on and come back 25 mins later for perfect rice.  (Be sure to let the rice rest for 5 mins after steaming/boiling.)	2015-04-07 18:51:44.153381	2015-04-08 23:24:19.666217	Rice	5	http://redirect.bigoven.com/pics/rs/640/simple-steamed-rice-rice-cooker-6.jpg	2	25	6 Servings	1 1/4 cup White Rice * 2 1/4 cups Water * 	The simplest way to make white rice. Set and forget!	162187	12	f	f	t	f
24	Tuscany Rice and Bean Soup	http://www.bigoven.com/recipe/tuscany-rice-and-bean-soup/466818	Brown sausage in 3- to 4-quart saucepan over medium-high heat, about 6 minutes. Drain fat. Stir in broth, tomatoes, salt, pepper and oregano; bring to a boil. Stir in rice and beans. Cover and simmer 20 minutes, or until rice is cooked.	2015-04-07 18:51:45.182995	2015-04-08 23:24:19.675572	\N	4.66666666666666963	http://redirect.bigoven.com/pics/rs/640/tuscany-rice-and-bean-soup-2.jpg	7	0	6 Servings	8 oz Italian sausage * 3 (16 oz) cans low-sodium chicken broth * 1 (28 oz) can diced tomatoes * 1/2 teaspoon Salt * 1/4 teaspoon freshly cracked black pepper * 1/4 teaspoon Dried oregano * 1 cup RiceSelect™ Texmati® Light Brown Rice * 1 (15 ½ oz) can Great Northern beans * 		466818	9	f	t	t	f
25	Chicken Fried Rice	http://www.bigoven.com/recipe/chicken-fried-rice/168285	Heat half of the oil and scramble the eggs until thoroughly cooked. Remove from pan and set aside.Heat the remaining oil and add onions, garlic and ginger. Saute for 30 seconds. Add rice and stir-fry for 2-3 minutes. Add soy sauce, chicken, peas, eggs and season to taste.Cook for a minute, and serve while hot.	2015-04-07 18:51:45.535017	2015-04-08 23:24:19.680771	Chicken	4.37662337662337997	http://redirect.bigoven.com/pics/rs/640/chicken-fried-rice-54.jpg	76	15	3 Servings	 1 tbsp oil  *  2  Eggs *  3   green onions  *  1 clove garlic  *  1  tsp fresh ginger  *  2 cups cooked rice  *  2 tbsp Soy sauce *  1/2  cup chicken  *  1/2  cup frozen peas * 	A tasty way to use leftover rice.	168285	14	f	t	f	f
26	Spanish Rice #7	http://www.bigoven.com/recipe/spanish-rice-7/61724	Since I have gathered hundreds of recipes and ideas from this list, it  seems like it is time I gave something back. Yesterday I saw a mention of  Spanish Rice, and it reminded me of my "Best of". This recipe is made in a  rice cooker so it is a dump-it-cook-it-eat-it recipe. No fuss. If you dont  use a rice cooker, just make it like you would cook regular rice.    If using rice cooker, dump all ingredients in, cover and press on.    Stovetop method: In medium saucepan stir together all ingredients.  Bring  to boiling. Reduce heat and simmer covered about 30 minutes or until rice  is tender and most of the liquid is absorbed. Remove from heat and let  stand for 10 minutes.    Added info: Varieties of 16 ounce tomatoes like with green peppers etc  change and enhance flavor.  I like large chunks of onion for texture and  flavor.  Use 2 tsp chili powder if you like it hotter.    Nutritional information: Total servings 4-6, Grams of fat 0, Total  cholesterol 0, Total mg sodium 587, Total gm protein 3, Total gm  cargohydrate 35, Total mg potassium 87, Calories per serving 155, Percent  of calories from fat 0.	2015-04-07 18:51:45.862876	2015-04-08 23:24:19.685569	Rice	4.5	http://redirect.bigoven.com/pics/rs/640/spanish-rice-7-2.jpg	14	\N	4 Servings	1  Garlic * 1/2 ts Salt * 1 ts Chili powder * 1/8 ts Pepper * 2/3 c Long grain rice * 1 16-oz can stewed tomatoes  * 1 1/4 c Water * 1/2 c Onions * 		61724	15	f	f	t	f
27	Chicken Rice Casserole	http://www.bigoven.com/recipe/chicken-rice-casserole/182694	Preheat oven to 400 degrees F. Grease a 9x13 baking pan.Melt butter in a large saucepan over medium heat.Stir in the mushrooms and rosemary, cook until softened (about 5 min.). Stir in the flour until well blended.Slowly whisk in the chicken broth and the half and half or milk.Bring to a boil, reduce heat and cook until sauce is thickened and smooth (about 5 min.).Mix in the chicken and the cooked rice, combine well.Pour into prepared pan.Mix together the bread crumbs, Parmesan cheese and 1 Tbsp. melted butter, stir well. Sprinkle on top of the chicken and rice mixture.Bake for 25-35 minutes, until the sauce is bubbling and the topping is golden brown.	2015-04-07 18:51:46.204757	2015-04-08 23:24:19.690429	chicken	4	http://redirect.bigoven.com/pics/rs/640/chicken-rice-casserole-8.jpg	4	45	6 Servings	6 tablespoons butter  * 8 ounces mushrooms * 1/4 teaspoon dried rosemary  * 1/2 cup all purpose flour  * 2 cups chicken broth  * 1 1/2 cups half and half or whole milk  * 4 cups chopped cooked chicken  * 3 cups cooked rice  * 1/2 cup dry bread crumbs  * 2 tablespoons grated Parmesan cheese  * 1 tablespoon melted butter * 	Chicken/rice casserole	182694	16	f	t	t	f
28	Pork Fried Rice	http://www.bigoven.com/recipe/pork-fried-rice/7439	In large skillet or wok, heat 1/2 tablespoon oil over medium heat. Add  eggs and cook without stirring until set.  Invert skillet over baking sheet to remove cooked eggs; cut into 1-1/2 x 1/2-inch strips.  In same  skillet, heat remaining oil over medium-high heat.  Stir-fry ham,  mushrooms, and green onions in oil for three minutes, or until mushrooms and  onions are tender.  Stir in cooked rice and egg strips; sprinkle with soy  sauce.  Toss lightly; heat thoroughly.    Each serving provides:  * 278 calories  * 14.1 g. protein  * 10.4 g. fat  * 31.3 g. carbohydrate  * 719 mg. sodium  * 156 mg. cholesterol   *NOTE: Optional ingredients are omitted from the nutritional calculations.  When ingredient options appear in a recipe, the first ingredient choice is  used for calculation.    Source: Brown Rice  Reprinted with permission from The USA Rice Council  Electronic format courtesy of Karen Mintzias    File ftp://ftp.idiscover.co.uk/pub/food/mealmaster/recipes/usarice.zip	2015-04-07 18:51:46.534056	2015-04-08 23:24:19.694981	Pork	4.0625	http://redirect.bigoven.com/pics/rs/640/pork-fried-rice-11.jpg	17	30	4 Servings	1 1/2 tablespoons Vegetable oil * 2  Eggs * 1 cup Ham * 1 cup Mushrooms * 1/2 cup Green Onions * 3 cups Cooked brown rice * 1 tablespoon Soy sauce * 		7439	17	f	t	f	f
29	Mexican Rice	http://www.bigoven.com/recipe/mexican-rice/396548	Instructions are at http://www.vegetariantimes.com/recipe/mexican-rice/	2015-04-07 18:51:46.862633	2015-04-08 23:24:19.700458	Rice	4.33333333333333037	http://redirect.bigoven.com/pics/rs/640/mexican-rice-17.jpg	3	0	1 Serving	1 tablespoon Extra virgin olive oil * 1 cup Brown rice * 1 cup Corn * 1 cup Peas * 3 cloves Garlic * 1/2 teaspoon Cumin * 1/2 teaspoon Dried oregano * 2 tablespoons Tomato paste * 2 cups chicken stock * 		396548	1	f	f	t	f
31	Barley and Mushroom Soup	http://www.bigoven.com/recipe/barley-and-mushroom-soup/20449	Saute the onion in the fat until translucent. Add mushrooms and garlic,  stirring, for 2 minutes. Add the wine and thyme, saute another 3 minutes.  Add barley, stir and saute another 3 min.  Add the soy flakes and the  broth, bring to a full boil and reduce to simmer, for 40 min. Season with  salt and pepper, stir in sherry and dill. 	2015-04-07 18:51:53.106005	2015-04-08 23:24:19.712004	Soup	1	http://redirect.bigoven.com/pics/vegan-barley-and-mushroom-soup.jpg	1	0	1 Serving	2 ts Butter * 1 md Onion * 3 c Fresh mushrooms * 2 Cloves  garlic * 2 tb Dry white wine * 1/2 ts Dried thyme * 1 1/2 c barley * 1/2 c Soy flakes * 8 c Broth *   salt and pepper * 2  tb fresh dill * 1 tb Dry sherry * 		20449	3	f	t	f	f
32	Chicken Tortilla Soup (8 Points)	http://www.bigoven.com/recipe/chicken-tortilla-soup-8-points/164925	1. Combine all ingredients except chips and cheese in large slow cooker.2. Cover. Cook on low 8 hours.3. Just before serving, remove chicken breast and slice into bite-size pieces. Stir into soup.4. To serve, put a handful of chips in each individual soup bowl. Ladle soup over chips. Top with cheese.	2015-04-07 18:51:53.43578	2015-04-08 23:24:19.715999	Chicken	4.5	http://redirect.bigoven.com/pics/rs/640/chicken-tortilla-soup-8-points.jpg	2	8	8 Servings	4  boneless chicken breast halves * 2 15-oz can Black beans * 1 15-oz can Low-sodium Mexican stewed tomatoes * 1 cup Salsa * 4 ounce Green chili *   Baked tortilla chips * 2 cup Fat Free Cheese * 		164925	1	f	t	f	f
33	Chicken Tortilla Soup ala Steve	http://www.bigoven.com/recipe/chicken-tortilla-soup-ala-steve/161821	In a large stockpot, heat 3 tablespoons of oil to medium-high heat.  Add crushed garlic and chopped onions, and stir until onions just start to brown.  Add the can of crushed tomatoes, cumin, cayenne pepper, chili powder, salt, pepper, and half of the lime juice.  Turn up the heat until it bubbles, stirring constantly, then gradually stir in chicken stock.  Turn down to low and simmer for 10 minutes.  Add diced chicken.  (Optionally add black beans or fresh corn kernels).  To make the tortilla crisps, julienne 12 corn tortillas into narrow, uniform strips.  In a saucepan, bring 1 cup of vegetable oil up to medium-high heat (takes about 5 minutes to come up to temperature -- be sure to test the heat of the oil by placing a corn tortilla bit into the oil -- it should bubble immediately).  Deep-fry these tortilla strips in batches (2 mins or so -- do not let them turn a dark brown) -- transfer to paper towel to dry.  They should be crispy.When ready to serve, plate the soup, then top with a mound of the tortilla strips.  Optionally add avocado, sour cream, cheese, fresh corn kernels.Squeeze fresh lime juice into each bowl at the table.  Soup itself can be made ahead, but make the corn tortilla strips fresh, just prior to serving... it's worth it.	2015-04-07 18:51:53.798206	2015-04-08 23:24:19.719939	Chicken	4.75912408759123995	http://redirect.bigoven.com/pics/rs/640/chicken-tortilla-soup-ala-steve-13.jpg	141	0	12 Servings	8 cups Chicken Stock * 2 whole Onions * 3 cloves Garlic * 1 1/2 tablespoon Chili Powder * 1 large can Crushed Tomatoes * 1 whole Lime * 1 teaspoon Cumin *   Salt *   Pepper * 1/4 teaspoon Cayenne * 1 cup Vegetable oil * 12 whole Corn tortillas * 2 cups Chicken *   -- Optional Add-Ons -- *   Cilantro *   Sour cream *   Corn kernels *   Black beans *   Avocado * 	About ten years ago, my wife and I enjoyed a terrific bowl of tortilla soup at a cafe perched above the bustling streets of Cabo San Lucas, Mexico. I've been trying to reproduce it ever since; this is fairly close. The secret is in the lime juice, and the freshly made tortilla crisps added at the table.	161821	1	f	t	f	f
34	Corned Beef and Cabbage Soup (Skinny Taste)	http://www.bigoven.com/recipe/corned-beef-and-cabbage-soup-skinny-taste/821759	1. In a large pot or Dutch oven, heat oil over medium low heat. Add leeks and sauté until soft, about 4-5 minutes; add garlic, carrots and celery and sauté about 2-3 minutes.2. Add corned beef, peppercorns or seasoning packet that comes with the corned beef, water and bay leaves; cover and bring to a boil. Simmer covered on low heat for 3 hours, until the meat becomes tender.3. Remove the corned beef, set it on a cutting board and shred with a fork. Return it to the pot then add the cabbage, potatoes and half the yellow pepper. Cook until the vegetables are tender, about 30 more minutes. Add the celery and the rest of the yellow pepper and cook for another 15 minutes. Taste for salt and pepper and adjust as needed.	2015-04-07 18:51:54.130761	2015-04-08 23:24:19.723675	corned beef	5	http://redirect.bigoven.com/pics/rs/640/corned-beef-and-cabbage-soup-skinny.jpg	3	255	5 Servings	1 teaspoon Olive oil * 2  leeks * 2 cloves garlic * 3 medium Carrots * 2 stalk Celery * 1 pound lean corned beef * 6 cups water * 2  Bay leaves * 1 small Cabbage *  large Potato * 1 stalk Celery * 1  Yellow pepper *  to taste Black pepper * 	Original recipe from Skinny Taste: http://www.skinnytaste.com/2012/03/corned-beef-and-cabbage-soup.html\r\rCook 2 1/2 pound corned beef (uncooked without fat = 2 pounds; cooked =18 ounces). Use half for soup. Reserve 9 ounces for second meal. Makes 9 cups. 	821759	9	f	t	f	f
35	Red Pepper-Cauliflower Soup	http://www.bigoven.com/recipe/red-pepper-cauliflower-soup/498642	1. Preheat broiler to high. Arrange bell peppers skin side up on baking sheet. Broil, watching carefully, until skins are blackened, about 10 minutes. Remove peppers from oven and let cool. Peel over a bowl to collect juices; set peppers and juices aside.2. In a large pot over medium-high heat, warm olive oil. Add shallots, salt, and cayenne and cook, stirring until soft, 3 minutes. Add broth and cauliflower. Bring to a boil, then lower heat to a simmer. Cover and cook 20 minutes. Add peppers with juices and cook, covered, until cauliflower is tender, 10 minutes. Purée in batches in a blender and add sugar. Add pepper to taste.3. Serve hot or cold, garnished with a drizzle of extra-virgin olive oil, some chives, and a squeeze of lemon juice if you like.	2015-04-07 18:51:54.7718	2015-04-08 23:24:19.729093	Cauliflower	4.70000000000000018	http://redirect.bigoven.com/pics/rs/640/red-pepper-cauliflower-soup.jpg	10	60	6 Servings	6 Large Red bell peppers * 1 tbs Olive Oil * 4  Shallots * 1 tsp Salt * 1/4 tsp Cayenne pepper * 1 Quart chicken broth * 1 Head Cauliflower * 1 tsp Sugar *   Freshly ground pepper *   Extra-virgin olive oil *   Chopped fresh chives *   Lemon wedges * 	Original recipe from MyRecipes: http://www.myrecipes.com/recipe/red-pepper-cauliflower-soup\rWonderful soup on Cold Winters Day - serve with Salad or Sandwich to make it more of a meal.	498642	9	f	t	t	f
36	Quick Chicken Enchilada Soup	http://www.bigoven.com/recipe/quick-chicken-enchilada-soup/253068	Instructions are at http://realmomkitchen.com/10413/quick-chicken-enchilada-soup/	2015-04-07 18:51:56.288922	2015-04-08 23:24:19.735319	Chicken	4.5	http://redirect.bigoven.com/pics/rs/640/quick-chicken-enchilada-soup-2.jpg	6	30	10 Servings	1 15 oz can  corn * 1 (15 oz can) black beans * 1 14.5- ounce can diced tomatoes (I used the kind with sweet oni * 1 (12.5 oz can)  Swanson Premium Chunk Chicken * 1 (10 oz can) enchilada sauce * 1 (10 3/4 oz can) Campbell’s cream of mushroom soup * 1 1/2 cups milk  *  8 oz tortilla chips *   shredded cheese * 	This recipe is perfect for a quick, easy weeknight meal.	253068	3	f	t	f	f
38	Creamy Tomato Soup	http://www.bigoven.com/recipe/creamy-tomato-soup/176947	In a large stock pot add tomatoes, chicken broth, butter, sugar, onion and baking soda. Simmer for 1 hour. In a double boiler heat cream until hot. You can also use a small saucepan over low heat. Make sure the cream does not burn. Once heated, add to tomato soup and serve.	2015-04-07 18:51:56.978019	2015-04-08 23:24:19.745864	Tomatoes	4.5555555555555598	http://redirect.bigoven.com/pics/rs/640/creamy-tomato-soup-4.jpg	11	80	8 Servings	1 29-oz can diced tomatoes * 1 oz. condensed chicken broth * 2 tbsp. Margarine * 2 tbsp. Sugar * 1 tbsp. Onions * 1/4 tsp. Baking soda * 2 cups heavy whipping cream * 	Yummy Tummy Warmer	176947	3	f	t	f	f
39	Smoky tomato and seafood soup	http://www.bigoven.com/recipe/smoky-tomato-and-seafood-soup/190864	1 If using fresh tomatoes, heat the broiler to high; put tomatoes on a foil-lined baking sheet. Broil 6 inches from the heat source, turning occasionally, until the skin is lightly charred on all sides, 10-12 minutes. Cool, peel and chop coarsely, collecting all the juices.2 Heat the oil in a 4- to 5-quart Dutch oven or deep saucepan. Cook the shallots and leek until soft, about 4 minutes. Stir in the red pepper and garlic; cook 1 minute. Add the tomatoes, broth, clam juice, wine, tomato paste, salt and smoked paprika. Simmer 15 minutes. (This base can be refrigerated, covered, up to 3 days. Shortly before serving, heat the tomato mixture to a simmer. )3 Add the clams; cook 3 minutes. Add the shrimp and fish; cook 2 minutes. Add the scallops; cook 1 minute more or until all fish is opaque but still tender. Ladle the soup into wide serving bowls. Place a dollop of the garlic mayo into the center. Sprinkle with parsley and chives.Garlic mayo: Mix 1/3 cup mayonnaise and 1 tablespoon fresh lemon juice in a small bowl. Use a garlic press to crush in 1 large clove of garlic; mix well. Add a pinch of salt if needed. This can be made up to 1 day in advance; cover and refrigerate.	2015-04-07 18:51:57.40282	2015-04-08 23:24:19.749685	Seafood-Other	5	http://redirect.bigoven.com/pics/smoky-tomato-and-seafood-soup-2.jpg	2	45	6 Servings	8  to 10 ripe plum tomatoes or 1 can * 3 tablespoons olive oil * 3 large shallots or 1 white onion * 1 small leek * 1  red bell pepper * 6 large cloves garlic * 1 quart vegetable broth * 1  bottle * 1/2 cup dry white wine * 1/4 cup tomato paste * 1 teaspoon salt or to taste * 3/4 teaspoon smoked sweet Spanish paprika * 1 pound small fresh clams * 1/2 pound large * 1 pound boneless * 1/2 pound bay scallops *   Garlic *   Chopped * 	\rIf using frozen seafood, thaw it in the refrigerator for several hours or overnight. Once thawed, store in the refrigerator, well wrapped and sitting on a bed of ice (just as you should for fresh fish). When fresh clams are unavailable, try using the frozen steamer clams available at Trader Joe's. If you have it, a pinch of saffron threads or a sprinkle of ground saffron beautifully enhances this main-course soup.	190864	15	f	t	f	f
40	Lamb Chops with Balsamic Reduction	http://www.bigoven.com/recipe/lamb-chops-with-balsamic-reduction/159263	1. Press rosemary, salt and pepper onto lamb chops.2. Heat olive oil over medium heat and cook lamb chops for about 3 1/2 minutes on each side (for medium rare).3. Transfer lamb to a warm plate. Add shallots to pan and sautee until slightly browned.4. Add balsamic vinegar and scrape browned bits from bottom of pan, then add chicken broth.5. Allow mixture to cook until reduced by half, about 5 minutes. Remove from heat and add butter.6. Pour sauce over lamb and serve.	2015-04-07 18:52:03.792077	2015-04-08 23:24:19.753799	Lamb	4.55813953488372015	http://redirect.bigoven.com/pics/rs/640/lamb-chops-with-balsamic-reduction-2.jpg	43	20	4 Servings	4  Lamb Chops * 1 tablespoon Fresh rosemary *   salt and pepper * 1 tablespoon olive oil * 1  Shallot * 1/3 cup Balsamic vinegar * 3/4 cup Chicken broth * 1 tablespoon Butter * 	I used this recipe the first time I cooked lamb and it was easy. I ended up forgetting the butter in the sauce and putting it on top of the lamb instead, but it was just as delicious.	159263	3	f	t	f	f
42	Jamaican Lamb Curry	http://www.bigoven.com/recipe/jamaican-lamb-curry/291758	Put the lamb in a ovenproof casserole dish with the thyme, some salt and lots of black pepper. Mix well and leave for 20 minutes.Heat the oven to 180C/fan 160C/gas 4. Heat 1 tbsp oil in a frying pan and gently fry the onion, garlic and chilli for 5 minutes. Stir in the curry powder, allspice, cloves and 5 tbsp cold water. Cook for a further 2 minutes then tip the onions in with the lamb. Add the tomatoes and treacle. Refill the tomato can with cold water and stir this in. Bring to a simmer, cover and put in the oven. Cook for 1½-2½ hours or until tender, stirring halfway through. Serve with rice.	2015-04-07 18:52:04.467463	2015-04-08 23:24:19.762608	Lamb	4	http://redirect.bigoven.com/pics/rs/640/jamaican-lamb-curry.jpg	2	0	4 Servings	500 grams Lamb * 1 whole Onion * 1 tablespoon Thyme * 1 whole Scotch Bonnet Pepper * 3 cloves Garlic * 2 tablespoon mild curry powder * 2 tablespoon Ground All Spice * 1 teaspoon ground cloves * 1 tin chopped tomatos * 	Just like Grandad makes?	291758	18	f	t	f	f
47	Mint and Garlic Marinade for Lamb	http://www.bigoven.com/recipe/mint-and-garlic-marinade-for-lamb/211459	Put all of the ingredients in a small bowl and mix into a paste.  Spread generously over both sides of chops or all over a boneless leg of lamb, filling in the cavities.  Let stand 15 minutes before grilling.Alternatively, if using a boneless leg, ask your butcher to roll and tie it.  Then, cook in a 325 oven until the internal temperature reaches 140 for medium rare.	2015-04-07 18:52:06.330967	2015-04-07 18:52:06.330967	Mint & Garlic	5	http://redirect.bigoven.com/pics/mint-and-garlic-marinade-for-lamb-2.jpg	1	0	1 Serving	1/4 cup Extra virgin olive oil * 1/4 cup Mint leaves * 4 large cloves Garlic * 2 teaspoons Salt * 1 teaspoons  Pepper * 	This easy to make marinade is great on grilled lamb chops or boneless legs	211459	9	f	f	f	f
49	Butterflied Leg of Lamb on the Braai	http://www.bigoven.com/recipe/butterflied-leg-of-lamb-on-the-braai/227338	Place the butterflied lamb in a marinating dish. Mix together the rest of the ingredients and pour over the lamb. Marinate for at least 2 hours, turning halfway through.Prepare a cool fire in a kettle braai. Place the lamb on the braai, and with the lid closed cook for 10-15 minuts on one side, then turn. Finish cooking to your liking. Baste the lamb with the marinade whenever you turn it. 	2015-04-07 18:52:07.001312	2015-04-07 18:52:07.001312	Lamb	4	http://redirect.bigoven.com/pics/rs/640/butterflied-leg-of-lamb-on-the-braa.jpg	0	30	6 Servings	1 1/5 kg Leg of Lamb * 75 ml Honey * 50 ml Mustard * 200 ml Balsamic Vinegar * 250 ml Vegetable stock * 50 ml Olive oil * 50 ml Rosemary * 50 ml Mint * 	Excellent for outdoor occassions.	227338	20	f	f	f	f
44	Braised Lamb and Vegetables	http://www.bigoven.com/recipe/braised-lamb-and-vegetables/159801	Preheat oven to 375F. In a bowl, combine vegetables, herbs and salt and pepper. Heat half the mixture in a large oven-proof casserole. Brown lamb in a skillet and add to casserole. Deglaze skillet with white wine and add wine to casserole. Cover with remaining vegetables and add enough water to almost cover vegetables. Bring to a boil. Cover and cook in oven for 30 minutes. Remove lid and cook for 1 hour more or until lamb is tender. Add extra water if dish seems too dry. Garnish with parsley.	2015-04-07 18:52:05.220098	2015-04-08 23:24:19.77372	Lamb	5	http://redirect.bigoven.com/pics/rs/640/braised-lamb-and-vegetables-4.jpg	1	120	4 Servings	1 pound Potatoes * 2 cloves Garlic * 8  Green onions * 2 large Artichoke bottoms * 3 cups Cremini mushrooms * 2 tablespoons Parsley * 1 tablespoon Mixed herbs *   salt and pepper * 4  Lamb shoulder chops * 3/4 cup White wine * 	Commonly referred to as the "lamb stewy thing" at our house, this is a recipe of Spanish origin. I often add a carrot and garnish with chopped fresh parsley just to brighten the dish up.	159801	15	f	t	t	f
46	Lamb Burgers with Tzatziki and Feta	http://www.bigoven.com/recipe/lamb-burgers-with-tzatziki-and-feta/182014	In a bowl, gently combine the lamb with the spices and garlic. Be careful not to over-work the meat. Form into patties. Heat the grill to medium-high heat. Grill the lamb for approximately 4 minutes per side for medium. Do NOT press the burgers down on the grill- you will lose the flavorful juices! Drain the feta and pat dry. Slice the feta and place on the burgers just before they are finished. (It's ok if it's crumbly, just try to keep them towards the center of the burger.) Remove the burgers from the grill and set aside to rest a few minutes. Put the pieces of naan on the grill to warm them- just about a minute. Remove, tear in half placing each on a plate and top with a burger and some red onion. Spoon tzatziki over the top and serve. These are served open-faced and you fold the naan around the burger.	2015-04-07 18:52:06.000991	2015-04-08 23:24:19.782299	Lamb|Lamb|	4.5	http://redirect.bigoven.com/pics/rs/640/lamb-burgers-with-tzatziki-and-feta.jpg	2	15	4 Servings	1 lb. freshly ground lamb  * 1/2 teaspoon cinnamon  * 1/2 teaspoon cumin  * 1  garlic clove * 1/2 teaspoon kosher salt  * 1/8 teaspoon freshly ground black pepper  * 1/2  red onion * 6 oz of good quality fresh feta in water  * 1 package of Naan  *    1 8oz. container Tzatziki * 	This very easy option for a weeknight dinner. I use store-bought Tzatziki and Naan to keep things simple. The lamb is extremely juicy and tender and the spices pack it full of flavor.	182014	19	f	t	f	f
48	Leftover Lamb Curry (Message from BigOven)	http://www.bigoven.com/recipe/leftover-lamb-curry/253117	We hope you are enjoying this free experimental developer key at api.bigoven.com.  Production usage of the BigOven API requires a paid plan, which helps offset BigOven's considerable hosting costs.  This message will not appear on any paid plan; visit your developer console at http://api.bigoven.com to purchase an upgraded key. Thank you!	2015-04-07 18:52:06.646621	2015-04-08 23:24:19.788316	lamb	0	http://redirect.bigoven.com/pics/rs/640/leftover-lamb-curry.jpg	0	\N	4 Servings		Makes a great second meal for leftover lamb	253117	8	f	t	f	f
51	Roasted Fingerling Potato Salad with Lemon and Thyme	http://www.bigoven.com/recipe/roasted-fingerling-potato-salad-with-lemon-and-thyme/1116587	Preheat oven to 425°F. Toss all salad ingredients together in a large bowl. Spread in a single layer on a large baking sheet and cook for 20 to 25 minutes or until potatoes start to brown. Let cool for at least 10 minutes. Meanwhile, whisk together all dressing ingredients in a medium bowl; toss with cooled vegetables. Serve at room temperature or chilled. Makes 6 servings.	2015-04-07 18:52:32.305196	2015-04-08 23:24:19.798344	Potatoes	0	http://redirect.bigoven.com/pics/rs/640/roasted-fingerling-potato-salad-wit.jpg	0	50	6 Servings	  Salad * 1 1/2 pounds Fingerling potatoes * 1  Red bell pepper * 1  Red onion * 3 tablespoons Extra virgin olive oil * 1/2 teaspoon Kosher Salt * 1/8 teaspoon Pepper *   Dressing * 1/4 cup Light or olive oil based mayonnaise * 1 1/2 tablespoons Lemon juice * 2 teaspoons Extra virgin olive oil * 2 teaspoons Fresh thyme leaves * 1 1/2 teaspoons Lemon zest * 1/4 teaspoon Kosher Salt * 1/8 teaspoon Pepper * 		1116587	3	t	f	t	f
52	Spinach, Apple and Pecan Salad	http://www.bigoven.com/recipe/spinach-apple-and-pecan-salad/572571	Instructions are at http://www.food.com/recipe/spinach-apple-and-pecan-salad-29765	2015-04-07 18:52:32.649222	2015-04-08 23:24:19.80282	Spinach	4.72727272727273018	http://redirect.bigoven.com/pics/rs/640/spinach-apple-and-pecan-salad-2.jpg	11	10	4 Servings	3 tablespoons olive oil * 1 1/2 tablespoons cider vinegar * 1 tablespoon prepared mustard  (I prefer Dijon) * 1 tablespoon sugar * 1/2 teaspoon salt * 1/4 teaspoon fresh ground black pepper * 1  golden delicious apple * 1/4 cup red onion * 3/4 lb fresh spinach * 1/2 cup toasted pecans * 	Recipe from food.com. Apples and spinach is a tasty combo. 	572571	3	t	f	t	f
53	Minty Cucumber-Quinoa Salad (Message from BigOven)	http://www.bigoven.com/recipe/minty-cucumber-quinoa-salad/560948	We hope you are enjoying this free experimental developer key at api.bigoven.com.  Production usage of the BigOven API requires a paid plan, which helps offset BigOven's considerable hosting costs.  This message will not appear on any paid plan; visit your developer console at http://api.bigoven.com to purchase an upgraded key. Thank you!	2015-04-07 18:52:32.98861	2015-04-08 23:24:19.807255	Quinoa	3.71428571428570997	http://redirect.bigoven.com/pics/rs/640/minty-cucumber-quinoa-salad-2.jpg	7	25	6 Servings		Recipe from Whole Foods. This recipe is not only good for you, it's yummy too!	560948	21	t	f	t	f
54	Chicken Tarragon Salad	http://www.bigoven.com/recipe/chicken-tarragon-salad/771043	Mix together and refrigerate.	2015-04-07 18:52:33.275439	2015-04-08 23:24:19.811014	Chicken	5	http://redirect.bigoven.com/pics/rs/640/chicken-tarragon-salad.jpg	1	15	6 Servings	1  Rotisserie Chicken *   Tarragon, dried * 3/4 cup Low fat mayonnaise * 		771043	8	t	f	t	f
56	Dilled Shrimp Pasta Salad	http://www.bigoven.com/recipe/dilled-shrimp-pasta-salad/561511	Instructions are at http://www.wholefoodsmarket.com/recipe/dilled-shrimp-pasta-salad	2015-04-07 18:52:34.023182	2015-04-08 23:24:19.818794	Pasta	4.73333333333332984	http://redirect.bigoven.com/pics/rs/640/dilled-shrimp-pasta-salad-3.jpg	15	40	6 Servings	1/2 pound fusilli rotelle (wagon wheel) or other medium past * 1 pound USA wild large shrimp (26 to 30 count) * 1 1/4 cup frozen shelled edamame or frozen peas * 2 tablespoons extra-virgin olive oil * 2 tablespoons light mayonnaise * 1 lemon, Zest of * 2 1/2 tablespoons lemon juice * 1 clove finely chopped garlic * 3/4 teaspoon fine sea salt *   pinch cayenne pepper * 3 cups baby spinach leaves * 2/3 cup chopped fresh dill * 	Recipe from Whole Foods. This zesty pasta salad is full of protein and vitamins. Use whole wheat pasta to make this recipe even more healthy.	561511	3	f	t	t	f
57	Grilled Veggie Caesar Salad with Sourdough Croutons	http://www.bigoven.com/recipe/grilled-veggie-caesar-salad-with-sourdough-croutons/565090	Instructions are at http://www.wholefoodsmarket.com/recipe/grilled-veggie-caesar-salad-sourdough-croutons	2015-04-07 18:52:34.375717	2015-04-08 23:24:19.822345	\N	5	http://redirect.bigoven.com/pics/rs/640/grilled-veggie-caesar-salad-with-so-6.jpg	1	35	4 Servings	2  bell peppers (any colors) * 1 small eggplant  * 1 small zucchini   * 3 tablespoons extra-virgin olive oil * 3/4 teaspoon fine sea salt * 2 large slices sourdough bread * 2 cloves garlic * 2 tablespoons lemon juice * 1 tablespoon light mayonnaise * 3  anchovies * 1/2 teaspoon freshly ground black pepper * 4 tablespoons grated Parmesan cheese * 8 cups  romaine lettuce (from about 1 large head) * 		565090	9	t	f	t	f
59	Charred Corn Salad with Mint, Parsley and Cilantro	http://www.bigoven.com/recipe/charred-corn-salad-with-mint-parsley-and-cilantro/844473	Instructions are at http://www.foodandwine.com/recipes/charred-corn-salad-with-mint-parsley-and-cilantro	2015-04-07 18:52:35.063364	2015-04-08 23:24:19.829824	Corn	4	http://redirect.bigoven.com/pics/rs/640/charred-corn-salad-with-mint-parsle-4.jpg	2	25	4 Servings	4 large ears of corn *   Extra-virgin olive oil *   Salt *   Freshly ground pepper * 1/2 small red onion thinly sliced * 2 1/2 tablespoons fresh lime juice * 1 teaspoon pure maple syrup * 1  jalapeño, * 3 tablespoons torn mint leaves * 3 tablespoons torn parsley leaves * 3 tablespoons torn cilantro leaves * 		844473	9	t	f	t	f
61	Spanish Chicken	http://www.bigoven.com/recipe/spanish-chicken/291260	Preheat oven to 425 degrees and distribute racks evenlyChop onions into medium - large piecesCut potatoes into medium-sized cubesCoat bottom of 2 shallow backing pans with oilRub chicken with oil and season with salt, pepper, and oreganoSear chicken in saute pan on high heat to crisp skinMove chicken to baking pansEvenly distribute onion and potatoes between the pans with the chickenSeason onions and potatoes with oregano, salt, pepper, and orange zestPlace chicken in ovenAfter 30 minutes, add chorizo and swap top tray with bottom tray, and cook an additional 30 minutes or until chicken is done	2015-04-07 18:52:51.773405	2015-04-08 23:24:19.83948	Chicken	4.26666666666667016	http://redirect.bigoven.com/pics/rs/640/spanish-chicken-3.jpg	15	0	8 Servings	3 tablespoons Olive oil * 12  Chicken Thighs * 1 package Chorizo Sausage *   Potatoes * 2  Red onion * 2 teaspoons Dried oregano * 1  Orange zest *   Salt and pepper to taste * 		291260	15	f	t	f	f
62	Bourbon Chicken	http://www.bigoven.com/recipe/bourbon-chicken/201809	Heat oil in a large skillet.Add chicken pieces and cook until lightly browned.Remove chicken.Add remaining ingredients, heating over medium heat until well blended and dissolved.Add chicken and bring to a hard boil.Reduce heat and simmer for 20 minutes uncovered.Serve over hot rice.	2015-04-07 18:52:52.168234	2015-04-08 23:24:19.845489	Chicken	4.5231158961368001	http://redirect.bigoven.com/pics/rs/640/bourbon-chicken-179.jpg	1581	30	4 Servings	2 pounds boneless chicken breasts * 1 tablespoon olive oil * 1  garlic clove * 1/4 teaspoon ginger * 3/4 teaspoon crushed red pepper flakes * 1/4 cup apple juice * 1/3 cup light brown sugar * 2 tablespoons ketchup * 1 tablespoon cider vinegar * 1/2 cup water * 1/3 cup soy sauce * 1 tablespoon cornstarch * 	A flavorful chicken dish named after Bourbon Street in New Orleans, Louisiana \r\rThis was a copycat recipe I found & modified of the Bourbon Chicken sold in most Chinese take-outs; which rarely use bourbon as a component. It's wonderfully sweet & spicy without being too hot. For kids that don't like hotstuffs, cut down on the pepper flakes!	201809	17	f	t	f	f
63	Baked Chicken Cordon Bleu	http://www.bigoven.com/recipe/baked-chicken-cordon-bleu/171850	Process a few slices of bread in food processor to make about 4-5 cups of fresh breadcrumbs. Add Parmesan and 2 tsp onion powder. Set aside. Melt butter in a bowl and mix with oil. Set aside. Wash and clean chicken breasts. Pat dry and cut each breast into two pieces. You will have two pretty thin slices. Place a chicken piece on a cutting board. Lay a plastic wrap over the chicken piece and pound with a mallet to about a 1/4 inch thickness. Take care not to pound too hard because the meat may tear or create holes. Do the same thing with all the chicken pieces. You should have 10 chicken pieces to the original 5. Season each chicken piece with a bit of salt/pepper and the remaining 2 tsp onion powder. Be careful not to over salt the chicken as it is quite thin and the cheese and ham are also salty. Bring all the other ingredients in close proximity. Take out the deli ham and place on a plate. Take cheese out...I usually like to cut the cheese slices in half in case I have to overlap them. Take a chicken piece and place a slice of ham and a slice of cheese (or 2 if you cut the original in half). Roll chicken... making sure you tuck the sides in as much as possible (this prevents the cheese from oozing out too much in the final baking time). You can secure it with a toothpick. I have, as of lately, started to omit this step. But if you are doing this for the first time, it might help to secure it with the toothpicks. Take the chicken roll and dip into the melted butter/oil... make sure all the sides are well coated.  Take the butter coated chicken roll and then roll it in the breadcrumbs/Parmesan mixture. Place in a casserole dish or plate. Finish with the rest. You can sprinkle some dried herbs of your choice if you like. I sprinkled some dried basil. Place in the refrigerator for at least an hour to ensure that the breadcrumbs stay put on the chicken :). When ready to bake, place each chicken roll on a parchment lined jelly roll pan (this will help with the cleaning later) making sure you don't overcrowd them. Bake in a preheated 375 oven for 15-20 minutes. Place the pan on the top third rack. Don't over cook the chicken. You can easily do this in a toaster oven as well.	2015-04-07 18:52:52.53853	2015-04-08 23:24:19.852008	Chicken	4.6534653465346496	http://redirect.bigoven.com/pics/baked-chicken-cordon-bleu-43.jpg	203	50	10 Servings	 5   chicken breasts *  4  tsps onion powder *  3 cups fresh bread crumbs  *  3/4  cup shredded Parmesan  *   salt/pepper *  4  tbsp butter *  3  tbsp olive oil *  10  slices deli ham *  10  slices Gruyere/Swiss cheese  *   basil/parsley  * 	Baked Chicken Cordon Bleu... I have been making this recipe for years now. It is such a wonderful and tasty dish...not to mention that you can prepare it in advance. I always fall back on this recipe when I have dinner guests. It is pretty nice to be able to enjoy their company without worrying too much about dinner. I usually prepare the chicken rolls in the morning, place them in the refrigerator and then bake them right before dinner. Alternately, you can freeze the rolls uncooked and defrost and bake at a later date.	171850	24	f	t	f	f
64	Cashew Chicken (Message from BigOven)	http://www.bigoven.com/recipe/cashew-chicken/166832	We hope you are enjoying this free experimental developer key at api.bigoven.com.  Production usage of the BigOven API requires a paid plan, which helps offset BigOven's considerable hosting costs.  This message will not appear on any paid plan; visit your developer console at http://api.bigoven.com to purchase an upgraded key. Thank you!	2015-04-07 18:52:52.82473	2015-04-08 23:24:19.856517	Chicken	4.33333333333333037	http://redirect.bigoven.com/pics/rs/640/cashew-chicken-31.jpg	2	30	4 Servings		A thai chicken dish made with hoisin sauce, an oriental BBQ style sauce.	166832	23	f	t	f	f
65	Buttermilk Fried Chicken Recipe	http://www.bigoven.com/recipe/buttermilk-fried-chicken-recipe/157668	Crispy fried chicken soaked in buttermilk for delicious an old fashioned flavor.Combine buttermilk, salt, pepper and chicken in shallow dish. Refrigerate 20 minutes, turning once. Remove chicken and dredge in flour. Cook in hot oil (350F.), turning to brown both sides. Reduce heat to 275F. Cover and cook 25 minutes. Uncover and cook an additional 5 minutes until crispy. Note: Drain chicken on paper towels.  	2015-04-07 18:52:53.127441	2015-04-08 23:24:19.860562	Chicken	3.83999999999999986	http://redirect.bigoven.com/pics/rs/640/buttermilk-fried-chicken-recipe-2.jpg	25	0	4 Servings	3/4 cup Buttermilk * 1 tsp. Salt * 1/4 tsp. Pepper * 2 1/2 lb. chicken fryers * 1 cup Flour * 1 1/2 cup Vegetable oil * 		157668	3	f	t	f	f
67	Chicken Bacon Alfredo (Message from BigOven)	http://www.bigoven.com/recipe/chicken-bacon-alfredo/161915	We hope you are enjoying this free experimental developer key at api.bigoven.com.  Production usage of the BigOven API requires a paid plan, which helps offset BigOven's considerable hosting costs.  This message will not appear on any paid plan; visit your developer console at http://api.bigoven.com to purchase an upgraded key. Thank you!	2015-04-07 18:52:53.761175	2015-04-08 23:24:19.868232	Chicken	4.55882352941176006	http://redirect.bigoven.com/pics/rs/640/chicken-bacon-alfredo-25.jpg	136	60	4 Servings		This Chicken Bacon Alfredo recipe is very tasty! If you're watching weight, don't try this at home.	161915	2	f	t	f	f
68	Buffalo Chicken Pizza	http://www.bigoven.com/recipe/buffalo-chicken-pizza/175190	 Heat the oven to 425°F.  Stir the chicken, hot sauce and butter in a medium bowl.Spread the chicken mixture on the pizza crust to within 1/2-inch of the edge.  Top with the pepper and cheese.Bake for 10 minutes or until the chicken mixture is hot and bubbling.	2015-04-07 18:52:54.118307	2015-04-08 23:24:19.873285	chicken	3.83333333333332993	http://redirect.bigoven.com/pics/rs/640/buffalo-chicken-pizza-2.jpg	6	30	6 Servings	 1  9.75-oz can Swanson® Premium White Chunk Chicken *  1/4  cup Frank's® RedHot® Sauce  *  2  tablespoons Butter *  1  10-oz package prepared thin pizza crust  (12-inch)  *  1/2   green pepper *  1/4  cup crumbled blue cheese  * 	Buffalo chicken pizza has all the great flavors of my favorite appetizer: buffalo chicken wings! Spicy hot sauce with salty blue cheese. This is a great party dish!	175190	3	f	t	f	f
69	Grilled Dessert Pizza	http://www.bigoven.com/recipe/grilled-dessert-pizza/843906	Instructions are at http://www.myrecipes.com/recipe/grilled-dessert-pizza-50400000121453/	2015-04-07 18:52:59.408619	2015-04-08 23:24:19.87761	Pizza Dough	0	http://redirect.bigoven.com/pics/rs/640/grilled-dessert-pizza-2.jpg	0	25	8 Servings	2 ounces white chocolate * 1 pound pizza dough * 1 cup chocolate chips * 1 cup sliced strawberries * 1 cup raspberries * 1 cup drained canned mandarin orange segments * 1/3 cup sliced almonds * 		843906	9	f	f	f	t
70	Snickers Caramel Apple Dessert	http://www.bigoven.com/recipe/snickers-caramel-apple-dessert/552089	InstructionsWhisk vanilla pudding packet, 1/2 cup milk and cool whip together until well combined.Chop up apples and Snickers.Stir chopped apples and Snickers into pudding mixture.Place in a large bowl and drizzle with caramel ice cream topping.Chill for at least 1 hour before serving.	2015-04-07 18:52:59.750674	2015-04-08 23:24:19.882049		5	http://redirect.bigoven.com/pics/rs/640/snickers-caramel-apple-dessert.jpg	2	0	1 Recipe	  Ingredients * 6 regular size Snickers Candy Bar * 6 apples Red Delicious or  Granny Smith * 1 (5 oz.) package Vanilla Instant Pudding dry * 1/2 cup milk * 1 (12 oz.) tub cool whip * 1/2 cup caramel ice cream topping * 		552089	8	f	f	f	t
71	Oreo Dessert	http://www.bigoven.com/recipe/oreo-dessert/164346	Crush oreos and save 1/4 cup for topping.Mix crushed oreos with butter and pat into dish for crust.Mix 2/3 container of Cool Whip with cream cheese. Spread mixture over crust.Mix pudding and milk. Let set until it thickens a little. Spread over cream cheese mixture.Top with remaining Cool Whip. Sprinkle saved oreo crumbs.	2015-04-07 18:53:00.041209	2015-04-08 23:24:19.885815	Cookies	4.56338028169014009	http://redirect.bigoven.com/pics/rs/640/oreo-dessert.jpg	71	0	8 Servings	 16  oz Oreo cookies *  0.5  cup Butter *  12  oz Cool whip *  8  oz Cream cheese *  6  oz Instant chocolate pudding *  2  cups milk * 	Another popular potluck dish from Mom!	164346	3	f	f	f	t
72	Dessert Cannoli	http://www.bigoven.com/recipe/dessert-cannoli/175677	Directions1.In a medium bowl, mix together the flour, sugar and cinnamon. Cut in the shortening until it is in pieces no larger than peas. Make a well in the center, and pour in the egg, egg yolk, Marsala wine, vinegar and water. Mix with a fork until the dough becomes stiff, then finish it by hand, kneading on a clean surface. Add a bit more water if needed to incorporate all of the dry ingredients. Knead for about 10 minutes, then cover and refrigerate for 1 to 2 hours. 2.Divide the cannoli dough into thirds, and flatten each one just enough to get through the pasta machine. Roll the dough through successively thinner settings until you have reached the thinnest setting. Dust lightly with flour if necessary. Place the sheet of dough on a lightly floured surface. Using a form or large glass or bowl, cut out 4 to 5 inch circles. Dust the circles with a light coating of flour. This will help you later in removing the shells from the tubes. Roll dough around cannoli tubes, sealing the edge with a bit of egg white. 3.Heat the oil to 375 degrees F (190 degrees C) in a deep-fryer or deep heavy skillet. Fry shells on the tubes a few at a time for 2 to 3 minutes, until golden. Use tongs to turn as needed. Carefully remove using the tongs, and place on a cooling rack set over paper towels. Cool just long enough that you can handle the tubes, then carefully twist the tube to remove the shell. Using a tea towel may help you get a better grip. Wash or wipe off the tubes, and use them for more shells. Cooled shells can be placed in an airtight container and kept for up to 2 months. You should only fill them immediately or up to 1 hours before serving. 4.To make the filling, stir together the ricotta cheese and confectioners' sugar using a spoon. Fold in the chopped citron and chocolate. Use a pastry bag to pipe into shells, filling from the center to one end, then doing the same from the other side. Dust with additional confectioners' sugar and grated chocolate for garnish when serving. 	2015-04-07 18:53:00.48185	2015-04-08 23:24:19.890695	Cheese	4.66666666666666963	http://redirect.bigoven.com/pics/rs/640/dessert-cannoli-2.jpg	3	225	30 Servings	  Shells:  *  3  cups all-purpose flour  *  1/4  cup Granulated sugar *  1/4  teaspoon ground cinnamon  *  3  tablespoons shortening  *  1   egg  *  1   egg yolk  *  1/2  cup sweet Marsala wine *  1  tablespoon distilled white vinegar *  2  tablespoons Water *  1   egg white  *  1  quart Vegetable Oil *   Filling:  *  1  container ricotta cheese *  1/2  cup confectioners sugar *  1  cup chopped candied citron *  4  ounces semisweet chocolate * 	Decadent chocolate, Ricotta cheese, and Candied Citron make this dessert a must have.	175677	2	f	f	f	t
73	Dessert Crepes	http://www.bigoven.com/recipe/dessert-crepes/373959	Instructions are at http://allrecipes.com/recipe/dessert-crepes/detail.aspx?event8=1&prop24=SR_Title&e11=desert%20crepes&e8=Quick%20Search&event10=1&e7=Home%20Page	2015-04-07 18:53:00.75634	2015-04-08 23:24:19.896518	\N	0	http://redirect.bigoven.com/pics/rs/640/dessert-crepes-5.jpg	0	20	1 Serving	4  Eggs * 1 1/3 cups milk * 2 tablespoons butter melted * 1 cup all-purpose flour * 2 tablespoons white sugar * 1/2 teaspoon salt *    * 	Basic dessert crepe	373959	9	f	f	f	t
74	Sugar Free Caramel Apple Dessert	http://www.bigoven.com/recipe/sugar-free-caramel-apple-dessert/161241	Over low heat (or in a double boiler) melt the caramels. Stir in the half-and-half until it's blended. Allow sauce to cool. Slice the apple into crescents and arrange in 4 bowls. Drizzle sauce over apples and garnish with drops of sugar-free chocolate sauce or curls of sugar free chocolate. Each (app 1/2 cup) serving contains an estimated:Cals: 51, FatCals: 11, TotFat: 1gSatFat: 1g, PolyFat: 0g, MonoFat: 0gChol: 0mg, Na: 10mg,  K: 41mgTotCarbs: 12g, Fiber: 2g, Sugars: 4gNetCarbs: 10g, Protein: 0gVARIATIONS: Add a dash of cayenne pepper or 1 teaspoon of sugar free chocolate sauce to vary the flavor. Try putting this over fresh pinapple or sliced pears. 	2015-04-07 18:53:01.039782	2015-04-08 23:24:19.901148	Apples	4	http://redirect.bigoven.com/pics/rs/640/sugar-free-caramel-apple-dessert-2.jpg	2	20	4 Servings	4 pieces Brach's Sugar Free Caramel * 1 tablespoons Fat Free Half and Half * 2 medium Apples * 	Who says Diabetics can't have a rich caramel dessert? Not with some of this on hand. It's incredibly simple to make and totally delicious. 	161241	3	f	f	f	t
75	Raspberries with chocolate inside them, easy, quick party dessert idea!	http://www.bigoven.com/recipe/raspberries-with-chocolate-inside-them-easy-quick-party-dessert-idea/244135	Stuff em in there!	2015-04-07 18:53:01.325777	2015-04-08 23:24:19.905604	Raspberry, chocolate	4.75	http://redirect.bigoven.com/pics/rs/640/rasberries-with-chocolate-inside-th.jpg	4	0	1 Serving	1  raspberry * 1  chocolate chip * 	Picture is self explanatory!	244135	25	f	f	f	t
80	Risotto With Chicken	http://www.bigoven.com/recipe/risotto-with-chicken/732273	Preparation: Finely chop an onion1. Cook a chicken breast with salt & pepper and herbs if available.2. Heat 1 Tb better and oil in a medium-size heavy saucepan over medium heat. Add onion; saute until golden and softened, about 5 minutes. Stir in rice to coat, 1 to 2 minutes.3. Add 1/2 cup chicken broth; stir until liquid is absorbed. Continue adding broth, 1/2 cup at a time, stirring constantly until each addition is absorbed before adding next 1/2 cup, until there is only 1 cup broth remaining.4. Add remaining broth, 1/3 cup ata time, stirring and cooking until rice is just cooked through. Cooking time should be about 30 minutes. Finished dish should be creamy.5. Cut the cooked chicken into small cubes. Stir in the Risotto Parmesana cheese, chicken, and remaining tablespoon butter.	2015-04-07 18:53:42.027108	2015-04-07 18:53:42.027108	Rice	5	http://redirect.bigoven.com/pics/rs/640/risotto-with-chicken.jpg	1	60	3 Servings	2 tablespoons Butter * 1 tablespoon Olive oil * 1 each Onion * 1 cup Arborio rice * 4 cups Lower-sodium chicken broth * 3 tablespoon Parmesan * 10 ounce Chicken breast * 8 ounce Mushroom * 		732273	2	f	f	f	f
81	Dirty Risotto	http://www.bigoven.com/recipe/dirty-risotto/185588	In a medium saucepan, bring the broth to a simmer. Cover the broth and keep warm over low heat.In a large heavy saucepan, melt the butter over medium heat. Add the pancetta and sausage and saute until golden brown, about 5 minutes. Add the onion, bell pepper, and mushrooms and saute until tender, scraping up the browned bits on the bottom of the pan, about 8 minutes. Season with salt and pepper. Add the rice and stir to coat. Add the wine and simmer until the wine has almost completely evaporated, about 1 minute.Add 1/2 cup of simmering broth and stir until almost completely absorbed, about 2 minutes. Continue cooking the rice, adding the broth 1/2 cup at a time, stirring constantly and allowing each addition of broth to absorb before adding the next, until the rice is tender but still firm to the bite and the mixture is creamy, about 25 to 30 minutes total. Remove from the heat. Stir in 3/4 of the Parmesan. Transfer the risotto to a serving bowl. Sprinkle with the parsley and remaining Parmesan and serve immediately.	2015-04-07 18:53:42.391239	2015-04-07 18:53:42.391239	Rice	4	http://redirect.bigoven.com/pics/rs/640/dirty-risotto.jpg	2	60	4 Servings	5 cups reduced-sodium chicken broth * 2 tablespoons butter * 2 ounces pancetta chopped * 1  link Spicy italian sausage (6 oz) * 3/4 cup finely chopped onion * 1 cup chopped red bell pepper * 4 ounces button mushrooms coarsely chopped * 1/2 teaspoon salt * 1/4 teaspoon freshly ground black pepper * 1 1/2 cups Arborio rice * 3/4 cup dry white wine * 1/2 cup freshly grated Parmesan * 1 tablespoon chopped fresh Italian parsley leaves * 	This is worth all the effort, it's also good with extra sausage for a main dish.	185588	2	f	f	f	f
82	Cauliflower Risotto	http://www.bigoven.com/recipe/cauliflower-risotto/311172	In a medium saucepan mix together all the ingredients, add tomatoes, spices and herbs to taste	2015-04-07 18:53:42.672046	2015-04-07 18:53:42.672046	Cauliflower	2	http://redirect.bigoven.com/pics/rs/640/cauliflower-risotto.jpg	1	\N	2 Servings	1 cup Cauliflower * 1 tablespoon onion * 3 tablespoons milk * 6  Cherry tomatoes *   herbs to taste * 		311172	8	f	f	f	f
77	Crescent roll dessert bars	http://www.bigoven.com/recipe/crescent-roll-dessert-bars/712161	Instructions:Unroll and spread 1 can crescent rolls on bottom of un-greased pan. Combine softened cream cheese, sugar, and vanilla. Spread mixture over crescent rolls. Unroll and spread remaining crescent rolls over mixture. Spread melted butter over the top and sprinkle with cinnamon and sugar. Bake at 350 degrees for 20-30 minutes. 	2015-04-07 18:53:01.888394	2015-04-08 23:24:19.914159	Pillsbury butter crescent rolls	4	http://redirect.bigoven.com/pics/rs/640/crescent-roll-dessert-bars.jpg	2	0	12 Servings	2 cans Pillsbury butter crescent rolls * 2 8 oz packages cream cheese * 1 cup sugar * 1 teaspoon vanilla * 1/4 cup butter * 1/4 cup Cinnamon & sugar * 	Crescent roll dessert bars	712161	9	f	f	f	t
78	Berry Chocolate Dessert  	http://www.bigoven.com/recipe/berry-chocolate-dessert/277742	Instructions are at http://www.tasteofhome.com/recipes/Berry-Chocolate-Dessert	2015-04-07 18:53:02.935825	2015-04-08 23:24:19.917989	cream cheese	0	http://redirect.bigoven.com/pics/rs/640/berry-chocolate-dessert-recipe-2.jpg	0	0	12 Servings	2/3 cup sliced almonds * 1-1/3 cups semisweet chocolate chips * 16 oz cream cheese * 2/3 cup sugar * 12 oz frozen whipped topping * 1 cup  fresh raspberries * 2 tablespoons seedless strawberry jam * 1 cup  fresh blueberries * 1 cup fresh blackberrries * 	Magazine-Recipes@yahoogroups.com\rOriginally published as Berry Chocolate Dessert in Simple & Delicious July/August 2009, p41\rHere’s a simply stunning dessert that’s a guaranteed standout! Creamy, dreamy and chocolaty, it’s piled with fresh, glazed raspberries, blueberries and blackberries. Best of all, promises our Test Kitchen, is the easy, breezy, no-bake preparation. Simple & Delicious Test Kitchen	277742	9	f	f	f	t
79	Seafood Risotto	http://www.bigoven.com/recipe/seafood-risotto/169985	1. Peel the prawns, reserving the shells for the stock. Set the prawns aside until needed. Wash the mussels, scrape them clean and pull out the beards. Open by placing in a pan with a splash of water, covering tightly then setting over a high heat until they have opened. Strain through a colander to remove any grit. Save the liquor for the stock. Remove the meats from all but 8 of the shells, discard the empty shells. Leaving a few whole mussels in the risotto makes it look very appetizing. Set the mussels aside until needed.2. To make the stock, heat the oil in a large pan and add the garlic, carrot, celery, onion, leek and chilli. Fry for 5 minutes without colouring. Add the reserved prawn shells and cook for another couple of minutes then add the tomato, saffron, fish stock and mussel liquor. Bring to the boil and simmer for 30 minutes then push through a conical sieve with the back of a ladle to extract as much flavour as possible.3. To make the risotto, melt the butter in a heavy-based pan (this will lessen the chance of the risotto burning on the bottom as it cooks) then add the shallots and garlic and sweat until softened. Add the rice and stir for a couple of minutes until well-coated with butter. Pour in the wine. Bring to the boil then remove from the heat and let the rice absorb all the liquid. You can make the risotto to this stage some time before completing the dish. The final cooking time, about 20 minutes, is reduced to about 10 by doing this.4. Return the pan to a medium heat and add the shellfish stock to the rice in three stages, allowing the liquid to be absorbed each time before adding the next amount. Stir continuously until the stock is almost completely absorbed.5. When the rice is just tender but still firm to the bite (al dente), add the parmesan. (The small amount of stock left at this stage will be absorbed by the cheese.) While the risotto is cooking, brush the rest of the seafood with olive oil and grill for 3-4 minutes. To serve, carefully mix the seafood including the mussels into the risotto. Leave a few pieces on top to garnish.	2015-04-07 18:53:41.687607	2015-04-08 23:24:19.922858	Fish	5	http://redirect.bigoven.com/pics/rs/640/seafood-risotto.jpg	1	90	8 Servings	 450 grams prawns *  36  small mussels  *  100 grams monkfish fillet *  50 grams squid *   For the Stock:  *  25 oz olive oil  *  1  clove garlic *  1  medium carrot *  1   celery stick *  1  small Onion *  1  small leek * 1 1/4  red chilli *  1   tomato *  1/8  tsp saffron  *  900 milliliters fish stock  *   cooking liquor from the mussels  *   For the Risotto:  *  50 grams unsalted butter  *  2   shallots *  1  clove garlic *   risotto rice *  120 oz Dry white wine *  25 grams parmesan  *  1  tbsp olive oil * 	by Rick Stein\rfrom Taste of the Sea	169985	2	f	t	f	f
84	Risotto	http://www.bigoven.com/recipe/risotto/164639	Bring stock to simmer, and keep it there. Heat butter in lg saucepan over medium heat. Saute onion and celery 2-3 mins. Add rice, stir one minute until it is translucent and coated. Add wine, stirring constantly until it is absorbed. Add stock 1/2 cup at a time, stirring constantly until each 1/2 cup is absorbed. (Save out about 1/2 c stock till later.) This should take about 20 minutes. Rice should be tender but still a bit al dente. Remove from heat. Quickly add the last 1/2 c stock, the cheese, the peas, and the parsley.	2015-04-07 18:53:43.318857	2015-04-08 23:24:19.936468	Rice	4.33333333333333037	http://redirect.bigoven.com/pics/rs/640/risotto-2.jpg	12	40	4 Servings	5 cups Chicken broth * 1 Tbs Butter * 1 small Onion * 1 1/2 cup Arborio rice * 1/2 cup white wine * 1/2 cup Parmesan cheese * 1 stalk celery * 1 cup frozen peas * 1/2 cup fresh parsley * 	Adapted from a recipe, 1997. Lots of patient stirring required to make it turn out right, but worth the trouble. This is excellent with Tomato Salad, bread, and sauvignon blanc.\r	164639	2	f	f	t	f
85	Risotto	http://www.bigoven.com/recipe/risotto/512667	Add all ingredients into saucepan and cook for 30 mins or until rice is tender	2015-04-07 18:53:43.628118	2015-04-08 23:24:19.941121	Rice	0	http://redirect.bigoven.com/pics/rs/640/risotto-6.jpg	0	40	4 Servings	2 Cups Arborio Rice *   Chicken Stock * 1  Red onion * 2  Garlic cloves * 0.5 Cup Single cream * 100 grams Parmesan cheese * 1 Cup White wine * 		512667	9	f	t	f	f
87	Butternut Squash and Vanilla Risotto	http://www.bigoven.com/recipe/butternut-squash-and-vanilla-risotto/660035	Instructions are at http://www.foodnetwork.com/recipes/giada-de-laurentiis/butternut-squash-and-vanilla-risotto-recipe/index.html	2015-04-07 18:53:44.32782	2015-04-08 23:24:19.949069	Arborio rice	4	http://redirect.bigoven.com/pics/rs/640/butternut-squash-and-vanilla-risott-9.jpg	1	35	6 side dish servings	4 cups vegetable broth * 1 large vanilla bean * 3 cups butternut squash * 2 tablespoons butter  * 3/4 cups  onion  * 1 1/2 cups Arborio rice or medium-grain white rice * 1/2 cup dry white wine * 1/2 cup freshly grated Parmesan * 1/2 teaspoon salt * 2 tablespoons fresh chives * 		660035	9	f	f	t	f
88	Spinach and Sweet Potato Brown Rice Risotto 	http://www.bigoven.com/recipe/spinach-and-sweet-potato-brown-rice-risotto/349090	Preheat oven to 410 F (210°C). Place sweet potatoes on a baking tray lined with baking paper and spray with cooking oil. Bake for 20 minutes or until golden and tender. Set aside. While potatoes are cooking, partially cook brown rice in some water, approx 20 - 30 min, then drain.Step 2Meanwhile, heat stock in a small saucepan over medium heat. Bring to a boil, then reduce heat to very low. Keep the saucepan on the burner while you make the risotto. Add oil to a large saucepan over medium heat. Add onion and cook for 3-4 minutes or until softened. Add rice and garlic, and stir for 2 minutes or until rice is coated well.Step 3Pour 2 cups hot stock mixture into the pan, stirring regularly to avoid the rice sticking to the base of the pan. Once most of the liquid has evaporated, add remaining stock, stirring constantly until most of the liquid has evaporated and the rice is tender. This should take 15-20 minutes. Stir in the spinach, sweet potato, butter and pine nuts, and serve with parmesan.	2015-04-07 18:53:44.707726	2015-04-08 23:24:19.95313	\N	3.75	http://redirect.bigoven.com/pics/rs/640/spinach-and-sweet-potato-brown-rice.jpg	4	60	12 Servings	2  sweet potato * 4 cups Chicken Stock * 1 tablespoon olive oil * 1 onion, chopped * 2 cups Short grain Brown rice * 2 cloves garlic  * 100 g baby spinach leaves * 2 tablespoons pine nuts toasted * 1 tablespoon butter * 2 teaspoon parmesan * 	Recipe adapted from Two Peas and Their Pod: http://www.twopeasandtheirpod.com/roasted-sweet-potato-and-spinach-risotto/\r\rFor those who love risotto, but are trying to avoid white rice, I actually like it with brown rice better!	349090	9	f	t	f	f
96	Savory Party Bread	http://www.bigoven.com/recipe/savory-party-bread/50891	Cut the bread lengthwise and crosswise without cutting through the bottom  crust (this bread resembles a blooming onion after its cut). Insert cheese  between cuts. Combine butter, onions and poppy seeds; drizzle over the  bread. Wrap in foil; place on a baking sheet. Bake at 350 ? for 15 minutes.  Uncover; bake 10 minutes longer or until the cheese is melted.    This recipe published in Taste Of Home Magazine Feb/Mar 1998 Submitted to  magazine by Kay Daly, she writes; "Its impossible to stop nibbling on warm  pieces of this cheesy, oniony bread." "The sliced loaf fans out for a fun  presentation".    Recipe by: Kay Daly, Raleigh, North Carolina    Posted to recipelu-digest Volume 01 Number 580 by PLK1028 <PLK1028@aol.com>  on Jan 23, 1998	2015-04-07 18:54:06.39117	2015-04-08 23:24:19.956907	Grains	4	http://redirect.bigoven.com/pics/rs/640/savory-party-bread.jpg	1	\N	6 Servings	1  Unsliced round loaf; * 3 ts Poppy seeds; (optional * 1/2 c Green onion; chopped * 1 lb Monterey jack cheese; sliced * 1/2 c Butter or Margarine * 		50891	3	t	f	f	f
90	Bread Cones	http://www.bigoven.com/recipe/bread-cones/173833	Pour the milk and water into a saucepan and heat to a scald.Pour this into a large bowl (I used my kitchen aid bowl since I was going to knead it using the mixer), allow to cool to lukewarm. Add in the oil, sugar and salt; mix with a wooden spoon till well blended.Add in the beaten egg and 2 cups of flour; mix till smooth with a wooden spoon.Add in the instant yeast and mix.Allow to sit for 10 minutes uncovered. Now, start to slowly add in more flour. I added 1 1/2 cups...a total of 3 1/2 cups of flour. I used my Kitchen Aid to do the mixing...I kneaded the dough for 6-8 minutes. Add a tablespoon of oil to a clean bowl and place the dough into the bowl. Turn over a few times to lightly coat all sides of the dough with the oil. Cover with plastic wrap and allow to rest till the dough doubles in bulk, about 1 hour. While the dough is rising, make the cones. That is if you don't have any. If you do...ah, take a break:)Make the cones out of card stock paper material or fliers that are a bit more sturdier.Tape the cones and then cover them well with aluminum foil, so that no paper shows.Set them aside.Remove dough and knead a few time to release the gas. Now cut the dough into 8 pieces.Use a scale to make sure each piece is equal in weight(I didn't do this since I don't have a scale). Allow the dough to rest for 5 minutes. Take each piece of dough and roll into a 36 inch rope.Roll the dough ropes around the greased 6 inch cream horn tubes.Place onto a cookie sheet lined with parchment paper and brush with the egg glaze. Sprinkle sesame seeds or poppy seeds(or both).Cover with plastic wrap. Allow to rest for 30 minutes in a warm environment.Bake in a preheated 350 degree oven for 20 - 22 minutes or till golden brown(mine took about 18 minutes).Place onto a wire rack and allow to cool for a couple minutes before removing the tubes.Fill them with your favorite filling and enjoy!They freeze very well.Printed with permission.	2015-04-07 18:54:04.236023	2015-04-07 18:54:04.236023	bread	4.57777777777778017	http://redirect.bigoven.com/pics/rs/640/bread-cones-9.jpg	50	140	8 Servings	 1/2  cup milk  *  1/2  cup Water *  3  tablespoons oil  *  1/4  cup Sugar *  1   egg  *  1 1/2  teaspoon Salt *  2 1/4  teaspoon instant yeast  *  3 1/2  cups bread flour *   Egg wash:  *  1   egg  *  1  tablespoon milk * 	This recipe comes from a site called http://www.cookingbread.com/ . So when I came across the Bread Cone Recipe, I instantly knew I would try it. I thought it was so elegant and pretty...perfect for bridal showers, birthday parties, reunions, potlucks, picnics or any other special occasion. There was one problem though, I didn't have any cream horn tubes to make these...so I came up with my own idea, using cardstock (or in my case mailing flyers). I covered the flyers with aluminum paper and they worked like a charm. If you have the cream horn tubes, use those instead. I love these bread cones...delicious and unique. 	173833	3	f	f	f	f
91	Onion Bread (Bread Machine)	http://www.bigoven.com/recipe/onion-bread-bread-machine/465135	Place mixing paddle in bread machine pan.Add ingredients except cornmeal and egg white to bread machine in the order listed, making a well in the center of the dry ingredients and placing the yeast within (do not allow yeast to touch liquid).Place pan in machine until it snaps into place and close lid.Press the ''''select'''' button on control panel repeatedly until the arrow aligns with the setting marked ''''dough'''' and press ''''start''''When the cycle has 30 minutes left to completion, preheat oven to 375F and place large cookie sheet on top of stove.  Spray sheet liberally with garlic-flavored cooking spray and sprinkle lightly with cornmeal.On clean and dried cutting board sprinkle about 1/8 cup of flour (until lightly coated). When the machine beeps transfer dough to board and sprinkle flour as needed.  Do NOT add too much.  The dough should not be coated with flour.  Turn dough over (you can flour hands if necessary)Pat dough to a rough rectangle then turn over and roll out to neat rectangle, (about) 8"x15" with rolling pin.  Make sure the dough does not stick by sprinkling dough or board lightly with additional flour.  Again, do not add too much or the bread will be hard.Roll dough from the long side in, making the roll as even as possible.  Pinch all ends in to seal, rolling dough to make even.Transfer carefully to prepared cookie sheet.  Spray with garlic-flavored cooking spray and cover with towel.  Let rise for 20 minutes.Separate egg and store yolk in refrigerator.  Add 1 tablespoon of water to egg white and beat lightly until frothy.  Move sheet with dough to cutting board and remove towel.  Make 3-4 diagonal slashes in dough and brush with 1/2 of the egg mixture.Bake for 20 minutes.After 20 minutes have passed remove bread from oven and brush with rest of egg mixture.  Replace in oven and bake for additional 12 minutes.Remove bread from oven and move from sheet immediately to cool.	2015-04-07 18:54:04.63287	2015-04-07 18:54:04.63287	Grains	0	http://redirect.bigoven.com/pics/rs/640/onion-bread-bread-machine.jpg	0	142	18 Servings	1 3/4 cups water * 1 teaspoon salt * 4 1/2 cups flour * 1 package onion soup mix * 2 1/4 teaspoons bread machine yeast * 1/4 scoop yellow cornmeal *   cooking spray * 1  egg white * 1  tablespoon water * 	Makes excellent sandwich bread.	465135	3	f	f	f	f
92	Killer Bread	http://www.bigoven.com/recipe/killer-bread/100	Preheat broiler.    Mix mayonnaise, Parmesan cheese and garlic in a large bowl to blend.Arrange bread, cut side up on a large cookie sheet.   Butter bread. Broil until crisp and brown.Spread Parmesan mixture over cut sides of bread.  Broil until top is puffed and golden brown. Sprinkle with basil. Cut into wedges and serve. 	2015-04-07 18:54:05.054155	2015-04-07 18:54:05.054155	Grains	3	http://redirect.bigoven.com/pics/rs/640/killer-bread-7.jpg	2	0	12 Servings	1 c Mayonnaise * 1 c Grated Parmesan * 1 clove Garlic * 1 lb Sourdough bread *   Butter * 2 ts Fresh Basil * 2 ts Dried basil * 	NOTE: This is a test recipe on BigOven, used by the team to test the platform. Please ignore the various comments, etc. Thank you!	100	9	f	f	f	f
95	Banana Bread Pancakes	http://www.bigoven.com/recipe/banana-bread-pancakes/863559	1.  Whisk together flour, baking soda, and salt in a large bowl.2.  In a separate bowl, whisk together mashed bananas, buttermilk, sugar, butter, egg and vanilla.3.  Add wet mixture to dry mixture; stir just until combined.4.  Heat an electric griddle to 375 degrees or a nonstick skillet over medium-low; coat with nonstick spray.5.  Drop batter by 2 Tbsp onto griddle and cook until bubbles appear and bottoms are browned; about 4 minutes.6.  Flip and cook until brown; about 2 minutes more.7.  Serve with syrup, sliced bananas and chopped toasted pecans.	2015-04-07 18:54:06.066982	2015-04-07 18:54:06.066982	Bananas	4.66666666666666963	http://redirect.bigoven.com/pics/rs/640/banana-bread-pancakes.jpg	3	0	2 Servings	3/4 cup All purpose flour * 1/2 teaspoon baking soda * 1/2 teaspoon salt * 3/4 cup overripe banana * 1/4 cup buttermilk * 1/4 cup sugar * 4 tablespoons unsalted butter * 1 teaspoon vanilla extract *   sliced bananas *   pecans * 	If you have a sweet tooth, these pancakes are sure to hit the spot. Balance their sweetness by serving them with sausage or bacon.\r\rNutrition:\r571 cal; 25g total fat; 155mg chol; 965mg sodium; 80g carb; 4g fiber; 10g protein	863559	8	f	f	f	f
94	Slow Cooker Bread Pudding	http://www.bigoven.com/recipe/slow-cooker-bread-pudding/157672	Combine all ingredients, making sure bread is thoroughly wet. Spray inside of crockpot with cooking spray; pour bread mixture in crockpot. Cover; cook on High for 3 to 4 hours or until knife inserted into the middle comes out clean.	2015-04-07 18:54:05.70675	2015-04-08 23:24:19.973245	Bread	3.41176470588235015	http://redirect.bigoven.com/pics/rs/640/slow-cooker-bread-pudding.jpg	17	0	4 Servings	3 md Eggs * 3 1/2 cups milk * 2 teaspoons Vanilla extract * 1 teaspoon Ground cinnamon * 1/2 teaspoon Salt * 3 cups bread cubes * 3/4 cup Brown sugar * 1/2 cup Raisins * 		157672	3	f	f	f	t
1	Main - Mexican Lasagna	http://www.bigoven.com/recipe/main-mexican-lasagna/179509	Brown the beef.  Add the can of chili to the mixture.  Be careful as it''ll splatter everywhere!   Add the tomato sauce and heat thru.Grease a large baking dish.  Layer:1.  Sauce2.  Tortillas (I dip them in the sauce then layer)3.  Velveeta slices (be generous)4.  Chopped OnionLayer again 2-3x and use up the ingredients.  Bake 350F  for 45 minutes.  Let stand 10 minutes prior to serving.  Serve with Sour Cream and Salsa.	2015-04-07 18:50:11.189246	2015-04-08 23:24:19.564575	Beef	4.5	http://redirect.bigoven.com/pics/rs/640/main-mexican-lasagna.jpg	4	0	4 Servings	1 pound Ground beef * 1 can (12 oz) Chili * 16 ounce Tomato sauce * 20 ea Corn tortillas * 1 pound Velveeta * 1 ea Onion * 1 cup Sour cream * 1 cup Salsa * 		179509	1	f	t	f	f
5	Main - Bobotie	http://www.bigoven.com/recipe/main-bobotie/179485	Heat oil in medium saute pan.  Stir in onions and garlic.  Cook over medium heat until transparent.  Add ground beef.  Cook until lightly browned and crumbly.Soak bread in half the milk, squeeze out excess milk and mash with a fork.  Retain the squeezed out milk!  Pour it straight back into remaining milk.  Set milk aside, and add pulled-apart bread to the meat mixture.Add curry, sugar, salt, pepper, turmeric, vinegar, raisins, chutney to the beef mixture.  Spoon the mixture into a greased baking dish, and place bay leaves on top.Bake for 1 hour at 350F.Beat egg with remaining milk and pour over mixture approximately 30 minutes before end of baking time.Serve with steamed yellow rice mixed with 1 box steamed raisins and extra chutney.	2015-04-07 18:50:13.890916	2015-04-08 23:24:19.593139	Beef	5	http://redirect.bigoven.com/pics/rs/640/main-bobotie.jpg	4	0	4 Servings	2 tablespoon Olive oil * 2 ea Onion * 2 cloves Garlic * 2 1/4 lbs Ground beef * 1 ea White bread * 1 cup Milk * 1 tablespoon Curry powder * 2 tablespoon Sugar * 2 teaspoon Salt * 1 teaspoon Tumeric * 1 1/2 tablespoon Malt vinegar * 1/2 cup Raisins * 2 tablespoon Chutney * 3 ea Bay leaf * 3 ea Eggs * 1 package Yellow rice * 1 box Raisins * 	South African Dish	179485	4	f	t	t	f
9	Main - Cheesburger Pie	http://www.bigoven.com/recipe/main-cheesburger-pie/179487	Saute the onion and add to the beef.  Stir in the soup and salt.  Spread the bottom of an aluminum pie plate with the meat mixture.  Sprinkle cheese over the meat.In another bowl, mix milk, bisquick and eggs.  Pour over the meat/cheese mixture.Bake 400F for 45 minutes on top of a cookie sheet.  It always boils over!	2015-04-07 18:50:17.274402	2015-04-08 23:24:19.610688	Beef	3.85714285714285987	http://redirect.bigoven.com/pics/rs/640/main-cheesburger-pie.jpg	7	0	4 Servings	1 pound Ground beef * 1 cup Onion * 1 tablespoon Salt * 1 can (12 oz) Cream of mushroom soup * 1 cup Cheddar * 1 cup Milk * 1/2 cup Bisquick * 2 ea Eggs * 	Kiddos favorite.	179487	3	f	t	f	f
10	Maine Clam Chowder	http://www.bigoven.com/recipe/maine-clam-chowder/158342	Melt margarine and saut the diced onions until they appear translucent. Add bacon and flour to the melted margarine and stir continuously for 5 minutes. Add clam juice and whisk into mixture. Stir constantly, breaking up any lumps that form. Add clams, potato, milk, cream, and salt and continue stirring. Decrease heat to low, and allow to simmer for about 20 minutes, stirring frequently to avoid burning or sticking. Serve hot with oyster crackers, adding black pepper to taste.	2015-04-07 18:50:17.888235	2015-04-08 23:24:19.615086	Clams	3	http://redirect.bigoven.com/pics/rs/640/maine-clam-chowder-2.jpg	1	0	4 Servings	5 cups bottled clam juice * 1 cup flour * 1 cup onion * 10 slices cooked bacon * 2 tablespoons Margarine * 8 ounces cooked clams * 6 ounces clams undrained * 4 medium potatoes * 1/2 cup milk * 1/2 cup Light cream * 1 teaspoon Salt *   Black Pepper * 	A quick and easy version of a Nor-East favorite	158342	3	t	t	f	f
22	Savoury Vegetable Rice	http://www.bigoven.com/recipe/savoury-vegetable-rice/174110	Heat the oil and add the onion. Cook until soft before adding the vegetables, turmeric, and garlic. Cook for three minutes before adding the rice, stir to coat the rice and then add the boiling stock. Lower the heat and simmer until the rice is cooked checking that the water does not boil away and the ingredients do not stick to the bottom of the pan. Serve immediately or leave to get cold and freeze in portions.You may need to add more water or less depending on the type of rice used and the amount of vegetables. 	2015-04-07 18:51:44.482477	2015-04-08 23:24:19.642292	Rice	4.75	http://redirect.bigoven.com/pics/rs/640/savoury-vegetable-rice-2.jpg	4	30	4 Servings	2 tablespoon Vegetable oil * 1 medium onion * 1 clove Garlic * 1/2 cup French Beans * 1/2 cup Peas * 1 medium Red pepper * 1/2 cup Corn kernels * 1 pinch Sea Salt * 1 pinch Pepper * 750 milliliters Chicken Stock * 1/2 teaspoon Turmeric * 300 grams Long grain rice * 	Savoury rice is a tasty alternative to vegetables or potatoes when filling out a family meal. Yes, you can buy ready prepared packets with dried ingredients however, do you really want to serve reconstituted food to your family that is bursting with additives.	174110	11	f	t	f	f
98	Crusty Skillet Corn Bread	http://www.bigoven.com/recipe/crusty-skillet-corn-bread/144952	Mix all dry ingredients together. Stir eggs into buttermilk and add to dry mixture. Melt butter inside heavy iron skillet. Coat skillet with butter on all sides. Pour remaining butter from skillet into cornbread batter and mix thoroughly. Cook bacon in skillet until crisp. Crumble bacon into small pieces and mix into the batter. Pour the cornbread batter into  hot skillet and bake in a 375 degree oven. Cook bread until it has a  golden brown crust (approximately 25-30 minutes). Yield: 8 servings.    CHEF DU JOUR RICHARD JONES SHOW #DJ9465    Busted and entered for you by: Bill Webster    Converted by MM_Buster v2.0m.          	2015-04-07 18:54:07.085062	2015-04-09 13:51:37.795377	Grains	4.25	http://redirect.bigoven.com/pics/rs/640/crusty-skillet-corn-bread-2.jpg	12	0	8 Servings	2 c Yellow corn meal * 1/2 c Flour * 1/2 ts Salt * 1/2 ts Baking soda * 3 tb Sugar * 2 ts Baking Powder * 4  Eggs * 1 1/4 c Buttermilk * 2 slices Bacon * 1/2 cup Butter * 		144952	3	f	f	t	f
16	Gefilte Fish	http://www.bigoven.com/recipe/gefilte-fish/89987	This is a recipe from my Aunt Goldie.  It is a simple recipe and it comes  out perfect everytime. It may be doubled, tripled or even quadripled.    Bring to boil a large pot of water and fish heads and bones Add lots of  onions and carrots sliced (save the peel of the onions).  Bring all the  ing. together and mix well. You can also add 1 carrot to the fish if you  want.  Wet your hands and form the fish into balls. Drop fish into the  water bring to a boil and simmer for 3 hrs covered. In the last hour add  the onion skins  Add hot water as needed. Enjoy! If you have any questions  feel free to ask  Bpstat@aol.com    If you feel daring try making horseradish.  Just peel a horseradish root,  Place in a blender or cuisnart and spin.  When that is ground up add 1 can  of beets and a little borscht.  Mix until you get the desired color and  consistency you want.  Then add some vinegar and if necessary add some  sugar to taste.  Posted to JEWISH-FOOD digest V96 #80    Date: Tue, 19 Nov 1996 01:31:03 -0500    From: BPSTAT@aol.com	2015-04-07 18:51:09.276005	2015-04-08 23:24:19.646109	Seafood-Other	0	http://redirect.bigoven.com/pics/rs/640/gefilte-fish.jpg	0	\N	1 Serving	1/4 c Matzoah meal per pound of * 1 lg Onion per pound of fish * 1  Egg per pound of fish ground * 1 lb Fish (whitefish carp trout * 1 ts Salt per pound of fish * 1/2 ts Pepper per pound of fish * 		89987	3	f	t	f	f
23	Quinoa Fried Rice	http://www.bigoven.com/recipe/quinoa-fried-rice/774349	1.Rinse quinoa a few times in cold water.2.Bring quinoa and water or chicken stock to a boil in a medium saucepan, and then reduce to a simmer. Season with salt.3.Simmer for 15-20 minutes until quinoa is fluffy and cooked through. Remove from heat and let set for five minutes or so. Fluff with a fork.4. Cool and store in the fridge, preferably overnight.5. Mix teriyaki, soy sauce, and sesame oil in a small bowl. Set aside.6. Heat ½ tablespoon olive oil in a large sauté pan over a high heat. Add onion and carrot, cook about two minutes. Add 2 scallions, garlic and ginger to the pan. Cook another two minutes. Add in the rest of the olive oil and the quinoa. Stir-fry about two minutes. Add sauce and stir-fry until incorporated, about two minutes. Make a well in the center of the quinoa pour eggs in, scramble. Throw in peas, then toss everything together until the peas are warmed through, add remaining scallion and serve.	2015-04-07 18:51:44.863688	2015-04-08 23:24:19.670122	Rice	4.42857142857142971	http://redirect.bigoven.com/pics/rs/640/quinoa-fried-rice-3.jpg	7	35	5 Servings	1 1/2 cups quinoa * 1 1/2 cups water/low-sodium chicken stock * 1/4 cup onion * 2  Carrots * 3  Scallions * 3  Garlic cloves * 1/2 teaspoon Fresh ginger * 1 tablespoon Olive oil * 2  eggs * 1/2 cup Frozen Peas * 1 1/2 tablespoon Teriyaki sauce * 2 1/2 tablespoon Soy sauce * 3/4 teaspoon Sesame Oil * 		774349	13	f	f	t	f
30	Southwestern Rice	http://www.bigoven.com/recipe/southwestern-rice/174808	In a  3 quart saucepan, heat up the oil on medium heat.  Once hot, add the onions and cumin and stir until onions have softened.  Add the tomatoes and chiles, continuously stirring until the liquid begins to evaporate.  Stir in the rice and mix well so that all rice is covered with the tomato, pepper & onions mixture.  Continue stirring for about 2 minutes.Add chicken broth and turn heat to high.  Once it comes to a boil, cover pan and bring down heat to a low simmer.  Cook on low for 17-20 minutes or until fluffy.	2015-04-07 18:51:47.170437	2015-04-08 23:24:19.707314	Rice	4.59999999999999964	http://redirect.bigoven.com/pics/rs/640/southwestern-rice-2.jpg	5	25	6 Servings	2 tablespoon Vegetable oil * 1 cup Onions * 1 teaspoon Ground cumin * 1 cup Canned tomatoes with chiles * 1 1/2 cups White rice * 3 1/2 cups Chicken broth * 	I love serving this Southwestern rice with mexican dishes. It is very flavorful !	174808	1	f	f	t	f
37	Broccoli and Cheddar Soup	http://www.bigoven.com/recipe/broccoli-and-cheddar-soup/162723	1.  Melt butter in large pot over medium heat.   Add onion and cook until soft, about 5 minutes.  Add garlic and cook until fragrant, about 1 minute.   Add broccoli stems and cook until bright green and just beginning to soften, about 5 minutes.  Stir in broth, increase heat until medium-high, and simmer until stems are tender, about 5 minutes.  Add florets, cream, and nutmeg and simmer until florets are tender, about 5 minutes.2.  Puree soup in 2 batches in blender until smooth, return to pot, and bring to simmer over medium heat.  Stir in cheddar until and season with salt and cayenne pepper.  Serve, garnished with extra cheese.(Soup can be refrigerated for up to 3 days.  Reheat over medium heat until hot, but do not boil or cheese will seperate.)	2015-04-07 18:51:56.612914	2015-04-08 23:24:19.741023	Broccoli	4.31578947368420973	http://redirect.bigoven.com/pics/rs/640/broccoliandcheddarsoup.jpg	20	70	6 Servings	3 tablespoons Unsalted butter * 1 large Onion * 2 cloves Garlic * 1 1/2 pound Broccoli * 4 cups Chicken broth * 1 cup Heavy cream * 1/4 teaspoon Ground nutmeg * 3 cups Mild cheddar cheese *   Salt & Cayenne pepper * 	This is a great soup	162723	3	f	t	f	f
41	Lamb and Cayenne Kefta	http://www.bigoven.com/recipe/lamb-and-cayenne-kefta/104740	Keftas, from North Africa, are meatballs prepared with ground lamb or beef  and a number of herbs and spices. They appear in a variety of dishes, such  as stews, and also as brochettes hot off the charcoal grill. The seasonings  range from chili to cinnamon and usually include a Moroccan favorite, fresh  mint. These keftas are delicious served with pita bread, low-fat yogurt,  tomatoes and lettuce or with cooked rice. Note: If using wooden skewers,  soak them in water for 20 minutes.    Combine all ingredients, cover and refrigerate for 1 hour or up to 24  hours. Shape into 30 1 1/2-inch meatballs and thread them on six skewers.  (You may slightly flatten them to make sausage shapes or leave them as  balls.)    Prepare a gas grill or charcoal fire. Grill for 3 minutes on each side, or  just until no longer pink inside. Alternatively, broil the meatballs for 2  minutes on each side.    176 CALORIES PER SERVING: 15 G PROTEIN, 12 G FAT, 3 G CARBOHYDRATE; 227 MG  SODIUM; 0 MG CHOLESTEROL.    Adapted from The Whole Chile Pepper Book by Dave De Witt and Nancy Gerlach.  Copyright 1990 by Dave DeWitt and Nancy Gerlach. Reprinted by permission of  Little, Brown and Company (Inc).    Posted by Stephen Ceideburg    	2015-04-07 18:52:04.138378	2015-04-08 23:24:19.7575	Lamb	4.33333333333333037	http://redirect.bigoven.com/pics/rs/640/lamb-and-cayenne-kefta-2.jpg	3	\N	6 Servings	1/2 ts Ground cumin *   rice *   Tomatoes * 1/2 ts Ground cinnamon *   Stephen Ceideburg * 1 lb Lean ground lamb * 1 ts Ground ginger *   Pita bread * 1/2 ts Ground nutmeg * 1/2 ts Salt * 1/4 ts Black Pepper * 1 ts Ground cloves * 1 md Onion * 1 ts Ground allspice *   Lettuce * 2 tb fresh mint * 1 ts Ground cayenne pepper * 1 ts Ground cardamom *   Low-fat yogurt * 		104740	3	t	f	f	f
66	Sweet, Sticky and Spicy Chicken	http://www.bigoven.com/recipe/sweet-sticky-and-spicy-chicken/165211	   1. Mix together brown sugar, honey, soy sauce, ginger, garlic and hot sauce in a small sauce pan simmer while cooking chicken. This should help thicken it for sticking to the chicken stirps.   2. Combine flour, salt and pepper in bag and coat the chicken strips.   3. Heat oil in a large skillet over medium-high heat. Add chicken strips and brown on both sides, about 1 minute per side. Pour the sauce over the chicken. Simmer uncovered until the sauce thickens, 8 to 10 minutes.	2015-04-07 18:52:53.472536	2015-04-08 23:24:19.864422	Chicken	4.35652173913042962	http://redirect.bigoven.com/pics/sweet-sticky-and-spicy-chicken-38.jpg	232	25	4 Servings	2 tablespoon Brown sugar * 4 tablespoon Honey * 1/2 cup Soy sauce * 2 tsp Fresh ginger * 2 tsp Garlic * 1 tablespoon Hot sauce *   salt and pepper *   All purpose flour * 4  Skinless chicken breasts * 1 tablespoon Vegetable oil * 	Flavor like a PF Chang's chicken.\r	165211	3	f	t	f	f
43	Herbed Lamb Chops	http://www.bigoven.com/recipe/herbed-lamb-chops/171251	Preheat oven to 400. Heat an oven safe grill pan over medium high heat.Lightly spray lamb chops with cooking spray, then season with salt and pepper, fresh herbs and minced garlic. Drizzle with lemon juice.Spray grill pan with cooking spray. Lay chops seasoned side down on grill pan. Immediately spray and season other side of chops. Grill for approximately 4 minutes.Flip chops and sear briefly, then put entire pan into the oven for approximately 5 minutes for medium rare or to desired doneness.Allow to rest for 5 minutes before serving. 	2015-04-07 18:52:04.799545	2015-04-08 23:24:19.768397	lamb	5	http://redirect.bigoven.com/pics/rs/640/herbed-lamb-chops-4.jpg	17	30	4 Servings	 32  ounces lamb loin chops *  2  cloves garlic  *  1  tablespoon fresh rosemary *  1  tablespoon fresh thyme *   Salt and pepper *   Olive oil cooking spray *  1  medium Lemon * 	Quick enough for a week night meal, delicious enough for guests.	171251	3	f	t	f	f
45	Roast Lamb with Pomegranates	http://www.bigoven.com/recipe/roast-lamb-with-pomegranates/567762	1. Combine the pomegranate juice, olive oil, garlic, Moroccan spice, coriander and seasoning. mix well.2. Put lamb into plastic bag and pour in the pomegranate mixture.3. Massage the mixture into the lamb and leave to marinate for 1 to 2 hours or more.4. Turn lamb into a roasting pan and roast at 190 deg C for 40 to 50 minutes or until done to your liking.5. Keep checking to ensure the pan juices do not catch and burn - if necessary add water.6. When the meat is done to your liking, remove and leave to rest for 10 minutes before carving.7. Serve with pan juices.Moroccan Spice Rub:2 Tbs. sweet paprika1 Tsp. brown sugar1 Tsp. kosher salt½ Tsp. freshly ground black pepper½ Tsp. ground ginger½ Tsp. ground cardamom½ Tsp. ground cumin½ Tsp. ground cloves½ Tsp. ground cinnamon¼ Tsp. ground all spice¼ Tsp. cayenneMix the ingredients.	2015-04-07 18:52:05.603152	2015-04-08 23:24:19.778065	Deboned leg of lamb	5	http://redirect.bigoven.com/pics/rs/640/roast-lamb-with-pomegranates-2.jpg	2	120	6 Servings	2 kgs Leg of lamb * 200 ml Pomegranate juice * 100 ml Olive oil * 2   cloves Garlic * 30  ml Moroccan spice rub * 80 ml Fresh coriander (cilantro) * 5  ml Salt *   Moroccan spice rub: * 2 tbs Sweet paprika * 1 tsp Brown sugar * 1 tsp Kosher salt * 1/2 tsp Freshly ground black pepper * 1/2 tsp Ground ginger * 1/2 tsp Ground cardamom * 1/2 tsp Ground cumin * 1/2 tsp Ground cloves * 1/2 tsp Ground cinnamon * 1/4 tsp Ground allspice * 1/4 tsp Cayenne * 	Roast Lamb	567762	9	f	t	f	f
50	Asian Potato Salad	http://www.bigoven.com/recipe/asian-potato-salad/1117253	1. Combine all ingredients listed under potatoes in a heavy-bottomed pot and bring to a gentle simmer. Once it reaches a simmer, turn down the heat until there are just very small bubbles in the pot and cook until the potatoes are tender. Cool the potatoes in their cooking liquid in a shallow pan. Once cool, cut the potatoes in half lengthwise.  The cooking liquid can be used again for the same purpose and so should be reserved.2. For the dressing: Create an Asian flavor base from miso, vinegar, mirin, and sesame oil and add this to your vinaigrette. Taste the dressing and adjust the seasoning as needed3. Mix the potatoes with the carrots and snap peas, and dress with the Asian vinaigrette. Season to taste and garnish with your favorite Asian garnishes as listed in the ingredientsPickled Mustard Seeds1. In a small heavy sauce pan cover the mustard seeds with water and bring to a boil.  Drain the water and rinse the mustard seeds. Repeat the blanching a second time.2. Drain the water, rinse the mustard seeds and add the vinegar, sugar, salt, soy sauce, and spices in a small heavy saucepan with the blanched mustard seeds and bring to a gentle simmer over low heat. Cook, stirring often, until the mustard seeds are plump and tender, about 15 to 20 minutes. The liquid will be nearly absorbed, but the seeds will remain moist in very little thick viscous broth. Cool the seeds in their liquid and refrigerate in a covered container. It will keep for months.	2015-04-07 18:52:31.980385	2015-04-08 23:24:19.793972	Potatoes	0	http://redirect.bigoven.com/pics/rs/640/asian-potato-salad-7.jpg	0	85	8 Servings	  Potato Salad * 1/2 gallon Water * 1 ounce Salt * 1/2 cup Miso * 1/2 cup Mirin * 1/2 cup Soy * 1/2 cup Rice vinegar * 2 pounds Multi-colored fingerling potatoes * 2 cups Snap peas * 1 1/2 cups Carrot * 3 each Scallions * 3 tablespoons Cilantro *   Dressing * 1/2 cup Vinaigrette * 1 tablespoon Miso * 1 tablespoon Rice wine vinegar * 1 tablespoon Soy sauce * 1 tablespoon Mirin * 1 tablespoon Sesame oil *   Wasabi Peas *   Togarashi *   Black sesame seeds *   Pickled mustard seeds (recipe below) *   Pickled Mustard Seas * 1 cup Yellow mustard seeds *   Water * 1/2 cup Mirin * 1 1/2 cups Rice wine vinegar * 1/2 cup Sugar * 1 tablespoon Salt * 2 tablespoons Soy * 1/2 teaspoon Pickling spice * 1 pinch Tumeric * 3 points Star anise * 	Recipe by Chef Bill Briw.\r\rRecipe created by The Culinary Institute of America as an industry service to the U.S. Potato Board. Photography courtesy of Kristen Loken.	1117253	13	t	f	t	f
55	German Potato Salad	http://www.bigoven.com/recipe/german-potato-salad/171792	Place the potatoes in a medium-size pot and cover them with enough water to extend 2 inches above the surface of the potatoes. Salt the water and bring to boil over medium-high heat. Continue cooking until potatoes are tender when pierced with a fork, about 15 to 20 minutes. Drain and dice into 1/2-inch pieces.Set aside in a warm place.Cook the bacon in a large skillet over medium-high heat. Once crisp, place on a paper towel-lined plate Pour off the rendered fat, reserving 1/4 cup in the pan. Turn the heat to medium and add the onion. Cook until translucent about 4 to 5 minutes. Whisk in the vinegar, sugar, mustard, and salt and stir until thick and bubbly. Add the diced, cooked potatoes and toss to coat.Top with crumbled Chavrie® Goat Log, bacon and garnish with the chives.Serve warm. 	2015-04-07 18:52:33.634562	2015-04-08 23:24:19.814903	Potato	3	http://redirect.bigoven.com/pics/rs/640/german-potato-salad-2.jpg	2	75	4 Servings	 2  lbs Yukon gold potatoes  *  3/4  c Onion *  1/3  c Apple cider vinegar  *  1/4  c Sugar *  1  tbsp Dijon mustard  *  1  tsp Salt  * 2 4-oz Chavrie® Goat Log  * 	This is a classic German Potato Salad with a great new twist, fresh Goat Cheese! Great for Summer Grilling and Memorial Day!	171792	22	t	f	t	f
58	Pasta Salad with Grilled Vegetables, Parsley and Feta	http://www.bigoven.com/recipe/pasta-salad-with-grilled-vegetables-parsley-and-feta/573606	Instructions are at http://www.foodandwine.com/recipes/august-2007-pasta-salad-with-grilled-vegetables-parsley-and-feta	2015-04-07 18:52:34.7216	2015-04-08 23:24:19.825733	\N	0	http://redirect.bigoven.com/pics/rs/640/pasta-salad-with-grilled-vegetables-2.jpg	0	25	8 SIDE DISH SERVINGS	3/4 pound orecchiette * 1/2 pound thin asparagus * 1 medium zucchini sliced lengthwise 1/4 inch thick * 1/2 small eggplant sliced lengthwise 1/2 inch thick * 7 tablespoons extra-virgin olive oil *   Kosher salt and freshly ground pepper * 2 1/2 tablespoons fresh lemon juice * 1 small shallot finely * 4 ounces French feta cheese (3/4 cup) * 1 cup parsley leaves * 1/3 cup pitted kalamata olives * 	Plus: Pasta Recipes and Tips More Pasta Salad Recipes	573606	9	f	t	t	f
60	Chicken Satay	http://www.bigoven.com/recipe/chicken-satay/158299	1. Place the chicken in a shallow, non-metallic dish.2. Mix together the garlic, soy sauce, chilli flakes, peanut butter, tomato puree and pineapple juice. Pour the mixture over the chicken and toss well to coat all the pieces. Cover and leave to marinate for 30 minutes.3. Thread the chicken pieces on to wooden skewers. Place them under a hot grill for 15 minutes, turning frequently. until evenly browned and cooked through.tip: Soak the wooden skewers in water for 20 minutes before using, to prevent them from burning.	2015-04-07 18:52:51.417662	2015-04-08 23:24:19.833812	Chicken	4.25581395348836988	http://redirect.bigoven.com/pics/chicken-satay-24.jpg	45	10	4 Servings	3/4 pound skinless chicken breast * 1 clove Garlic * 2 tablespoon Dark soy sauce * 1 teaspoon Dried chile flakes * 2 tablespoon Peanut butter * 1 tablespoon Tomato puree * 100 mililiter Pineapple juice * 	These are delicious eaten hot or cold, and are ideal for packed lunches or picnics.	158299	23	t	f	f	f
110	Side car	http://www.bigoven.com/recipe/side-car/495615	Mix well over ice shake if possible.  Sugar the glass rim.	2015-04-09 13:35:03.891983	2015-04-09 13:35:03.891983	Cognac	0	http://redirect.bigoven.com/pics/rs/640/side-car.jpg	0	5	2 Serving			495615	3	f	f	f	f
76	Dessert: Raspberry Amaretto Tarts	http://www.bigoven.com/recipe/dessert-raspberry-amaretto-tarts/163939	Preheat oven to 350For crust, combine crumbs, butter, 1 teaspoon sugar, tossing with fork until moist.  Divide mixture evenly between 2 creme brulee dishes coated with cooking spray.  Press mixture to bottom of dishes.  Bake at 350 for 10 min or until lightly browned, cool completely on wire rack.For filling, combine 1/4 c milk, 3 T sugar, cornstarch, salt, egg yolk in a medium bowl, stirring with a whisk.  Heat 3/4 c milk over med heat in a small heavy saucepan to 180 degrees or until tiny bubbles form around edge (don't boil).  Gradually add hot milk to sugar mixture, stirring constantly with a whisk.  PLace mixture in pan, cook over med heat until thick and bubbly about 5 min, stirring constantly.Remove pan from heat, stir in liqueur and vanilla.  Spoon custard into small bowl, place bowl inside medium ice-filled bowl for 10 min or until custard comes to room temp, stirring occasionally.  Remove bowl from ice, spoon custard into prepared crusts.  Cover and chilll 2-6 hours.  Serve with raspberries on top of tarts, along with Bonny Doon dessert wine.	2015-04-07 18:53:01.665286	2015-04-08 23:24:19.910032	Custard	4.33333333333333037	http://redirect.bigoven.com/pics/rs/640/dessert-rasberry-amaretto-tarts.jpg	3	180	4 Servings	1/4 cup Vanilla wafer * 1 1/2 teaspoon Butter * 1 teaspoon Sugar * 1 cup Milk * 3 tablespoon Sugar * 5 teaspoon Cornstarch * 1/8 teaspoon Salt * 1  Egg yolk * 2 teaspoon Amaretto * 1/4 teaspoon Vanilla * 1/2 cup Raspberries *   Fresh mint * 	best dessert	163939	3	f	f	f	t
83	Seafood Risotto	http://www.bigoven.com/recipe/seafood-risotto/663029	SEAFOOD MIXTURE:1. Heat butter until foaming, add garlic and mushrooms.2. For 2 minutes add shrimp and scallops.3. Stir and cook for 2 minutes more.4. Add cream and simmer for 5 minutes, until thickens.5. Add parsley and set aside.RICE MIXTURE:6. Heat oil. Add onions, saute until soft.7. Add rice and stir until all grains are coated.8. Add broth 1/2 cup at a time, reserving 1/2 cup, stirring often.9. After about 20 minutes, when broth is almost absorbed, add final 1/2 cup.10. When rice is tender but firm, add seafood mixture and stir to combine with rice.Serve immediately!	2015-04-07 18:53:42.988487	2015-04-08 23:24:19.93268	Vialone Nano Rice	0	http://redirect.bigoven.com/pics/rs/640/seafood-risotto-9.jpg	0	0	2 Servings	2 TBS Butter * 1 clove Garlic * 5 oz Mushrooms * 1/2 lb Scallops * 1/2 lb med Shrimp * 1/2 cup Light cream * 1 TBS Fresh parsley * 4 cups Fish broth * 2 TBS Olive oil * 1/2 cup Onions * 1 cup Vialone Nano rice * 	~Riseria Campanini, off Vialone Nano rice package	663029	2	f	t	f	f
86	Butternut Squash Risotto	http://www.bigoven.com/recipe/butternut-squash-risotto/175929	Preheat the oven to 400 degrees F.Peel the butternut squash, remove the seeds, and cut it into 3/4-inch cubes. You should have about 6 cups. Place the squash on a sheet pan and toss it with the olive oil, 1 teaspoon salt (optional), and 1/2 teaspoon pepper. Roast for 25 to 30 minutes, tossing once, until very tender. Set aside.Meanwhile, heat the chicken stock in a small covered saucepan. Leave it on low heat to simmer.In a heavy-bottomed pot or Dutch oven, melt the butter and saute the pancetta and shallots on medium-low heat for 10 minutes, until the shallots are translucent but not browned. Add the rice and stir to coat the grains with butter. Add the wine and cook for 2 minutes. Add 2 full ladles of stock to the rice plus the saffron and 1/2 teaspoon pepper. Stir, and simmer until the stock is absorbed, 5 to 10 minutes. Continue to add the stock, 2 ladles at a time, stirring every few minutes. Each time, cook until the mixture seems a little dry, then add more stock. Continue until the rice is cooked through, but still al dente, about 30 minutes total. Off the heat, add the roasted squash cubes and Parmesan. Mix well and serve. 	2015-04-07 18:53:43.95841	2015-04-08 23:24:19.945325	Risotto	4.79999999999999982	http://redirect.bigoven.com/pics/rs/640/butternut-squash-risotto-3.jpg	15	50	6 Servings	 1   butternut squash *  2  tablespoons olive oil *   Kosher salt and  black pepper, *  6  cups chicken stock *  6  tablespoons unsalted butter *  2  ounces pancetta, * 1/2 cup shallots, *  1-1/2 cups Arborio rice * 1/2 cup dry white wine *  1  teaspoon saffron threads *  1  cup Parmesan cheese * 	Butternut Squash Risotto	175929	2	f	f	t	f
93	Cheese Bread	http://www.bigoven.com/recipe/cheese-bread/56424	In a small mixing bowl combine Parmesan cheese and mayonnaise. Stir in snipped chives or parsley, if desired. Set aside. Slice french bread  lengthwise or into slices. If using sliced bread, place bread on the rack  of broiler pan. Broil 3 to 4 inches from heat about 1 minute or till  toasted.  Turn bread over. Spread some of the cheese-mayonnaise mixture on the untoasted/cut side of the bread. Broil, 3 to 4 inches from heat for 2 to 3 minutes or till light brown.    	2015-04-07 18:54:05.316396	2015-04-08 23:24:19.96902	Grains	0	http://redirect.bigoven.com/pics/rs/640/cheese-bread-5.jpg	0	0	4 Servings	1/2 c Grated Parmesan cheese * 1/3 c Mayonnaise  *   French bread * 2 tablespoons Fresh chives or parsley (optional) * 		56424	3	t	f	f	f
99	Grilled Zucchini	http://www.bigoven.com/recipe/grilled-zucchini/140043	Prepare barbecue (medium-high heat) or preheat broiler. Brush zucchini with olive oil. Sprinkle both sides of zucchini with oregano, garlic and  rosemary. Season zucchini slices generously with salt and pepper. Grill or broil until zucchini is tender, about 4 minutes per side.    Serves 4.    Bon Appetit April 1993          	2015-04-09 13:31:24.499792	2015-04-09 13:31:24.499792	Zucchini	4	http://redirect.bigoven.com/pics/rs/640/grilled-zucchini-7.jpg	1	0	1 Serving	3 lg Zucchini * 3 tb olive oil * 2 tb fresh oregano * 2  Garlic * 1 ts fresh rosemary * 		140043	3	f	f	f	f
102	Chicken Breasts with Grilled Pineapple and Tomatillo Salsa	http://www.bigoven.com/recipe/chicken-breasts-with-grilled-pineapple-and-tomatillo-salsa/561575	Instructions are at http://www.wholefoodsmarket.com/recipe/chicken-breasts-grilled-pineapple-and-tomatillo-salsa	2015-04-09 13:31:26.00188	2015-04-09 13:46:02.647086	Chicken Breast	4.5	http://redirect.bigoven.com/pics/rs/640/chicken-breasts-with-grilled-pineap-2.jpg	2	25	4 Servings	2 tablespoons canola oil * 1/2 large sweet white onion * 6  pineapple slices *   Salt and pepper * 1 1/2 cup tomatillo salsa * 2 tablespoons chopped cilantro * 1 tablespoon lime juice * 4 skinless, boneless chicken breast halves * 	Whole Foods recipe. This grilled chicken is on the healthy side and full of flavor.	561575	27	f	t	f	f
103	Salmon Tortilla Appetizers	http://www.bigoven.com/recipe/salmon-tortilla-appetizers/47811	Drain salmon and remove any bones. In a small bowl combine salmon, cream  cheese, salsa, parsley and cilantro. Add cumin if desired. Spread about 2  tablespoons mixture over each tortilla. Roll each tortilla up tightly and  wrap individually with plastic wrap. Refrigerate 2-3 hours; slice each  tortilla into bite-size pieces.    Yield: About 48 appetizers.    Recipe By     : Jo Anne Merrill    From:                                 Date: 05/28    File ftp://ftp.idiscover.co.uk/pub/food/mealmaster/recipes/mmdja006.zip	2015-04-09 13:32:10.009048	2015-04-09 13:46:02.651912	Fish	5	http://redirect.bigoven.com/pics/salmon-tortilla-appetizers.jpg	3	\N	48 Servings	8 oz Cream cheese * 1 ts Cilantro * 15 oz Salmon, canned * 1/4 ts Ground cumin * 2 tb Fresh parsley * 4 tb Salsa * 8  Flour tortillas * 		47811	3	t	f	f	f
105	Appetizer - Pastry Wrapped Brie	http://www.bigoven.com/recipe/appetizer-pastry-wrapped-brie/179442	Heat the oven to 400F. Beat the egg and water in a small bowl with a fork or whisk.Unfold a single pastry sheet on a lightly floured surface.  Let thaw for 45 minutes.Optional: Sprinkle the almonds and parsley on top of the sheet. Optional: Spread raspberry jam on the sheet to about 2" to the edge.  Spinkle with dried cranberries and almonds.Optional: Spread the sheet with mixed dried cherries, toasted pecans, ? cup honey and ?tsp rosemary.Place the cheese in the center of the sheet.  Fold the pastry up over the cheese to cover. Trim the excess pastry and press to seal. Brush the seam with the egg mixture. Place seam-side down onto the baking sheet. Decorate the top with pastry scraps, if desired (example:  Make a bow). Brush with the egg mixture.Bake for 25 minutes or until the pastry is golden brown. Let stand for 20 minutes. Serve with the crackers.	2015-04-09 13:32:11.04137	2015-04-09 13:46:02.662142	Cheese	4	http://redirect.bigoven.com/pics/rs/640/appetizer-pastry-wrapped-brie.jpg	1	0	4 Servings	8 ounce Brie * 1 ea Egg * 1 ea Puff Pastry Sheet * 1 box Crackers * 		179442	3	t	f	f	f
106	Bacon and Date Appetizer	http://www.bigoven.com/recipe/bacon-and-date-appetizer/571980	Instructions are at http://allrecipes.com/Recipe/Bacon-and-Date-Appetizer/Detail.aspx?event8=1	2015-04-09 13:32:11.326013	2015-04-09 13:46:02.666727	Bacon	3.5	http://redirect.bigoven.com/pics/rs/640/bacon-and-date-appetizer-6.jpg	4	15	6 servings	1 (8 ounce) package pitted dates * 4 ounces almonds * 1 pound sliced bacon * 	Recipe from Allrecipes. One of the easiest appetizers you could make!	571980	3	t	f	f	f
107	Appetizer - Chex Party Mix	http://www.bigoven.com/recipe/appetizer-chex-party-mix/179434	Melt butter and add in spices.  Mix and coat the cereal, nuts, chips and sticks with the butter and it's coated well.Spread on several baking sheets and bake 250F for 1 hour.  Stir every 15 min.  Cool on a paper towel and store in a ziplock.	2015-04-09 13:32:11.628608	2015-04-09 13:46:02.671307	Cereal	5	http://redirect.bigoven.com/pics/rs/640/appetizer-chex-party-mix.jpg	1	0	4 Servings	1 box Chex Cereal * 1 box Chex Cereal * 1 box Chex Cereal * 1 bottle Peanuts * 1 bag Bagel Chips * 1 bag Sesame Sticks * 1 stick Butter * 3 tablespoon Worcestershire Sauce * 2 tablespoon Garlic Salt * 	My Grandmothers Recipe!	179434	3	t	f	f	f
108	Appetizer - Cheese Fondue	http://www.bigoven.com/recipe/appetizer-cheese-fondue/179432	Make sure the bread cubes are large.On the stove, heat all ingredients except bread until thickened.  Transfer to a heated fondue pot.  Dip the bread in it!	2015-04-09 13:32:12.228278	2015-04-09 13:46:02.676968	Cheese	5	http://redirect.bigoven.com/pics/appetizer-cheese-fondue-2.jpg	1	0	4 Servings	1 loaf Sourdough bread * 1 cup Chicken broth * 2 cup Cracker Barrel Cheese * 2 tablespoon Dijon mustard * 2 tablespoon Cornstarch * 1/4 can (12 oz) Beer * 	Classy.	179432	24	t	f	f	f
104	Appetizer Roll-Ups	http://www.bigoven.com/recipe/appetizer-roll-ups/19808	1. In a bowl, combine the cream cheese, carrot, zucchini, dill and pepper.  Spread about 2 tablespoonfuls on each slice of ham and turkey. Roll up  tightly; wrap in plastic wrap. Refrigerate overnight. Slice into 1 1/2 inch  pieces. Yield: 3 to 4 dozen.  Posted to recipelu-digest by "Diane Geary" <diane@keyway.net> on Feb 15,  1998	2015-04-09 13:32:10.345193	2015-04-09 13:51:37.876146		4.59999999999999964	http://redirect.bigoven.com/pics/rs/640/appetizer-roll-ups-2.jpg	6	\N	1 Serving	1/2 c Zucchini * 2 ts Dill weed * 1/2 lb cooked turkey * 1/2 ts Pepper * 1/2 lb fully cooked ham * 12 oz Cream cheese * 1/2 c Carrot * 		19808	3	t	t	f	f
113	Sides - Brown Rice	http://www.bigoven.com/recipe/sides-brown-rice/186000	Brown riceBoil rice in cold chicken stockAdd sone hot pepper (like a diced portuguese)Set the heat to maximum, and bring the rice/water to a boil uncovered.Cover and simmer 20 minutes.Let the rice sit in the covered pot for 15 minutes or longer. Add sautéed chicken, bean and whateverPlace in pie-hole and enjoy	2015-04-09 13:35:08.848071	2015-04-09 13:35:08.848071	Rice	0	http://redirect.bigoven.com/pics/rs/640/sides-brown-rice.jpg	0	0	4 Servings	1.5  cups brown rice * 1.5 cups chicken stock * 	How to cook brown rice	186000	13	f	f	f	f
115	TasteMag: Tandoori Lamb Burger	http://www.bigoven.com/recipe/tastemag-tandoori-lamb-burger/227344	Preheat eth oven to 180?C. Combine the lamb, onion, tandoor spice, coriander and cumin in a bowl and mix well. Divide the mixture into 4 large meatballs. Flatten the meatballs and shape into patties. Refrigerate for 10 minutes. Heat the olive oil in a pan over a medium heat and fry the patties for 3 minutes on each side. Toast the buns in the oven.Serve with chopped mango, mango atchar and sweet chilli sauce in a burger bun, with the asian greens on the side.	2015-04-09 13:37:11.133658	2015-04-09 13:46:02.699363	Lamb	4	http://redirect.bigoven.com/pics/rs/640/tastemag-tandoori-lamb-burger.jpg	0	35	4 Servings	600 g Lamb Mince * 1  Red Onion * 60 g Tandoori spice * 30 ml Coriander * 100 ml Olive oil * 4  Burger Rolls * 250 ml Asian greens * 100 ml Mango Atchar * 1  Mango * 60 ml Sweet chilli sauce *   Salt * 	Spicy burgers.	227344	28	f	t	f	f
117	Grilled Pork Chops	http://www.bigoven.com/recipe/grilled-pork-chops/186127	Boil 1/2 water with seasonings.  After boiling, add remaining 1/2 of cool water.  Allow brine to come to room temp.  Soak chops for 10-30 mins.  Remove from brine and pat dry.Season chops w/ pepper and garlic and place on hot grill.  Cook for 3 mins, and turn down heat.  Cook for another 5-8 mins, flip once and complete.  Sprinkle rosemary during last flip, if desired.	2015-04-09 13:37:53.084345	2015-04-09 13:46:02.709016	Pork	4.71428571428570997	http://redirect.bigoven.com/pics/rs/640/grilled-pork-chops-7.jpg	7	0	4 Servings	  Brine * 1 quart water * 1/2 cup sugar * 1/2 cup salt * 1 sprinkle red pepper flakes *   Pork * 4  pork chops *   pepper, for seasoning *   garlic (powder), for seasoning * 	The easiest, best-tasting pork chops! Brine, grill and enjoy!	186127	3	f	t	f	f
118	Grilled Salmon	http://www.bigoven.com/recipe/grilled-salmon/94394	Place salmon in a shallow dish. Combine remaining ingredients and mix well.  Set aside 1/4 cup for basting; pour the rest over the salmon. Cover and refrigerate for 30 minutes. Drain, discarding marinade. Grill salmon over  medium coals, skin side down, for 15-20 minutes or until fish flakes easily  with a fork. Baste occasionally with reserved marinade.    	2015-04-09 13:37:53.688832	2015-04-09 13:46:02.713809	Fish	3.57142857142856984	http://redirect.bigoven.com/pics/rs/640/grilled-salmon-2.jpg	7	0	4 Servings	2  Salmon filets * 1/2 cup Vegetable oil * 1/2 cup Lemon juice * 4  Green onion * 3 tablespoon Fresh parsley * 1 1/2 teaspoons Fresh rosemary * 1/2 teaspoon Salt * 1/8 teaspoon Pepper * 	Very few dishes are as simple, delicious and elegant as grilled salmon. Do not overcook it, however! Remember that all meat continues to cook even when removed from a heat source.	94394	3	f	t	f	f
111	Side Dish - Baked Apples	http://www.bigoven.com/recipe/side-dish-baked-apples/226463	In a large bowl, mix together berries, sugar, pecans, cinnamon and nutmeg. Put aside.With a melon scooper, core apples to hollow out the middle. Do not go all the way through. Fill each apple core with dry berry mixture.Pour apple cider into casserole dish and place apples right side up. Place a pat of butter on apple hole filled with mixture. Drizzle maple syrup on top of all the apples. Bake for 50 minutes.	2015-04-09 13:35:04.380672	2015-04-09 13:51:37.891825	Apples	4	http://redirect.bigoven.com/pics/rs/640/side-dish-baked-apples.jpg	2	0	4 Servings	6 ea Apple * 1/4 cup Cranberries * 1/4 cup Brown sugar * 1/4 cup Pecan * 1/4 teaspoon Cinnamon * 1/8 teaspoon Nutmeg * 1/2 cup Apple cider * 3 tablespoon Butter * 1/2 cup Maple Syrup * 	The Neelys recipe.	226463	3	f	f	t	f
112	Side Dish - Stuffing For Thanksgiving	http://www.bigoven.com/recipe/side-dish-stuffing-for-thanksgiving/179557	Mix broth, cranberries, celery and onion in a large saucepan on high until boiling.  Turn down and simmer 5 minutes.  Add  the browned sausage and sauted mushrooms.  Cook 5 more minutes.Once it's back to a boil, remove from the heat and add the stuffing.  Cover and let sit 5-10 minutes.	2015-04-09 13:35:05.266502	2015-04-09 13:51:37.896527	Stuffing	5	http://redirect.bigoven.com/pics/rs/640/side-dish-stuffing-for-thanksgiving.jpg	1	0	4 Servings	1 package Stuffing * 1 can (12 oz) Chicken broth * 1 stalk Celery * 1/2 cup Cranberries * 1 ea Onion * 1/2 cup Mushroom * 1/2 cup Sausage * 	My twist!	179557	3	f	f	t	f
122	Grilled Asparagus with Gorgonzola Butter	http://www.bigoven.com/recipe/grilled-asparagus-with-gorgonzola-butter/167010	Stir Gorgonzola cheese, butter and lemon juice in medium bowl to blend.  Season to taste with salt and pepper. Cover and refrigerate.  (Gorgonzola butter can be prepared 2 days ahead. Keep refrigerated.)  Prepare barbecue (high heat). Whisk oil, basil and garlic to blend in small bowl. Spread out asparagus in single layer in baking dish. Pour oil mixture over asparagus and turn to coat. Sprinkle with salt and pepper. Transfer asparagus to barbecue. Grill until charred on all sides, turning occasionally, about 4 minutes. Transfer to plates. Top asparagus with some Gorgonzola butter and serve.	2015-04-09 13:37:55.388902	2015-04-09 13:37:55.388902	Asparagus	5	http://redirect.bigoven.com/pics/rs/640/grilled-asparagus-with-gorgonzola-b-2.jpg	1	0	6 Servings	3/4 cup Gorgonzola Cheese * 6 tablespoon Butter * 1 teaspoon Fresh Lemon Juice * 2 tablespoon olive oil * 1 tablespoon Fresh Basil * 3 cloves Garlic * 2 pounds Asparagus * 	Bon Appetit September 2000\r	167010	3	f	f	f	f
123	Grilled Sirloin Steak with Mushroom-Wine Sauce	http://www.bigoven.com/recipe/grilled-sirloin-steak-with-mushroom-wine-sauce/740	To prepare wine sauce, saute mushrooms, garlic and onion in melted butter or margarine in saucepan until mushrooms are tender. Add flour, stirring until blended; cook over medium heat for 1 minute, stirring constantly. Blend in tomato paste, salt and pepper; stir in wine and stock until  well-blended. Simmer 20 minutes, stirring occasionally. Adjust seasoning  if necessary.    Sprinkle steaks with lemon pepper. Grill steaks over moderately hot coals  for 5 to 8 minutes per side for medium rare, or to a desired degree of doneness. Serve with mushroom-wine sauce. Serves 4. Typed in MMFormat by  cjhartlin@msn.com  Source:  Angus Beef Recipe Collection    Posted to MM-Recipes Digest  by "Cindy Hartlin" <cjhartlin@email.msn.com>  on Aug 18, 1998	2015-04-09 13:37:55.73711	2015-04-09 13:37:55.73711	Beef	4.20000000000000018	http://redirect.bigoven.com/pics/grilled-sirloin-steak-with-mushroom-3.jpg	5	0	4 Servings	4  center cut top sirloin * 1 1/2 ts Lemon pepper *   MUSHROOM-WINE SAUCE: * 8 oz Fresh mushrooms * 1 cl Garlic * 2 tb Onion * 2 tb Butter or margarine * 1 tb Flour * 1 1/2 tb Tomato paste * 1/4 ts Salt * 1/8 ts White pepper * 1/2 c Dry red wine * 1/4 c Beef stock * 		740	3	f	f	f	f
120	Tequila-Orange Grilled Shrimp	http://www.bigoven.com/recipe/tequila-orange-grilled-shrimp/162202	In a medium bowl, mix oil, half the jalapeno, half the garlic  and lime zest; season with salt and pepper.  Fold in shrimp.  Cover and refrigerate for 15 minutes up to 1 hour.In a shallow saucepan, comine remaining jalapeno and garlic, 1 teaspoon salt, pepper, orange juice, tequila and shallots; bring to a boil over medium-high heat.  Cook until mixture is thick and syrupy, 7 to 8 minutes.  Stir in butter; keep warm.Heat a gas grill on high or stove-top grill pan over high heat.  Grill shrimp, turning once, until just opaque, about 4 minutes.  Transfer to a serving platter; pour tequila sauce over shrimp.  Garnish with chives; serve immediately with lime wedges.	2015-04-09 13:37:54.758451	2015-04-09 13:46:02.722295	Shrimp	4.625	http://redirect.bigoven.com/pics/rs/640/tequila-orange-grilled-shrimp-2.jpg	16	90	4 Servings	1 pound shrimp * 3 tablespoons olive oil * 1  jalapeno pepper * 2 cloves garlic *   lime zest *   Coarse salt *   pepper * 1 cup Orange juice * 1/4 cup tequila * 1  shallot * 1 tablespoon Unsalted butter * 1 tablespoon chives * 	Serve with Lime-Cilantro Rice	162202	3	f	t	f	f
121	Grilled Pineapple	http://www.bigoven.com/recipe/grilled-pineapple/736	Cut pineapple crosswise into six 3/4-inch-thick slices. Stir together  butter, brown sugar and curry powder. Grill pineapple slices on an  uncovered grill directly over medium coals for 6 to 8 minutes or till  heated through, turning once and brushing once or twice with butter  mixture. Combine yogurt and coconut. To serve, cut pineapple slices in  half. Serve warm with yogurt. Yield: 6 servings. Per serving: 115 Calories;  3g Fat (22% calories from fat); 2g Protein; 23g Carbohydrate; 5mg  Cholesterol; 35mg Sodium    Recipe by: Russie Crombie    Posted to EAT-LF Digest by Betsy Burtis <ebburtis@ix.netcom.com> on Aug 23,  98, 	2015-04-09 13:37:55.059898	2015-04-09 13:46:02.727115	Pineapple	4.5	http://redirect.bigoven.com/pics/grilled-pineapple-6.jpg	6	\N	6 Servings	1 md Pineapple * 1 tb Butter * 1 tb Brown sugar * 1/8 ts Curry powder * 1/2 c Nonfat vanilla yogurt * 2 tb coconut * 		736	3	f	f	f	t
129	Easy Grilled Chicken Marinade	http://www.bigoven.com/recipe/easy-grilled-chicken-marinade/163421	Prepare marinade:In a non-reactive bowl, whisk egg and add in all other ingredients.  Add chicken.  Marinade in a ziploc bag for at least 4 hours; ideally 1-2 days.  Turn occasionally.Prepare medium-hot grill.  Let it warm up at least 15 minutes.  Place chicken on the grill.  After 3 minutes, pick it up and give it a quarter turn.  Sear another 3 minutes.  Flip over.  After 3 more minutes, give it another quarter-turn.  Grill until internal temperature reads 160 degrees F, about 10 minutes total depending upon thickness.  	2015-04-09 13:37:58.897651	2015-04-09 13:37:58.897651	Chicken	4.5454545454545503	http://redirect.bigoven.com/pics/rs/640/easy-grilled-chicken-marinade-7.jpg	24	240	4 Servings	 3  whole Eggs *  2  tablespoons White vinegar *  3  tablespoons Fresh parsley *  2  teaspoons Salt *  1  teaspoon Freshly ground pepper *  3  tablespoons Vegetable oil *  1  whole Yellow or white onion *  4  whole Chicken breasts * 	My family has enjoyed this grilled chicken marinade for more than two decades, which I think originally came from the Star Ledger of Newark NJ. \r\rThe recipe is simple -- dare I say foolproof? -- and delicious... And the smell coming off the grill has always been a sure sign of summertime. I like to pair this with fresh green beans, corn on the cob or couscous.	163421	3	f	f	f	f
126	Grilled Halibut with Lime-Chipotle Butter	http://www.bigoven.com/recipe/grilled-halibut-with-lime-chipotle-butter/188682	Spray the grill rack with nonstick spray. Prepare the grill. Combine the butter, lime zest, cilantro, chipotle pepper, and 1/8 teaspoon of the salt in a small bowl. Set aside. Drizzle the halibut fillets with the lime juice. Sprinkle evenly with the cumin, garlic powder, and remaining 1/8 teaspoon salt. Place the fillets, flesh-side down, on the grill and cook until the halibut is opaque in the center, 5-6 minutes on each side. Top each fillet evenly with the chipotle butter and serve at once. Yields 1 halibut steak and 2 teaspoons chipotle butter per serving. 	2015-04-09 13:37:56.765391	2015-04-09 13:46:02.748062	Halibut	4.33333333333333037	http://redirect.bigoven.com/pics/grilled-halibut-with-lime-chipotle--2.jpg	3	20	2 Servings	1 tablespoon unsalted butter * 1 teaspoon lime zest * 1 teaspoon cilantro * 1/4 teaspoon chili powder * 1/4 teaspoon table salt * 12 ounces halibut fillet * 2 teaspoons fresh lime juice * 1/2 teaspoon Cumin seeds * 1/4 teaspoon garlic powder * 	Chipotle peppers are dried, smoked jalapeno peppers. They impart both a pleasant smokiness to foods and a fair amount of spiciness or heat.	188682	3	f	t	f	f
127	Thai Grilled Steak with Basil Fried Rice (Message from BigOven)	http://www.bigoven.com/recipe/thai-grilled-steak-with-basil-fried-rice/188932	We hope you are enjoying this free experimental developer key at api.bigoven.com.  Production usage of the BigOven API requires a paid plan, which helps offset BigOven's considerable hosting costs.  This message will not appear on any paid plan; visit your developer console at http://api.bigoven.com to purchase an upgraded key. Thank you!	2015-04-09 13:37:57.367123	2015-04-09 13:46:02.753291	Beef	5	http://redirect.bigoven.com/pics/rs/640/thai-grilled-steak-with-basil-fried.jpg	6	0	1 Serving		This sauce is so good I think I could almost eat it as a soup! It has a velvety texture and the flavor seems to shift as you're tasting it. It is a little sweet, so I am glad that I added the heat to the steak, it worked out ideally. 	188932	23	f	t	f	f
128	Grilled Marinated Heart of Palm Tacos With Spicy Cabbage Slaw (vegan)	http://www.bigoven.com/recipe/grilled-marinated-heart-of-palm-tacos-with-spicy-cabbage-slaw-vegan/846750	Instructions are at http://www.seriouseats.com/recipes/2013/02/grilled-marinated-heart-of-palm-tacos-recipe.html?ref=search	2015-04-09 13:37:58.531973	2015-04-09 13:46:02.759468	Tortillas	0	http://redirect.bigoven.com/pics/rs/640/grilled-marinated-heart-of-palm-tac-4.jpg	0	30	6 Servings	2 teaspoons lime juice from 1 lime * 1 medium clove garlic * 1 teaspoon minced fresh thyme or oregano leaves * 1 tablespoon olive oil *   Kosher salt and freshly ground black pepper * 1 (15 ounce) can of hearts of palm * 1/2 teaspoon vegetable oil * 12 corn tortillas * 1 cup homemade or store-bought salsa verde *   Sliced white onion (for serving) *   Picked cilantro (for serving) * 2 cups Spicy Cabbage Slaw * 1 ripe avocado sliced or mashed (for serving * 		846750	1	f	t	f	f
130	Grilled Pears with Butterscotch Sauce	http://www.bigoven.com/recipe/grilled-pears-with-butterscotch-sauce/94251	Preheat the grill and the grill topper to medium heat. When ready to cook,  spray the rack--off the grill-- with nonstick cooking spray.    Peel the pears, halve them lengthwise, and core. With a sharp knife, cut a  very thin slice from the rounded side of each pear half so it will lie flat  on the grill topper. In a medium bowl, toss the pear halves with the lime  juice and granulated sugar.    Grill the pear halves on the grill topper for 4 minutes. Turn the pears  over, drizzle with any remaining lime juice mixture, and grill for 5  minutes or until tender.    Meanwhile, in small saucepan, combine the eveaporated milk, brown sugar, butter, and vanilla. Cook directly on the grill on the stovetop over medium  heat, stirring constantly, until the mixture comes to a gentle boil. Cook until the sauce is smooth and slightly thickened, about 2 minutes. Divide the pears among 4 plates, drizzle with the butterscotch sauce, and serve  hot or warm.    Recipe by: Unknown Cookbook Posted to MC-Recipe Digest V1 #683 by  L979@aol.com on Jul 21, 1997	2015-04-09 13:37:59.19052	2015-04-09 13:46:02.766901	Pears	0	http://redirect.bigoven.com/pics/grilled-pears-with-butterscotch-sau.jpg	0	0	4 Servings	4 lg Firm-ripe anjou or Bartlett * 3 tb Fresh lime juice * 2 tb Granulated sugar * 1/3 c Evaporated milk * 2 tb light brown sugar * 2 ts Unsalted butter * 1/2 ts Vanilla extract * 		94251	3	f	f	f	t
132	Lamb with Penne	http://www.bigoven.com/recipe/lamb-with-penne/235496	Cook the penne pasta according to package directions.While pasta is cooking, saute onion in the olive oil until it starts to soften, about five minutes. Add zucchini and saute for another five minutes. Add garlic, stirring quickly for 30 seconds.Crumble ground lamb into the vegetables, stirring between additions until all of the lamb has been added and has been cooked. Add chicken broth and tomatoes and heat through.Drain pasta. Combine with meat and vegetable mixture. Stir in parmesan and basil. Season to taste. Serve!	2015-04-09 13:38:19.875491	2015-04-09 13:46:02.776158	Lamb	4.5	http://redirect.bigoven.com/pics/rs/640/lamb-with-penne.jpg	2	30	6 Servings	16 ounce Penne pasta * 2 tablespoons Olive oil * 1 medium Onion * 1 pound Zucchini * 2 cloves Garlic * 1 pound Lamb * 1/2 cup Chicken broth * 6  Roma tomatoes * 1/2 cup Parmesan * 1/2 bunch Fresh basil *   Salt and pepper * 	A favorite late summer dish made with veggies from the garden, although great any time of year!	235496	2	f	t	t	f
133	Lamb: Lebanese lamb wraps	http://www.bigoven.com/recipe/lamb-lebanese-lamb-wraps/908202	I make the salad first so that the onion can mellowToss salad ingredients togetherDressingMix all ingredients wellLambMix onions with spices and fry gently in a little oil until soft, add a little water if it gets too dry, not more oilAdd mince and brown thoroughly. Add pomegranate molasses and 200 (ish) ml water and simmer for 10 minutes or so then allow the moisture to evaporateToast pittasServe by layering up all the elements in a pitta or on flatbread. Enjoy	2015-04-09 13:38:20.278083	2015-04-09 13:46:02.781009	Lamb	5	http://redirect.bigoven.com/pics/lamb-lebanese-lamb-wraps-2.jpg	1	40	4 Servings	1  Red chilli * 3 tablespoons Extra virgin olive oil * Few Pinches Light brown sugar *   Lamb * 600 grams Minced lamb * 1 Large Onion * 2 teaspoons Ground cumin * 2 teaspoons Ground cinnamon * 3 Cloves Garlic * 1/2 teaspoon Chilli flakes * 2 tablespoons Pomegranate molasses *   Pitta breads *   Dressing * 125 Grams Natural yoghurt * 1 tablespoon Tahini paste * 1 clove Garlic * 1/2  Lemon *   Salad * 300 grams Cherry tomatoes *  Bunch Fresh parsley * 1  Red onion * 1/2  Lemon * 1-2 tablespoons Pomegranate molasses * 	Sounds way more complicated than it is. Super sunny food	908202	30	f	t	f	f
134	Lamb Bhuna	http://www.bigoven.com/recipe/lamb-bhuna/268633	To make a lamb bhuna, start by gently browning a heady mix of spices as below (add to a large, hot, dry frying pan and gently roast for a couple of minutes)2 Teaspoons:Cumin SeedsMustard SeedsFennel SeedsFenugreek Seeds4 Teaspoons:Coriander Seeds2 or 3 dried chillisAfter roasting, let the spices cool before grinding to a fine powder with a pestle & mortar.Next, finely chop 2 large shallots, a four centimetre chunk of ginger and 4 or 5 garlic cloves, then cook in oil in a large pan until they turn golden brown. This will take maybe four or five minutes.Add a couple of medium tomatoes, peeled and chopped to the pan, along with a shake of curry mix. Feel free to use canned tomatoes instead of fresh. Cook until the sauce thickens.Add the roasted spice mix to the pan and stir well. The dry spice powder will cause the sauce to seize and thicken. Cook for a minute or two, taking care not to let the sauce catch on the bottom of the pan. If it does, add a splash of water and quickly stir.Now add a 550g of boneless lamb or mutton shoulder, cut into large chunks, and a teaspoon and a half of salt. Stir and cook for five minutes, making sure that the meat is fully covered in the thick sauce.Let the curry down with 250ml of water, bring to a gentle simmer, put a lid on the pan and cook on a very gentle heat for about an hour and a half.After this time, check that the meat is tender. If it isn’t leave it for a while longer. When the meat is ready, remove the lid from the pan and turn up the heat to reduce the sauce until it almost disappears. The aim is to create a dry dish, where the highly concentrated remains of the sauce cling tightly to the tender meat.Serve with naan bread, rice and cold beer. This is no place for wine. Beer only, please, something light and very, very cold.	2015-04-09 13:38:21.725464	2015-04-09 13:46:02.784967	Lamb	0	http://redirect.bigoven.com/pics/rs/640/lamb-bhuna.jpg	0	\N	2 Servings	2 teaspoons Cumin Seeds * 2 teaspoons Fennel Seeds * 2 teaspoons Mustard Seeds * 2 teaspoons Fenugreek Seeds * 4 teaspoons Coriander Seeds * 2 or 3 Whole Dried Chilli * 2 Whole Shallots * 4cm piece Ginger * 4 Cloves Garlic * 2 Whole Tomatoes * 550 Grams Boneless Lamb * 	One that I found on the web, tried and loved - well worth the extra bit of effort!	268633	28	f	t	f	f
135	Lamb Meatballs	http://www.bigoven.com/recipe/lamb-meatballs/161292	1. Heat a saucepan over medium heat. Lightly spray with oil. Add garlic and cook for 30 seconds. Add tomatoes and bring to the boil. Reduce heat to low and simmer for 25 to 30 minutes or until sauce thickens. Remove from heat. Add basil and salt and pepper.(Put on vegetable to steam, or rice as a side dish)2. Meanwhile, combine mince, breadcrumbs, egg, onion, mint, feta and salt and pepper in a large bowl. Using wet hands, shape tablespoons of mixture into balls.3. Heat a non stick frying pan over medium heat. Spray with oil. Cook meatballs in batches, for 8 to 10 minutes or until golden and cooked through.4. Stir back into sauce mixture and mix in.Serve with steamed green vegetables or rice.	2015-04-09 13:38:22.511543	2015-04-09 13:46:02.789163	Lamb	4	http://redirect.bigoven.com/pics/rs/640/lamb-meatballs-3.jpg	1	2400	4 Servings	2 sprays Olive oil cooking spray * 2 cloves Garlic * 800 gram Chopped Tomatoes * 1/4 cup Basil leaves * 500 gram Minced lamb lean * 1/2 cup Whole Grain Breadcrumbs * 1  Egg * 1 small onion * 1/4 cup Mint leaves * 1/4 cup Feta cheese * 	Calories: 347 Fat: 13.9 Sat: 6g, Protein 35.5g, Carb 18g, Fibre 3.8g, Cholesterol 143mg, Sodium 518mg	161292	2	f	t	f	f
136	Lamb Tagine! (Message from BigOven)	http://www.bigoven.com/recipe/lamb-tagine/179642	We hope you are enjoying this free experimental developer key at api.bigoven.com.  Production usage of the BigOven API requires a paid plan, which helps offset BigOven's considerable hosting costs.  This message will not appear on any paid plan; visit your developer console at http://api.bigoven.com to purchase an upgraded key. Thank you!	2015-04-09 13:38:22.732869	2015-04-09 13:38:22.732869	Lamb	5	http://redirect.bigoven.com/pics/rs/640/lamb-tagine.jpg	1	150	6 Servings		I love lamb and I love spices so a lamb tagine seemed like a good idea. This is a very earthy tasty dish. Definitely much better the second day. Eating on a cold day by the fire is a nice plus.	179642	31	f	f	f	f
141	Rack Of Lamb	http://www.bigoven.com/recipe/rack-of-lamb/181104	You will need your trusty cast iron pan, and your oven pre-heated to 375 F.Mix the mustard, salt, pepper, rosemary and 1 tbs oil well in a bowl and set aside. If the rack is really big and has plenty of meat on each piece then we separate the rack into singles. If it is a bit smaller, it's better to cut the rack into double or even tripple pieces.  This way you will still be able to get them perfectly cooked to medium-rare.   Heat the cast iron pan to a high heat melting only 1/2 tablespoon of oil. Place the rack pieces on their sides with the bone sticking sideways out of the pan.  Now brush the smear onto each lamb chop.  Once the first side is nice and browned, flip each chop and repeat the smear. Each side should cook for about 3 - 5 minutes, depending on the thickness and on how many you've got piled into the pan. Flip them one more time before shoving the whole pan into your oven. Bake for about 10 - 12 minutes for perfect medium-rare rack of lamb chops. These are so juicy and so good. Enjoy these! 	2015-04-09 13:38:24.373967	2015-04-09 13:38:24.373967	Lamb	5	http://redirect.bigoven.com/pics/rs/640/rack-of-lamb.jpg	4	20	4 Servings	2  Rack of Lamb * 2 tablespoons Organic Gluten-free Dijon Mustard * 2 pinch Sea salt * 2 pinch Fresh ground black pepper * 2 stalks Fresh Rosemary * 1 1/2 tablespoons Coconut oil * 		181104	3	f	f	f	f
101	Grilled Bean Burger	http://www.bigoven.com/recipe/grilled-bean-burger/171305	In a large nonstick skillet coated with cooking spray, saute onion and garlic in oil for 2 minutes. Stir in the carrot, chili powder and cumin; cook 2 minutes longer or until carrot is tender. Remove from the heat; set aside.In a large bowl, mash the pinto beans and black beans. Stir in the oats. Add the mustard, soy sauce, ketchup, pepper and carrot mixture; mix well. Shape into eight 3-1/2-in. patties.Coat grill rack with cooking spray before starting the grill. Grill patties, covered, over medium heat for 4-5 minutes on each side or until heated through. Serve on buns with lettuce and salsa. 	2015-04-09 13:31:25.630314	2015-04-09 13:46:02.640467	Beans	5	http://redirect.bigoven.com/pics/rs/640/grilled-bean-burger-6.jpg	4	0	8 Servings	4 cloves Garlic * 1 large Onion * 1 tablespoon olive oil * 1 medium Carrot * 1 teaspoon Chili powder * 1 teaspoon Ground cumin * 1 15-oz can Pinto beans * 1 15-oz can  Black beans * 1 1/2 cups Quick cooking oats * 2 tablespoons Dijon mustard * 2 tablespoons Soy sauce * 1 tablespoon Ketchup * 1/4 teaspoon Pepper * 8 leafs Lettuce * 8 tablespoon Salsa * 	Delish! Very easy to make. Only bean burger I've ever made that didn't fall apart and maintained a texture very much like a meat burger.	171305	26	f	t	f	f
138	Lamb Souvlaki	http://www.bigoven.com/recipe/lamb-souvlaki/283957	1.\t Combine all ingredients and let meat marinate for 30 minutes to overnight.2.\t Skewer the meat.3.\tCook on the grill or under a broiler for about 8-10 minutes for medium rare.	2015-04-09 13:38:23.303676	2015-04-09 13:46:02.800409	Lamb	0	http://redirect.bigoven.com/pics/rs/640/lamb-souvlaki.jpg	0	\N	4 Servings	1 pound lamb * 2 cloves garlic * 1 whole lemon * 1/4 cup  olive oil * 1 teaspoon oregano * 1/4 teaspoon salt * 1/4 teaspoon pepper * 		283957	21	f	t	f	f
140	Lamb Biryani	http://www.bigoven.com/recipe/lamb-biryani/272834	Marinate meat and leave overnight.Stir food colouring into rice.In a large pot, add oil, with aniseed, cinnamon, jeers and heat to sizzle.Sprinkle curry spoon rice to bottom of pot. Repeat with lentils.Add marinated meat and boiled eggs.Layer with lentils, potatoe, rice, onions.Pour over 2 cups water, and cook on high for 15 minutes.Heat oven to 180" and cook for an hour.	2015-04-09 13:38:24.00172	2015-04-09 13:46:02.810702	Lamb	0	http://redirect.bigoven.com/pics/rs/640/lamb-biryani-3.jpg	0	\N	8 Servings	1 Kg Lamb * 2 Cups Rice *   Black lentils * 4 Large Potatoe *   For the marinade *   Freah coriander *   Fresh thyme *   Fresh mint * 1/2 Cup Plain yoghurt * 1 tablespoon Yellow food colouring *   Biryani masala *   Roigh saltt * 1 tablespoon ginger and garlic *   Fresh curry leaf * 2 tablespoon Sunflower oil * 1 Sticks Cinnamon stick * 1 teaspoon Jeera * 2  Star anise * 2 Cupsw Water * 		272834	28	f	t	f	f
100	Thai Grilled Pizza	http://www.bigoven.com/recipe/thai-grilled-pizza/159432	   1. Prepare grill for indirect-heat cooking.   2. Combine lime juice, soy sauce, onion, cilantro, peanut butter, oil, brown sugar, ginger, lime zest, red pepper flakes and garlic in a stockpot. Stir in shredded turkey. Heat over low heat, stirring occasionally.   3. Unroll pizza dough and pat into a rectangle, approximately 10 x 13 inches. Cut dough into 4 equal pieces.   4. Reduce grill heat to low. Brush grill rack with olive oil. Using the indirect grilling method, slide pizza crusts on grill and cook until golden, about 3 to 4 minutes until dough is puffy and lightly browned.   5. Turn pizza crusts over. Top browned side of pizza crusts with heated turkey mixture. Sprinkle with green onions, carrot sticks and cilantro. Sprinkle pizzas with cheese.   6. Cover with grill lid or tent with foil. Heat pizzas about 5 minutes or until crusts are cooked on bottom, cheese melts and pizzas are hot. 	2015-04-09 13:31:25.228744	2015-04-09 13:46:02.615899	Turkey	4.4782608695652204	http://redirect.bigoven.com/pics/rs/640/thai-grilled-pizza-4.jpg	24	0	4 Servings	1/4 Cup fresh lime juice with pulp * 2 Tablespoons Reduced-sodium soy sauce * 2 Tablespoons green onion * 1 Tablespoon fresh cilantro * 1 Tablespoon crunchy peanut butter * 1 Tablespoon olive oil * 1 Tablespoon Brown sugar * 1 Teaspoon fresh ginger root * 1/2 Teaspoon lime zest * 1/4 Teaspoon Red pepper flakes * 2 Cloves Garlic * 2 Cups GRILLED OR COOKED TURKEY * 1 10-ounce refrigerated pizza dough *   olive oil * 1/2 Cup green onion * 1 Medium carrot * 1/4 Cup Fresh Cilantro * 1/2 Cup Mozzarella cheese * 	An alternative take on an everyday favorite	159432	23	f	t	f	f
143	Fish: Halibut with Garlic and Herbs	http://www.bigoven.com/recipe/fish-halibut-with-garlic-and-herbs/163877	Preheat oven to 450.Combine first 5 ingredients in a shallow dish. Place egg whites and egg in a shallow dish. Place flour in a shallow dish. Sprinkle fish with salt and pepper. Dredge fish in flour. Dip in egg mixture; dredge in panko mixture.Heat 1 tablespoon oil in a large non-stick skillet over medium-high heat.Add 3 fish fillets; cook 2 minutes on each side or until browned. Add more oil as needed to ensure that breading browns. Do not overcrowd fish in pan. Place fish on broiler pan coated with cooking spray.  Repeat with more oil and remaining fish. Bake at 450 for 6 minutes or until fish flakes easily when tested with a fork or until desired degree of doneness.  	2015-04-09 13:39:20.357048	2015-04-09 13:46:02.822081	Halibut	4.32352941176471006	http://redirect.bigoven.com/pics/rs/640/fish-oven-fried-halibut-with-garlic.jpg	35	0	4 Servings	1 cup Panko Breadcrumbs * 1 tablespoon Basil * 1 tablespoon Parsley * 1/2 teaspoon Onion powder * 1 clove Garlic * 3  Egg * 2 tablespoon Flour * 6 6-oz Halibut * 3/4 teaspoon Salt * 1/4 teaspoon Black pepper * 2 tablespoon olive oil * 	Works great with halibut, but you can sub any firm white fish. Kid-friendly.	163877	3	f	t	f	f
145	Steve's Fish Tacos (Message from BigOven)	http://www.bigoven.com/recipe/steves-fish-tacos/178920	We hope you are enjoying this free experimental developer key at api.bigoven.com.  Production usage of the BigOven API requires a paid plan, which helps offset BigOven's considerable hosting costs.  This message will not appear on any paid plan; visit your developer console at http://api.bigoven.com to purchase an upgraded key. Thank you!	2015-04-09 13:39:21.626565	2015-04-09 13:46:02.83177	Fish	4.73333333333332984	http://redirect.bigoven.com/pics/rs/640/steves-fish-tacos-2.jpg	15	45	6 Servings		I had never tried fish tacos until my son, fresh out of boot camp, asked me to make them. I found a basic recipe, then adapted it from there, and now it's one of my favorite things to eat!	178920	3	f	t	f	f
146	Chili and Garlic Fish Fry	http://www.bigoven.com/recipe/chili-and-garlic-fish-fry/175830	Soak red chili and garlic cloves in hot water for 10 mins and grind it into smooth paste. In a small bowl add besan flour, red chili and garlic paste, turmeric powder, lime juice, food color and salt. Mix well and break an egg into it, mix once again to form a smooth paste. Marinade the fish slices in this mixture for at least half an hour. Heat oil in a pan and fry these fish slices until crisp. Serve hot.	2015-04-09 13:39:21.95574	2015-04-09 13:46:02.835874	Fish	4.5	http://redirect.bigoven.com/pics/rs/640/chilly-and-garlic-fish-fry.jpg	2	15	4 Servings	1  fish * 1 tbsp Besan flour or Chickpea flour * 1  Egg * 6 tsp Dry red chili * 3 cloves Garlic * 1/2 tsp Turmeric powder * 1/2 tsp Lime juice * 1 pinch Red food color * 1   Salt to taste * 		175830	17	f	t	f	f
109	Lebanese Chickpea Appetizer (Hummus Habb)	http://www.bigoven.com/recipe/lebanese-chickpea-appetizer-hummus-habb/161654	Thoroughly mix all ingredients except the mint. Refrigerate for one hour. Just before serving, garnish with mint.Note: chives may be substituted for the cilantro and  tsp of dried mint for the fresh mint.From: "Classic Vegetarian Cooking from the Middle East and North Africa" by Habeeb SalloumEach (app 1/4 cup) serving contains an estimated:Cals: 142, FatCals: 69, TotFat: 8gSatFat: 1g, PolyFat: 1g, MonoFat: 6gChol: 0mg, Na: 300mg, K: 177mgTotCarbs: 15g, Fiber: 4g, Sugars: 2gNetCarbs: 11g, Protein: 4g	2015-04-09 13:32:12.57755	2015-04-09 13:46:02.682034	Chickpeas	4.66666666666666963	http://redirect.bigoven.com/pics/rs/640/lebanese-chickpea-appetizer-hummus--2.jpg	3	60	8 Servings	2 cups chickpeas * 1/4 cup olive oil * 1/4 cup Fresh Lemon Juice * 6 cloves garlic * 1 teaspoon salt * 2 tablespoons scallions * 2 tablespoons fresh cilantro * 1 tablespoon mint * 	Unlike more traditional hummus, this leaves the chickpeas essentially whole. The textrue and flavor are completely different from the Arabian version. 	161654	19	t	f	t	f
114	Indian-Spiced Lentils and Lamb	http://www.bigoven.com/recipe/indian-spiced-lentils-and-lamb/604857	Instructions are at http://www.myrecipes.com/recipe/indian-spiced-lentils-lamb-50400000115837/	2015-04-09 13:37:10.790014	2015-04-09 13:46:02.694858	Lamb	0	http://redirect.bigoven.com/pics/rs/640/indian-spiced-lentils-and-lamb-8.jpg	0	60	4 Servings	2 teaspoons olive oil * 6 ounces lean ground lamb * 1 teaspoon red curry powder * 1 teaspoon ground cumin * 1/2 teaspoon kosher salt * 1/4 teaspoon ground red pepper * 1 1/2 cups chopped onion * 3/4 cup chopped carrot * 1 jalapeño pepper * 5  garlic cloves * 1 tablespoon tomato paste * 3/4 cup brown lentils * 2 cups fat-free lower-sodium chicken broth * 1 cup water * 3/4 cup light coconut milk * 1 (15-ounce) can whole peeled tomatoes * 1/4 cup 2% reduced-fat Greek yogurt * 1/4 cup cilantro leaves * 		604857	28	f	t	f	f
116	Lazy Lamb	http://www.bigoven.com/recipe/lazy-lamb/172964	Preheat oven to 150C/Gas 2/ fan oven 130C. Put the lamb in a large roasting tin and drizzle with the oil.  Season with freshly ground black pepper and sprinkle with rosemary. Dissolve the stock cube in 450ml boiling water and add to the pan. Stir in the red wine and mint sauce. Cover the tin with a double layer of aluminium foil, pinching tightly around the edges of the pan to make a good seal. Put in the oven and forget about it for 2/1/2 - 3 hours, until cooked through.Carefully take tin out of the oven and discard foil. Increase oven temperature to240C/Gas 9/fan oven 220C (or according to roast potato pack instructions). Lift lamb onto a plate and pour cooking liquid into a large saucepan. Skim off fat and add redcurrant jelly to pan. Put potatoes in oven to cook. Return lamb to tin. Bake above potatoes for 20 minutes or until the lamb has lightly browned and is thoroughly cooked.  Boil frozen vegetables until tender.Heat the cooking liquid until it begins to bubble. Stir in the gravy granules and cook gently for 1-2 minutes until thickened. Carve the lamb and serve with roast potatoes, vegetables and the minty gravy. 	2015-04-09 13:37:11.877394	2015-04-09 13:46:02.703965	Lamb	4	http://redirect.bigoven.com/pics/rs/640/lazy-lamb-2.jpg	2	180	4 Servings	  part-boned leg New Zealand Lamb * 1 tablespoon Vegetable oil * 1 tablespoon fresh rosemary leaves * 1/2 cube lamb stock  * 150 mililiters Red wine * 2 teaspoons mint sauce * 2 tablespoons redcurrant jelly * 2 tsp gravy granules *   frozen roast potatoes and mixed farmhouse vegetabl * 	Slow cooked lamb dish, specially designed by New Zealand Lamb.	172964	3	f	t	f	f
124	Grilled Chili-rubbed Flank Steak	http://www.bigoven.com/recipe/grilled-chili-rubbed-flank-steak/140567	Pat the flank steak thoroughly dry with paper towels. Sprinkle both sides  of the steak with salt and pepper. Using your fingers, press the Chili Rub  into both sides of the flank steak. Wrap the steak well and refrigerate for  at least 4 hours or up to 2 days. The longer the steak marinates the more  intense the flavor. Remove the flank steak from the refrigerator 1 hour  before grilling.    Set up the grill, light the coals, and place the grill 4 inches above them.  When the coals are ready, place the flank steak on the grill and cook,  turning once, until done, 12 to 15 minutes for rare, 15 to 20 minutes for  medium. Let the meat rest for 5 minutes before slicing. Slice the flank  against the grain (its very easy to see) into thin strips, holding the  knife at an angle to the cutting surface. Serve warm, accompanied by lime  wedges.   For the Chili Rub: Combine all the ingredients in a small bowl and stir until well blended.  Transfer to a small lidded container and store in the refrigerator for up  to 1 month.    Blue Collar Food: Easy Home Cooking for Hardworking People by Two Really  Nice Guys by Chris Styler and Bill Hodge (William Morrow and Company, Inc.,  copyright 1994 by Christopher Styler and William Hodge).        Recipe by: Good Morning America      	2015-04-09 13:37:56.10987	2015-04-09 13:46:02.737519	Beef	5	http://redirect.bigoven.com/pics/rs/640/grilled-chili-rubbed-flank-steak-2.jpg	9	0	4 Servings	2 pounds Flank steak; *   Kosher salt *   black pepper * 1 tablespoon Chili Rub  *   Lime wedges *   ~~ CHILI RUB ~~ * 1/4 cup Chili powder * 1/4 cup Oriental sesame oil * 2 tablespoons Fresh lime juice * 2 tablespoons Soy sauce * 1 teaspoon Garlic * 		140567	3	f	t	f	f
125	South-of-the-border Grilled Pork Tenderloin	http://www.bigoven.com/recipe/south-of-the-border-grilled-pork-tenderloin/59871	In a small bowl, combine everything but pork. Place tenderloins in a  shallow glass baking dish. Pour marinade over them and turn meat to coat  evenly. Refrigerate for 30 minutes.Remove meat from marinade and grill, 4 inches (10 cm) from source of heat,  over medium-hot coals for 10 to 12 minutes or broil until internal  temperature reaches 140F (60C), turning once and basting occasionally with  marinade. Slice and serve. (Makes 4 servings)Per serving: calories, 199 protein, 31 g carbohydrate, 3 g fat, 6 g  (calories from fat, 27%) dietary fiber, trace cholesterol, 99 mg sodium, 74  mg potassium, 646 mgExchanges: 4 low-fat meat Joslin Diabetes Gourmet Cookbook  Posted to recipelu-digest Volume 01 Number 176 by Reggie Dwork  ~~ltreggie~~at;reggie.com> on Oct 28, 1997	2015-04-09 13:37:56.427318	2015-04-09 13:46:02.742883	Pork	4.04999999999999982	http://redirect.bigoven.com/pics/south-of-the-border-grilled-pork-te-7.jpg	22	0	4 Servings	1/4 cup fresh marjoram * 1/4 cup cilantro * 1/4 cup Onion * 1 clove Garlic * 1 teaspoon Black Pepper * 1 teaspoon olive oil * 2  Pork tenderloins *   juice and zest of 1 lime *   juice and zest of 1 lemon * 		59871	3	f	t	f	f
131	Lamb Biryani	http://www.bigoven.com/recipe/lamb-biryani/167841	Wash and soak the rice in water for one hourApply salt, papaya peel, minced ginger, minced garlic and garam masala to the pre cut lambMix the greens and marinate for a 2- 3 hoursIn the mean time fry the sliced onions until golden brown and allow to coolMix the curd, lime juice, fried onions and oil. Add to the marinated meat and keep on the sideIn a cooking handi (traditional heavy bottomed pot) boil 3 litres water with salt and garam masala. Drain the waterAdd the rice to the boiling water and bring to a rapid boil, drain the water, spread the rice on the meat. Mix cream and milk along with 100 ml of the drained rice water. Pour over the rice and meat evenlySeal the edges of the container with aluminum foil and cook on high heat until it starts to steamCook on dum (traditional Indian method of cooking by covering and simmering on a very slow flame) for approximately 30 minutes, remove from heat and leave covered for a further lid be till another 30 minutesMix the desi ghee (pure ghee) with the biryani and servehttp://prochef360blog.com	2015-04-09 13:38:19.493756	2015-04-09 13:46:02.770907	Lamb	4.5	http://redirect.bigoven.com/pics/rs/640/lamb-biryani-2.jpg	2	120	10 Servings	 10   servings  * 1   Ingredients  *  1000  gm Biryani Rice  *  1500  gm Lamb  *  60  gm Ghee  *  250  ml  Vegetable Oil  *  50  gm Ginger *  30  gm Garlic *  250  gm Brown Onions  *  12  gm Cinnamon Stick  *   For Garam Masala:  *  15  gm Shahi Zeera  *  10  gm Cloves  *  5  gm Green Cardamom Powder  *  250  gm Curd  *  25  gm Green Chilli Paste  *  20  gm Khova  *  15  ml Cream  *  250  ml  Milk  *  40  gm Coriander  *  40  gm Mint  *  10  gm Green Chilli Paste  *  6  pc Green Chilli *  25  ml Lime Juice  *  20  gm Raw Papaya Peel  *   For Boiling Rice:  *  50  gm Salt  *  8  gm Cloves  *  5  gm Green Cardamom  *  10  gm Shahi Zeera  *  12  gm Cinnamon Stick  *  20  gm Ginger Garlic Paste * 	Easy and simple mediterranean cuisine	167841	29	f	t	f	f
137	Baharat Lamb	http://www.bigoven.com/recipe/baharat-lamb/562997	Make baharat spice rub: Place ingredients in a bowl. Mix well to combine.Combine oil and 2 tablespoons spice rub (see tip) in a bowl. Brush over both sides lamb cutlets. Cover and refrigerate for 30 minutes, if time permits.Preheat a barbecue plate on medium heat until hot. Cook lamb for 3 minutes each side for medium or until cooked to your liking. Serve with tabouli, tzatziki and Lebanese bread.	2015-04-09 13:38:23.090615	2015-04-09 13:46:02.795714	Lamb	0	http://redirect.bigoven.com/pics/rs/640/baharat-lamb.jpg	0	15	4 Servings	2 tablespoons Olive Oil * 12  Lamb Cutlets * 1 and 1/2 tablespoons Paprika Powder * 1 tablespoon Ground Black Pepper * 3 teaspoons Ground Cumin * 2 teaspoons Ground Corriander * 2 teaspoons Ground Cinnamon * 2 teaspoons Ground Cloves * 1 teaspoon Ground Cardamom * 1/2 teaspoon Ground Star Anise *  pinch Ground Nutmeg *   Tabouli, Tzatziki and Lebanese Bread * 		562997	32	f	t	f	f
139	Lamb Tagine	http://www.bigoven.com/recipe/lamb-tagine/184465	Soak Tagine pot in water for 30 mins and bring oven to temperature - 180C. Brown lamb in frying pan and then put to oneside. Then brown onion in same pan towards end add garlic, cumin, coriander and cloves.Put Onion mix in bottom of Tagine pot place lamb on top. Then cover lamb with remaining spices and grated pepper.Add apricots, figs, almonds, chick peas and preserved lemon. Mix in.Add vinegar. Pour hot stock until most ingredients are covered.Place in oven for 1 hour then turn over lamb and add stock if required.Check stock levels but don't over do it only add if getting dry. If need be turn oven down towards the end. About 2.5-3 hours in the oven. Its cooked after 1.5 hours but will be more tender if in longer.Add salt and parsley at the end before serving - which os best done in Tagine pot on the table.	2015-04-09 13:38:23.61883	2015-04-09 13:46:02.804646	Lamb	0	http://redirect.bigoven.com/pics/rs/640/lamb-tagine-4.jpg	1	0	6 Servings	6  Lamb shank * 2  Onions * 4 cloves Garlic * 2 teaspoon Ground Cinnamon * 1 teaspoon Ground Ginger * 1 teaspoon Paprika * 1/2 teaspoon Saffron * 1/2 teaspoon Cumin * 1/2 teaspoon Coriander * 1/2 teaspoon Ground Turmeric * 1/4 teaspoon Nutmeg * 5  Cloves * 200 g Green or Black Olives *   Almonds *   Preserved Lemon *   Beef Stock * 50 ml Red Wine Vinegar * 500 g Dried Apricots & Figs (or Prunes) *   Olive Oil *   Pepper *   Sea Salt *   Fresh Parsley * 400 g Chick Peas * 	Inspired tagine developed following trip to Marrakech	184465	32	f	t	f	f
142	Fish in Ginger Sauce	http://www.bigoven.com/recipe/fish-in-ginger-sauce/495177	1.  Fillets should be wet 2.  In a small bowl mix the first six ingredients. 3.  Heat skillet over medium high heat 4.  Add vegetable oil to skillet 5.  Put seasoned cornflour in gallon plastic bag. 6.  Add the fish to the bag and shake to coat the fillets thoroughly 7.  Put the breaded fillets onto clean plate 9.  Add fillets to hot oil and cook until slightly brown, about a minute10.  Turn over fillets and brown on other side for another minute11.  Turn heat down to medium12.  Pour in the soy sauce mixture13.  Turn fish over one last time14.  Cover pan and let it simmer about 3-4 minutes more15.  Transfer fillets to serving platter and pour remaining sauce over top16.  Sprinkle green onions over the top	2015-04-09 13:39:19.988982	2015-04-09 13:46:02.817698	Fish fillets	4	http://redirect.bigoven.com/pics/rs/640/fish-in-ginger-sauce.jpg	2	30	3 Servings	1/2 cup Low sodium soy sauce * 2 tablespoons Szechuan Spicy Stir-Fry Sauce * 3 tablespoons Sugar (or sweeter equivalent) * 1/4 teaspoon Garlic powder * 2 to 3 tablespoons minced fresh ginger * 2/3 cup Water * 1 1/2 pounds small fish fillets * 1/2 cup cornflour seasoned with salt & pepper * 1/3 cup Vegetable oil * 2 to 3  Green onions, chopped * 	This is far easier than the list of ingredients may indicate. If you enjoy fishing, this is a great way to prepare your fresh catch, whether bass, bluegill, crappie, perch or walleye fillets. It's great with tilapia fillets too. I came up with this Asian-like recipe after years of experimenting and tweaking. It has a little spice kick to it from the Szechuan spicy stir-fry sauce, but anyone can handle it, even kids. I posted a 5 minute video of myself making this dish on YouTube under the title "Fish in Ginger Sauce" (from Juanelo1946)	495177	13	f	t	f	f
144	Healthy-Hardy Fish Stew	http://www.bigoven.com/recipe/healthy-hardy-fish-stew/161753	Place broth, beer, garlic, celery, and carrots on a large pan. Simmer until veggies are mostly tender (about 10 minutes). Add potato, tomato, salsa, and cook unti potatoes are soft (another 10 minutes). Blend 3/4 of the soup until smooth, season with salt & pepper, add lime juice to taste. Return to pan and re-heat to low boil. Add fish cubes and cook just until fish is cooked through (about 5 mins). Serve with garlic toast or croutons. Each (app 1 cup) serving (exclusive of bread) contains an estimated:Cals: 138, FatCals: 40, TotFat: 5gSatFat: 1g, PolyFat: 1g, MonoFat: 3gChol: 27mg, Na: 392mg, K: 565mgTotCarbs: 11g, Fiber: 2g, Sugars: 3gNetCarbs: 9g, Protein: 11g	2015-04-09 13:39:21.335377	2015-04-09 13:46:02.827313	Fish	4.4615384615384599	http://redirect.bigoven.com/pics/rs/640/healthy-hardy-fish-stew-2.jpg	15	45	8 Servings	2 cups Chicken broth * 1 cup Beer * 4 cloves garlic * 1/2 cup Celery * 1/2 cup Carrots * 3 medium Plum Tomatoes * 1 medium Potato * 1/4 cup Chile salsa * 1/2 teaspoon kosher salt * 1/2 teaspoon Black pepper * 1/4 cup lime juice * 1 pound Tilapia filets * 	This tasty stew is hardy fare for a cold evening. It's heart-health and Diabetic-friendly as well. 	161753	3	f	t	f	f
89	Basic Bread	http://www.bigoven.com/recipe/basic-bread/159335	Put warm water in a bowl, add sugar and yeast.  Stir and let sit for a couple of minutes.  Gradually stir in flour and salt until dough pulls from sides of bowl. Lightly flour a surface and put dough onto it to knead.Knead dough for 3 minutes.  Then clean and grease the bowl in which you will let the dough rise.  Before putting in dough, knead another 3 minutes.Form the dough into a ball and put into the greased bowl, turning to grease all sides of the dough.  Cover with a damp clean dishtowel and let rise until it doubles its size, about 1 to 2 hours.Punch down the dough with fist and knead for a minute or so to work out the air. Cut dough in half and form two loaves.  Sprinkle cornmeal on a baking sheet, place loaves onto the sheet, and let rise for 45 minutes. Set the oven to 450F (230C / Gas Mark 8)  and preheat for 15 minutes. Put a pan on the bottom rack and pour 2 or so cups of boiling water into it.   Put the cookie sheet with bread on the rack above the water, and bake for 20 minutes.  When the baking time is over, turn off the oven and leave in the bread for 5 more minutes.To keep, freeze in foil (after cooled) or leave at room temperature in a paper bag. Either of these are better for bread than refrigeration.	2015-04-07 18:54:03.880895	2015-04-09 13:51:37.753873	Bread	4.26900584795321958	http://redirect.bigoven.com/pics/rs/640/basic-bread-4.jpg	182	150	28 Servings	 1  package Yeast *  1  tablespoon Sugar *  5.5  cups All purpose flour *  1  tablespoon Salt *  0.25  cup Cornmeal *  2  cups Water *  2  cups Water * 	Adapted from the King Arthur Flour website. Delicious and easy!	159335	3	f	f	t	f
97	Bread Machine French Bread 	http://www.bigoven.com/recipe/bread-machine-french-bread/357132	1. Place all ingredients (except egg white, water and cornmeal) in bread machine according to manufacturers directions.2. Start machine on regular dough cycle.3. When dough cycle is complete, remove dough with floured hands and cut in half on floured surface.4. Take each half of dough and roll to make a loaf about 12 inches long in the shape of French bread.5. Place on baking sheet that has been greased and "floured" with cornmeal. 6. Let rise about 20 - 30 minutes.7. Preheat oven to 400 degrees while bread is rising.8. Mix egg white with 1 Tbs. of water and brush on bread.9. Make several diagonal slashes across the top of the bread about 1/4" deep.10. Bake for 20 minutes. 11. Remove baked loaves to wire racks to cool.	2015-04-07 18:54:06.741731	2015-04-09 13:51:37.79104	Flour	4.33333333333333037	http://redirect.bigoven.com/pics/rs/640/bread-machine-french-bread-9.jpg	3	170	4 Servings	1 1/3 cups Water * 3/4 teaspoon Salt * 4 cups Flour * 2 1/4 teaspoons Yeast active dry yeast * 1  Egg white * 1 tablespoon Water *   Cornmeal * 	Simple french bread recipe that is easy. This always comes out great for us. Enjoy!	357132	9	f	f	t	f
119	Grilled Pineapple Salsa	http://www.bigoven.com/recipe/grilled-pineapple-salsa/94262	URL : http://www.lowfatlife.com/condime.htm    Brush pineapple slices lightly with oil (or spray with cooking spray).  Place on a hot grill and cook, turning once or twice, until lightly browned  on both sides (about 10 minutes). Let cool and finely dice (discarding hard  core). Mix with remaining ingredients. Allow to marinate at least 2 hours  at room temperature or cover and refrigerate up to 3 days. Serve at room  temperature. This is great with a grilled chicken breast or turkey  tenderloin marinated in lemon juice, black pepper and onion.    Posted to EAT-L Digest 06 Sep 96    From:    "~REality" <Ausetkmt@CRIS.COM>    Date:    Sat, 7 Sep 1996 19:04:15 -0700	2015-04-09 13:37:54.395725	2015-04-09 13:51:37.989058	Pineapple	4.5	http://redirect.bigoven.com/pics/rs/640/grilled-pineapple-salsa-2.jpg	2	\N	1 Serving	1 ts Sugar * 1/2 c fresh cilantro * 2  Jalapeno peppers * 1 md Pineapple * 1  Garlic * 1/4 ts Salt * 1 md Red onion * 		94262	3	t	f	t	f
\.


--
-- Name: recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jeremysklarsky
--

SELECT pg_catalog.setval('recipes_id_seq', 146, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: jeremysklarsky
--

COPY schema_migrations (version) FROM stdin;
20150407184623
20150406194416
20150406194932
20150406195913
20150406200417
20150406200542
20150406200615
20150406201028
20150406201504
20150406202011
20150406202137
20150406202250
20150406202344
20150407143242
20150407145651
20150407145816
20150407151802
20150408155800
20150408225418
20150409142820
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: jeremysklarsky
--

COPY users (id, name, email, password_digest, created_at, updated_at) FROM stdin;
1	Jeremy Sklarsky	jeremy.sklarsky@gmail.com	$2a$10$g.nHCCwdBIFDLlE1gS278.6LdoUtiXOSGcnrlncrks33OwdExtlcW	2015-04-07 19:28:08.910027	2015-04-07 19:28:08.910027
2	Rachel Nackman	rachel.nackman@gmail.com	$2a$10$ckV2pte3aXvUSscfuZ/KnuC/O5XT7p0.uFy2ofTFk9r/sj2t21tsK	2015-04-07 21:56:34.647334	2015-04-07 21:56:34.647334
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jeremysklarsky
--

SELECT pg_catalog.setval('users_id_seq', 2, true);


--
-- Name: courses_pkey; Type: CONSTRAINT; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

ALTER TABLE ONLY courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: cuisines_pkey; Type: CONSTRAINT; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

ALTER TABLE ONLY cuisines
    ADD CONSTRAINT cuisines_pkey PRIMARY KEY (id);


--
-- Name: dinner_guests_pkey; Type: CONSTRAINT; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

ALTER TABLE ONLY dinner_guests
    ADD CONSTRAINT dinner_guests_pkey PRIMARY KEY (id);


--
-- Name: dinners_pkey; Type: CONSTRAINT; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

ALTER TABLE ONLY dinners
    ADD CONSTRAINT dinners_pkey PRIMARY KEY (id);


--
-- Name: menu_recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

ALTER TABLE ONLY menu_recipes
    ADD CONSTRAINT menu_recipes_pkey PRIMARY KEY (id);


--
-- Name: menus_pkey; Type: CONSTRAINT; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

ALTER TABLE ONLY menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (id);


--
-- Name: recipe_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

ALTER TABLE ONLY recipe_courses
    ADD CONSTRAINT recipe_courses_pkey PRIMARY KEY (id);


--
-- Name: recipe_cuisines_pkey; Type: CONSTRAINT; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

ALTER TABLE ONLY recipe_cuisines
    ADD CONSTRAINT recipe_cuisines_pkey PRIMARY KEY (id);


--
-- Name: recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

ALTER TABLE ONLY recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_dinner_guests_on_dinner_id; Type: INDEX; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

CREATE INDEX index_dinner_guests_on_dinner_id ON dinner_guests USING btree (dinner_id);


--
-- Name: index_dinner_guests_on_guest_id; Type: INDEX; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

CREATE INDEX index_dinner_guests_on_guest_id ON dinner_guests USING btree (guest_id);


--
-- Name: index_dinner_guests_on_guest_id_and_dinner_id; Type: INDEX; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

CREATE UNIQUE INDEX index_dinner_guests_on_guest_id_and_dinner_id ON dinner_guests USING btree (guest_id, dinner_id);


--
-- Name: index_menu_recipes_on_menu_id; Type: INDEX; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

CREATE INDEX index_menu_recipes_on_menu_id ON menu_recipes USING btree (menu_id);


--
-- Name: index_menu_recipes_on_menu_id_and_recipe_id; Type: INDEX; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

CREATE UNIQUE INDEX index_menu_recipes_on_menu_id_and_recipe_id ON menu_recipes USING btree (menu_id, recipe_id);


--
-- Name: index_menu_recipes_on_recipe_id; Type: INDEX; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

CREATE INDEX index_menu_recipes_on_recipe_id ON menu_recipes USING btree (recipe_id);


--
-- Name: index_recipe_courses_on_course_id; Type: INDEX; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

CREATE INDEX index_recipe_courses_on_course_id ON recipe_courses USING btree (course_id);


--
-- Name: index_recipe_courses_on_recipe_id; Type: INDEX; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

CREATE INDEX index_recipe_courses_on_recipe_id ON recipe_courses USING btree (recipe_id);


--
-- Name: index_recipe_courses_on_recipe_id_and_course_id; Type: INDEX; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

CREATE UNIQUE INDEX index_recipe_courses_on_recipe_id_and_course_id ON recipe_courses USING btree (recipe_id, course_id);


--
-- Name: index_recipe_cuisines_on_cuisine_id; Type: INDEX; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

CREATE INDEX index_recipe_cuisines_on_cuisine_id ON recipe_cuisines USING btree (cuisine_id);


--
-- Name: index_recipe_cuisines_on_recipe_id; Type: INDEX; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

CREATE INDEX index_recipe_cuisines_on_recipe_id ON recipe_cuisines USING btree (recipe_id);


--
-- Name: index_recipe_cuisines_on_recipe_id_and_cuisine_id; Type: INDEX; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

CREATE UNIQUE INDEX index_recipe_cuisines_on_recipe_id_and_cuisine_id ON recipe_cuisines USING btree (recipe_id, cuisine_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: jeremysklarsky; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: jeremysklarsky
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM jeremysklarsky;
GRANT ALL ON SCHEMA public TO jeremysklarsky;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

