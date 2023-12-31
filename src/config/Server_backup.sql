PGDMP         &                {            helpdesk    15.3    15.3 ;    K           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            L           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            M           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            N           1262    16400    helpdesk    DATABASE     �   CREATE DATABASE helpdesk WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE helpdesk;
                postgres    false            �            1259    24652    category    TABLE     \   CREATE TABLE public.category (
    id integer NOT NULL,
    c_name character varying(20)
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    24651    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    226            O           0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    225            �            1259    24660    knowledgebase    TABLE       CREATE TABLE public.knowledgebase (
    id integer NOT NULL,
    title character varying(255),
    description text,
    content text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 !   DROP TABLE public.knowledgebase;
       public         heap    postgres    false            �            1259    24659    knowledgebase_id_seq    SEQUENCE     �   CREATE SEQUENCE public.knowledgebase_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.knowledgebase_id_seq;
       public          postgres    false    228            P           0    0    knowledgebase_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.knowledgebase_id_seq OWNED BY public.knowledgebase.id;
          public          postgres    false    227            �            1259    24641    messages    TABLE       CREATE TABLE public.messages (
    id integer NOT NULL,
    sender_id integer,
    receiver_id integer,
    ticket_id integer,
    message text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.messages;
       public         heap    postgres    false            �            1259    24640    messages_id_seq    SEQUENCE     �   CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.messages_id_seq;
       public          postgres    false    224            Q           0    0    messages_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;
          public          postgres    false    223            �            1259    24634    sub_category    TABLE     s   CREATE TABLE public.sub_category (
    id integer NOT NULL,
    c_id integer,
    s_name character varying(255)
);
     DROP TABLE public.sub_category;
       public         heap    postgres    false            �            1259    24633    sub_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sub_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.sub_category_id_seq;
       public          postgres    false    222            R           0    0    sub_category_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.sub_category_id_seq OWNED BY public.sub_category.id;
          public          postgres    false    221            �            1259    24627    tech_tickets    TABLE     �   CREATE TABLE public.tech_tickets (
    id integer NOT NULL,
    tech_id integer,
    ticket_id integer,
    ticket_status character varying(20)
);
     DROP TABLE public.tech_tickets;
       public         heap    postgres    false            �            1259    24626    tech_tickets_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tech_tickets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.tech_tickets_id_seq;
       public          postgres    false    220            S           0    0    tech_tickets_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.tech_tickets_id_seq OWNED BY public.tech_tickets.id;
          public          postgres    false    219            �            1259    24602    technicians    TABLE     j  CREATE TABLE public.technicians (
    id integer NOT NULL,
    tech_id integer NOT NULL,
    tech_empid character varying(20),
    tech_category integer,
    tech_name character varying(255) NOT NULL,
    tech_email character varying(255) NOT NULL,
    tech_phone bigint,
    tech_status integer,
    tech_verify integer,
    tech_dob date,
    tech_doj date
);
    DROP TABLE public.technicians;
       public         heap    postgres    false            �            1259    24601    technicians_id_seq    SEQUENCE     �   CREATE SEQUENCE public.technicians_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.technicians_id_seq;
       public          postgres    false    216            T           0    0    technicians_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.technicians_id_seq OWNED BY public.technicians.id;
          public          postgres    false    215            �            1259    24616    tickets    TABLE       CREATE TABLE public.tickets (
    id integer NOT NULL,
    sc_id integer,
    title text,
    description text,
    raised_by integer,
    assigned_to integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    resolved_at timestamp without time zone,
    closed_at timestamp without time zone,
    reason character varying(255),
    closed_by integer,
    ticket_status character varying(20),
    changed_by integer,
    comments text
);
    DROP TABLE public.tickets;
       public         heap    postgres    false            �            1259    24615    tickets_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tickets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.tickets_id_seq;
       public          postgres    false    218            U           0    0    tickets_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.tickets_id_seq OWNED BY public.tickets.id;
          public          postgres    false    217            �            1259    24590    users    TABLE     ,  CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    emp_id character varying(20),
    phone bigint,
    user_type integer,
    user_status integer,
    login_status integer,
    dob date,
    doj date,
    api_token character varying(255),
    fcm_token character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.users;
       public         heap    postgres    false            �           2604    24655    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    226    226            �           2604    24663    knowledgebase id    DEFAULT     t   ALTER TABLE ONLY public.knowledgebase ALTER COLUMN id SET DEFAULT nextval('public.knowledgebase_id_seq'::regclass);
 ?   ALTER TABLE public.knowledgebase ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228            �           2604    24644    messages id    DEFAULT     j   ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);
 :   ALTER TABLE public.messages ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    24637    sub_category id    DEFAULT     r   ALTER TABLE ONLY public.sub_category ALTER COLUMN id SET DEFAULT nextval('public.sub_category_id_seq'::regclass);
 >   ALTER TABLE public.sub_category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            �           2604    24630    tech_tickets id    DEFAULT     r   ALTER TABLE ONLY public.tech_tickets ALTER COLUMN id SET DEFAULT nextval('public.tech_tickets_id_seq'::regclass);
 >   ALTER TABLE public.tech_tickets ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    24605    technicians id    DEFAULT     p   ALTER TABLE ONLY public.technicians ALTER COLUMN id SET DEFAULT nextval('public.technicians_id_seq'::regclass);
 =   ALTER TABLE public.technicians ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            �           2604    24619 
   tickets id    DEFAULT     h   ALTER TABLE ONLY public.tickets ALTER COLUMN id SET DEFAULT nextval('public.tickets_id_seq'::regclass);
 9   ALTER TABLE public.tickets ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            F          0    24652    category 
   TABLE DATA           .   COPY public.category (id, c_name) FROM stdin;
    public          postgres    false    226   <E       H          0    24660    knowledgebase 
   TABLE DATA           `   COPY public.knowledgebase (id, title, description, content, created_at, updated_at) FROM stdin;
    public          postgres    false    228   kE       D          0    24641    messages 
   TABLE DATA           j   COPY public.messages (id, sender_id, receiver_id, ticket_id, message, created_at, updated_at) FROM stdin;
    public          postgres    false    224   �E       B          0    24634    sub_category 
   TABLE DATA           8   COPY public.sub_category (id, c_id, s_name) FROM stdin;
    public          postgres    false    222   �E       @          0    24627    tech_tickets 
   TABLE DATA           M   COPY public.tech_tickets (id, tech_id, ticket_id, ticket_status) FROM stdin;
    public          postgres    false    220   �E       <          0    24602    technicians 
   TABLE DATA           �   COPY public.technicians (id, tech_id, tech_empid, tech_category, tech_name, tech_email, tech_phone, tech_status, tech_verify, tech_dob, tech_doj) FROM stdin;
    public          postgres    false    216   )F       >          0    24616    tickets 
   TABLE DATA           �   COPY public.tickets (id, sc_id, title, description, raised_by, assigned_to, created_at, updated_at, resolved_at, closed_at, reason, closed_by, ticket_status, changed_by, comments) FROM stdin;
    public          postgres    false    218   �F       :          0    24590    users 
   TABLE DATA           �   COPY public.users (id, name, email, password, emp_id, phone, user_type, user_status, login_status, dob, doj, api_token, fcm_token, created_at, updated_at) FROM stdin;
    public          postgres    false    214   G       V           0    0    category_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.category_id_seq', 1, false);
          public          postgres    false    225            W           0    0    knowledgebase_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.knowledgebase_id_seq', 1, false);
          public          postgres    false    227            X           0    0    messages_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.messages_id_seq', 1, false);
          public          postgres    false    223            Y           0    0    sub_category_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.sub_category_id_seq', 1, false);
          public          postgres    false    221            Z           0    0    tech_tickets_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tech_tickets_id_seq', 1, false);
          public          postgres    false    219            [           0    0    technicians_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.technicians_id_seq', 1, true);
          public          postgres    false    215            \           0    0    tickets_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.tickets_id_seq', 1, false);
          public          postgres    false    217            �           2606    24657    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    226            �           2606    24669     knowledgebase knowledgebase_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.knowledgebase
    ADD CONSTRAINT knowledgebase_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.knowledgebase DROP CONSTRAINT knowledgebase_pkey;
       public            postgres    false    228            �           2606    24650    messages messages_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_pkey;
       public            postgres    false    224            �           2606    24639    sub_category sub_category_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.sub_category
    ADD CONSTRAINT sub_category_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.sub_category DROP CONSTRAINT sub_category_pkey;
       public            postgres    false    222            �           2606    24632    tech_tickets tech_tickets_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.tech_tickets
    ADD CONSTRAINT tech_tickets_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.tech_tickets DROP CONSTRAINT tech_tickets_pkey;
       public            postgres    false    220            �           2606    24609    technicians technicians_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.technicians
    ADD CONSTRAINT technicians_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.technicians DROP CONSTRAINT technicians_pkey;
       public            postgres    false    216            �           2606    24613 &   technicians technicians_tech_email_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.technicians
    ADD CONSTRAINT technicians_tech_email_key UNIQUE (tech_email);
 P   ALTER TABLE ONLY public.technicians DROP CONSTRAINT technicians_tech_email_key;
       public            postgres    false    216            �           2606    24611 #   technicians technicians_tech_id_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.technicians
    ADD CONSTRAINT technicians_tech_id_key UNIQUE (tech_id);
 M   ALTER TABLE ONLY public.technicians DROP CONSTRAINT technicians_tech_id_key;
       public            postgres    false    216            �           2606    24625    tickets tickets_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.tickets DROP CONSTRAINT tickets_pkey;
       public            postgres    false    218            �           2606    24600    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    214            �           2606    24598    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    214            F      x�3�LN,IM7�2�0���!c�=... �j      H      x������ � �      D      x������ � �      B   G   x�M���0���0��w�4A`d {$��	����=��$*jRea3'�I��i$,VhⰒ�9�J �5 �      @      x�310�420�412<]|\�b���� 0�      <   [   x�320�460�t�00 ҆�%��Fҡ$��D/9?����������Ԃ� c�����������J"�ZZ���� ����� ZL6      >   d   x�3110�4�,I-.Q(�L�N-�rRR���2J2��9��8c�8���u,t��̭L�L,�,�̍̌�I5���+H-Ď����Լ�=... ��"'      :   �   x����J1���)|���/3�?'{�x�؋�=T�n���n�q˄&_�ھ>>�u��q8�q�uXVzx|ff�Z�M�J&�{�:`��p��,7�h��R�ĉ^����8兞�3�����aJ�}��s���#���+U�u�1S��q���M�ݬܔE��XQ�J�e��8|˒y�\dPf�:�o�h����ȿ���!���nG     