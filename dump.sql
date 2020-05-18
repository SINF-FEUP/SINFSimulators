--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.13
-- Dumped by pg_dump version 9.6.13

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
-- Name: has_test; Type: SCHEMA; Schema: -; Owner: sinfdoc
--

CREATE SCHEMA has_test;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: actuator; Type: TABLE; Schema: has_test; Owner: sinfdoc
--

CREATE TABLE has_test.actuator (
    act_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(100)
);



CREATE SEQUENCE has_test.actuator_act_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: actuator_act_id_seq; Type: SEQUENCE OWNED BY; Schema: has_test; Owner: sinfdoc
--

ALTER SEQUENCE has_test.actuator_act_id_seq OWNED BY has_test.actuator.act_id;


--
-- Name: actuator_room; Type: TABLE; Schema: has_test; Owner: sinfdoc
--

CREATE TABLE has_test.actuator_room (
    act_id integer NOT NULL,
    name_room character varying(100) NOT NULL
);



--
-- Name: measure; Type: TABLE; Schema: has_test; Owner: sinfdoc
--

CREATE TABLE has_test.measure (
    m_id integer NOT NULL,
    "timestamp" timestamp without time zone,
    value double precision,
    type_sens character varying(100),
    mote_id integer
);



--
-- Name: measure_m_id_seq; Type: SEQUENCE; Schema: has_test; Owner: sinfdoc
--

CREATE SEQUENCE has_test.measure_m_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




--
-- Name: measure_m_id_seq; Type: SEQUENCE OWNED BY; Schema: has_test; Owner: sinfdoc
--

ALTER SEQUENCE has_test.measure_m_id_seq OWNED BY has_test.measure.m_id;


--
-- Name: mote; Type: TABLE; Schema: has_test; Owner: sinfdoc
--

CREATE TABLE has_test.mote (
    mote_id integer NOT NULL,
    name character varying(100),
    series character varying(100),
    name_room character varying(100)
);


--
-- Name: mote_mote_id_seq; Type: SEQUENCE; Schema: has_test; Owner: sinfdoc
--

CREATE SEQUENCE has_test.mote_mote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mote_mote_id_seq; Type: SEQUENCE OWNED BY; Schema: has_test; Owner: sinfdoc
--

ALTER SEQUENCE has_test.mote_mote_id_seq OWNED BY has_test.mote.mote_id;


--
-- Name: room; Type: TABLE; Schema: has_test; Owner: sinfdoc
--

CREATE TABLE has_test.room (
    name character varying(100) NOT NULL,
    description character varying(200)
);


--
-- Name: rule; Type: TABLE; Schema: has_test; Owner: sinfdoc
--

CREATE TABLE has_test.rule (
    rule_id integer NOT NULL,
    operator character varying(10),
    value double precision,
    act_id integer NOT NULL,
    type_sens character varying(100) NOT NULL,
    mote_id integer NOT NULL
);


--
-- Name: rule_rule_id_seq; Type: SEQUENCE; Schema: has_test; Owner: sinfdoc
--

CREATE SEQUENCE has_test.rule_rule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: rule_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: has_test; Owner: sinfdoc
--

ALTER SEQUENCE has_test.rule_rule_id_seq OWNED BY has_test.rule.rule_id;


--
-- Name: sensor; Type: TABLE; Schema: has_test; Owner: sinfdoc
--

CREATE TABLE has_test.sensor (
    type character varying(100) NOT NULL,
    description character varying(200)
);


--
-- Name: sensor_mote; Type: TABLE; Schema: has_test; Owner: sinfdoc
--

CREATE TABLE has_test.sensor_mote (
    type_sens character varying(100) NOT NULL,
    mote_id integer NOT NULL
);



--
-- Name: state; Type: TABLE; Schema: has_test; Owner: sinfdoc
--

CREATE TABLE has_test.state (
    s_id integer NOT NULL,
    "timestamp" timestamp without time zone,
    state integer,
    act_id integer,
    name_room character varying(100)
);


--
-- Name: state_s_id_seq; Type: SEQUENCE; Schema: has_test; Owner: sinfdoc
--

CREATE SEQUENCE has_test.state_s_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: state_s_id_seq; Type: SEQUENCE OWNED BY; Schema: has_test; Owner: sinfdoc
--

ALTER SEQUENCE has_test.state_s_id_seq OWNED BY has_test.state.s_id;


--
-- Name: actuator act_id; Type: DEFAULT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.actuator ALTER COLUMN act_id SET DEFAULT nextval('has_test.actuator_act_id_seq'::regclass);


--
-- Name: measure m_id; Type: DEFAULT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.measure ALTER COLUMN m_id SET DEFAULT nextval('has_test.measure_m_id_seq'::regclass);


--
-- Name: mote mote_id; Type: DEFAULT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.mote ALTER COLUMN mote_id SET DEFAULT nextval('has_test.mote_mote_id_seq'::regclass);


--
-- Name: rule rule_id; Type: DEFAULT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.rule ALTER COLUMN rule_id SET DEFAULT nextval('has_test.rule_rule_id_seq'::regclass);


--
-- Name: state s_id; Type: DEFAULT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.state ALTER COLUMN s_id SET DEFAULT nextval('has_test.state_s_id_seq'::regclass);


--
-- Data for Name: actuator; Type: TABLE DATA; Schema: has_test; Owner: sinfdoc
--

INSERT INTO has_test.actuator VALUES (1, 'Heater', 'This is the Heater type, meaning that at home there might be several heaters');


--
-- Name: actuator_act_id_seq; Type: SEQUENCE SET; Schema: has_test; Owner: sinfdoc
--

SELECT pg_catalog.setval('has_test.actuator_act_id_seq', 1, true);


--
-- Data for Name: actuator_room; Type: TABLE DATA; Schema: has_test; Owner: sinfdoc
--

INSERT INTO has_test.actuator_room VALUES (1, 'Kitchen');
INSERT INTO has_test.actuator_room VALUES (1, 'WC');
INSERT INTO has_test.actuator_room VALUES (1, 'Living Room');


--
-- Data for Name: measure; Type: TABLE DATA; Schema: has_test; Owner: sinfdoc
--

