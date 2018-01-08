PGDMP                           v            objects    9.6.5    9.6.5 0    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    16627    objects    DATABASE     y   CREATE DATABASE objects WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE objects;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    4                        3079    12427    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1                        3079    16628    chkpass 	   EXTENSION     ;   CREATE EXTENSION IF NOT EXISTS chkpass WITH SCHEMA public;
    DROP EXTENSION chkpass;
                  false    4            �           0    0    EXTENSION chkpass    COMMENT     J   COMMENT ON EXTENSION chkpass IS 'data type for auto-encrypted passwords';
                       false    2            �            1259    16667    contenedores_externos    TABLE     �   CREATE TABLE contenedores_externos (
    id_ct_externo integer NOT NULL,
    fid_inventario integer,
    nombre_ct_externo text,
    dimensiones_ct_externo integer[],
    props_ct_externo jsonb,
    link_imagen character varying
);
 )   DROP TABLE public.contenedores_externos;
       public         postgres    false    4            �            1259    16665 '   contenedores_externos_id_ct_externo_seq    SEQUENCE     �   CREATE SEQUENCE contenedores_externos_id_ct_externo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.contenedores_externos_id_ct_externo_seq;
       public       postgres    false    191    4            �           0    0 '   contenedores_externos_id_ct_externo_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE contenedores_externos_id_ct_externo_seq OWNED BY contenedores_externos.id_ct_externo;
            public       postgres    false    190            �            1259    16683    contenedores_internos    TABLE     �   CREATE TABLE contenedores_internos (
    id_ct_interno integer NOT NULL,
    fid_ct_externo integer,
    nombre_ct_interno text,
    dimensiones_ct_interno integer[],
    props_ct_interno jsonb,
    link_imagen character varying
);
 )   DROP TABLE public.contenedores_internos;
       public         postgres    false    4            �            1259    16681 '   contenedores_internos_id_ct_interno_seq    SEQUENCE     �   CREATE SEQUENCE contenedores_internos_id_ct_interno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.contenedores_internos_id_ct_interno_seq;
       public       postgres    false    4    193            �           0    0 '   contenedores_internos_id_ct_interno_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE contenedores_internos_id_ct_interno_seq OWNED BY contenedores_internos.id_ct_interno;
            public       postgres    false    192            �            1259    16651    inventarios    TABLE     �   CREATE TABLE inventarios (
    id_inventario integer NOT NULL,
    fid_usuario integer,
    nombre_inventario text,
    props_inventario jsonb
);
    DROP TABLE public.inventarios;
       public         postgres    false    4            �            1259    16649    inventarios_id_inventario_seq    SEQUENCE        CREATE SEQUENCE inventarios_id_inventario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.inventarios_id_inventario_seq;
       public       postgres    false    189    4            �           0    0    inventarios_id_inventario_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE inventarios_id_inventario_seq OWNED BY inventarios.id_inventario;
            public       postgres    false    188            �            1259    16699    objetos    TABLE     �   CREATE TABLE objetos (
    id_objeto integer NOT NULL,
    fid_ct_interno integer,
    nombre_objeto text,
    img_link text,
    props_objeto jsonb
);
    DROP TABLE public.objetos;
       public         postgres    false    4            �            1259    16697    objetos_id_objeto_seq    SEQUENCE     w   CREATE SEQUENCE objetos_id_objeto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.objetos_id_objeto_seq;
       public       postgres    false    195    4            �           0    0    objetos_id_objeto_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE objetos_id_objeto_seq OWNED BY objetos.id_objeto;
            public       postgres    false    194            �            1259    16640    usuarios    TABLE     �   CREATE TABLE usuarios (
    id_usuario integer NOT NULL,
    nombre_usuario character varying,
    contrasena_usuario chkpass
);
    DROP TABLE public.usuarios;
       public         postgres    false    2    4    2    4    2    4    4            �            1259    16638    usuarios_id_usuario_seq    SEQUENCE     y   CREATE SEQUENCE usuarios_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.usuarios_id_usuario_seq;
       public       postgres    false    4    187            �           0    0    usuarios_id_usuario_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE usuarios_id_usuario_seq OWNED BY usuarios.id_usuario;
            public       postgres    false    186            !           2604    16670 #   contenedores_externos id_ct_externo    DEFAULT     �   ALTER TABLE ONLY contenedores_externos ALTER COLUMN id_ct_externo SET DEFAULT nextval('contenedores_externos_id_ct_externo_seq'::regclass);
 R   ALTER TABLE public.contenedores_externos ALTER COLUMN id_ct_externo DROP DEFAULT;
       public       postgres    false    190    191    191            "           2604    16686 #   contenedores_internos id_ct_interno    DEFAULT     �   ALTER TABLE ONLY contenedores_internos ALTER COLUMN id_ct_interno SET DEFAULT nextval('contenedores_internos_id_ct_interno_seq'::regclass);
 R   ALTER TABLE public.contenedores_internos ALTER COLUMN id_ct_interno DROP DEFAULT;
       public       postgres    false    192    193    193                        2604    16654    inventarios id_inventario    DEFAULT     x   ALTER TABLE ONLY inventarios ALTER COLUMN id_inventario SET DEFAULT nextval('inventarios_id_inventario_seq'::regclass);
 H   ALTER TABLE public.inventarios ALTER COLUMN id_inventario DROP DEFAULT;
       public       postgres    false    188    189    189            #           2604    16702    objetos id_objeto    DEFAULT     h   ALTER TABLE ONLY objetos ALTER COLUMN id_objeto SET DEFAULT nextval('objetos_id_objeto_seq'::regclass);
 @   ALTER TABLE public.objetos ALTER COLUMN id_objeto DROP DEFAULT;
       public       postgres    false    195    194    195                       2604    16643    usuarios id_usuario    DEFAULT     l   ALTER TABLE ONLY usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('usuarios_id_usuario_seq'::regclass);
 B   ALTER TABLE public.usuarios ALTER COLUMN id_usuario DROP DEFAULT;
       public       postgres    false    187    186    187            �          0    16667    contenedores_externos 
   TABLE DATA               �   COPY contenedores_externos (id_ct_externo, fid_inventario, nombre_ct_externo, dimensiones_ct_externo, props_ct_externo, link_imagen) FROM stdin;
    public       postgres    false    191   �7       �           0    0 '   contenedores_externos_id_ct_externo_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('contenedores_externos_id_ct_externo_seq', 3, true);
            public       postgres    false    190            �          0    16683    contenedores_internos 
   TABLE DATA               �   COPY contenedores_internos (id_ct_interno, fid_ct_externo, nombre_ct_interno, dimensiones_ct_interno, props_ct_interno, link_imagen) FROM stdin;
    public       postgres    false    193   *8       �           0    0 '   contenedores_internos_id_ct_interno_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('contenedores_internos_id_ct_interno_seq', 1, false);
            public       postgres    false    192            �          0    16651    inventarios 
   TABLE DATA               _   COPY inventarios (id_inventario, fid_usuario, nombre_inventario, props_inventario) FROM stdin;
    public       postgres    false    189   G8       �           0    0    inventarios_id_inventario_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('inventarios_id_inventario_seq', 15, true);
            public       postgres    false    188            �          0    16699    objetos 
   TABLE DATA               \   COPY objetos (id_objeto, fid_ct_interno, nombre_objeto, img_link, props_objeto) FROM stdin;
    public       postgres    false    195   �9       �           0    0    objetos_id_objeto_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('objetos_id_objeto_seq', 1, false);
            public       postgres    false    194            �          0    16640    usuarios 
   TABLE DATA               K   COPY usuarios (id_usuario, nombre_usuario, contrasena_usuario) FROM stdin;
    public       postgres    false    187   �9       �           0    0    usuarios_id_usuario_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('usuarios_id_usuario_seq', 7, true);
            public       postgres    false    186            )           2606    16675 0   contenedores_externos contenedores_externos_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY contenedores_externos
    ADD CONSTRAINT contenedores_externos_pkey PRIMARY KEY (id_ct_externo);
 Z   ALTER TABLE ONLY public.contenedores_externos DROP CONSTRAINT contenedores_externos_pkey;
       public         postgres    false    191    191            +           2606    16691 0   contenedores_internos contenedores_internos_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY contenedores_internos
    ADD CONSTRAINT contenedores_internos_pkey PRIMARY KEY (id_ct_interno);
 Z   ALTER TABLE ONLY public.contenedores_internos DROP CONSTRAINT contenedores_internos_pkey;
       public         postgres    false    193    193            '           2606    16659    inventarios inventarios_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY inventarios
    ADD CONSTRAINT inventarios_pkey PRIMARY KEY (id_inventario);
 F   ALTER TABLE ONLY public.inventarios DROP CONSTRAINT inventarios_pkey;
       public         postgres    false    189    189            -           2606    16707    objetos objetos_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY objetos
    ADD CONSTRAINT objetos_pkey PRIMARY KEY (id_objeto);
 >   ALTER TABLE ONLY public.objetos DROP CONSTRAINT objetos_pkey;
       public         postgres    false    195    195            %           2606    16648    usuarios usuarios_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public         postgres    false    187    187            /           2606    16676 ?   contenedores_externos contenedores_externos_fid_inventario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY contenedores_externos
    ADD CONSTRAINT contenedores_externos_fid_inventario_fkey FOREIGN KEY (fid_inventario) REFERENCES inventarios(id_inventario);
 i   ALTER TABLE ONLY public.contenedores_externos DROP CONSTRAINT contenedores_externos_fid_inventario_fkey;
       public       postgres    false    191    189    2087            0           2606    16692 ?   contenedores_internos contenedores_internos_fid_ct_externo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY contenedores_internos
    ADD CONSTRAINT contenedores_internos_fid_ct_externo_fkey FOREIGN KEY (fid_ct_externo) REFERENCES contenedores_externos(id_ct_externo);
 i   ALTER TABLE ONLY public.contenedores_internos DROP CONSTRAINT contenedores_internos_fid_ct_externo_fkey;
       public       postgres    false    2089    193    191            .           2606    16660 (   inventarios inventarios_fid_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY inventarios
    ADD CONSTRAINT inventarios_fid_usuario_fkey FOREIGN KEY (fid_usuario) REFERENCES usuarios(id_usuario);
 R   ALTER TABLE ONLY public.inventarios DROP CONSTRAINT inventarios_fid_usuario_fkey;
       public       postgres    false    2085    187    189            1           2606    16708 #   objetos objetos_fid_ct_interno_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY objetos
    ADD CONSTRAINT objetos_fid_ct_interno_fkey FOREIGN KEY (fid_ct_interno) REFERENCES contenedores_internos(id_ct_interno);
 M   ALTER TABLE ONLY public.objetos DROP CONSTRAINT objetos_fid_ct_interno_fkey;
       public       postgres    false    2091    193    195            �   �   x�u�1�0k�'�(��#���\�������c�Tі�;S��x|I��Mh��*����P�ܨ<��g�zR�Ot�i��A@s����_ʵP�F���,z���(�����
\�	�QyI��P'�s�\y�֯��Xk߉L�      �      x������ � �      �   n  x��Q[N�0�vN��w���H�8�c�l�ǎ���U�8B/�:E�~�d��fvfv�V��儆O�N���!q�w�B�莢	<-�jv3���=ad0Yz�>V�o����x	��r"ٲ|�L�\��U$֪)��A/��E�A�"����������.��}�9����E���Z�^��tYZe�(w������vرa�Ůo#�Y���e&�8�a<�E0_��CbrS��0'/����Xݜs����H�b�z����Bq7Yt��&�6e�/�2xG��P�-�EK-�$��VI��-Y�Yܽ�.�gv=X����kU7��k�b �-�M�^��
��F�1v;9� ����ǫ��> ���      �      x������ � �      �   �   x����  ���S�mPiyk�e��[\����`s�ӷ��ǡ����&c���u��$���d	gzMZ�*����X)Lu�p��:���V�:B����_Cl��Q��omia}��q��)�L*gI�R�i�9d��	��}]T�y.!?�[0z     