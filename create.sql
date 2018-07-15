-- Table: account

-- DROP TABLE account;

CREATE TABLE account
(
  id serial NOT NULL,
  principal_id integer,
  login character varying,
  password character varying,
  CONSTRAINT account_pkey PRIMARY KEY (id),
  CONSTRAINT pricipal_key FOREIGN KEY (principal_id)
      REFERENCES principal (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE account
  OWNER TO postgres;

  
  
-- Table: atm

-- DROP TABLE atm;

CREATE TABLE atm
(
  id serial NOT NULL,
  credit_score_id integer,
  current_score_id integer,
  debet_score_id integer,
  CONSTRAINT atm_pkey PRIMARY KEY (id),
  CONSTRAINT credit_score_key FOREIGN KEY (credit_score_id)
      REFERENCES credit_score (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT current_score FOREIGN KEY (current_score_id)
      REFERENCES current_score (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT debet_score_key FOREIGN KEY (debet_score_id)
      REFERENCES debet_score (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE atm
  OWNER TO postgres;

  
  
  -- Table: credit_score

-- DROP TABLE credit_score;

CREATE TABLE credit_score
(
  id serial NOT NULL,
  money_id integer,
  account_id integer,
  "number" integer,
  CONSTRAINT credit_score_pkey PRIMARY KEY (id),
  CONSTRAINT money_key FOREIGN KEY (money_id)
      REFERENCES money (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE credit_score
  OWNER TO postgres;

  
  -- Table: current_score

-- DROP TABLE current_score;

CREATE TABLE current_score
(
  id serial NOT NULL,
  money_id integer,
  account_id integer,
  "number" integer,
  CONSTRAINT current_score_pkey PRIMARY KEY (id),
  CONSTRAINT money_key FOREIGN KEY (money_id)
      REFERENCES money (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE current_score
  OWNER TO postgres;

  
  
  -- Table: debet_score

-- DROP TABLE debet_score;

CREATE TABLE debet_score
(
  id serial NOT NULL,
  money_id integer,
  account_id integer,
  "number" integer,
  CONSTRAINT debet_score_pkey PRIMARY KEY (id),
  CONSTRAINT money_key FOREIGN KEY (money_id)
      REFERENCES money (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE debet_score
  OWNER TO postgres;

  
  -- Table: money

-- DROP TABLE money;

CREATE TABLE money
(
  id serial NOT NULL,
  value double precision,
  currency_name character varying(5),
  CONSTRAINT money_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE money
  OWNER TO postgres;

  
  
  -- Table: principal

-- DROP TABLE principal;

CREATE TABLE principal
(
  id serial NOT NULL,
  first_name character varying NOT NULL,
  last_name character varying NOT NULL,
  second_name character varying,
  age integer NOT NULL,
  CONSTRAINT principal_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE principal
  OWNER TO postgres;
