--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = "SmartHouse", pg_catalog;

--
-- Data for Name: Actuator; Type: TABLE DATA; Schema: SmartHouse; Owner: sinfdoc
--

COPY "Actuator" ("actuatorID", description) FROM stdin;
\.


--
-- Data for Name: Measurement; Type: TABLE DATA; Schema: SmartHouse; Owner: sinfdoc
--

COPY "Measurement" ("timestamp", light, temperature, huminidy, "IDMeasurement") FROM stdin;
\.


--
-- Data for Name: Room; Type: TABLE DATA; Schema: SmartHouse; Owner: sinfdoc
--

COPY "Room" ("RoomID", dimensions, name, description) FROM stdin;
\.


--
-- Data for Name: Mote; Type: TABLE DATA; Schema: SmartHouse; Owner: sinfdoc
--

COPY "Mote" ("moteID", "roomID", description) FROM stdin;
\.


--
-- Data for Name: Rules; Type: TABLE DATA; Schema: SmartHouse; Owner: sinfdoc
--

COPY "Rules" ("RuleID", "RoomID", rule, description) FROM stdin;
\.


--
-- Data for Name: State; Type: TABLE DATA; Schema: SmartHouse; Owner: sinfdoc
--

COPY "State" ("actuatorState", "roomID", "actuatorID") FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

