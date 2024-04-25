--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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
-- Name: actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actor (
    actor_id integer NOT NULL,
    actor_name character varying
);


ALTER TABLE public.actor OWNER TO postgres;

--
-- Name: actor_actor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actor_actor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.actor_actor_id_seq OWNER TO postgres;

--
-- Name: actor_actor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.actor_actor_id_seq OWNED BY public.actor.actor_id;


--
-- Name: awards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.awards (
    idaward integer NOT NULL,
    award_received integer
);


ALTER TABLE public.awards OWNER TO postgres;

--
-- Name: awards_idaward_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.awards_idaward_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.awards_idaward_seq OWNER TO postgres;

--
-- Name: awards_idaward_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.awards_idaward_seq OWNED BY public.awards.idaward;


--
-- Name: casts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.casts (
    idcasts integer NOT NULL,
    idmovie integer,
    actor_id integer
);


ALTER TABLE public.casts OWNER TO postgres;

--
-- Name: casts_actor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.casts_actor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.casts_actor_id_seq OWNER TO postgres;

--
-- Name: casts_actor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.casts_actor_id_seq OWNED BY public.casts.actor_id;


--
-- Name: casts_idcasts_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.casts_idcasts_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.casts_idcasts_seq OWNER TO postgres;

--
-- Name: casts_idcasts_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.casts_idcasts_seq OWNED BY public.casts.idcasts;


--
-- Name: casts_idmovie_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.casts_idmovie_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.casts_idmovie_seq OWNER TO postgres;

--
-- Name: casts_idmovie_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.casts_idmovie_seq OWNED BY public.casts.idmovie;


--
-- Name: director; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.director (
    director_id integer NOT NULL,
    fullname character varying
);


ALTER TABLE public.director OWNER TO postgres;

--
-- Name: director_director_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.director_director_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.director_director_id_seq OWNER TO postgres;

--
-- Name: director_director_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.director_director_id_seq OWNED BY public.director.director_id;


--
-- Name: movie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie (
    idmovie integer NOT NULL,
    title character varying,
    genre character varying,
    tags character varying,
    languages character varying,
    ty_type character varying,
    country character varying,
    runtime character varying,
    boxoffice integer,
    y_o_r character varying,
    netflix_release character varying,
    summary character varying,
    director_id integer,
    studio_id integer
);


ALTER TABLE public.movie OWNER TO postgres;

--
-- Name: movie_director_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movie_director_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.movie_director_id_seq OWNER TO postgres;

--
-- Name: movie_director_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movie_director_id_seq OWNED BY public.movie.director_id;


--
-- Name: movie_idmovie_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movie_idmovie_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.movie_idmovie_seq OWNER TO postgres;

--
-- Name: movie_idmovie_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movie_idmovie_seq OWNED BY public.movie.idmovie;


--
-- Name: movie_studio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movie_studio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.movie_studio_id_seq OWNER TO postgres;

--
-- Name: movie_studio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movie_studio_id_seq OWNED BY public.movie.studio_id;


--
-- Name: productionhouse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productionhouse (
    studio_id integer NOT NULL,
    studio_name character varying
);


ALTER TABLE public.productionhouse OWNER TO postgres;

--
-- Name: productionhouse_studio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productionhouse_studio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.productionhouse_studio_id_seq OWNER TO postgres;

--
-- Name: productionhouse_studio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productionhouse_studio_id_seq OWNED BY public.productionhouse.studio_id;


--
-- Name: ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ratings (
    idrating integer NOT NULL,
    imdb double precision,
    hidden_gem double precision,
    viewer_rating character varying
);


ALTER TABLE public.ratings OWNER TO postgres;

--
-- Name: ratings_idrating_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ratings_idrating_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ratings_idrating_seq OWNER TO postgres;

--
-- Name: ratings_idrating_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ratings_idrating_seq OWNED BY public.ratings.idrating;


--
-- Name: writer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.writer (
    writer_id integer NOT NULL,
    writer_name character varying
);


ALTER TABLE public.writer OWNER TO postgres;

--
-- Name: writer_writer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.writer_writer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.writer_writer_id_seq OWNER TO postgres;

--
-- Name: writer_writer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.writer_writer_id_seq OWNED BY public.writer.writer_id;


--
-- Name: actor actor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actor ALTER COLUMN actor_id SET DEFAULT nextval('public.actor_actor_id_seq'::regclass);


--
-- Name: awards idaward; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards ALTER COLUMN idaward SET DEFAULT nextval('public.awards_idaward_seq'::regclass);


--
-- Name: casts idcasts; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.casts ALTER COLUMN idcasts SET DEFAULT nextval('public.casts_idcasts_seq'::regclass);


--
-- Name: casts idmovie; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.casts ALTER COLUMN idmovie SET DEFAULT nextval('public.casts_idmovie_seq'::regclass);


--
-- Name: casts actor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.casts ALTER COLUMN actor_id SET DEFAULT nextval('public.casts_actor_id_seq'::regclass);


--
-- Name: director director_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.director ALTER COLUMN director_id SET DEFAULT nextval('public.director_director_id_seq'::regclass);


--
-- Name: movie idmovie; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie ALTER COLUMN idmovie SET DEFAULT nextval('public.movie_idmovie_seq'::regclass);


--
-- Name: movie director_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie ALTER COLUMN director_id SET DEFAULT nextval('public.movie_director_id_seq'::regclass);


--
-- Name: movie studio_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie ALTER COLUMN studio_id SET DEFAULT nextval('public.movie_studio_id_seq'::regclass);


--
-- Name: productionhouse studio_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productionhouse ALTER COLUMN studio_id SET DEFAULT nextval('public.productionhouse_studio_id_seq'::regclass);


--
-- Name: ratings idrating; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings ALTER COLUMN idrating SET DEFAULT nextval('public.ratings_idrating_seq'::regclass);


--
-- Name: writer writer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.writer ALTER COLUMN writer_id SET DEFAULT nextval('public.writer_writer_id_seq'::regclass);


--
-- Name: actor actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actor
    ADD CONSTRAINT actor_pkey PRIMARY KEY (actor_id);


--
-- Name: awards awards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_pkey PRIMARY KEY (idaward);


--
-- Name: casts casts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.casts
    ADD CONSTRAINT casts_pkey PRIMARY KEY (idcasts);


--
-- Name: director director_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.director
    ADD CONSTRAINT director_pkey PRIMARY KEY (director_id);


--
-- Name: movie movie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (idmovie);


--
-- Name: productionhouse productionhouse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productionhouse
    ADD CONSTRAINT productionhouse_pkey PRIMARY KEY (studio_id);


--
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (idrating);


--
-- Name: writer writer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.writer
    ADD CONSTRAINT writer_pkey PRIMARY KEY (writer_id);


--
-- Name: casts fk_actor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.casts
    ADD CONSTRAINT fk_actor FOREIGN KEY (actor_id) REFERENCES public.actor(actor_id) ON DELETE CASCADE;


--
-- Name: movie fk_director; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT fk_director FOREIGN KEY (director_id) REFERENCES public.director(director_id) ON DELETE CASCADE;


--
-- Name: casts fk_movie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.casts
    ADD CONSTRAINT fk_movie FOREIGN KEY (idmovie) REFERENCES public.movie(idmovie) ON DELETE CASCADE;


--
-- Name: movie fk_productionhouse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT fk_productionhouse FOREIGN KEY (studio_id) REFERENCES public.productionhouse(studio_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

