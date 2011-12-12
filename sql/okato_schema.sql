--
-- Name: okato_general; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE okato_general (
    zone character varying NOT NULL,
    type character varying NOT NULL,
    cod character varying NOT NULL,
    name character varying NOT NULL,
    capital character varying NOT NULL
);

--
-- Name: okato_region; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE okato_region (
    cod character varying NOT NULL,
    name character varying NOT NULL
);

--
-- Name: okato_zone; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE okato_zone (
    region character varying NOT NULL,
    cod character varying NOT NULL,
    name character varying NOT NULL
);

--
-- Name: okato_general_pkey; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY okato_general
    ADD CONSTRAINT okato_general_pkey PRIMARY KEY (cod);


--
-- Name: okato_region_pkey; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY okato_region
    ADD CONSTRAINT okato_region_pkey PRIMARY KEY (cod);


--
-- Name: okato_zone_pkey; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY okato_zone
    ADD CONSTRAINT okato_zone_pkey PRIMARY KEY (cod);


--
-- Name: okato_general_zone; Type: INDEX; Schema: public; Owner: admin; Tablespace: 
--

CREATE INDEX okato_general_zone ON okato_general USING btree (zone);


--
-- Name: okato_zone_region; Type: INDEX; Schema: public; Owner: admin; Tablespace: 
--

CREATE INDEX okato_zone_region ON okato_zone USING btree (region);


--
-- Name: okato_general_zone_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY okato_general
    ADD CONSTRAINT okato_general_zone_fkey FOREIGN KEY (zone) REFERENCES okato_zone(cod) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: okato_zone_region_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY okato_zone
    ADD CONSTRAINT okato_zone_region_fkey FOREIGN KEY (region) REFERENCES okato_region(cod) ON UPDATE RESTRICT ON DELETE RESTRICT;


