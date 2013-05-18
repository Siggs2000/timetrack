--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
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
-- Name: billables; Type: TABLE; Schema: public; Owner: seth; Tablespace: 
--

CREATE TABLE billables (
    id integer NOT NULL,
    job_id integer,
    time_in time without time zone,
    time_out time without time zone,
    date_in date,
    date_out date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.billables OWNER TO seth;

--
-- Name: billables_id_seq; Type: SEQUENCE; Schema: public; Owner: seth
--

CREATE SEQUENCE billables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.billables_id_seq OWNER TO seth;

--
-- Name: billables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: seth
--

ALTER SEQUENCE billables_id_seq OWNED BY billables.id;


--
-- Name: billables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: seth
--

SELECT pg_catalog.setval('billables_id_seq', 3, true);


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: seth; Tablespace: 
--

CREATE TABLE jobs (
    id integer NOT NULL,
    user_id integer,
    job_code character varying(255),
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.jobs OWNER TO seth;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: seth
--

CREATE SEQUENCE jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO seth;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: seth
--

ALTER SEQUENCE jobs_id_seq OWNED BY jobs.id;


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: seth
--

SELECT pg_catalog.setval('jobs_id_seq', 2, true);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: seth; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO seth;

--
-- Name: users; Type: TABLE; Schema: public; Owner: seth; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(255),
    admin boolean,
    contractor boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255)
);


ALTER TABLE public.users OWNER TO seth;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: seth
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO seth;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: seth
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: seth
--

SELECT pg_catalog.setval('users_id_seq', 2, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: seth
--

ALTER TABLE ONLY billables ALTER COLUMN id SET DEFAULT nextval('billables_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: seth
--

ALTER TABLE ONLY jobs ALTER COLUMN id SET DEFAULT nextval('jobs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: seth
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: billables; Type: TABLE DATA; Schema: public; Owner: seth
--

COPY billables (id, job_id, time_in, time_out, date_in, date_out, created_at, updated_at) FROM stdin;
1	1	17:20:27.09777	17:22:34.226346	2013-05-18	2013-05-18	2013-05-18 17:20:27.111084	2013-05-18 17:22:34.22767
2	1	17:44:23.003412	17:45:32.295456	2013-05-18	2013-05-18	2013-05-18 17:44:23.004667	2013-05-18 17:45:32.29633
3	1	11:00:12	11:04:52	2013-05-18	2013-05-18	2013-05-18 18:04:52.124874	2013-05-18 18:05:11.920782
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: seth
--

COPY jobs (id, user_id, job_code, name, created_at, updated_at) FROM stdin;
1	1	G500	Exterior - 145 Maple St.	2013-05-15 01:04:26.423269	2013-05-15 01:04:26.423269
2	1	G500	Exterior - 145 Maple St.	2013-05-15 01:05:04.69211	2013-05-15 01:05:04.69211
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: seth
--

COPY schema_migrations (version) FROM stdin;
20130514044443
20130514044527
20130514044846
20130514193151
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: seth
--

COPY users (id, name, admin, contractor, created_at, updated_at, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip) FROM stdin;
1	Seth Siegler	t	t	2013-05-15 01:00:40.311241	2013-05-15 01:00:40.355177	usaseth@gmail.com	$2a$10$9vRnpTaVLX26YPITvHX3FuDjWeW0Qqo0duMSOQy9t6arlK5Sp./ra	\N	\N	\N	1	2013-05-15 01:00:40.353961	2013-05-15 01:00:40.353961	127.0.0.1	127.0.0.1
2	Joe Schmoe	f	t	2013-05-18 17:49:03.869042	2013-05-18 17:49:03.905529	joe@gmail.com	$2a$10$W56Ij6HFlxPpzvfPbMdmsuDEZHoBLvLeX3zfgpZqpsufsjpgBCaGW	\N	\N	\N	1	2013-05-18 17:49:03.904872	2013-05-18 17:49:03.904872	127.0.0.1	127.0.0.1
\.


--
-- Name: billables_pkey; Type: CONSTRAINT; Schema: public; Owner: seth; Tablespace: 
--

ALTER TABLE ONLY billables
    ADD CONSTRAINT billables_pkey PRIMARY KEY (id);


--
-- Name: jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: seth; Tablespace: 
--

ALTER TABLE ONLY jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: seth; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: seth; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: seth; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: seth; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: seth
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM seth;
GRANT ALL ON SCHEMA public TO seth;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