INSERT INTO has_test.measure VALUES (7611, '2020-04-17 18:09:39', 0, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7612, '2020-04-17 18:09:39', 0, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7613, '2020-04-17 18:09:39', 0, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7614, '2020-04-17 18:09:39', 0, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7615, '2020-04-17 18:09:39', 2, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7616, '2020-04-17 18:09:39', 5, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7617, '2020-04-17 18:09:39', 91, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7618, '2020-04-17 18:09:39', 0.844848999999999961, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7619, '2020-04-17 18:09:39', 0, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7620, '2020-04-17 18:09:39', 0, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7621, '2020-04-17 18:09:39', 0, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7622, '2020-04-17 18:09:39', 0, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7623, '2020-04-17 18:09:40', 0, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7624, '2020-04-17 18:09:40', 0, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7625, '2020-04-17 18:09:40', 0, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7626, '2020-04-17 18:09:40', 0, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7627, '2020-04-17 18:09:40', 2, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7628, '2020-04-17 18:09:40', 5, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7629, '2020-04-17 18:09:40', 91, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7630, '2020-04-17 18:09:40', 0.844848999999999961, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7631, '2020-04-17 18:09:40', 3, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7632, '2020-04-17 18:09:40', 4, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7633, '2020-04-17 18:09:40', 102, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7634, '2020-04-17 18:09:40', 1.12646500000000005, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7635, '2020-04-17 18:09:40', 3, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7636, '2020-04-17 18:09:40', 5, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7637, '2020-04-17 18:09:40', 105, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7638, '2020-04-17 18:09:40', 1.12646500000000005, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7639, '2020-04-17 18:09:40', 2, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7640, '2020-04-17 18:09:40', 5, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7641, '2020-04-17 18:09:40', 91, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7642, '2020-04-17 18:09:40', 0.844848999999999961, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7643, '2020-04-17 18:09:40', 3, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7644, '2020-04-17 18:09:40', 4, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7645, '2020-04-17 18:09:40', 102, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7646, '2020-04-17 18:09:40', 1.12646500000000005, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7647, '2020-04-17 18:09:40', 3, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7648, '2020-04-17 18:09:40', 5, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7649, '2020-04-17 18:09:40', 105, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7650, '2020-04-17 18:09:40', 1.12646500000000005, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7651, '2020-04-17 18:09:40', 3, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7652, '2020-04-17 18:09:40', 6, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7653, '2020-04-17 18:09:40', 114, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7654, '2020-04-17 18:09:40', 1.12646500000000005, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7655, '2020-04-17 18:09:40', 3, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7656, '2020-04-17 18:09:40', 4, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7657, '2020-04-17 18:09:40', 102, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7658, '2020-04-17 18:09:40', 1.12646500000000005, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7659, '2020-04-17 18:09:41', 3, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7660, '2020-04-17 18:09:41', 5, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7661, '2020-04-17 18:09:41', 105, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7662, '2020-04-17 18:09:41', 1.12646500000000005, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7663, '2020-04-17 18:09:41', 3, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7664, '2020-04-17 18:09:41', 6, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7665, '2020-04-17 18:09:41', 114, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7666, '2020-04-17 18:09:41', 1.12646500000000005, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7667, '2020-04-17 18:09:41', 4, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7668, '2020-04-17 18:09:41', 6, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7669, '2020-04-17 18:09:41', 89, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7670, '2020-04-17 18:09:41', 1.40808099999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7671, '2020-04-17 18:09:41', 4, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7672, '2020-04-17 18:09:41', 7, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7673, '2020-04-17 18:09:41', 112, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7674, '2020-04-17 18:09:41', 1.40808099999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7675, '2020-04-17 18:09:41', 3, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7676, '2020-04-17 18:09:41', 6, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7677, '2020-04-17 18:09:41', 114, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7678, '2020-04-17 18:09:41', 1.12646500000000005, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7679, '2020-04-17 18:09:41', 4, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7680, '2020-04-17 18:09:41', 6, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7681, '2020-04-17 18:09:41', 89, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7682, '2020-04-17 18:09:41', 1.40808099999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7683, '2020-04-17 18:09:41', 4, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7684, '2020-04-17 18:09:41', 7, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7685, '2020-04-17 18:09:41', 112, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7686, '2020-04-17 18:09:41', 1.40808099999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7687, '2020-04-17 18:09:41', 4, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7688, '2020-04-17 18:09:41', 8, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7689, '2020-04-17 18:09:41', 82, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7690, '2020-04-17 18:09:41', 1.40808099999999992, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7691, '2020-04-17 18:09:41', 4, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7692, '2020-04-17 18:09:41', 6, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7693, '2020-04-17 18:09:41', 89, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7694, '2020-04-17 18:09:41', 1.40808099999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7695, '2020-04-17 18:09:42', 4, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7696, '2020-04-17 18:09:42', 7, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7697, '2020-04-17 18:09:42', 112, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7698, '2020-04-17 18:09:42', 1.40808099999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7699, '2020-04-17 18:09:42', 4, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7700, '2020-04-17 18:09:42', 8, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7701, '2020-04-17 18:09:42', 82, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7702, '2020-04-17 18:09:42', 1.40808099999999992, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7703, '2020-04-17 18:09:42', 5, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7704, '2020-04-17 18:09:42', 8, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7705, '2020-04-17 18:09:42', 102, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7706, '2020-04-17 18:09:42', 1.40808099999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7707, '2020-04-17 18:09:42', 6, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7708, '2020-04-17 18:09:42', 9, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7709, '2020-04-17 18:09:42', 91, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7710, '2020-04-17 18:09:42', 1.689697, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7711, '2020-04-17 18:09:42', 4, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7712, '2020-04-17 18:09:42', 8, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7713, '2020-04-17 18:09:42', 82, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7714, '2020-04-17 18:09:42', 1.40808099999999992, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7715, '2020-04-17 18:09:42', 5, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7716, '2020-04-17 18:09:42', 8, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7717, '2020-04-17 18:09:42', 102, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7718, '2020-04-17 18:09:42', 1.40808099999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7719, '2020-04-17 18:09:42', 6, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7720, '2020-04-17 18:09:42', 9, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7721, '2020-04-17 18:09:42', 91, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7722, '2020-04-17 18:09:42', 1.689697, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7723, '2020-04-17 18:09:42', 5, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7724, '2020-04-17 18:09:42', 10, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7725, '2020-04-17 18:09:42', 116, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7726, '2020-04-17 18:09:42', 1.689697, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7727, '2020-04-17 18:09:42', 5, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7728, '2020-04-17 18:09:42', 8, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7729, '2020-04-17 18:09:42', 102, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7730, '2020-04-17 18:09:42', 1.40808099999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7731, '2020-04-17 18:09:43', 6, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7732, '2020-04-17 18:09:43', 9, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7733, '2020-04-17 18:09:43', 91, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7734, '2020-04-17 18:09:43', 1.689697, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7735, '2020-04-17 18:09:43', 5, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7736, '2020-04-17 18:09:43', 10, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7737, '2020-04-17 18:09:43', 116, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7738, '2020-04-17 18:09:43', 1.689697, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7739, '2020-04-17 18:09:43', 6, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7740, '2020-04-17 18:09:43', 10, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7741, '2020-04-17 18:09:43', 86, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7742, '2020-04-17 18:09:43', 1.689697, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7743, '2020-04-17 18:09:43', 6, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7744, '2020-04-17 18:09:43', 11, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7745, '2020-04-17 18:09:43', 116, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7746, '2020-04-17 18:09:43', 1.97131300000000009, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7747, '2020-04-17 18:09:43', 5, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7748, '2020-04-17 18:09:43', 10, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7749, '2020-04-17 18:09:43', 116, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7750, '2020-04-17 18:09:43', 1.689697, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7751, '2020-04-17 18:09:43', 6, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7752, '2020-04-17 18:09:43', 10, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7753, '2020-04-17 18:09:43', 86, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7754, '2020-04-17 18:09:43', 1.689697, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7755, '2020-04-17 18:09:43', 6, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7756, '2020-04-17 18:09:43', 11, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7757, '2020-04-17 18:09:43', 116, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7758, '2020-04-17 18:09:43', 1.97131300000000009, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7759, '2020-04-17 18:09:43', 7, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7760, '2020-04-17 18:09:43', 11, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7761, '2020-04-17 18:09:43', 109, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7762, '2020-04-17 18:09:43', 1.97131300000000009, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7763, '2020-04-17 18:09:43', 6, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7764, '2020-04-17 18:09:43', 10, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7765, '2020-04-17 18:09:43', 86, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7766, '2020-04-17 18:09:43', 1.689697, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7767, '2020-04-17 18:09:44', 6, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7768, '2020-04-17 18:09:44', 11, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7769, '2020-04-17 18:09:44', 116, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7770, '2020-04-17 18:09:44', 1.97131300000000009, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7771, '2020-04-17 18:09:44', 7, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7772, '2020-04-17 18:09:44', 11, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7773, '2020-04-17 18:09:44', 109, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7774, '2020-04-17 18:09:44', 1.97131300000000009, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7775, '2020-04-17 18:09:44', 7, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7776, '2020-04-17 18:09:44', 11, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7777, '2020-04-17 18:09:44', 114, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7778, '2020-04-17 18:09:44', 1.97131300000000009, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7779, '2020-04-17 18:09:44', 7, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7780, '2020-04-17 18:09:44', 12, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7781, '2020-04-17 18:09:44', 86, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7782, '2020-04-17 18:09:44', 1.97131300000000009, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7783, '2020-04-17 18:09:44', 7, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7784, '2020-04-17 18:09:44', 11, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7785, '2020-04-17 18:09:44', 109, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7786, '2020-04-17 18:09:44', 1.97131300000000009, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7787, '2020-04-17 18:09:44', 7, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7788, '2020-04-17 18:09:44', 11, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7789, '2020-04-17 18:09:44', 114, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7790, '2020-04-17 18:09:44', 1.97131300000000009, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7791, '2020-04-17 18:09:44', 7, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7792, '2020-04-17 18:09:44', 12, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7793, '2020-04-17 18:09:44', 86, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7794, '2020-04-17 18:09:44', 1.97131300000000009, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7795, '2020-04-17 18:09:44', 7, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7796, '2020-04-17 18:09:44', 13, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7797, '2020-04-17 18:09:44', 82, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7798, '2020-04-17 18:09:44', 2.2529300000000001, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7799, '2020-04-17 18:09:44', 7, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7800, '2020-04-17 18:09:44', 11, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7801, '2020-04-17 18:09:44', 114, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7802, '2020-04-17 18:09:44', 1.97131300000000009, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7803, '2020-04-17 18:09:45', 7, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7804, '2020-04-17 18:09:45', 12, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7805, '2020-04-17 18:09:45', 86, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7806, '2020-04-17 18:09:45', 1.97131300000000009, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7807, '2020-04-17 18:09:45', 7, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7808, '2020-04-17 18:09:45', 13, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7809, '2020-04-17 18:09:45', 82, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7810, '2020-04-17 18:09:45', 2.2529300000000001, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7811, '2020-04-17 18:09:45', 8, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7812, '2020-04-17 18:09:45', 14, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7813, '2020-04-17 18:09:45', 89, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7814, '2020-04-17 18:09:45', 2.2529300000000001, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7815, '2020-04-17 18:09:45', 8, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7816, '2020-04-17 18:09:45', 14, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7817, '2020-04-17 18:09:45', 91, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7818, '2020-04-17 18:09:45', 2.2529300000000001, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7819, '2020-04-17 18:09:45', 7, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7820, '2020-04-17 18:09:45', 13, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7821, '2020-04-17 18:09:45', 82, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7822, '2020-04-17 18:09:45', 2.2529300000000001, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7823, '2020-04-17 18:09:45', 8, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7824, '2020-04-17 18:09:45', 14, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7825, '2020-04-17 18:09:45', 89, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7826, '2020-04-17 18:09:45', 2.2529300000000001, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7827, '2020-04-17 18:09:45', 8, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7828, '2020-04-17 18:09:45', 14, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7829, '2020-04-17 18:09:45', 91, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7830, '2020-04-17 18:09:45', 2.2529300000000001, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7831, '2020-04-17 18:09:45', 9, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7832, '2020-04-17 18:09:45', 15, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7833, '2020-04-17 18:09:45', 84, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7834, '2020-04-17 18:09:45', 2.53454600000000019, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7835, '2020-04-17 18:09:45', 8, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7836, '2020-04-17 18:09:45', 14, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7837, '2020-04-17 18:09:45', 89, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7838, '2020-04-17 18:09:45', 2.2529300000000001, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7839, '2020-04-17 18:09:46', 8, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7840, '2020-04-17 18:09:46', 14, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7841, '2020-04-17 18:09:46', 91, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7842, '2020-04-17 18:09:46', 2.2529300000000001, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7843, '2020-04-17 18:09:46', 9, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7844, '2020-04-17 18:09:46', 15, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7845, '2020-04-17 18:09:46', 84, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7846, '2020-04-17 18:09:46', 2.53454600000000019, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7847, '2020-04-17 18:09:46', 8, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7848, '2020-04-17 18:09:46', 15, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7849, '2020-04-17 18:09:46', 86, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7850, '2020-04-17 18:09:46', 2.53454600000000019, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7851, '2020-04-17 18:09:46', 9, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7852, '2020-04-17 18:09:46', 15, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7853, '2020-04-17 18:09:46', 89, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7854, '2020-04-17 18:09:46', 2.53454600000000019, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7855, '2020-04-17 18:09:46', 9, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7856, '2020-04-17 18:09:46', 15, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7857, '2020-04-17 18:09:46', 84, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7858, '2020-04-17 18:09:46', 2.53454600000000019, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7859, '2020-04-17 18:09:46', 8, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7860, '2020-04-17 18:09:46', 15, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7861, '2020-04-17 18:09:46', 86, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7862, '2020-04-17 18:09:46', 2.53454600000000019, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7863, '2020-04-17 18:09:46', 9, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7864, '2020-04-17 18:09:46', 15, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7865, '2020-04-17 18:09:46', 89, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7866, '2020-04-17 18:09:46', 2.53454600000000019, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7867, '2020-04-17 18:09:46', 10, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7868, '2020-04-17 18:09:46', 15, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7869, '2020-04-17 18:09:46', 100, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7870, '2020-04-17 18:09:46', 2.53454600000000019, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7871, '2020-04-17 18:09:46', 8, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7872, '2020-04-17 18:09:46', 15, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7873, '2020-04-17 18:09:46', 86, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7874, '2020-04-17 18:09:46', 2.53454600000000019, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7875, '2020-04-17 18:09:47', 9, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7876, '2020-04-17 18:09:47', 15, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7877, '2020-04-17 18:09:47', 89, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7878, '2020-04-17 18:09:47', 2.53454600000000019, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7879, '2020-04-17 18:09:47', 10, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7880, '2020-04-17 18:09:47', 15, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7881, '2020-04-17 18:09:47', 100, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7882, '2020-04-17 18:09:47', 2.53454600000000019, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7883, '2020-04-17 18:09:47', 10, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7884, '2020-04-17 18:09:47', 16, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7885, '2020-04-17 18:09:47', 100, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7886, '2020-04-17 18:09:47', 2.81616199999999983, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7887, '2020-04-17 18:09:47', 10, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7888, '2020-04-17 18:09:47', 17, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7889, '2020-04-17 18:09:47', 112, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7890, '2020-04-17 18:09:47', 2.81616199999999983, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7891, '2020-04-17 18:09:47', 10, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7892, '2020-04-17 18:09:47', 15, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7893, '2020-04-17 18:09:47', 100, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7894, '2020-04-17 18:09:47', 2.53454600000000019, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7895, '2020-04-17 18:09:47', 10, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7896, '2020-04-17 18:09:47', 16, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7897, '2020-04-17 18:09:47', 100, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7898, '2020-04-17 18:09:47', 2.81616199999999983, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7899, '2020-04-17 18:09:47', 10, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7900, '2020-04-17 18:09:47', 17, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7901, '2020-04-17 18:09:47', 112, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7902, '2020-04-17 18:09:47', 2.81616199999999983, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7903, '2020-04-17 18:09:47', 11, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7904, '2020-04-17 18:09:47', 18, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7905, '2020-04-17 18:09:47', 116, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7906, '2020-04-17 18:09:47', 2.81616199999999983, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7907, '2020-04-17 18:09:47', 10, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7908, '2020-04-17 18:09:47', 16, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7909, '2020-04-17 18:09:47', 100, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7910, '2020-04-17 18:09:47', 2.81616199999999983, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7911, '2020-04-17 18:09:48', 10, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7912, '2020-04-17 18:09:48', 17, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7913, '2020-04-17 18:09:48', 112, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7914, '2020-04-17 18:09:48', 2.81616199999999983, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7915, '2020-04-17 18:09:48', 11, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7916, '2020-04-17 18:09:48', 18, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7917, '2020-04-17 18:09:48', 116, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7918, '2020-04-17 18:09:48', 2.81616199999999983, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7919, '2020-04-17 18:09:48', 11, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7920, '2020-04-17 18:09:48', 18, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7921, '2020-04-17 18:09:48', 107, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7922, '2020-04-17 18:09:48', 2.81616199999999983, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7923, '2020-04-17 18:09:48', 11, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7924, '2020-04-17 18:09:48', 19, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7925, '2020-04-17 18:09:48', 114, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7926, '2020-04-17 18:09:48', 3.09777799999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7927, '2020-04-17 18:09:48', 11, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7928, '2020-04-17 18:09:48', 18, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7929, '2020-04-17 18:09:48', 116, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7930, '2020-04-17 18:09:48', 2.81616199999999983, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7931, '2020-04-17 18:09:48', 11, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7932, '2020-04-17 18:09:48', 18, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7933, '2020-04-17 18:09:48', 107, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7934, '2020-04-17 18:09:48', 2.81616199999999983, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7935, '2020-04-17 18:09:48', 11, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7936, '2020-04-17 18:09:48', 19, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7937, '2020-04-17 18:09:48', 114, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7938, '2020-04-17 18:09:48', 3.09777799999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7939, '2020-04-17 18:09:48', 12, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7940, '2020-04-17 18:09:48', 19, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7941, '2020-04-17 18:09:48', 114, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7942, '2020-04-17 18:09:48', 3.09777799999999992, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7943, '2020-04-17 18:09:48', 11, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7944, '2020-04-17 18:09:48', 18, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7945, '2020-04-17 18:09:48', 107, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7946, '2020-04-17 18:09:48', 2.81616199999999983, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7947, '2020-04-17 18:09:49', 11, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7948, '2020-04-17 18:09:49', 19, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7949, '2020-04-17 18:09:49', 114, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7950, '2020-04-17 18:09:49', 3.09777799999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7951, '2020-04-17 18:09:49', 12, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7952, '2020-04-17 18:09:49', 19, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7953, '2020-04-17 18:09:49', 114, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7954, '2020-04-17 18:09:49', 3.09777799999999992, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7955, '2020-04-17 18:09:49', 12, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7956, '2020-04-17 18:09:49', 19, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7957, '2020-04-17 18:09:49', 98, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7958, '2020-04-17 18:09:49', 3.09777799999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7959, '2020-04-17 18:09:49', 12, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7960, '2020-04-17 18:09:49', 19, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7961, '2020-04-17 18:09:49', 100, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7962, '2020-04-17 18:09:49', 3.09777799999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7963, '2020-04-17 18:09:49', 12, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7964, '2020-04-17 18:09:49', 19, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7965, '2020-04-17 18:09:49', 114, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7966, '2020-04-17 18:09:49', 3.09777799999999992, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7967, '2020-04-17 18:09:49', 12, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7968, '2020-04-17 18:09:49', 19, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7969, '2020-04-17 18:09:49', 98, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7970, '2020-04-17 18:09:49', 3.09777799999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7971, '2020-04-17 18:09:49', 12, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7972, '2020-04-17 18:09:49', 19, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7973, '2020-04-17 18:09:49', 100, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7974, '2020-04-17 18:09:49', 3.09777799999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7975, '2020-04-17 18:09:49', 12, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7976, '2020-04-17 18:09:49', 20, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7977, '2020-04-17 18:09:49', 96, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7978, '2020-04-17 18:09:49', 3.37939500000000015, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7979, '2020-04-17 18:09:49', 12, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7980, '2020-04-17 18:09:49', 19, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7981, '2020-04-17 18:09:49', 98, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7982, '2020-04-17 18:09:49', 3.09777799999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7983, '2020-04-17 18:09:50', 12, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7984, '2020-04-17 18:09:50', 19, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7985, '2020-04-17 18:09:50', 100, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7986, '2020-04-17 18:09:50', 3.09777799999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7987, '2020-04-17 18:09:50', 12, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (7988, '2020-04-17 18:09:50', 20, 'HUM', 3);
INSERT INTO has_test.measure VALUES (7989, '2020-04-17 18:09:50', 96, 'LUM', 3);
INSERT INTO has_test.measure VALUES (7990, '2020-04-17 18:09:50', 3.37939500000000015, 'CURR', 3);
INSERT INTO has_test.measure VALUES (7991, '2020-04-17 18:09:50', 13, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (7992, '2020-04-17 18:09:50', 20, 'HUM', 4);
INSERT INTO has_test.measure VALUES (7993, '2020-04-17 18:09:50', 93, 'LUM', 4);
INSERT INTO has_test.measure VALUES (7994, '2020-04-17 18:09:50', 3.37939500000000015, 'CURR', 4);
INSERT INTO has_test.measure VALUES (7995, '2020-04-17 18:09:50', 13, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (7996, '2020-04-17 18:09:50', 21, 'HUM', 2);
INSERT INTO has_test.measure VALUES (7997, '2020-04-17 18:09:50', 112, 'LUM', 2);
INSERT INTO has_test.measure VALUES (7998, '2020-04-17 18:09:50', 3.37939500000000015, 'CURR', 2);
INSERT INTO has_test.measure VALUES (7999, '2020-04-17 18:09:50', 12, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8000, '2020-04-17 18:09:50', 20, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8001, '2020-04-17 18:09:50', 96, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8002, '2020-04-17 18:09:50', 3.37939500000000015, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8003, '2020-04-17 18:09:50', 13, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8004, '2020-04-17 18:09:50', 20, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8005, '2020-04-17 18:09:50', 93, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8006, '2020-04-17 18:09:50', 3.37939500000000015, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8007, '2020-04-17 18:09:50', 13, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8008, '2020-04-17 18:09:50', 21, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8009, '2020-04-17 18:09:50', 112, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8010, '2020-04-17 18:09:50', 3.37939500000000015, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8011, '2020-04-17 18:09:50', 13, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8012, '2020-04-17 18:09:50', 21, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8013, '2020-04-17 18:09:50', 93, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8014, '2020-04-17 18:09:50', 3.37939500000000015, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8015, '2020-04-17 18:09:50', 13, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8016, '2020-04-17 18:09:50', 20, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8017, '2020-04-17 18:09:50', 93, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8018, '2020-04-17 18:09:50', 3.37939500000000015, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8019, '2020-04-17 18:09:51', 13, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8020, '2020-04-17 18:09:51', 21, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8021, '2020-04-17 18:09:51', 112, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8022, '2020-04-17 18:09:51', 3.37939500000000015, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8023, '2020-04-17 18:09:51', 13, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8024, '2020-04-17 18:09:51', 21, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8025, '2020-04-17 18:09:51', 93, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8026, '2020-04-17 18:09:51', 3.37939500000000015, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8027, '2020-04-17 18:09:51', 14, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8028, '2020-04-17 18:09:51', 22, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8029, '2020-04-17 18:09:51', 82, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8030, '2020-04-17 18:09:51', 3.66101099999999979, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8031, '2020-04-17 18:09:51', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8032, '2020-04-17 18:09:51', 22, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8033, '2020-04-17 18:09:51', 112, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8034, '2020-04-17 18:09:51', 3.66101099999999979, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8035, '2020-04-17 18:09:51', 13, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8036, '2020-04-17 18:09:51', 21, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8037, '2020-04-17 18:09:51', 93, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8038, '2020-04-17 18:09:51', 3.37939500000000015, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8039, '2020-04-17 18:09:51', 14, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8040, '2020-04-17 18:09:51', 22, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8041, '2020-04-17 18:09:51', 82, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8042, '2020-04-17 18:09:51', 3.66101099999999979, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8043, '2020-04-17 18:09:51', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8044, '2020-04-17 18:09:51', 22, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8045, '2020-04-17 18:09:51', 112, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8046, '2020-04-17 18:09:51', 3.66101099999999979, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8047, '2020-04-17 18:09:51', 14, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8048, '2020-04-17 18:09:51', 22, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8049, '2020-04-17 18:09:51', 119, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8050, '2020-04-17 18:09:51', 3.66101099999999979, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8051, '2020-04-17 18:09:51', 14, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8052, '2020-04-17 18:09:51', 22, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8053, '2020-04-17 18:09:51', 82, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8054, '2020-04-17 18:09:51', 3.66101099999999979, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8055, '2020-04-17 18:09:52', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8056, '2020-04-17 18:09:52', 22, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8057, '2020-04-17 18:09:52', 112, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8058, '2020-04-17 18:09:52', 3.66101099999999979, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8059, '2020-04-17 18:09:52', 14, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8060, '2020-04-17 18:09:52', 22, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8061, '2020-04-17 18:09:52', 119, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8062, '2020-04-17 18:09:52', 3.66101099999999979, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8063, '2020-04-17 18:09:52', 15, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8064, '2020-04-17 18:09:52', 23, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8065, '2020-04-17 18:09:52', 96, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8066, '2020-04-17 18:09:52', 3.66101099999999979, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8067, '2020-04-17 18:09:52', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8068, '2020-04-17 18:09:52', 24, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8069, '2020-04-17 18:09:52', 114, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8070, '2020-04-17 18:09:52', 3.66101099999999979, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8071, '2020-04-17 18:09:52', 14, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8072, '2020-04-17 18:09:52', 22, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8073, '2020-04-17 18:09:52', 119, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8074, '2020-04-17 18:09:52', 3.66101099999999979, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8075, '2020-04-17 18:09:52', 15, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8076, '2020-04-17 18:09:52', 23, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8077, '2020-04-17 18:09:52', 96, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8078, '2020-04-17 18:09:52', 3.66101099999999979, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8079, '2020-04-17 18:09:52', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8080, '2020-04-17 18:09:52', 24, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8081, '2020-04-17 18:09:52', 114, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8082, '2020-04-17 18:09:52', 3.66101099999999979, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8083, '2020-04-17 18:09:52', 15, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8084, '2020-04-17 18:09:52', 23, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8085, '2020-04-17 18:09:52', 114, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8086, '2020-04-17 18:09:52', 3.94262699999999988, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8087, '2020-04-17 18:09:52', 15, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8088, '2020-04-17 18:09:52', 23, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8089, '2020-04-17 18:09:52', 96, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8090, '2020-04-17 18:09:52', 3.66101099999999979, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8091, '2020-04-17 18:09:53', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8092, '2020-04-17 18:09:53', 24, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8093, '2020-04-17 18:09:53', 114, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8094, '2020-04-17 18:09:53', 3.66101099999999979, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8095, '2020-04-17 18:09:53', 15, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8096, '2020-04-17 18:09:53', 23, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8097, '2020-04-17 18:09:53', 114, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8098, '2020-04-17 18:09:53', 3.94262699999999988, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8099, '2020-04-17 18:09:53', 15, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8100, '2020-04-17 18:09:53', 24, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8101, '2020-04-17 18:09:53', 102, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8102, '2020-04-17 18:09:53', 3.94262699999999988, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8103, '2020-04-17 18:09:53', 15, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8104, '2020-04-17 18:09:53', 25, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8105, '2020-04-17 18:09:53', 107, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8106, '2020-04-17 18:09:53', 3.94262699999999988, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8107, '2020-04-17 18:09:53', 15, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8108, '2020-04-17 18:09:53', 23, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8109, '2020-04-17 18:09:53', 114, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8110, '2020-04-17 18:09:53', 3.94262699999999988, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8111, '2020-04-17 18:09:53', 15, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8112, '2020-04-17 18:09:53', 24, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8113, '2020-04-17 18:09:53', 102, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8114, '2020-04-17 18:09:53', 3.94262699999999988, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8115, '2020-04-17 18:09:53', 15, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8116, '2020-04-17 18:09:53', 25, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8117, '2020-04-17 18:09:53', 107, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8118, '2020-04-17 18:09:53', 3.94262699999999988, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8119, '2020-04-17 18:09:53', 16, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8120, '2020-04-17 18:09:53', 25, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8121, '2020-04-17 18:09:53', 89, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8122, '2020-04-17 18:09:53', 3.94262699999999988, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8123, '2020-04-17 18:09:53', 15, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8124, '2020-04-17 18:09:53', 24, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8125, '2020-04-17 18:09:53', 102, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8126, '2020-04-17 18:09:53', 3.94262699999999988, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8127, '2020-04-17 18:09:54', 15, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8128, '2020-04-17 18:09:54', 25, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8129, '2020-04-17 18:09:54', 107, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8130, '2020-04-17 18:09:54', 3.94262699999999988, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8131, '2020-04-17 18:09:54', 16, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8132, '2020-04-17 18:09:54', 25, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8133, '2020-04-17 18:09:54', 89, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8134, '2020-04-17 18:09:54', 3.94262699999999988, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8135, '2020-04-17 18:09:54', 16, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8136, '2020-04-17 18:09:54', 25, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8137, '2020-04-17 18:09:54', 93, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8138, '2020-04-17 18:09:54', 3.94262699999999988, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8139, '2020-04-17 18:09:54', 16, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8140, '2020-04-17 18:09:54', 25, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8141, '2020-04-17 18:09:54', 109, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8142, '2020-04-17 18:09:54', 4.22424300000000041, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8143, '2020-04-17 18:09:54', 16, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8144, '2020-04-17 18:09:54', 25, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8145, '2020-04-17 18:09:54', 89, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8146, '2020-04-17 18:09:54', 3.94262699999999988, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8147, '2020-04-17 18:09:54', 16, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8148, '2020-04-17 18:09:54', 25, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8149, '2020-04-17 18:09:54', 93, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8150, '2020-04-17 18:09:54', 3.94262699999999988, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8151, '2020-04-17 18:09:54', 16, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8152, '2020-04-17 18:09:54', 25, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8153, '2020-04-17 18:09:54', 109, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8154, '2020-04-17 18:09:54', 4.22424300000000041, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8155, '2020-04-17 18:09:54', 16, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8156, '2020-04-17 18:09:54', 25, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8157, '2020-04-17 18:09:54', 98, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8158, '2020-04-17 18:09:54', 4.22424300000000041, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8159, '2020-04-17 18:09:54', 16, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8160, '2020-04-17 18:09:54', 25, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8161, '2020-04-17 18:09:54', 93, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8162, '2020-04-17 18:09:54', 3.94262699999999988, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8163, '2020-04-17 18:09:55', 16, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8164, '2020-04-17 18:09:55', 25, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8165, '2020-04-17 18:09:55', 109, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8166, '2020-04-17 18:09:55', 4.22424300000000041, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8167, '2020-04-17 18:09:55', 16, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8168, '2020-04-17 18:09:55', 25, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8169, '2020-04-17 18:09:55', 98, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8170, '2020-04-17 18:09:55', 4.22424300000000041, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8171, '2020-04-17 18:09:55', 16, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8172, '2020-04-17 18:09:55', 26, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8173, '2020-04-17 18:09:55', 84, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8174, '2020-04-17 18:09:55', 4.22424300000000041, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8175, '2020-04-17 18:09:55', 16, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8176, '2020-04-17 18:09:55', 27, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8177, '2020-04-17 18:09:55', 119, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8178, '2020-04-17 18:09:55', 4.22424300000000041, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8179, '2020-04-17 18:09:55', 16, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8180, '2020-04-17 18:09:55', 25, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8181, '2020-04-17 18:09:55', 98, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8182, '2020-04-17 18:09:55', 4.22424300000000041, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8183, '2020-04-17 18:09:55', 16, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8184, '2020-04-17 18:09:55', 26, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8185, '2020-04-17 18:09:55', 84, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8186, '2020-04-17 18:09:55', 4.22424300000000041, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8187, '2020-04-17 18:09:55', 16, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8188, '2020-04-17 18:09:55', 27, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8189, '2020-04-17 18:09:55', 119, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8190, '2020-04-17 18:09:55', 4.22424300000000041, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8191, '2020-04-17 18:09:55', 16, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8192, '2020-04-17 18:09:55', 26, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8193, '2020-04-17 18:09:55', 116, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8194, '2020-04-17 18:09:55', 4.22424300000000041, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8195, '2020-04-17 18:09:55', 16, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8196, '2020-04-17 18:09:55', 26, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8197, '2020-04-17 18:09:55', 84, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8198, '2020-04-17 18:09:55', 4.22424300000000041, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8199, '2020-04-17 18:09:56', 16, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8200, '2020-04-17 18:09:56', 27, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8201, '2020-04-17 18:09:56', 119, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8202, '2020-04-17 18:09:56', 4.22424300000000041, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8203, '2020-04-17 18:09:56', 16, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8204, '2020-04-17 18:09:56', 26, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8205, '2020-04-17 18:09:56', 116, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8206, '2020-04-17 18:09:56', 4.22424300000000041, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8207, '2020-04-17 18:09:56', 17, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8208, '2020-04-17 18:09:56', 27, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8209, '2020-04-17 18:09:56', 2483, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8210, '2020-04-17 18:09:56', 4.22424300000000041, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8211, '2020-04-17 18:09:56', 17, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8212, '2020-04-17 18:09:56', 27, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8213, '2020-04-17 18:09:56', 2481, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8214, '2020-04-17 18:09:56', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8215, '2020-04-17 18:09:56', 16, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8216, '2020-04-17 18:09:56', 26, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8217, '2020-04-17 18:09:56', 116, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8218, '2020-04-17 18:09:56', 4.22424300000000041, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8219, '2020-04-17 18:09:56', 17, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8220, '2020-04-17 18:09:56', 27, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8221, '2020-04-17 18:09:56', 2483, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8222, '2020-04-17 18:09:56', 4.22424300000000041, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8223, '2020-04-17 18:09:56', 17, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8224, '2020-04-17 18:09:56', 27, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8225, '2020-04-17 18:09:56', 2481, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8226, '2020-04-17 18:09:56', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8227, '2020-04-17 18:09:56', 17, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8228, '2020-04-17 18:09:56', 27, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8229, '2020-04-17 18:09:56', 2515, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8230, '2020-04-17 18:09:56', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8231, '2020-04-17 18:09:56', 17, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8232, '2020-04-17 18:09:56', 27, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8233, '2020-04-17 18:09:56', 2483, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8234, '2020-04-17 18:09:56', 4.22424300000000041, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8235, '2020-04-17 18:09:57', 17, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8236, '2020-04-17 18:09:57', 27, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8237, '2020-04-17 18:09:57', 2481, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8238, '2020-04-17 18:09:57', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8239, '2020-04-17 18:09:57', 17, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8240, '2020-04-17 18:09:57', 27, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8241, '2020-04-17 18:09:57', 2515, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8242, '2020-04-17 18:09:57', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8243, '2020-04-17 18:09:57', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8244, '2020-04-17 18:09:57', 28, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8245, '2020-04-17 18:09:57', 2490, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8246, '2020-04-17 18:09:57', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8247, '2020-04-17 18:09:57', 17, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8248, '2020-04-17 18:09:57', 28, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8249, '2020-04-17 18:09:57', 2508, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8250, '2020-04-17 18:09:57', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8251, '2020-04-17 18:09:57', 17, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8252, '2020-04-17 18:09:57', 27, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8253, '2020-04-17 18:09:57', 2515, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8254, '2020-04-17 18:09:57', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8255, '2020-04-17 18:09:57', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8256, '2020-04-17 18:09:57', 28, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8257, '2020-04-17 18:09:57', 2490, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8258, '2020-04-17 18:09:57', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8259, '2020-04-17 18:09:57', 17, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8260, '2020-04-17 18:09:57', 28, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8261, '2020-04-17 18:09:57', 2508, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8262, '2020-04-17 18:09:57', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8263, '2020-04-17 18:09:57', 17, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8264, '2020-04-17 18:09:57', 28, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8265, '2020-04-17 18:09:57', 2490, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8266, '2020-04-17 18:09:57', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8267, '2020-04-17 18:09:57', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8268, '2020-04-17 18:09:57', 28, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8269, '2020-04-17 18:09:57', 2490, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8270, '2020-04-17 18:09:57', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8271, '2020-04-17 18:09:58', 17, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8272, '2020-04-17 18:09:58', 28, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8273, '2020-04-17 18:09:58', 2508, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8274, '2020-04-17 18:09:58', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8275, '2020-04-17 18:09:58', 17, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8276, '2020-04-17 18:09:58', 28, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8277, '2020-04-17 18:09:58', 2490, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8278, '2020-04-17 18:09:58', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8279, '2020-04-17 18:09:58', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8280, '2020-04-17 18:09:58', 28, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8281, '2020-04-17 18:09:58', 2478, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8282, '2020-04-17 18:09:58', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8283, '2020-04-17 18:09:58', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8284, '2020-04-17 18:09:58', 29, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8285, '2020-04-17 18:09:58', 2494, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8286, '2020-04-17 18:09:58', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8287, '2020-04-17 18:09:58', 17, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8288, '2020-04-17 18:09:58', 28, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8289, '2020-04-17 18:09:58', 2490, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8290, '2020-04-17 18:09:58', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8291, '2020-04-17 18:09:58', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8292, '2020-04-17 18:09:58', 28, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8293, '2020-04-17 18:09:58', 2478, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8294, '2020-04-17 18:09:58', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8295, '2020-04-17 18:09:58', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8296, '2020-04-17 18:09:58', 29, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8297, '2020-04-17 18:09:58', 2494, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8298, '2020-04-17 18:09:58', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8299, '2020-04-17 18:09:58', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8300, '2020-04-17 18:09:58', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8301, '2020-04-17 18:09:58', 2487, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8302, '2020-04-17 18:09:58', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8303, '2020-04-17 18:09:58', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8304, '2020-04-17 18:09:58', 28, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8305, '2020-04-17 18:09:58', 2478, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8306, '2020-04-17 18:09:58', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8307, '2020-04-17 18:09:59', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8308, '2020-04-17 18:09:59', 29, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8309, '2020-04-17 18:09:59', 2494, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8310, '2020-04-17 18:09:59', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8311, '2020-04-17 18:09:59', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8312, '2020-04-17 18:09:59', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8313, '2020-04-17 18:09:59', 2487, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8314, '2020-04-17 18:09:59', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8315, '2020-04-17 18:09:59', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8316, '2020-04-17 18:09:59', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8317, '2020-04-17 18:09:59', 2490, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8318, '2020-04-17 18:09:59', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8319, '2020-04-17 18:09:59', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8320, '2020-04-17 18:09:59', 28, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8321, '2020-04-17 18:09:59', 2494, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8322, '2020-04-17 18:09:59', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8323, '2020-04-17 18:09:59', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8324, '2020-04-17 18:09:59', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8325, '2020-04-17 18:09:59', 2487, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8326, '2020-04-17 18:09:59', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8327, '2020-04-17 18:09:59', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8328, '2020-04-17 18:09:59', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8329, '2020-04-17 18:09:59', 2490, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8330, '2020-04-17 18:09:59', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8331, '2020-04-17 18:09:59', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8332, '2020-04-17 18:09:59', 28, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8333, '2020-04-17 18:09:59', 2494, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8334, '2020-04-17 18:09:59', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8335, '2020-04-17 18:09:59', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8336, '2020-04-17 18:09:59', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8337, '2020-04-17 18:09:59', 2499, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8338, '2020-04-17 18:09:59', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8339, '2020-04-17 18:09:59', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8340, '2020-04-17 18:09:59', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8341, '2020-04-17 18:09:59', 2490, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8342, '2020-04-17 18:09:59', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8343, '2020-04-17 18:10:00', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8344, '2020-04-17 18:10:00', 28, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8345, '2020-04-17 18:10:00', 2494, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8346, '2020-04-17 18:10:00', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8347, '2020-04-17 18:10:00', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8348, '2020-04-17 18:10:00', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8349, '2020-04-17 18:10:00', 2499, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8350, '2020-04-17 18:10:00', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8351, '2020-04-17 18:10:00', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8352, '2020-04-17 18:10:00', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8353, '2020-04-17 18:10:00', 2483, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8354, '2020-04-17 18:10:00', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8355, '2020-04-17 18:10:00', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8356, '2020-04-17 18:10:00', 29, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8357, '2020-04-17 18:10:00', 2510, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8358, '2020-04-17 18:10:00', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8359, '2020-04-17 18:10:00', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8360, '2020-04-17 18:10:00', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8361, '2020-04-17 18:10:00', 2499, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8362, '2020-04-17 18:10:00', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8363, '2020-04-17 18:10:00', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8364, '2020-04-17 18:10:00', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8365, '2020-04-17 18:10:00', 2483, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8366, '2020-04-17 18:10:00', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8367, '2020-04-17 18:10:01', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8368, '2020-04-17 18:10:01', 29, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8369, '2020-04-17 18:10:01', 2510, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8370, '2020-04-17 18:10:01', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8371, '2020-04-17 18:10:01', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8372, '2020-04-17 18:10:01', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8373, '2020-04-17 18:10:01', 2501, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8374, '2020-04-17 18:10:01', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8375, '2020-04-17 18:10:01', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8376, '2020-04-17 18:10:01', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8377, '2020-04-17 18:10:01', 2483, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8378, '2020-04-17 18:10:01', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8379, '2020-04-17 18:10:01', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8380, '2020-04-17 18:10:01', 29, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8381, '2020-04-17 18:10:01', 2510, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8382, '2020-04-17 18:10:01', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8383, '2020-04-17 18:10:01', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8384, '2020-04-17 18:10:01', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8385, '2020-04-17 18:10:01', 2501, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8386, '2020-04-17 18:10:01', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8387, '2020-04-17 18:10:01', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8388, '2020-04-17 18:10:01', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8389, '2020-04-17 18:10:01', 2510, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8390, '2020-04-17 18:10:01', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8391, '2020-04-17 18:10:01', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8392, '2020-04-17 18:10:01', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8393, '2020-04-17 18:10:01', 2483, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8394, '2020-04-17 18:10:01', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8395, '2020-04-17 18:10:01', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8396, '2020-04-17 18:10:01', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8397, '2020-04-17 18:10:01', 2501, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8398, '2020-04-17 18:10:01', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8399, '2020-04-17 18:10:01', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8400, '2020-04-17 18:10:01', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8401, '2020-04-17 18:10:01', 2510, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8402, '2020-04-17 18:10:01', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8403, '2020-04-17 18:10:02', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8404, '2020-04-17 18:10:02', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8405, '2020-04-17 18:10:02', 2483, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8406, '2020-04-17 18:10:02', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8407, '2020-04-17 18:10:02', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8408, '2020-04-17 18:10:02', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8409, '2020-04-17 18:10:02', 2494, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8410, '2020-04-17 18:10:02', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8411, '2020-04-17 18:10:02', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8412, '2020-04-17 18:10:02', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8413, '2020-04-17 18:10:02', 2510, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8414, '2020-04-17 18:10:02', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8415, '2020-04-17 18:10:02', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8416, '2020-04-17 18:10:02', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8417, '2020-04-17 18:10:02', 2483, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8418, '2020-04-17 18:10:02', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8419, '2020-04-17 18:10:02', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8420, '2020-04-17 18:10:02', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8421, '2020-04-17 18:10:02', 2494, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8422, '2020-04-17 18:10:02', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8423, '2020-04-17 18:10:02', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8424, '2020-04-17 18:10:02', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8425, '2020-04-17 18:10:02', 2490, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8426, '2020-04-17 18:10:02', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8427, '2020-04-17 18:10:02', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8428, '2020-04-17 18:10:02', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8429, '2020-04-17 18:10:02', 2497, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8430, '2020-04-17 18:10:02', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8431, '2020-04-17 18:10:02', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8432, '2020-04-17 18:10:02', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8433, '2020-04-17 18:10:02', 2494, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8434, '2020-04-17 18:10:02', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8435, '2020-04-17 18:10:02', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8436, '2020-04-17 18:10:02', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8437, '2020-04-17 18:10:02', 2490, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8438, '2020-04-17 18:10:02', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8439, '2020-04-17 18:10:03', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8440, '2020-04-17 18:10:03', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8441, '2020-04-17 18:10:03', 2497, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8442, '2020-04-17 18:10:03', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8443, '2020-04-17 18:10:03', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8444, '2020-04-17 18:10:03', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8445, '2020-04-17 18:10:03', 2497, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8446, '2020-04-17 18:10:03', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8447, '2020-04-17 18:10:03', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8448, '2020-04-17 18:10:03', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8449, '2020-04-17 18:10:03', 2490, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8450, '2020-04-17 18:10:03', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8451, '2020-04-17 18:10:03', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8452, '2020-04-17 18:10:03', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8453, '2020-04-17 18:10:03', 2497, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8454, '2020-04-17 18:10:03', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8455, '2020-04-17 18:10:03', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8456, '2020-04-17 18:10:03', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8457, '2020-04-17 18:10:03', 2497, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8458, '2020-04-17 18:10:03', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8459, '2020-04-17 18:10:03', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8460, '2020-04-17 18:10:03', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8461, '2020-04-17 18:10:03', 2510, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8462, '2020-04-17 18:10:03', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8463, '2020-04-17 18:10:03', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8464, '2020-04-17 18:10:03', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8465, '2020-04-17 18:10:03', 2506, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8466, '2020-04-17 18:10:03', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8467, '2020-04-17 18:10:03', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8468, '2020-04-17 18:10:03', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8469, '2020-04-17 18:10:03', 2497, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8470, '2020-04-17 18:10:03', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8471, '2020-04-17 18:10:03', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8472, '2020-04-17 18:10:03', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8473, '2020-04-17 18:10:03', 2510, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8474, '2020-04-17 18:10:03', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8475, '2020-04-17 18:10:04', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8476, '2020-04-17 18:10:04', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8477, '2020-04-17 18:10:04', 2506, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8478, '2020-04-17 18:10:04', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8479, '2020-04-17 18:10:04', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8480, '2020-04-17 18:10:04', 31, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8481, '2020-04-17 18:10:04', 2517, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8482, '2020-04-17 18:10:04', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8483, '2020-04-17 18:10:04', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8484, '2020-04-17 18:10:04', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8485, '2020-04-17 18:10:04', 2510, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8486, '2020-04-17 18:10:04', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8487, '2020-04-17 18:10:04', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8488, '2020-04-17 18:10:04', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8489, '2020-04-17 18:10:04', 2506, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8490, '2020-04-17 18:10:04', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8491, '2020-04-17 18:10:04', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8492, '2020-04-17 18:10:04', 31, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8493, '2020-04-17 18:10:04', 2517, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8494, '2020-04-17 18:10:04', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8495, '2020-04-17 18:10:04', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8496, '2020-04-17 18:10:04', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8497, '2020-04-17 18:10:04', 2490, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8498, '2020-04-17 18:10:04', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8499, '2020-04-17 18:10:04', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8500, '2020-04-17 18:10:04', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8501, '2020-04-17 18:10:04', 2490, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8502, '2020-04-17 18:10:04', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8503, '2020-04-17 18:10:04', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8504, '2020-04-17 18:10:04', 31, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8505, '2020-04-17 18:10:04', 2517, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8506, '2020-04-17 18:10:04', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8507, '2020-04-17 18:10:04', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8508, '2020-04-17 18:10:04', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8509, '2020-04-17 18:10:04', 2490, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8510, '2020-04-17 18:10:04', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8511, '2020-04-17 18:10:05', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8512, '2020-04-17 18:10:05', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8513, '2020-04-17 18:10:05', 2490, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8514, '2020-04-17 18:10:05', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8515, '2020-04-17 18:10:05', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8516, '2020-04-17 18:10:05', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8517, '2020-04-17 18:10:05', 2481, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8518, '2020-04-17 18:10:05', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8519, '2020-04-17 18:10:05', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8520, '2020-04-17 18:10:05', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8521, '2020-04-17 18:10:05', 2490, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8522, '2020-04-17 18:10:05', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8523, '2020-04-17 18:10:05', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8524, '2020-04-17 18:10:05', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8525, '2020-04-17 18:10:05', 2490, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8526, '2020-04-17 18:10:05', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8527, '2020-04-17 18:10:05', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8528, '2020-04-17 18:10:05', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8529, '2020-04-17 18:10:05', 2481, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8530, '2020-04-17 18:10:05', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8531, '2020-04-17 18:10:05', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8532, '2020-04-17 18:10:05', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8533, '2020-04-17 18:10:05', 2517, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8534, '2020-04-17 18:10:05', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8535, '2020-04-17 18:10:05', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8536, '2020-04-17 18:10:05', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8537, '2020-04-17 18:10:05', 2485, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8538, '2020-04-17 18:10:05', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8539, '2020-04-17 18:10:05', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8540, '2020-04-17 18:10:05', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8541, '2020-04-17 18:10:05', 2481, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8542, '2020-04-17 18:10:05', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8543, '2020-04-17 18:10:05', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8544, '2020-04-17 18:10:05', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8545, '2020-04-17 18:10:05', 2517, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8546, '2020-04-17 18:10:05', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8547, '2020-04-17 18:10:06', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8548, '2020-04-17 18:10:06', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8549, '2020-04-17 18:10:06', 2485, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8550, '2020-04-17 18:10:06', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8551, '2020-04-17 18:10:06', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8552, '2020-04-17 18:10:06', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8553, '2020-04-17 18:10:06', 2501, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8554, '2020-04-17 18:10:06', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8555, '2020-04-17 18:10:06', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8556, '2020-04-17 18:10:06', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8557, '2020-04-17 18:10:06', 2517, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8558, '2020-04-17 18:10:06', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8559, '2020-04-17 18:10:06', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8560, '2020-04-17 18:10:06', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8561, '2020-04-17 18:10:06', 2485, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8562, '2020-04-17 18:10:06', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8563, '2020-04-17 18:10:06', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8564, '2020-04-17 18:10:06', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8565, '2020-04-17 18:10:06', 2501, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8566, '2020-04-17 18:10:06', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8567, '2020-04-17 18:10:06', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8568, '2020-04-17 18:10:06', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8569, '2020-04-17 18:10:06', 2499, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8570, '2020-04-17 18:10:06', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8571, '2020-04-17 18:10:06', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8572, '2020-04-17 18:10:06', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8573, '2020-04-17 18:10:06', 2483, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8574, '2020-04-17 18:10:06', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8575, '2020-04-17 18:10:06', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8576, '2020-04-17 18:10:06', 30, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8577, '2020-04-17 18:10:06', 2501, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8578, '2020-04-17 18:10:06', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8579, '2020-04-17 18:10:06', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8580, '2020-04-17 18:10:06', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8581, '2020-04-17 18:10:06', 2499, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8582, '2020-04-17 18:10:06', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8583, '2020-04-17 18:10:07', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8584, '2020-04-17 18:10:07', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8585, '2020-04-17 18:10:07', 2483, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8586, '2020-04-17 18:10:07', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8587, '2020-04-17 18:10:07', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8588, '2020-04-17 18:10:07', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8589, '2020-04-17 18:10:07', 2492, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8590, '2020-04-17 18:10:07', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8591, '2020-04-17 18:10:07', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8592, '2020-04-17 18:10:07', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8593, '2020-04-17 18:10:07', 2499, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8594, '2020-04-17 18:10:07', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8595, '2020-04-17 18:10:07', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8596, '2020-04-17 18:10:07', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8597, '2020-04-17 18:10:07', 2483, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8598, '2020-04-17 18:10:07', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8599, '2020-04-17 18:10:07', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8600, '2020-04-17 18:10:07', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8601, '2020-04-17 18:10:07', 2492, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8602, '2020-04-17 18:10:07', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8603, '2020-04-17 18:10:07', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8604, '2020-04-17 18:10:07', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8605, '2020-04-17 18:10:07', 2513, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8606, '2020-04-17 18:10:07', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8607, '2020-04-17 18:10:07', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8608, '2020-04-17 18:10:07', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8609, '2020-04-17 18:10:07', 2497, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8610, '2020-04-17 18:10:07', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8611, '2020-04-17 18:10:07', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8612, '2020-04-17 18:10:07', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8613, '2020-04-17 18:10:07', 2492, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8614, '2020-04-17 18:10:07', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8615, '2020-04-17 18:10:07', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8616, '2020-04-17 18:10:07', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8617, '2020-04-17 18:10:07', 2513, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8618, '2020-04-17 18:10:07', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8619, '2020-04-17 18:10:08', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8620, '2020-04-17 18:10:08', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8621, '2020-04-17 18:10:08', 2497, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8622, '2020-04-17 18:10:08', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8623, '2020-04-17 18:10:08', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8624, '2020-04-17 18:10:08', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8625, '2020-04-17 18:10:08', 2499, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8626, '2020-04-17 18:10:08', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8627, '2020-04-17 18:10:08', 19, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8628, '2020-04-17 18:10:08', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8629, '2020-04-17 18:10:08', 2513, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8630, '2020-04-17 18:10:08', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8631, '2020-04-17 18:10:08', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8632, '2020-04-17 18:10:08', 30, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8633, '2020-04-17 18:10:08', 2497, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8634, '2020-04-17 18:10:08', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8635, '2020-04-17 18:10:08', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8636, '2020-04-17 18:10:08', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8637, '2020-04-17 18:10:08', 2499, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8638, '2020-04-17 18:10:08', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8639, '2020-04-17 18:10:08', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8640, '2020-04-17 18:10:08', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8641, '2020-04-17 18:10:08', 2508, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8642, '2020-04-17 18:10:08', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8643, '2020-04-17 18:10:08', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8644, '2020-04-17 18:10:08', 29, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8645, '2020-04-17 18:10:08', 2506, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8646, '2020-04-17 18:10:08', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8647, '2020-04-17 18:10:08', 19, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8648, '2020-04-17 18:10:08', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8649, '2020-04-17 18:10:08', 2499, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8650, '2020-04-17 18:10:08', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8651, '2020-04-17 18:10:08', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8652, '2020-04-17 18:10:08', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8653, '2020-04-17 18:10:08', 2508, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8654, '2020-04-17 18:10:08', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8655, '2020-04-17 18:10:09', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8656, '2020-04-17 18:10:09', 29, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8657, '2020-04-17 18:10:09', 2506, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8658, '2020-04-17 18:10:09', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8659, '2020-04-17 18:10:09', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8660, '2020-04-17 18:10:09', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8661, '2020-04-17 18:10:09', 2490, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8662, '2020-04-17 18:10:09', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8663, '2020-04-17 18:10:09', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8664, '2020-04-17 18:10:09', 30, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8665, '2020-04-17 18:10:09', 2508, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8666, '2020-04-17 18:10:09', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8667, '2020-04-17 18:10:09', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8668, '2020-04-17 18:10:09', 29, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8669, '2020-04-17 18:10:09', 2506, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8670, '2020-04-17 18:10:09', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8671, '2020-04-17 18:10:09', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8672, '2020-04-17 18:10:09', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8673, '2020-04-17 18:10:09', 2490, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8674, '2020-04-17 18:10:09', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8675, '2020-04-17 18:10:09', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8676, '2020-04-17 18:10:09', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8677, '2020-04-17 18:10:09', 2503, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8678, '2020-04-17 18:10:09', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8679, '2020-04-17 18:10:09', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8680, '2020-04-17 18:10:09', 29, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8681, '2020-04-17 18:10:09', 2481, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8682, '2020-04-17 18:10:09', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8683, '2020-04-17 18:10:09', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8684, '2020-04-17 18:10:09', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8685, '2020-04-17 18:10:09', 2490, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8686, '2020-04-17 18:10:09', 4.78747599999999984, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8687, '2020-04-17 18:10:09', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8688, '2020-04-17 18:10:09', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8689, '2020-04-17 18:10:09', 2503, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8690, '2020-04-17 18:10:09', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8691, '2020-04-17 18:10:10', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8692, '2020-04-17 18:10:10', 29, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8693, '2020-04-17 18:10:10', 2481, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8694, '2020-04-17 18:10:10', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8695, '2020-04-17 18:10:10', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8696, '2020-04-17 18:10:10', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8697, '2020-04-17 18:10:10', 2510, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8698, '2020-04-17 18:10:10', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8699, '2020-04-17 18:10:10', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8700, '2020-04-17 18:10:10', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8701, '2020-04-17 18:10:10', 2503, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8702, '2020-04-17 18:10:10', 4.78747599999999984, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8703, '2020-04-17 18:10:10', 19, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8704, '2020-04-17 18:10:10', 29, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8705, '2020-04-17 18:10:10', 2481, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8706, '2020-04-17 18:10:10', 4.78747599999999984, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8707, '2020-04-17 18:10:10', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8708, '2020-04-17 18:10:10', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8709, '2020-04-17 18:10:10', 2510, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8710, '2020-04-17 18:10:10', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8711, '2020-04-17 18:10:10', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8712, '2020-04-17 18:10:10', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8713, '2020-04-17 18:10:10', 2501, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8714, '2020-04-17 18:10:10', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8715, '2020-04-17 18:10:10', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8716, '2020-04-17 18:10:10', 28, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8717, '2020-04-17 18:10:10', 2508, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8718, '2020-04-17 18:10:10', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8719, '2020-04-17 18:10:10', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8720, '2020-04-17 18:10:10', 29, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8721, '2020-04-17 18:10:10', 2510, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8722, '2020-04-17 18:10:10', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8723, '2020-04-17 18:10:10', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8724, '2020-04-17 18:10:10', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8725, '2020-04-17 18:10:10', 2501, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8726, '2020-04-17 18:10:10', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8727, '2020-04-17 18:10:11', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8728, '2020-04-17 18:10:11', 28, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8729, '2020-04-17 18:10:11', 2508, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8730, '2020-04-17 18:10:11', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8731, '2020-04-17 18:10:11', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8732, '2020-04-17 18:10:11', 28, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8733, '2020-04-17 18:10:11', 2490, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8734, '2020-04-17 18:10:11', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8735, '2020-04-17 18:10:11', 18, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8736, '2020-04-17 18:10:11', 29, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8737, '2020-04-17 18:10:11', 2501, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8738, '2020-04-17 18:10:11', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8739, '2020-04-17 18:10:11', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8740, '2020-04-17 18:10:11', 28, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8741, '2020-04-17 18:10:11', 2508, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8742, '2020-04-17 18:10:11', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8743, '2020-04-17 18:10:11', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8744, '2020-04-17 18:10:11', 28, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8745, '2020-04-17 18:10:11', 2490, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8746, '2020-04-17 18:10:11', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8747, '2020-04-17 18:10:11', 17, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8748, '2020-04-17 18:10:11', 28, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8749, '2020-04-17 18:10:11', 2485, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8750, '2020-04-17 18:10:11', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8751, '2020-04-17 18:10:11', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8752, '2020-04-17 18:10:11', 28, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8753, '2020-04-17 18:10:11', 2513, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8754, '2020-04-17 18:10:11', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8755, '2020-04-17 18:10:11', 18, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8756, '2020-04-17 18:10:11', 28, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8757, '2020-04-17 18:10:11', 2490, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8758, '2020-04-17 18:10:11', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8759, '2020-04-17 18:10:11', 17, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8760, '2020-04-17 18:10:11', 28, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8761, '2020-04-17 18:10:11', 2485, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8762, '2020-04-17 18:10:11', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8763, '2020-04-17 18:10:12', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8764, '2020-04-17 18:10:12', 28, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8765, '2020-04-17 18:10:12', 2513, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8766, '2020-04-17 18:10:12', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8767, '2020-04-17 18:10:12', 17, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8768, '2020-04-17 18:10:12', 28, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8769, '2020-04-17 18:10:12', 2503, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8770, '2020-04-17 18:10:12', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8771, '2020-04-17 18:10:12', 17, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8772, '2020-04-17 18:10:12', 28, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8773, '2020-04-17 18:10:12', 2485, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8774, '2020-04-17 18:10:12', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8775, '2020-04-17 18:10:12', 18, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8776, '2020-04-17 18:10:12', 28, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8777, '2020-04-17 18:10:12', 2513, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8778, '2020-04-17 18:10:12', 4.50585900000000006, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8779, '2020-04-17 18:10:12', 17, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8780, '2020-04-17 18:10:12', 28, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8781, '2020-04-17 18:10:12', 2503, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8782, '2020-04-17 18:10:12', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8783, '2020-04-17 18:10:12', 17, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8784, '2020-04-17 18:10:12', 28, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8785, '2020-04-17 18:10:12', 2483, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8786, '2020-04-17 18:10:12', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8787, '2020-04-17 18:10:12', 17, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8788, '2020-04-17 18:10:12', 27, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8789, '2020-04-17 18:10:12', 2503, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8790, '2020-04-17 18:10:12', 4.22424300000000041, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8791, '2020-04-17 18:10:12', 17, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8792, '2020-04-17 18:10:12', 28, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8793, '2020-04-17 18:10:12', 2503, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8794, '2020-04-17 18:10:12', 4.50585900000000006, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8795, '2020-04-17 18:10:12', 17, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8796, '2020-04-17 18:10:12', 28, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8797, '2020-04-17 18:10:12', 2483, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8798, '2020-04-17 18:10:12', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8799, '2020-04-17 18:10:13', 17, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8800, '2020-04-17 18:10:13', 27, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8801, '2020-04-17 18:10:13', 2503, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8802, '2020-04-17 18:10:13', 4.22424300000000041, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8803, '2020-04-17 18:10:13', 17, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8804, '2020-04-17 18:10:13', 26, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8805, '2020-04-17 18:10:13', 93, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8806, '2020-04-17 18:10:13', 4.22424300000000041, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8807, '2020-04-17 18:10:13', 17, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8808, '2020-04-17 18:10:13', 28, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8809, '2020-04-17 18:10:13', 2483, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8810, '2020-04-17 18:10:13', 4.50585900000000006, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8811, '2020-04-17 18:10:13', 17, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8812, '2020-04-17 18:10:13', 27, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8813, '2020-04-17 18:10:13', 2503, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8814, '2020-04-17 18:10:13', 4.22424300000000041, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8815, '2020-04-17 18:10:13', 17, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8816, '2020-04-17 18:10:13', 26, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8817, '2020-04-17 18:10:13', 93, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8818, '2020-04-17 18:10:13', 4.22424300000000041, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8819, '2020-04-17 18:10:13', 16, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8820, '2020-04-17 18:10:13', 26, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8821, '2020-04-17 18:10:13', 91, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8822, '2020-04-17 18:10:13', 4.22424300000000041, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8823, '2020-04-17 18:10:14', 17, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8824, '2020-04-17 18:10:14', 26, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8825, '2020-04-17 18:10:14', 96, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8826, '2020-04-17 18:10:14', 4.22424300000000041, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8827, '2020-04-17 18:10:14', 17, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8828, '2020-04-17 18:10:14', 26, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8829, '2020-04-17 18:10:14', 93, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8830, '2020-04-17 18:10:14', 4.22424300000000041, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8831, '2020-04-17 18:10:14', 16, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8832, '2020-04-17 18:10:14', 26, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8833, '2020-04-17 18:10:14', 91, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8834, '2020-04-17 18:10:14', 4.22424300000000041, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8835, '2020-04-17 18:10:14', 17, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8836, '2020-04-17 18:10:14', 26, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8837, '2020-04-17 18:10:14', 96, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8838, '2020-04-17 18:10:14', 4.22424300000000041, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8839, '2020-04-17 18:10:14', 16, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8840, '2020-04-17 18:10:14', 26, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8841, '2020-04-17 18:10:14', 80, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8842, '2020-04-17 18:10:14', 4.22424300000000041, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8843, '2020-04-17 18:10:14', 16, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8844, '2020-04-17 18:10:14', 26, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8845, '2020-04-17 18:10:14', 91, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8846, '2020-04-17 18:10:14', 4.22424300000000041, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8847, '2020-04-17 18:10:14', 17, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8848, '2020-04-17 18:10:14', 26, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8849, '2020-04-17 18:10:14', 96, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8850, '2020-04-17 18:10:14', 4.22424300000000041, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8851, '2020-04-17 18:10:14', 16, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8852, '2020-04-17 18:10:14', 26, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8853, '2020-04-17 18:10:14', 80, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8854, '2020-04-17 18:10:14', 4.22424300000000041, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8855, '2020-04-17 18:10:14', 16, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8856, '2020-04-17 18:10:14', 26, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8857, '2020-04-17 18:10:14', 91, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8858, '2020-04-17 18:10:14', 4.22424300000000041, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8859, '2020-04-17 18:10:14', 16, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8860, '2020-04-17 18:10:14', 25, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8861, '2020-04-17 18:10:14', 119, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8862, '2020-04-17 18:10:14', 3.94262699999999988, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8863, '2020-04-17 18:10:14', 16, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8864, '2020-04-17 18:10:14', 26, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8865, '2020-04-17 18:10:14', 80, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8866, '2020-04-17 18:10:14', 4.22424300000000041, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8867, '2020-04-17 18:10:14', 16, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8868, '2020-04-17 18:10:14', 26, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8869, '2020-04-17 18:10:14', 91, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8870, '2020-04-17 18:10:14', 4.22424300000000041, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8871, '2020-04-17 18:10:15', 16, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8872, '2020-04-17 18:10:15', 25, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8873, '2020-04-17 18:10:15', 119, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8874, '2020-04-17 18:10:15', 3.94262699999999988, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8875, '2020-04-17 18:10:15', 15, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8876, '2020-04-17 18:10:15', 25, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8877, '2020-04-17 18:10:15', 84, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8878, '2020-04-17 18:10:15', 3.94262699999999988, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8879, '2020-04-17 18:10:15', 16, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8880, '2020-04-17 18:10:15', 26, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8881, '2020-04-17 18:10:15', 91, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8882, '2020-04-17 18:10:15', 4.22424300000000041, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8883, '2020-04-17 18:10:15', 16, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8884, '2020-04-17 18:10:15', 25, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8885, '2020-04-17 18:10:15', 119, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8886, '2020-04-17 18:10:15', 3.94262699999999988, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8887, '2020-04-17 18:10:15', 15, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8888, '2020-04-17 18:10:15', 25, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8889, '2020-04-17 18:10:15', 84, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8890, '2020-04-17 18:10:15', 3.94262699999999988, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8891, '2020-04-17 18:10:15', 15, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8892, '2020-04-17 18:10:15', 25, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8893, '2020-04-17 18:10:15', 96, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8894, '2020-04-17 18:10:15', 3.94262699999999988, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8895, '2020-04-17 18:10:15', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8896, '2020-04-17 18:10:15', 24, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8897, '2020-04-17 18:10:15', 102, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8898, '2020-04-17 18:10:15', 3.94262699999999988, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8899, '2020-04-17 18:10:15', 15, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8900, '2020-04-17 18:10:15', 25, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8901, '2020-04-17 18:10:15', 84, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8902, '2020-04-17 18:10:15', 3.94262699999999988, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8903, '2020-04-17 18:10:15', 15, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8904, '2020-04-17 18:10:15', 25, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8905, '2020-04-17 18:10:15', 96, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8906, '2020-04-17 18:10:15', 3.94262699999999988, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8907, '2020-04-17 18:10:16', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8908, '2020-04-17 18:10:16', 24, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8909, '2020-04-17 18:10:16', 102, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8910, '2020-04-17 18:10:16', 3.94262699999999988, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8911, '2020-04-17 18:10:16', 14, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8912, '2020-04-17 18:10:16', 24, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8913, '2020-04-17 18:10:16', 109, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8914, '2020-04-17 18:10:16', 3.94262699999999988, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8915, '2020-04-17 18:10:16', 15, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8916, '2020-04-17 18:10:16', 25, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8917, '2020-04-17 18:10:16', 96, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8918, '2020-04-17 18:10:16', 3.94262699999999988, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8919, '2020-04-17 18:10:16', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8920, '2020-04-17 18:10:16', 24, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8921, '2020-04-17 18:10:16', 102, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8922, '2020-04-17 18:10:16', 3.94262699999999988, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8923, '2020-04-17 18:10:16', 14, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8924, '2020-04-17 18:10:16', 24, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8925, '2020-04-17 18:10:16', 109, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8926, '2020-04-17 18:10:16', 3.94262699999999988, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8927, '2020-04-17 18:10:16', 14, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8928, '2020-04-17 18:10:16', 24, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8929, '2020-04-17 18:10:16', 96, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8930, '2020-04-17 18:10:16', 3.66101099999999979, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8931, '2020-04-17 18:10:17', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8932, '2020-04-17 18:10:17', 22, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8933, '2020-04-17 18:10:17', 93, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8934, '2020-04-17 18:10:17', 3.66101099999999979, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8935, '2020-04-17 18:10:17', 14, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8936, '2020-04-17 18:10:17', 24, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8937, '2020-04-17 18:10:17', 109, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8938, '2020-04-17 18:10:17', 3.94262699999999988, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8939, '2020-04-17 18:10:17', 14, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8940, '2020-04-17 18:10:17', 24, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8941, '2020-04-17 18:10:17', 96, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8942, '2020-04-17 18:10:17', 3.66101099999999979, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8943, '2020-04-17 18:10:17', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8944, '2020-04-17 18:10:17', 22, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8945, '2020-04-17 18:10:17', 93, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8946, '2020-04-17 18:10:17', 3.66101099999999979, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8947, '2020-04-17 18:10:17', 14, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8948, '2020-04-17 18:10:17', 23, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8949, '2020-04-17 18:10:17', 105, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8950, '2020-04-17 18:10:17', 3.66101099999999979, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8951, '2020-04-17 18:10:17', 14, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8952, '2020-04-17 18:10:17', 24, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8953, '2020-04-17 18:10:17', 96, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8954, '2020-04-17 18:10:17', 3.66101099999999979, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8955, '2020-04-17 18:10:17', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8956, '2020-04-17 18:10:17', 22, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8957, '2020-04-17 18:10:17', 93, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8958, '2020-04-17 18:10:17', 3.66101099999999979, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8959, '2020-04-17 18:10:17', 14, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8960, '2020-04-17 18:10:17', 23, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8961, '2020-04-17 18:10:17', 105, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8962, '2020-04-17 18:10:17', 3.66101099999999979, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8963, '2020-04-17 18:10:17', 14, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8964, '2020-04-17 18:10:17', 22, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8965, '2020-04-17 18:10:17', 105, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8966, '2020-04-17 18:10:17', 3.66101099999999979, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8967, '2020-04-17 18:10:17', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8968, '2020-04-17 18:10:17', 21, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8969, '2020-04-17 18:10:17', 105, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8970, '2020-04-17 18:10:17', 3.66101099999999979, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8971, '2020-04-17 18:10:17', 14, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8972, '2020-04-17 18:10:17', 23, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8973, '2020-04-17 18:10:17', 105, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8974, '2020-04-17 18:10:17', 3.66101099999999979, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8975, '2020-04-17 18:10:17', 14, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8976, '2020-04-17 18:10:17', 22, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8977, '2020-04-17 18:10:17', 105, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8978, '2020-04-17 18:10:17', 3.66101099999999979, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8979, '2020-04-17 18:10:18', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8980, '2020-04-17 18:10:18', 21, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8981, '2020-04-17 18:10:18', 105, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8982, '2020-04-17 18:10:18', 3.66101099999999979, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8983, '2020-04-17 18:10:18', 13, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8984, '2020-04-17 18:10:18', 21, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8985, '2020-04-17 18:10:18', 89, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8986, '2020-04-17 18:10:18', 3.37939500000000015, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8987, '2020-04-17 18:10:18', 14, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (8988, '2020-04-17 18:10:18', 22, 'HUM', 4);
INSERT INTO has_test.measure VALUES (8989, '2020-04-17 18:10:18', 105, 'LUM', 4);
INSERT INTO has_test.measure VALUES (8990, '2020-04-17 18:10:18', 3.66101099999999979, 'CURR', 4);
INSERT INTO has_test.measure VALUES (8991, '2020-04-17 18:10:18', 14, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (8992, '2020-04-17 18:10:18', 21, 'HUM', 2);
INSERT INTO has_test.measure VALUES (8993, '2020-04-17 18:10:18', 105, 'LUM', 2);
INSERT INTO has_test.measure VALUES (8994, '2020-04-17 18:10:18', 3.66101099999999979, 'CURR', 2);
INSERT INTO has_test.measure VALUES (8995, '2020-04-17 18:10:18', 13, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (8996, '2020-04-17 18:10:18', 21, 'HUM', 3);
INSERT INTO has_test.measure VALUES (8997, '2020-04-17 18:10:18', 89, 'LUM', 3);
INSERT INTO has_test.measure VALUES (8998, '2020-04-17 18:10:18', 3.37939500000000015, 'CURR', 3);
INSERT INTO has_test.measure VALUES (8999, '2020-04-17 18:10:18', 13, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9000, '2020-04-17 18:10:18', 20, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9001, '2020-04-17 18:10:18', 112, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9002, '2020-04-17 18:10:18', 3.37939500000000015, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9003, '2020-04-17 18:10:18', 13, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9004, '2020-04-17 18:10:18', 20, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9005, '2020-04-17 18:10:18', 109, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9006, '2020-04-17 18:10:18', 3.37939500000000015, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9007, '2020-04-17 18:10:18', 13, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9008, '2020-04-17 18:10:18', 21, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9009, '2020-04-17 18:10:18', 89, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9010, '2020-04-17 18:10:18', 3.37939500000000015, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9011, '2020-04-17 18:10:18', 13, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9012, '2020-04-17 18:10:18', 20, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9013, '2020-04-17 18:10:18', 112, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9014, '2020-04-17 18:10:18', 3.37939500000000015, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9015, '2020-04-17 18:10:19', 13, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9016, '2020-04-17 18:10:19', 20, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9017, '2020-04-17 18:10:19', 109, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9018, '2020-04-17 18:10:19', 3.37939500000000015, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9019, '2020-04-17 18:10:19', 12, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9020, '2020-04-17 18:10:19', 20, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9021, '2020-04-17 18:10:19', 91, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9022, '2020-04-17 18:10:19', 3.37939500000000015, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9023, '2020-04-17 18:10:19', 13, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9024, '2020-04-17 18:10:19', 20, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9025, '2020-04-17 18:10:19', 112, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9026, '2020-04-17 18:10:19', 3.37939500000000015, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9027, '2020-04-17 18:10:19', 13, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9028, '2020-04-17 18:10:19', 20, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9029, '2020-04-17 18:10:19', 109, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9030, '2020-04-17 18:10:19', 3.37939500000000015, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9031, '2020-04-17 18:10:19', 12, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9032, '2020-04-17 18:10:19', 20, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9033, '2020-04-17 18:10:19', 91, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9034, '2020-04-17 18:10:19', 3.37939500000000015, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9035, '2020-04-17 18:10:19', 13, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9036, '2020-04-17 18:10:19', 20, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9037, '2020-04-17 18:10:19', 114, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9038, '2020-04-17 18:10:19', 3.09777799999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9039, '2020-04-17 18:10:19', 12, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9040, '2020-04-17 18:10:19', 19, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9041, '2020-04-17 18:10:19', 84, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9042, '2020-04-17 18:10:19', 3.09777799999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9043, '2020-04-17 18:10:19', 12, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9044, '2020-04-17 18:10:19', 20, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9045, '2020-04-17 18:10:19', 91, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9046, '2020-04-17 18:10:19', 3.37939500000000015, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9047, '2020-04-17 18:10:19', 13, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9048, '2020-04-17 18:10:19', 20, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9049, '2020-04-17 18:10:19', 114, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9050, '2020-04-17 18:10:19', 3.09777799999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9051, '2020-04-17 18:10:20', 12, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9052, '2020-04-17 18:10:20', 19, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9053, '2020-04-17 18:10:20', 84, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9054, '2020-04-17 18:10:20', 3.09777799999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9055, '2020-04-17 18:10:20', 12, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9056, '2020-04-17 18:10:20', 18, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9057, '2020-04-17 18:10:20', 105, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9058, '2020-04-17 18:10:20', 3.09777799999999992, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9059, '2020-04-17 18:10:20', 13, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9060, '2020-04-17 18:10:20', 20, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9061, '2020-04-17 18:10:20', 114, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9062, '2020-04-17 18:10:20', 3.09777799999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9063, '2020-04-17 18:10:20', 12, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9064, '2020-04-17 18:10:20', 19, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9065, '2020-04-17 18:10:20', 84, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9066, '2020-04-17 18:10:20', 3.09777799999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9067, '2020-04-17 18:10:20', 12, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9068, '2020-04-17 18:10:20', 18, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9069, '2020-04-17 18:10:20', 105, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9070, '2020-04-17 18:10:20', 3.09777799999999992, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9071, '2020-04-17 18:10:20', 11, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9072, '2020-04-17 18:10:20', 18, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9073, '2020-04-17 18:10:20', 86, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9074, '2020-04-17 18:10:20', 3.09777799999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9075, '2020-04-17 18:10:20', 11, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9076, '2020-04-17 18:10:20', 18, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9077, '2020-04-17 18:10:20', 80, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9078, '2020-04-17 18:10:20', 2.81616199999999983, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9079, '2020-04-17 18:10:20', 12, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9080, '2020-04-17 18:10:20', 18, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9081, '2020-04-17 18:10:20', 105, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9082, '2020-04-17 18:10:20', 3.09777799999999992, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9083, '2020-04-17 18:10:20', 11, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9084, '2020-04-17 18:10:20', 18, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9085, '2020-04-17 18:10:20', 86, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9086, '2020-04-17 18:10:20', 3.09777799999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9087, '2020-04-17 18:10:21', 11, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9088, '2020-04-17 18:10:21', 18, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9089, '2020-04-17 18:10:21', 80, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9090, '2020-04-17 18:10:21', 2.81616199999999983, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9091, '2020-04-17 18:10:21', 11, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9092, '2020-04-17 18:10:21', 17, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9093, '2020-04-17 18:10:21', 80, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9094, '2020-04-17 18:10:21', 2.81616199999999983, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9095, '2020-04-17 18:10:21', 11, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9096, '2020-04-17 18:10:21', 18, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9097, '2020-04-17 18:10:21', 86, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9098, '2020-04-17 18:10:21', 3.09777799999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9099, '2020-04-17 18:10:21', 11, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9100, '2020-04-17 18:10:21', 18, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9101, '2020-04-17 18:10:21', 80, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9102, '2020-04-17 18:10:21', 2.81616199999999983, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9103, '2020-04-17 18:10:21', 11, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9104, '2020-04-17 18:10:21', 17, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9105, '2020-04-17 18:10:21', 80, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9106, '2020-04-17 18:10:21', 2.81616199999999983, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9107, '2020-04-17 18:10:21', 10, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9108, '2020-04-17 18:10:21', 17, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9109, '2020-04-17 18:10:21', 80, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9110, '2020-04-17 18:10:21', 2.81616199999999983, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9111, '2020-04-17 18:10:21', 10, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9112, '2020-04-17 18:10:21', 16, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9113, '2020-04-17 18:10:21', 84, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9114, '2020-04-17 18:10:21', 2.81616199999999983, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9115, '2020-04-17 18:10:21', 11, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9116, '2020-04-17 18:10:21', 17, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9117, '2020-04-17 18:10:21', 80, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9118, '2020-04-17 18:10:21', 2.81616199999999983, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9119, '2020-04-17 18:10:21', 10, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9120, '2020-04-17 18:10:21', 17, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9121, '2020-04-17 18:10:21', 80, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9122, '2020-04-17 18:10:21', 2.81616199999999983, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9123, '2020-04-17 18:10:22', 10, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9124, '2020-04-17 18:10:22', 16, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9125, '2020-04-17 18:10:22', 84, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9126, '2020-04-17 18:10:22', 2.81616199999999983, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9127, '2020-04-17 18:10:22', 10, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9128, '2020-04-17 18:10:22', 16, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9129, '2020-04-17 18:10:22', 114, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9130, '2020-04-17 18:10:22', 2.53454600000000019, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9131, '2020-04-17 18:10:22', 10, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9132, '2020-04-17 18:10:22', 17, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9133, '2020-04-17 18:10:22', 80, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9134, '2020-04-17 18:10:22', 2.81616199999999983, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9135, '2020-04-17 18:10:22', 10, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9136, '2020-04-17 18:10:22', 16, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9137, '2020-04-17 18:10:22', 84, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9138, '2020-04-17 18:10:22', 2.81616199999999983, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9139, '2020-04-17 18:10:22', 10, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9140, '2020-04-17 18:10:22', 16, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9141, '2020-04-17 18:10:22', 114, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9142, '2020-04-17 18:10:22', 2.53454600000000019, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9143, '2020-04-17 18:10:22', 9, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9144, '2020-04-17 18:10:22', 15, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9145, '2020-04-17 18:10:22', 98, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9146, '2020-04-17 18:10:22', 2.53454600000000019, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9147, '2020-04-17 18:10:22', 9, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9148, '2020-04-17 18:10:22', 15, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9149, '2020-04-17 18:10:22', 91, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9150, '2020-04-17 18:10:22', 2.53454600000000019, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9151, '2020-04-17 18:10:22', 10, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9152, '2020-04-17 18:10:22', 16, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9153, '2020-04-17 18:10:22', 114, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9154, '2020-04-17 18:10:22', 2.53454600000000019, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9155, '2020-04-17 18:10:22', 9, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9156, '2020-04-17 18:10:22', 15, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9157, '2020-04-17 18:10:22', 98, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9158, '2020-04-17 18:10:22', 2.53454600000000019, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9159, '2020-04-17 18:10:23', 9, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9160, '2020-04-17 18:10:23', 15, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9161, '2020-04-17 18:10:23', 91, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9162, '2020-04-17 18:10:23', 2.53454600000000019, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9163, '2020-04-17 18:10:23', 9, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9164, '2020-04-17 18:10:23', 14, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9165, '2020-04-17 18:10:23', 116, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9166, '2020-04-17 18:10:23', 2.53454600000000019, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9167, '2020-04-17 18:10:23', 9, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9168, '2020-04-17 18:10:23', 15, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9169, '2020-04-17 18:10:23', 98, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9170, '2020-04-17 18:10:23', 2.53454600000000019, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9171, '2020-04-17 18:10:23', 9, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9172, '2020-04-17 18:10:23', 15, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9173, '2020-04-17 18:10:23', 91, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9174, '2020-04-17 18:10:23', 2.53454600000000019, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9175, '2020-04-17 18:10:23', 9, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9176, '2020-04-17 18:10:23', 14, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9177, '2020-04-17 18:10:23', 116, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9178, '2020-04-17 18:10:23', 2.53454600000000019, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9179, '2020-04-17 18:10:23', 8, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9180, '2020-04-17 18:10:23', 14, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9181, '2020-04-17 18:10:23', 109, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9182, '2020-04-17 18:10:23', 2.2529300000000001, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9183, '2020-04-17 18:10:23', 8, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9184, '2020-04-17 18:10:23', 14, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9185, '2020-04-17 18:10:23', 100, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9186, '2020-04-17 18:10:23', 2.2529300000000001, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9187, '2020-04-17 18:10:23', 9, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9188, '2020-04-17 18:10:23', 14, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9189, '2020-04-17 18:10:23', 116, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9190, '2020-04-17 18:10:23', 2.53454600000000019, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9191, '2020-04-17 18:10:23', 8, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9192, '2020-04-17 18:10:23', 14, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9193, '2020-04-17 18:10:23', 109, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9194, '2020-04-17 18:10:23', 2.2529300000000001, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9195, '2020-04-17 18:10:24', 8, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9196, '2020-04-17 18:10:24', 14, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9197, '2020-04-17 18:10:24', 100, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9198, '2020-04-17 18:10:24', 2.2529300000000001, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9199, '2020-04-17 18:10:24', 8, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9200, '2020-04-17 18:10:24', 13, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9201, '2020-04-17 18:10:24', 105, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9202, '2020-04-17 18:10:24', 2.2529300000000001, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9203, '2020-04-17 18:10:24', 8, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9204, '2020-04-17 18:10:24', 14, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9205, '2020-04-17 18:10:24', 109, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9206, '2020-04-17 18:10:24', 2.2529300000000001, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9207, '2020-04-17 18:10:24', 8, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9208, '2020-04-17 18:10:24', 14, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9209, '2020-04-17 18:10:24', 100, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9210, '2020-04-17 18:10:24', 2.2529300000000001, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9211, '2020-04-17 18:10:24', 8, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9212, '2020-04-17 18:10:24', 13, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9213, '2020-04-17 18:10:24', 105, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9214, '2020-04-17 18:10:24', 2.2529300000000001, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9215, '2020-04-17 18:10:24', 7, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9216, '2020-04-17 18:10:24', 12, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9217, '2020-04-17 18:10:24', 80, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9218, '2020-04-17 18:10:24', 1.97131300000000009, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9219, '2020-04-17 18:10:24', 7, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9220, '2020-04-17 18:10:24', 12, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9221, '2020-04-17 18:10:24', 80, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9222, '2020-04-17 18:10:24', 1.97131300000000009, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9223, '2020-04-17 18:10:24', 8, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9224, '2020-04-17 18:10:24', 13, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9225, '2020-04-17 18:10:24', 105, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9226, '2020-04-17 18:10:24', 2.2529300000000001, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9227, '2020-04-17 18:10:24', 7, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9228, '2020-04-17 18:10:24', 12, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9229, '2020-04-17 18:10:24', 80, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9230, '2020-04-17 18:10:24', 1.97131300000000009, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9231, '2020-04-17 18:10:25', 7, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9232, '2020-04-17 18:10:25', 12, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9233, '2020-04-17 18:10:25', 80, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9234, '2020-04-17 18:10:25', 1.97131300000000009, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9235, '2020-04-17 18:10:25', 6, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9236, '2020-04-17 18:10:25', 11, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9237, '2020-04-17 18:10:25', 93, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9238, '2020-04-17 18:10:25', 1.97131300000000009, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9239, '2020-04-17 18:10:25', 7, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9240, '2020-04-17 18:10:25', 12, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9241, '2020-04-17 18:10:25', 80, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9242, '2020-04-17 18:10:25', 1.97131300000000009, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9243, '2020-04-17 18:10:25', 7, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9244, '2020-04-17 18:10:25', 12, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9245, '2020-04-17 18:10:25', 80, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9246, '2020-04-17 18:10:25', 1.97131300000000009, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9247, '2020-04-17 18:10:25', 6, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9248, '2020-04-17 18:10:25', 11, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9249, '2020-04-17 18:10:25', 93, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9250, '2020-04-17 18:10:25', 1.97131300000000009, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9251, '2020-04-17 18:10:25', 7, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9252, '2020-04-17 18:10:25', 11, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9253, '2020-04-17 18:10:25', 105, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9254, '2020-04-17 18:10:25', 1.97131300000000009, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9255, '2020-04-17 18:10:25', 6, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9256, '2020-04-17 18:10:25', 10, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9257, '2020-04-17 18:10:25', 96, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9258, '2020-04-17 18:10:25', 1.689697, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9259, '2020-04-17 18:10:25', 6, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9260, '2020-04-17 18:10:25', 11, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9261, '2020-04-17 18:10:25', 93, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9262, '2020-04-17 18:10:25', 1.97131300000000009, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9263, '2020-04-17 18:10:25', 7, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9264, '2020-04-17 18:10:25', 11, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9265, '2020-04-17 18:10:25', 105, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9266, '2020-04-17 18:10:25', 1.97131300000000009, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9267, '2020-04-17 18:10:26', 6, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9268, '2020-04-17 18:10:26', 10, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9269, '2020-04-17 18:10:26', 96, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9270, '2020-04-17 18:10:26', 1.689697, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9271, '2020-04-17 18:10:26', 5, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9272, '2020-04-17 18:10:26', 9, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9273, '2020-04-17 18:10:26', 82, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9274, '2020-04-17 18:10:26', 1.689697, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9275, '2020-04-17 18:10:26', 7, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9276, '2020-04-17 18:10:26', 11, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9277, '2020-04-17 18:10:26', 105, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9278, '2020-04-17 18:10:26', 1.97131300000000009, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9279, '2020-04-17 18:10:26', 6, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9280, '2020-04-17 18:10:26', 10, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9281, '2020-04-17 18:10:26', 96, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9282, '2020-04-17 18:10:26', 1.689697, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9283, '2020-04-17 18:10:26', 5, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9284, '2020-04-17 18:10:26', 9, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9285, '2020-04-17 18:10:26', 82, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9286, '2020-04-17 18:10:26', 1.689697, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9287, '2020-04-17 18:10:26', 5, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9288, '2020-04-17 18:10:26', 9, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9289, '2020-04-17 18:10:26', 100, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9290, '2020-04-17 18:10:26', 1.689697, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9291, '2020-04-17 18:10:27', 5, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9292, '2020-04-17 18:10:27', 8, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9293, '2020-04-17 18:10:27', 82, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9294, '2020-04-17 18:10:27', 1.40808099999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9295, '2020-04-17 18:10:27', 5, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9296, '2020-04-17 18:10:27', 9, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9297, '2020-04-17 18:10:27', 82, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9298, '2020-04-17 18:10:27', 1.689697, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9299, '2020-04-17 18:10:27', 5, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9300, '2020-04-17 18:10:27', 9, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9301, '2020-04-17 18:10:27', 100, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9302, '2020-04-17 18:10:27', 1.689697, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9303, '2020-04-17 18:10:27', 5, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9304, '2020-04-17 18:10:27', 8, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9305, '2020-04-17 18:10:27', 82, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9306, '2020-04-17 18:10:27', 1.40808099999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9307, '2020-04-17 18:10:27', 4, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9308, '2020-04-17 18:10:27', 8, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9309, '2020-04-17 18:10:27', 89, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9310, '2020-04-17 18:10:27', 1.40808099999999992, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9311, '2020-04-17 18:10:27', 5, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9312, '2020-04-17 18:10:27', 9, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9313, '2020-04-17 18:10:27', 100, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9314, '2020-04-17 18:10:27', 1.689697, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9315, '2020-04-17 18:10:27', 5, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9316, '2020-04-17 18:10:27', 8, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9317, '2020-04-17 18:10:27', 82, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9318, '2020-04-17 18:10:27', 1.40808099999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9319, '2020-04-17 18:10:27', 4, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9320, '2020-04-17 18:10:27', 8, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9321, '2020-04-17 18:10:27', 89, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9322, '2020-04-17 18:10:27', 1.40808099999999992, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9323, '2020-04-17 18:10:27', 4, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9324, '2020-04-17 18:10:27', 7, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9325, '2020-04-17 18:10:27', 109, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9326, '2020-04-17 18:10:27', 1.40808099999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9327, '2020-04-17 18:10:28', 4, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9328, '2020-04-17 18:10:28', 7, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9329, '2020-04-17 18:10:28', 105, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9330, '2020-04-17 18:10:28', 1.40808099999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9331, '2020-04-17 18:10:28', 4, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9332, '2020-04-17 18:10:28', 8, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9333, '2020-04-17 18:10:28', 89, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9334, '2020-04-17 18:10:28', 1.40808099999999992, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9335, '2020-04-17 18:10:28', 4, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9336, '2020-04-17 18:10:28', 7, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9337, '2020-04-17 18:10:28', 109, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9338, '2020-04-17 18:10:28', 1.40808099999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9339, '2020-04-17 18:10:28', 4, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9340, '2020-04-17 18:10:28', 7, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9341, '2020-04-17 18:10:28', 105, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9342, '2020-04-17 18:10:28', 1.40808099999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9343, '2020-04-17 18:10:28', 3, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9344, '2020-04-17 18:10:28', 6, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9345, '2020-04-17 18:10:28', 86, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9346, '2020-04-17 18:10:28', 1.12646500000000005, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9347, '2020-04-17 18:10:28', 4, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9348, '2020-04-17 18:10:28', 7, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9349, '2020-04-17 18:10:28', 109, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9350, '2020-04-17 18:10:28', 1.40808099999999992, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9351, '2020-04-17 18:10:28', 4, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9352, '2020-04-17 18:10:28', 7, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9353, '2020-04-17 18:10:28', 105, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9354, '2020-04-17 18:10:28', 1.40808099999999992, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9355, '2020-04-17 18:10:28', 3, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9356, '2020-04-17 18:10:28', 6, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9357, '2020-04-17 18:10:28', 86, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9358, '2020-04-17 18:10:28', 1.12646500000000005, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9359, '2020-04-17 18:10:28', 3, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9360, '2020-04-17 18:10:28', 6, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9361, '2020-04-17 18:10:28', 98, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9362, '2020-04-17 18:10:28', 1.12646500000000005, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9363, '2020-04-17 18:10:29', 3, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9364, '2020-04-17 18:10:29', 5, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9365, '2020-04-17 18:10:29', 96, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9366, '2020-04-17 18:10:29', 1.12646500000000005, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9367, '2020-04-17 18:10:29', 3, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9368, '2020-04-17 18:10:29', 6, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9369, '2020-04-17 18:10:29', 86, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9370, '2020-04-17 18:10:29', 1.12646500000000005, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9371, '2020-04-17 18:10:29', 3, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9372, '2020-04-17 18:10:29', 6, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9373, '2020-04-17 18:10:29', 98, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9374, '2020-04-17 18:10:29', 1.12646500000000005, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9375, '2020-04-17 18:10:29', 3, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9376, '2020-04-17 18:10:29', 5, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9377, '2020-04-17 18:10:29', 96, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9378, '2020-04-17 18:10:29', 1.12646500000000005, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9379, '2020-04-17 18:10:29', 3, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9380, '2020-04-17 18:10:29', 5, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9381, '2020-04-17 18:10:29', 93, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9382, '2020-04-17 18:10:29', 0.844848999999999961, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9383, '2020-04-17 18:10:29', 3, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9384, '2020-04-17 18:10:29', 6, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9385, '2020-04-17 18:10:29', 98, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9386, '2020-04-17 18:10:29', 1.12646500000000005, 'CURR', 4);
INSERT INTO has_test.measure VALUES (9387, '2020-04-17 18:10:29', 3, 'TEMP', 2);
INSERT INTO has_test.measure VALUES (9388, '2020-04-17 18:10:29', 5, 'HUM', 2);
INSERT INTO has_test.measure VALUES (9389, '2020-04-17 18:10:29', 96, 'LUM', 2);
INSERT INTO has_test.measure VALUES (9390, '2020-04-17 18:10:29', 1.12646500000000005, 'CURR', 2);
INSERT INTO has_test.measure VALUES (9391, '2020-04-17 18:10:29', 3, 'TEMP', 3);
INSERT INTO has_test.measure VALUES (9392, '2020-04-17 18:10:29', 5, 'HUM', 3);
INSERT INTO has_test.measure VALUES (9393, '2020-04-17 18:10:29', 93, 'LUM', 3);
INSERT INTO has_test.measure VALUES (9394, '2020-04-17 18:10:29', 0.844848999999999961, 'CURR', 3);
INSERT INTO has_test.measure VALUES (9395, '2020-04-17 18:10:29', 2, 'TEMP', 4);
INSERT INTO has_test.measure VALUES (9396, '2020-04-17 18:10:29', 3, 'HUM', 4);
INSERT INTO has_test.measure VALUES (9397, '2020-04-17 18:10:29', 105, 'LUM', 4);
INSERT INTO has_test.measure VALUES (9398, '2020-04-17 18:10:29', 0.844848999999999961, 'CURR', 4);


--
-- Name: measure_m_id_seq; Type: SEQUENCE SET; Schema: has_test; Owner: sinfdoc
--

SELECT pg_catalog.setval('has_test.measure_m_id_seq', 9398, true);


--
-- Data for Name: mote; Type: TABLE DATA; Schema: has_test; Owner: sinfdoc
--

INSERT INTO has_test.mote VALUES (2, 'mote_kitchen', 'CM5000', 'Kitchen');
INSERT INTO has_test.mote VALUES (3, 'mote_WC', 'CM5000', 'WC');
INSERT INTO has_test.mote VALUES (4, 'mote_living_room', 'CM5000', 'Living Room');


--
-- Name: mote_mote_id_seq; Type: SEQUENCE SET; Schema: has_test; Owner: sinfdoc
--

SELECT pg_catalog.setval('has_test.mote_mote_id_seq', 4, true);


--
-- Data for Name: room; Type: TABLE DATA; Schema: has_test; Owner: sinfdoc
--

INSERT INTO has_test.room VALUES ('Living Room', 'This is the living room for the HAS system ');
INSERT INTO has_test.room VALUES ('WC', 'This is the WC for the HAS system');
INSERT INTO has_test.room VALUES ('Kitchen', 'This is the Kitchen for the HAS system');


--
-- Data for Name: rule; Type: TABLE DATA; Schema: has_test; Owner: sinfdoc
--

INSERT INTO has_test.rule VALUES (1, '>', 10, 1, 'TEMP', 2);
INSERT INTO has_test.rule VALUES (2, '>', 15, 1, 'TEMP', 3);
INSERT INTO has_test.rule VALUES (3, '>', 20, 1, 'TEMP', 4);


--
-- Name: rule_rule_id_seq; Type: SEQUENCE SET; Schema: has_test; Owner: sinfdoc
--

SELECT pg_catalog.setval('has_test.rule_rule_id_seq', 3, true);


--
-- Data for Name: sensor; Type: TABLE DATA; Schema: has_test; Owner: sinfdoc
--

INSERT INTO has_test.sensor VALUES ('TEMP', 'Temperature Sensor');
INSERT INTO has_test.sensor VALUES ('HUM', 'Humidity Sensor');
INSERT INTO has_test.sensor VALUES ('LUM', 'Luminosity Sensor');
INSERT INTO has_test.sensor VALUES ('CURR', 'Current Sensor');


--
-- Data for Name: sensor_mote; Type: TABLE DATA; Schema: has_test; Owner: sinfdoc
--

INSERT INTO has_test.sensor_mote VALUES ('TEMP', 2);
INSERT INTO has_test.sensor_mote VALUES ('HUM', 2);
INSERT INTO has_test.sensor_mote VALUES ('LUM', 2);
INSERT INTO has_test.sensor_mote VALUES ('CURR', 2);
INSERT INTO has_test.sensor_mote VALUES ('TEMP', 3);
INSERT INTO has_test.sensor_mote VALUES ('HUM', 3);
INSERT INTO has_test.sensor_mote VALUES ('LUM', 3);
INSERT INTO has_test.sensor_mote VALUES ('CURR', 3);
INSERT INTO has_test.sensor_mote VALUES ('TEMP', 4);
INSERT INTO has_test.sensor_mote VALUES ('HUM', 4);
INSERT INTO has_test.sensor_mote VALUES ('LUM', 4);
INSERT INTO has_test.sensor_mote VALUES ('CURR', 4);


--
-- Data for Name: state; Type: TABLE DATA; Schema: has_test; Owner: sinfdoc
--

INSERT INTO has_test.state VALUES (72, '2020-04-17 18:09:39', 1, 1, 'Kitchen');
INSERT INTO has_test.state VALUES (73, '2020-04-17 18:09:39', 1, 1, 'WC');
INSERT INTO has_test.state VALUES (74, '2020-04-17 18:09:39', 1, 1, 'Living Room');
INSERT INTO has_test.state VALUES (75, '2020-04-17 18:09:45', 0, 1, 'Kitchen');
INSERT INTO has_test.state VALUES (76, '2020-04-17 18:09:50', 0, 1, 'WC');
INSERT INTO has_test.state VALUES (77, '2020-04-17 18:09:57', 0, 1, 'Living Room');
INSERT INTO has_test.state VALUES (78, '2020-04-17 18:10:11', 1, 1, 'Living Room');
INSERT INTO has_test.state VALUES (79, '2020-04-17 18:10:19', 1, 1, 'WC');
INSERT INTO has_test.state VALUES (80, '2020-04-17 18:10:24', 1, 1, 'Kitchen');


--
-- Name: state_s_id_seq; Type: SEQUENCE SET; Schema: has_test; Owner: sinfdoc
--

SELECT pg_catalog.setval('has_test.state_s_id_seq', 80, true);


--
-- Name: actuator actuator_pkey; Type: CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.actuator
    ADD CONSTRAINT actuator_pkey PRIMARY KEY (act_id);


--
-- Name: measure measure_pkey; Type: CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.measure
    ADD CONSTRAINT measure_pkey PRIMARY KEY (m_id);


--
-- Name: mote mote_pkey; Type: CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.mote
    ADD CONSTRAINT mote_pkey PRIMARY KEY (mote_id);


--
-- Name: room room_pkey; Type: CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (name);


--
-- Name: rule rule_pkey; Type: CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.rule
    ADD CONSTRAINT rule_pkey PRIMARY KEY (rule_id);


--
-- Name: sensor_mote sensor_mote_pkey; Type: CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.sensor_mote
    ADD CONSTRAINT sensor_mote_pkey PRIMARY KEY (type_sens, mote_id);


--
-- Name: sensor sensor_pkey; Type: CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.sensor
    ADD CONSTRAINT sensor_pkey PRIMARY KEY (type);


--
-- Name: actuator_room state_pkey; Type: CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.actuator_room
    ADD CONSTRAINT state_pkey PRIMARY KEY (act_id, name_room);


--
-- Name: state state_pkey1; Type: CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.state
    ADD CONSTRAINT state_pkey1 PRIMARY KEY (s_id);


--
-- Name: measure fk_measure_mote; Type: FK CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.measure
    ADD CONSTRAINT fk_measure_mote FOREIGN KEY (mote_id) REFERENCES has_test.mote(mote_id);


--
-- Name: actuator_room fk_measure_mote; Type: FK CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.actuator_room
    ADD CONSTRAINT fk_measure_mote FOREIGN KEY (act_id) REFERENCES has_test.actuator(act_id);


--
-- Name: measure fk_measure_sensor; Type: FK CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.measure
    ADD CONSTRAINT fk_measure_sensor FOREIGN KEY (type_sens) REFERENCES has_test.sensor(type);


--
-- Name: mote fk_mote_room; Type: FK CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.mote
    ADD CONSTRAINT fk_mote_room FOREIGN KEY (name_room) REFERENCES has_test.room(name);


--
-- Name: sensor_mote fk_mote_sensor_fk1; Type: FK CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.sensor_mote
    ADD CONSTRAINT fk_mote_sensor_fk1 FOREIGN KEY (mote_id) REFERENCES has_test.mote(mote_id);


--
-- Name: rule fk_rule_actuator; Type: FK CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.rule
    ADD CONSTRAINT fk_rule_actuator FOREIGN KEY (act_id) REFERENCES has_test.actuator(act_id);


--
-- Name: rule fk_rule_mote; Type: FK CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.rule
    ADD CONSTRAINT fk_rule_mote FOREIGN KEY (mote_id) REFERENCES has_test.mote(mote_id);


--
-- Name: rule fk_rule_sensor; Type: FK CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.rule
    ADD CONSTRAINT fk_rule_sensor FOREIGN KEY (type_sens) REFERENCES has_test.sensor(type);


--
-- Name: sensor_mote fk_sensor_mote_fk1; Type: FK CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.sensor_mote
    ADD CONSTRAINT fk_sensor_mote_fk1 FOREIGN KEY (type_sens) REFERENCES has_test.sensor(type);


--
-- Name: state fk_state_actuator; Type: FK CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.state
    ADD CONSTRAINT fk_state_actuator FOREIGN KEY (act_id) REFERENCES has_test.actuator(act_id);


--
-- Name: actuator_room fk_state_room; Type: FK CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.actuator_room
    ADD CONSTRAINT fk_state_room FOREIGN KEY (name_room) REFERENCES has_test.room(name);


--
-- Name: state fk_state_room; Type: FK CONSTRAINT; Schema: has_test; Owner: sinfdoc
--

ALTER TABLE ONLY has_test.state
    ADD CONSTRAINT fk_state_room FOREIGN KEY (name_room) REFERENCES has_test.room(name);


--
-- PostgreSQL database dump complete
--

