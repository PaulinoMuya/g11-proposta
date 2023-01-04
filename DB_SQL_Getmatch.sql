-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.campo
(
    campo_id integer NOT NULL DEFAULT nextval('campo_campo_id_seq'::regclass),
    campo_nome character varying(40) COLLATE pg_catalog."default",
    localizacao character varying(40) COLLATE pg_catalog."default",
    dias_disponiveis date,
    horarios_disponiveis date,
    CONSTRAINT campo_pkey PRIMARY KEY (campo_id)
);

CREATE TABLE IF NOT EXISTS public.estado_jogo
(
    estado_jogo_id integer NOT NULL DEFAULT nextval('estado_jogo_estado_jogo_id_seq'::regclass),
    estado character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT estado_jogo_pkey PRIMARY KEY (estado_jogo_id)
);

CREATE TABLE IF NOT EXISTS public.jogo
(
    jogo_id integer NOT NULL DEFAULT nextval('jogo_jogo_id_seq'::regclass),
    jogo_nome character varying(30) COLLATE pg_catalog."default",
    numero_maximo integer,
    descricao character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT jogo_pkey PRIMARY KEY (jogo_id)
);

CREATE TABLE IF NOT EXISTS public.modalidade_campo
(
    modalidade_campo_id integer NOT NULL DEFAULT nextval('modalidade_campo_modalidade_campo_id_seq'::regclass),
    CONSTRAINT modalidade_campo_pkey PRIMARY KEY (modalidade_campo_id)
);

CREATE TABLE IF NOT EXISTS public.modalidade_jogo
(
    modalidade_jogo_id integer NOT NULL DEFAULT nextval('modalidade_jogo_modalidade_jogo_id_seq'::regclass),
    CONSTRAINT modalidade_jogo_pkey PRIMARY KEY (modalidade_jogo_id)
);

CREATE TABLE IF NOT EXISTS public.participante
(
    participante_id integer NOT NULL DEFAULT nextval('participante_participante_id_seq'::regclass),
    nome character varying(30) COLLATE pg_catalog."default",
    tipo_desporto character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT participante_pkey PRIMARY KEY (participante_id)
);

CREATE TABLE IF NOT EXISTS public.participante_jogo
(
    participante_jogo_id integer NOT NULL DEFAULT nextval('participante_jogo_participante_jogo_id_seq'::regclass),
    CONSTRAINT participante_jogo_pkey PRIMARY KEY (participante_jogo_id)
);

CREATE TABLE IF NOT EXISTS public.tipo_campo
(
    tipo_campo_id integer NOT NULL DEFAULT nextval('tipo_campo_tipo_campo_id_seq'::regclass),
    estrutura character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT tipo_campo_pkey PRIMARY KEY (tipo_campo_id)
);

CREATE TABLE IF NOT EXISTS public.users
(
    users_id integer NOT NULL DEFAULT nextval('users_users_id_seq'::regclass),
    user_name character varying(30) COLLATE pg_catalog."default",
    telefone integer,
    data_nasc date NOT NULL,
    emaill character varying(30) COLLATE pg_catalog."default",
    senha character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT users_pkey PRIMARY KEY (users_id)
);

ALTER TABLE IF EXISTS public.campo
    ADD CONSTRAINT campo_fk_jogo FOREIGN KEY (campo_id)
    REFERENCES public.jogo (jogo_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS campo_pkey
    ON public.campo(campo_id);


ALTER TABLE IF EXISTS public.jogo
    ADD CONSTRAINT jogo_fk_modalidade_jogo FOREIGN KEY (jogo_id)
    REFERENCES public.modalidade_jogo (modalidade_jogo_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS jogo_pkey
    ON public.jogo(jogo_id);


ALTER TABLE IF EXISTS public.jogo
    ADD CONSTRAINT jogo_fk_users FOREIGN KEY (jogo_id)
    REFERENCES public.users (users_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS jogo_pkey
    ON public.jogo(jogo_id);


ALTER TABLE IF EXISTS public.modalidade_campo
    ADD CONSTRAINT modalidade_campo_fk_campo FOREIGN KEY (modalidade_campo_id)
    REFERENCES public.campo (campo_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS modalidade_campo_pkey
    ON public.modalidade_campo(modalidade_campo_id);


ALTER TABLE IF EXISTS public.modalidade_campo
    ADD CONSTRAINT modalidade_campo_fk_modalidade_jogo FOREIGN KEY (modalidade_campo_id)
    REFERENCES public.modalidade_jogo (modalidade_jogo_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS modalidade_campo_pkey
    ON public.modalidade_campo(modalidade_campo_id);


ALTER TABLE IF EXISTS public.participante
    ADD CONSTRAINT participante_fk_jogo FOREIGN KEY (participante_id)
    REFERENCES public.jogo (jogo_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS participante_pkey
    ON public.participante(participante_id);


ALTER TABLE IF EXISTS public.participante
    ADD CONSTRAINT participante_fk_users FOREIGN KEY (participante_id)
    REFERENCES public.users (users_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS participante_pkey
    ON public.participante(participante_id);


ALTER TABLE IF EXISTS public.participante_jogo
    ADD CONSTRAINT participante_jogo_fk_estado_jogo FOREIGN KEY (participante_jogo_id)
    REFERENCES public.estado_jogo (estado_jogo_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS participante_jogo_pkey
    ON public.participante_jogo(participante_jogo_id);


ALTER TABLE IF EXISTS public.participante_jogo
    ADD CONSTRAINT participante_jogo_fk_participante FOREIGN KEY (participante_jogo_id)
    REFERENCES public.participante (participante_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS participante_jogo_pkey
    ON public.participante_jogo(participante_jogo_id);


ALTER TABLE IF EXISTS public.tipo_campo
    ADD CONSTRAINT campo_fk_campo FOREIGN KEY (tipo_campo_id)
    REFERENCES public.campo (campo_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS tipo_campo_pkey
    ON public.tipo_campo(tipo_campo_id);

END;