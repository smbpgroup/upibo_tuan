--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE saleor; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE saleor IS 'Initial';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: btree_gin; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS btree_gin WITH SCHEMA public;


--
-- Name: EXTENSION btree_gin; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION btree_gin IS 'support for indexing common datatypes in GIN';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_address; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.account_address (
    id integer NOT NULL,
    first_name character varying(256) NOT NULL,
    last_name character varying(256) NOT NULL,
    company_name character varying(256) NOT NULL,
    street_address_1 character varying(256) NOT NULL,
    street_address_2 character varying(256) NOT NULL,
    city character varying(256) NOT NULL,
    postal_code character varying(20) NOT NULL,
    country character varying(2) NOT NULL,
    country_area character varying(128) NOT NULL,
    phone character varying(128) NOT NULL,
    city_area character varying(128) NOT NULL
);


ALTER TABLE public.account_address OWNER TO saleor;

--
-- Name: account_customernote; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.account_customernote (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    content text NOT NULL,
    is_public boolean NOT NULL,
    customer_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.account_customernote OWNER TO saleor;

--
-- Name: account_customernote_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.account_customernote_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_customernote_id_seq OWNER TO saleor;

--
-- Name: account_customernote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.account_customernote_id_seq OWNED BY public.account_customernote.id;


--
-- Name: account_user; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.account_user (
    id integer NOT NULL,
    is_superuser boolean NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    password character varying(128) NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    last_login timestamp with time zone,
    default_billing_address_id integer,
    default_shipping_address_id integer,
    note text,
    token uuid NOT NULL
);


ALTER TABLE public.account_user OWNER TO saleor;

--
-- Name: account_user_addresses; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.account_user_addresses (
    id integer NOT NULL,
    user_id integer NOT NULL,
    address_id integer NOT NULL
);


ALTER TABLE public.account_user_addresses OWNER TO saleor;

--
-- Name: account_user_groups; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.account_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.account_user_groups OWNER TO saleor;

--
-- Name: account_user_user_permissions; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.account_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.account_user_user_permissions OWNER TO saleor;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO saleor;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO saleor;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO saleor;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO saleor;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO saleor;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO saleor;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: checkout_cartline; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.checkout_cartline (
    id integer NOT NULL,
    quantity integer NOT NULL,
    data text NOT NULL,
    cart_id uuid NOT NULL,
    variant_id integer NOT NULL,
    CONSTRAINT cart_cartline_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.checkout_cartline OWNER TO saleor;

--
-- Name: cart_cartline_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.cart_cartline_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_cartline_id_seq OWNER TO saleor;

--
-- Name: cart_cartline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.cart_cartline_id_seq OWNED BY public.checkout_cartline.id;


--
-- Name: checkout_cart; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.checkout_cart (
    created timestamp with time zone NOT NULL,
    last_change timestamp with time zone NOT NULL,
    email character varying(254) NOT NULL,
    token uuid NOT NULL,
    quantity integer NOT NULL,
    user_id integer,
    billing_address_id integer,
    discount_amount numeric(12,2) NOT NULL,
    discount_name character varying(255),
    note text NOT NULL,
    shipping_address_id integer,
    shipping_method_id integer,
    voucher_code character varying(12),
    translated_discount_name character varying(255),
    CONSTRAINT cart_cart_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.checkout_cart OWNER TO saleor;

--
-- Name: contentitem_code_codeitem; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.contentitem_code_codeitem (
    contentitem_ptr_id integer NOT NULL,
    language character varying(50) NOT NULL,
    code text NOT NULL,
    linenumbers boolean NOT NULL
);


ALTER TABLE public.contentitem_code_codeitem OWNER TO saleor;

--
-- Name: contentitem_iframe_iframeitem; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.contentitem_iframe_iframeitem (
    contentitem_ptr_id integer NOT NULL,
    src character varying(200) NOT NULL,
    width character varying(10) NOT NULL,
    height character varying(10) NOT NULL
);


ALTER TABLE public.contentitem_iframe_iframeitem OWNER TO saleor;

--
-- Name: contentitem_markup_markupitem; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.contentitem_markup_markupitem (
    contentitem_ptr_id integer NOT NULL,
    text text NOT NULL,
    language character varying(30) NOT NULL
);


ALTER TABLE public.contentitem_markup_markupitem OWNER TO saleor;

--
-- Name: contentitem_rawhtml_rawhtmlitem; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.contentitem_rawhtml_rawhtmlitem (
    contentitem_ptr_id integer NOT NULL,
    html text NOT NULL
);


ALTER TABLE public.contentitem_rawhtml_rawhtmlitem OWNER TO saleor;

--
-- Name: contentitem_sharedcontent_sharedcontentitem; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.contentitem_sharedcontent_sharedcontentitem (
    contentitem_ptr_id integer NOT NULL,
    shared_content_id integer NOT NULL
);


ALTER TABLE public.contentitem_sharedcontent_sharedcontentitem OWNER TO saleor;

--
-- Name: contentitem_text_textitem; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.contentitem_text_textitem (
    contentitem_ptr_id integer NOT NULL,
    text text NOT NULL,
    text_final text
);


ALTER TABLE public.contentitem_text_textitem OWNER TO saleor;

--
-- Name: discount_sale; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.discount_sale (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(10) NOT NULL,
    value numeric(12,2) NOT NULL,
    end_date date,
    start_date date NOT NULL
);


ALTER TABLE public.discount_sale OWNER TO saleor;

--
-- Name: discount_sale_categories; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.discount_sale_categories (
    id integer NOT NULL,
    sale_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.discount_sale_categories OWNER TO saleor;

--
-- Name: discount_sale_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.discount_sale_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discount_sale_categories_id_seq OWNER TO saleor;

--
-- Name: discount_sale_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.discount_sale_categories_id_seq OWNED BY public.discount_sale_categories.id;


--
-- Name: discount_sale_collections; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.discount_sale_collections (
    id integer NOT NULL,
    sale_id integer NOT NULL,
    collection_id integer NOT NULL
);


ALTER TABLE public.discount_sale_collections OWNER TO saleor;

--
-- Name: discount_sale_collections_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.discount_sale_collections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discount_sale_collections_id_seq OWNER TO saleor;

--
-- Name: discount_sale_collections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.discount_sale_collections_id_seq OWNED BY public.discount_sale_collections.id;


--
-- Name: discount_sale_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.discount_sale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discount_sale_id_seq OWNER TO saleor;

--
-- Name: discount_sale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.discount_sale_id_seq OWNED BY public.discount_sale.id;


--
-- Name: discount_sale_products; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.discount_sale_products (
    id integer NOT NULL,
    sale_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.discount_sale_products OWNER TO saleor;

--
-- Name: discount_sale_products_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.discount_sale_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discount_sale_products_id_seq OWNER TO saleor;

--
-- Name: discount_sale_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.discount_sale_products_id_seq OWNED BY public.discount_sale_products.id;


--
-- Name: discount_voucher; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.discount_voucher (
    id integer NOT NULL,
    type character varying(20) NOT NULL,
    name character varying(255),
    code character varying(12) NOT NULL,
    usage_limit integer,
    used integer NOT NULL,
    start_date date NOT NULL,
    end_date date,
    discount_value_type character varying(10) NOT NULL,
    discount_value numeric(12,2) NOT NULL,
    min_amount_spent numeric(12,2),
    apply_once_per_order boolean NOT NULL,
    countries character varying(749) NOT NULL,
    CONSTRAINT discount_voucher_usage_limit_check CHECK ((usage_limit >= 0)),
    CONSTRAINT discount_voucher_used_check CHECK ((used >= 0))
);


ALTER TABLE public.discount_voucher OWNER TO saleor;

--
-- Name: discount_voucher_categories; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.discount_voucher_categories (
    id integer NOT NULL,
    voucher_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.discount_voucher_categories OWNER TO saleor;

--
-- Name: discount_voucher_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.discount_voucher_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discount_voucher_categories_id_seq OWNER TO saleor;

--
-- Name: discount_voucher_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.discount_voucher_categories_id_seq OWNED BY public.discount_voucher_categories.id;


--
-- Name: discount_voucher_collections; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.discount_voucher_collections (
    id integer NOT NULL,
    voucher_id integer NOT NULL,
    collection_id integer NOT NULL
);


ALTER TABLE public.discount_voucher_collections OWNER TO saleor;

--
-- Name: discount_voucher_collections_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.discount_voucher_collections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discount_voucher_collections_id_seq OWNER TO saleor;

--
-- Name: discount_voucher_collections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.discount_voucher_collections_id_seq OWNED BY public.discount_voucher_collections.id;


--
-- Name: discount_voucher_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.discount_voucher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discount_voucher_id_seq OWNER TO saleor;

--
-- Name: discount_voucher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.discount_voucher_id_seq OWNED BY public.discount_voucher.id;


--
-- Name: discount_voucher_products; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.discount_voucher_products (
    id integer NOT NULL,
    voucher_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.discount_voucher_products OWNER TO saleor;

--
-- Name: discount_voucher_products_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.discount_voucher_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discount_voucher_products_id_seq OWNER TO saleor;

--
-- Name: discount_voucher_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.discount_voucher_products_id_seq OWNED BY public.discount_voucher_products.id;


--
-- Name: discount_vouchertranslation; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.discount_vouchertranslation (
    id integer NOT NULL,
    language_code character varying(10) NOT NULL,
    name character varying(255),
    voucher_id integer NOT NULL
);


ALTER TABLE public.discount_vouchertranslation OWNER TO saleor;

--
-- Name: discount_vouchertranslation_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.discount_vouchertranslation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discount_vouchertranslation_id_seq OWNER TO saleor;

--
-- Name: discount_vouchertranslation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.discount_vouchertranslation_id_seq OWNED BY public.discount_vouchertranslation.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO saleor;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO saleor;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_celery_results_taskresult; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.django_celery_results_taskresult (
    id integer NOT NULL,
    task_id character varying(255) NOT NULL,
    status character varying(50) NOT NULL,
    content_type character varying(128) NOT NULL,
    content_encoding character varying(64) NOT NULL,
    result text,
    date_done timestamp with time zone NOT NULL,
    traceback text,
    hidden boolean NOT NULL,
    meta text
);


ALTER TABLE public.django_celery_results_taskresult OWNER TO saleor;

--
-- Name: django_celery_results_taskresult_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.django_celery_results_taskresult_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_results_taskresult_id_seq OWNER TO saleor;

--
-- Name: django_celery_results_taskresult_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.django_celery_results_taskresult_id_seq OWNED BY public.django_celery_results_taskresult.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO saleor;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO saleor;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO saleor;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO saleor;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_prices_openexchangerates_conversionrate; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.django_prices_openexchangerates_conversionrate (
    id integer NOT NULL,
    to_currency character varying(3) NOT NULL,
    rate numeric(20,12) NOT NULL,
    modified_at timestamp with time zone NOT NULL
);


ALTER TABLE public.django_prices_openexchangerates_conversionrate OWNER TO saleor;

--
-- Name: django_prices_openexchangerates_conversionrate_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.django_prices_openexchangerates_conversionrate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_prices_openexchangerates_conversionrate_id_seq OWNER TO saleor;

--
-- Name: django_prices_openexchangerates_conversionrate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.django_prices_openexchangerates_conversionrate_id_seq OWNED BY public.django_prices_openexchangerates_conversionrate.id;


--
-- Name: django_prices_vatlayer_ratetypes; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.django_prices_vatlayer_ratetypes (
    id integer NOT NULL,
    types text NOT NULL
);


ALTER TABLE public.django_prices_vatlayer_ratetypes OWNER TO saleor;

--
-- Name: django_prices_vatlayer_ratetypes_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.django_prices_vatlayer_ratetypes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_prices_vatlayer_ratetypes_id_seq OWNER TO saleor;

--
-- Name: django_prices_vatlayer_ratetypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.django_prices_vatlayer_ratetypes_id_seq OWNED BY public.django_prices_vatlayer_ratetypes.id;


--
-- Name: django_prices_vatlayer_vat; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.django_prices_vatlayer_vat (
    id integer NOT NULL,
    country_code character varying(2) NOT NULL,
    data text NOT NULL
);


ALTER TABLE public.django_prices_vatlayer_vat OWNER TO saleor;

--
-- Name: django_prices_vatlayer_vat_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.django_prices_vatlayer_vat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_prices_vatlayer_vat_id_seq OWNER TO saleor;

--
-- Name: django_prices_vatlayer_vat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.django_prices_vatlayer_vat_id_seq OWNED BY public.django_prices_vatlayer_vat.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO saleor;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO saleor;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO saleor;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: fluent_contents_contentitem; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.fluent_contents_contentitem (
    id integer NOT NULL,
    parent_id integer,
    language_code character varying(15) NOT NULL,
    sort_order integer NOT NULL,
    parent_type_id integer NOT NULL,
    placeholder_id integer,
    polymorphic_ctype_id integer
);


ALTER TABLE public.fluent_contents_contentitem OWNER TO saleor;

--
-- Name: fluent_contents_contentitem_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.fluent_contents_contentitem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fluent_contents_contentitem_id_seq OWNER TO saleor;

--
-- Name: fluent_contents_contentitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.fluent_contents_contentitem_id_seq OWNED BY public.fluent_contents_contentitem.id;


--
-- Name: fluent_contents_placeholder; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.fluent_contents_placeholder (
    id integer NOT NULL,
    slot character varying(50) NOT NULL,
    role character varying(1) NOT NULL,
    parent_id integer,
    title character varying(255) NOT NULL,
    parent_type_id integer
);


ALTER TABLE public.fluent_contents_placeholder OWNER TO saleor;

--
-- Name: fluent_contents_placeholder_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.fluent_contents_placeholder_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fluent_contents_placeholder_id_seq OWNER TO saleor;

--
-- Name: fluent_contents_placeholder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.fluent_contents_placeholder_id_seq OWNED BY public.fluent_contents_placeholder.id;


--
-- Name: impersonate_impersonationlog; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.impersonate_impersonationlog (
    id integer NOT NULL,
    session_key character varying(40) NOT NULL,
    session_started_at timestamp with time zone,
    session_ended_at timestamp with time zone,
    impersonating_id integer NOT NULL,
    impersonator_id integer NOT NULL
);


ALTER TABLE public.impersonate_impersonationlog OWNER TO saleor;

--
-- Name: impersonate_impersonationlog_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.impersonate_impersonationlog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.impersonate_impersonationlog_id_seq OWNER TO saleor;

--
-- Name: impersonate_impersonationlog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.impersonate_impersonationlog_id_seq OWNED BY public.impersonate_impersonationlog.id;


--
-- Name: menu_menu; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.menu_menu (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    json_content text NOT NULL
);


ALTER TABLE public.menu_menu OWNER TO saleor;

--
-- Name: menu_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.menu_menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_menu_id_seq OWNER TO saleor;

--
-- Name: menu_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.menu_menu_id_seq OWNED BY public.menu_menu.id;


--
-- Name: menu_menuitem; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.menu_menuitem (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    sort_order integer NOT NULL,
    url character varying(256),
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    category_id integer,
    collection_id integer,
    menu_id integer NOT NULL,
    page_id integer,
    parent_id integer,
    CONSTRAINT menu_menuitem_level_check CHECK ((level >= 0)),
    CONSTRAINT menu_menuitem_lft_check CHECK ((lft >= 0)),
    CONSTRAINT menu_menuitem_rght_check CHECK ((rght >= 0)),
    CONSTRAINT menu_menuitem_sort_order_check CHECK ((sort_order >= 0)),
    CONSTRAINT menu_menuitem_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.menu_menuitem OWNER TO saleor;

--
-- Name: menu_menuitem_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.menu_menuitem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_menuitem_id_seq OWNER TO saleor;

--
-- Name: menu_menuitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.menu_menuitem_id_seq OWNED BY public.menu_menuitem.id;


--
-- Name: menu_menuitemtranslation; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.menu_menuitemtranslation (
    id integer NOT NULL,
    language_code character varying(10) NOT NULL,
    name character varying(128) NOT NULL,
    menu_item_id integer NOT NULL
);


ALTER TABLE public.menu_menuitemtranslation OWNER TO saleor;

--
-- Name: menu_menuitemtranslation_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.menu_menuitemtranslation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_menuitemtranslation_id_seq OWNER TO saleor;

--
-- Name: menu_menuitemtranslation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.menu_menuitemtranslation_id_seq OWNED BY public.menu_menuitemtranslation.id;


--
-- Name: order_fulfillment; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.order_fulfillment (
    id integer NOT NULL,
    tracking_number character varying(255) NOT NULL,
    shipping_date timestamp with time zone NOT NULL,
    order_id integer NOT NULL,
    fulfillment_order integer NOT NULL,
    status character varying(32) NOT NULL,
    CONSTRAINT order_fulfillment_fulfillment_order_check CHECK ((fulfillment_order >= 0))
);


ALTER TABLE public.order_fulfillment OWNER TO saleor;

--
-- Name: order_fulfillment_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.order_fulfillment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_fulfillment_id_seq OWNER TO saleor;

--
-- Name: order_fulfillment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.order_fulfillment_id_seq OWNED BY public.order_fulfillment.id;


--
-- Name: order_fulfillmentline; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.order_fulfillmentline (
    id integer NOT NULL,
    order_line_id integer NOT NULL,
    quantity integer NOT NULL,
    fulfillment_id integer NOT NULL
);


ALTER TABLE public.order_fulfillmentline OWNER TO saleor;

--
-- Name: order_fulfillmentline_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.order_fulfillmentline_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_fulfillmentline_id_seq OWNER TO saleor;

--
-- Name: order_fulfillmentline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.order_fulfillmentline_id_seq OWNED BY public.order_fulfillmentline.id;


--
-- Name: order_order; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.order_order (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    tracking_client_id character varying(36) NOT NULL,
    user_email character varying(254) NOT NULL,
    token character varying(36) NOT NULL,
    billing_address_id integer,
    shipping_address_id integer,
    user_id integer,
    total_net numeric(12,2) NOT NULL,
    discount_amount numeric(12,2) NOT NULL,
    discount_name character varying(255) NOT NULL,
    voucher_id integer,
    language_code character varying(35) NOT NULL,
    shipping_price_gross numeric(12,2) NOT NULL,
    total_gross numeric(12,2) NOT NULL,
    shipping_price_net numeric(12,2) NOT NULL,
    status character varying(32) NOT NULL,
    shipping_method_name character varying(255),
    shipping_method_id integer,
    display_gross_prices boolean NOT NULL,
    translated_discount_name character varying(255) NOT NULL,
    customer_note text NOT NULL
);


ALTER TABLE public.order_order OWNER TO saleor;

--
-- Name: order_order_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.order_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_order_id_seq OWNER TO saleor;

--
-- Name: order_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.order_order_id_seq OWNED BY public.order_order.id;


--
-- Name: order_orderline; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.order_orderline (
    id integer NOT NULL,
    product_name character varying(386) NOT NULL,
    product_sku character varying(32) NOT NULL,
    quantity integer NOT NULL,
    unit_price_net numeric(12,2) NOT NULL,
    unit_price_gross numeric(12,2) NOT NULL,
    is_shipping_required boolean NOT NULL,
    order_id integer NOT NULL,
    quantity_fulfilled integer NOT NULL,
    variant_id integer,
    tax_rate numeric(5,2) NOT NULL,
    translated_product_name character varying(386) NOT NULL
);


ALTER TABLE public.order_orderline OWNER TO saleor;

--
-- Name: order_ordereditem_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.order_ordereditem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_ordereditem_id_seq OWNER TO saleor;

--
-- Name: order_ordereditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.order_ordereditem_id_seq OWNED BY public.order_orderline.id;


--
-- Name: order_orderhistoryentry; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.order_orderhistoryentry (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    order_id integer NOT NULL,
    user_id integer,
    content text NOT NULL
);


ALTER TABLE public.order_orderhistoryentry OWNER TO saleor;

--
-- Name: order_orderhistoryentry_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.order_orderhistoryentry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_orderhistoryentry_id_seq OWNER TO saleor;

--
-- Name: order_orderhistoryentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.order_orderhistoryentry_id_seq OWNED BY public.order_orderhistoryentry.id;


--
-- Name: order_ordernote; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.order_ordernote (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    content text NOT NULL,
    order_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.order_ordernote OWNER TO saleor;

--
-- Name: order_ordernote_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.order_ordernote_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_ordernote_id_seq OWNER TO saleor;

--
-- Name: order_ordernote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.order_ordernote_id_seq OWNED BY public.order_ordernote.id;


--
-- Name: order_payment; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.order_payment (
    id integer NOT NULL,
    variant character varying(255) NOT NULL,
    status character varying(10) NOT NULL,
    fraud_status character varying(10) NOT NULL,
    fraud_message text NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    transaction_id character varying(255) NOT NULL,
    currency character varying(10) NOT NULL,
    total numeric(9,2) NOT NULL,
    delivery numeric(9,2) NOT NULL,
    tax numeric(9,2) NOT NULL,
    description text NOT NULL,
    billing_first_name character varying(256) NOT NULL,
    billing_last_name character varying(256) NOT NULL,
    billing_address_1 character varying(256) NOT NULL,
    billing_address_2 character varying(256) NOT NULL,
    billing_city character varying(256) NOT NULL,
    billing_postcode character varying(256) NOT NULL,
    billing_country_code character varying(2) NOT NULL,
    billing_country_area character varying(256) NOT NULL,
    billing_email character varying(254) NOT NULL,
    customer_ip_address inet,
    extra_data text NOT NULL,
    message text NOT NULL,
    token character varying(36) NOT NULL,
    captured_amount numeric(9,2) NOT NULL,
    order_id integer NOT NULL
);


ALTER TABLE public.order_payment OWNER TO saleor;

--
-- Name: order_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.order_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_payment_id_seq OWNER TO saleor;

--
-- Name: order_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.order_payment_id_seq OWNED BY public.order_payment.id;


--
-- Name: page_page; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.page_page (
    id integer NOT NULL,
    slug character varying(100) NOT NULL,
    title character varying(200) NOT NULL,
    content text NOT NULL,
    created timestamp with time zone NOT NULL,
    is_visible boolean NOT NULL,
    available_on date,
    seo_description character varying(300),
    seo_title character varying(70)
);


ALTER TABLE public.page_page OWNER TO saleor;

--
-- Name: page_page_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.page_page_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_page_id_seq OWNER TO saleor;

--
-- Name: page_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.page_page_id_seq OWNED BY public.page_page.id;


--
-- Name: page_pagetranslation; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.page_pagetranslation (
    id integer NOT NULL,
    seo_title character varying(70),
    seo_description character varying(300),
    language_code character varying(10) NOT NULL,
    title character varying(255) NOT NULL,
    content text NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE public.page_pagetranslation OWNER TO saleor;

--
-- Name: page_pagetranslation_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.page_pagetranslation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_pagetranslation_id_seq OWNER TO saleor;

--
-- Name: page_pagetranslation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.page_pagetranslation_id_seq OWNED BY public.page_pagetranslation.id;


--
-- Name: product_attributechoicevalue; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_attributechoicevalue (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    attribute_id integer NOT NULL,
    slug character varying(100) NOT NULL,
    sort_order integer NOT NULL,
    CONSTRAINT product_attributechoicevalue_sort_order_check CHECK ((sort_order >= 0))
);


ALTER TABLE public.product_attributechoicevalue OWNER TO saleor;

--
-- Name: product_attributechoicevalue_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_attributechoicevalue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_attributechoicevalue_id_seq OWNER TO saleor;

--
-- Name: product_attributechoicevalue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_attributechoicevalue_id_seq OWNED BY public.product_attributechoicevalue.id;


--
-- Name: product_attributechoicevaluetranslation; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_attributechoicevaluetranslation (
    id integer NOT NULL,
    language_code character varying(10) NOT NULL,
    name character varying(100) NOT NULL,
    attribute_choice_value_id integer NOT NULL
);


ALTER TABLE public.product_attributechoicevaluetranslation OWNER TO saleor;

--
-- Name: product_attributechoicevaluetranslation_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_attributechoicevaluetranslation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_attributechoicevaluetranslation_id_seq OWNER TO saleor;

--
-- Name: product_attributechoicevaluetranslation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_attributechoicevaluetranslation_id_seq OWNED BY public.product_attributechoicevaluetranslation.id;


--
-- Name: product_category; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_category (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    slug character varying(128) NOT NULL,
    description text NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id integer,
    background_image character varying(100),
    seo_description character varying(300),
    seo_title character varying(70),
    CONSTRAINT product_category_level_check CHECK ((level >= 0)),
    CONSTRAINT product_category_lft_check CHECK ((lft >= 0)),
    CONSTRAINT product_category_rght_check CHECK ((rght >= 0)),
    CONSTRAINT product_category_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.product_category OWNER TO saleor;

--
-- Name: product_category_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_category_id_seq OWNER TO saleor;

--
-- Name: product_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_category_id_seq OWNED BY public.product_category.id;


--
-- Name: product_categorytranslation; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_categorytranslation (
    id integer NOT NULL,
    seo_title character varying(70),
    seo_description character varying(300),
    language_code character varying(10) NOT NULL,
    name character varying(128) NOT NULL,
    description text NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.product_categorytranslation OWNER TO saleor;

--
-- Name: product_categorytranslation_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_categorytranslation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_categorytranslation_id_seq OWNER TO saleor;

--
-- Name: product_categorytranslation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_categorytranslation_id_seq OWNED BY public.product_categorytranslation.id;


--
-- Name: product_collection; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_collection (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    slug character varying(128) NOT NULL,
    background_image character varying(100),
    seo_description character varying(300),
    seo_title character varying(70),
    is_published boolean NOT NULL
);


ALTER TABLE public.product_collection OWNER TO saleor;

--
-- Name: product_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_collection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_collection_id_seq OWNER TO saleor;

--
-- Name: product_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_collection_id_seq OWNED BY public.product_collection.id;


--
-- Name: product_collection_products; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_collection_products (
    id integer NOT NULL,
    collection_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.product_collection_products OWNER TO saleor;

--
-- Name: product_collection_products_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_collection_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_collection_products_id_seq OWNER TO saleor;

--
-- Name: product_collection_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_collection_products_id_seq OWNED BY public.product_collection_products.id;


--
-- Name: product_collectiontranslation; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_collectiontranslation (
    id integer NOT NULL,
    seo_title character varying(70),
    seo_description character varying(300),
    language_code character varying(10) NOT NULL,
    name character varying(128) NOT NULL,
    collection_id integer NOT NULL
);


ALTER TABLE public.product_collectiontranslation OWNER TO saleor;

--
-- Name: product_collectiontranslation_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_collectiontranslation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_collectiontranslation_id_seq OWNER TO saleor;

--
-- Name: product_collectiontranslation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_collectiontranslation_id_seq OWNED BY public.product_collectiontranslation.id;


--
-- Name: product_imagedata; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_imagedata (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    ppoi character varying(20) NOT NULL,
    height integer,
    name character varying(80) NOT NULL,
    width integer,
    sort_order integer NOT NULL,
    CONSTRAINT product_imagedata_height_check CHECK ((height >= 0)),
    CONSTRAINT product_imagedata_sort_order_check CHECK ((sort_order >= 0)),
    CONSTRAINT product_imagedata_width_check CHECK ((width >= 0))
);


ALTER TABLE public.product_imagedata OWNER TO saleor;

--
-- Name: product_imagedata_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_imagedata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_imagedata_id_seq OWNER TO saleor;

--
-- Name: product_imagedata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_imagedata_id_seq OWNED BY public.product_imagedata.id;


--
-- Name: product_product; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_product (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    description text NOT NULL,
    price numeric(12,2) NOT NULL,
    available_on date,
    updated_at timestamp with time zone,
    product_type_id integer NOT NULL,
    attributes public.hstore NOT NULL,
    is_published boolean NOT NULL,
    category_id integer NOT NULL,
    seo_description character varying(300),
    seo_title character varying(70),
    charge_taxes boolean NOT NULL,
    tax_rate character varying(128) NOT NULL
);


ALTER TABLE public.product_product OWNER TO saleor;

--
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_product_id_seq OWNER TO saleor;

--
-- Name: product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product_product.id;


--
-- Name: product_productattribute; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_productattribute (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.product_productattribute OWNER TO saleor;

--
-- Name: product_productattribute_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_productattribute_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_productattribute_id_seq OWNER TO saleor;

--
-- Name: product_productattribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_productattribute_id_seq OWNED BY public.product_productattribute.id;


--
-- Name: product_productattributetranslation; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_productattributetranslation (
    id integer NOT NULL,
    language_code character varying(10) NOT NULL,
    name character varying(100) NOT NULL,
    product_attribute_id integer NOT NULL
);


ALTER TABLE public.product_productattributetranslation OWNER TO saleor;

--
-- Name: product_productattributetranslation_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_productattributetranslation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_productattributetranslation_id_seq OWNER TO saleor;

--
-- Name: product_productattributetranslation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_productattributetranslation_id_seq OWNED BY public.product_productattributetranslation.id;


--
-- Name: product_producttype; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_producttype (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    has_variants boolean NOT NULL,
    is_shipping_required boolean NOT NULL,
    tax_rate character varying(128) NOT NULL
);


ALTER TABLE public.product_producttype OWNER TO saleor;

--
-- Name: product_productclass_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_productclass_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_productclass_id_seq OWNER TO saleor;

--
-- Name: product_productclass_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_productclass_id_seq OWNED BY public.product_producttype.id;


--
-- Name: product_producttype_product_attributes; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_producttype_product_attributes (
    id integer NOT NULL,
    producttype_id integer NOT NULL,
    productattribute_id integer NOT NULL
);


ALTER TABLE public.product_producttype_product_attributes OWNER TO saleor;

--
-- Name: product_productclass_product_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_productclass_product_attributes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_productclass_product_attributes_id_seq OWNER TO saleor;

--
-- Name: product_productclass_product_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_productclass_product_attributes_id_seq OWNED BY public.product_producttype_product_attributes.id;


--
-- Name: product_producttype_variant_attributes; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_producttype_variant_attributes (
    id integer NOT NULL,
    producttype_id integer NOT NULL,
    productattribute_id integer NOT NULL
);


ALTER TABLE public.product_producttype_variant_attributes OWNER TO saleor;

--
-- Name: product_productclass_variant_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_productclass_variant_attributes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_productclass_variant_attributes_id_seq OWNER TO saleor;

--
-- Name: product_productclass_variant_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_productclass_variant_attributes_id_seq OWNED BY public.product_producttype_variant_attributes.id;


--
-- Name: product_productimage; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_productimage (
    id integer NOT NULL,
    image_id integer NOT NULL,
    alt character varying(128) NOT NULL,
    sort_order integer NOT NULL,
    product_id integer NOT NULL,
    CONSTRAINT product_productimage_sort_order_dfda9c19_check CHECK ((sort_order >= 0))
);


ALTER TABLE public.product_productimage OWNER TO saleor;

--
-- Name: product_productimage_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_productimage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_productimage_id_seq OWNER TO saleor;

--
-- Name: product_productimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_productimage_id_seq OWNED BY public.product_productimage.id;


--
-- Name: product_producttranslation; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_producttranslation (
    id integer NOT NULL,
    seo_title character varying(70),
    seo_description character varying(300),
    language_code character varying(10) NOT NULL,
    name character varying(128) NOT NULL,
    description text NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.product_producttranslation OWNER TO saleor;

--
-- Name: product_producttranslation_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_producttranslation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_producttranslation_id_seq OWNER TO saleor;

--
-- Name: product_producttranslation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_producttranslation_id_seq OWNED BY public.product_producttranslation.id;


--
-- Name: product_productvariant; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_productvariant (
    id integer NOT NULL,
    sku character varying(32) NOT NULL,
    name character varying(255) NOT NULL,
    price_override numeric(12,2),
    product_id integer NOT NULL,
    attributes public.hstore NOT NULL,
    cost_price numeric(12,2),
    quantity integer NOT NULL,
    quantity_allocated integer NOT NULL,
    track_inventory boolean NOT NULL,
    product_template jsonb
);


ALTER TABLE public.product_productvariant OWNER TO saleor;

--
-- Name: product_productvariant_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_productvariant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_productvariant_id_seq OWNER TO saleor;

--
-- Name: product_productvariant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_productvariant_id_seq OWNED BY public.product_productvariant.id;


--
-- Name: product_productvarianttranslation; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_productvarianttranslation (
    id integer NOT NULL,
    language_code character varying(10) NOT NULL,
    name character varying(255) NOT NULL,
    product_variant_id integer NOT NULL
);


ALTER TABLE public.product_productvarianttranslation OWNER TO saleor;

--
-- Name: product_productvarianttranslation_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_productvarianttranslation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_productvarianttranslation_id_seq OWNER TO saleor;

--
-- Name: product_productvarianttranslation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_productvarianttranslation_id_seq OWNED BY public.product_productvarianttranslation.id;


--
-- Name: product_variantimage; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.product_variantimage (
    id integer NOT NULL,
    image_id integer NOT NULL,
    variant_id integer NOT NULL
);


ALTER TABLE public.product_variantimage OWNER TO saleor;

--
-- Name: product_variantimage_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.product_variantimage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_variantimage_id_seq OWNER TO saleor;

--
-- Name: product_variantimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.product_variantimage_id_seq OWNED BY public.product_variantimage.id;


--
-- Name: sharedcontent_sharedcontent; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.sharedcontent_sharedcontent (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    is_cross_site boolean NOT NULL,
    parent_site_id integer NOT NULL
);


ALTER TABLE public.sharedcontent_sharedcontent OWNER TO saleor;

--
-- Name: sharedcontent_sharedcontent_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.sharedcontent_sharedcontent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sharedcontent_sharedcontent_id_seq OWNER TO saleor;

--
-- Name: sharedcontent_sharedcontent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.sharedcontent_sharedcontent_id_seq OWNED BY public.sharedcontent_sharedcontent.id;


--
-- Name: sharedcontent_sharedcontent_translation; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.sharedcontent_sharedcontent_translation (
    id integer NOT NULL,
    language_code character varying(15) NOT NULL,
    title character varying(200) NOT NULL,
    master_id integer
);


ALTER TABLE public.sharedcontent_sharedcontent_translation OWNER TO saleor;

--
-- Name: sharedcontent_sharedcontent_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.sharedcontent_sharedcontent_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sharedcontent_sharedcontent_translation_id_seq OWNER TO saleor;

--
-- Name: sharedcontent_sharedcontent_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.sharedcontent_sharedcontent_translation_id_seq OWNED BY public.sharedcontent_sharedcontent_translation.id;


--
-- Name: shipping_shippingmethod; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.shipping_shippingmethod (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.shipping_shippingmethod OWNER TO saleor;

--
-- Name: shipping_shippingmethod_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.shipping_shippingmethod_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_shippingmethod_id_seq OWNER TO saleor;

--
-- Name: shipping_shippingmethod_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.shipping_shippingmethod_id_seq OWNED BY public.shipping_shippingmethod.id;


--
-- Name: shipping_shippingmethodcountry; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.shipping_shippingmethodcountry (
    id integer NOT NULL,
    country_code character varying(2) NOT NULL,
    price numeric(12,2) NOT NULL,
    shipping_method_id integer NOT NULL
);


ALTER TABLE public.shipping_shippingmethodcountry OWNER TO saleor;

--
-- Name: shipping_shippingmethodcountry_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.shipping_shippingmethodcountry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_shippingmethodcountry_id_seq OWNER TO saleor;

--
-- Name: shipping_shippingmethodcountry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.shipping_shippingmethodcountry_id_seq OWNED BY public.shipping_shippingmethodcountry.id;


--
-- Name: site_authorizationkey; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.site_authorizationkey (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    key text NOT NULL,
    password text NOT NULL,
    site_settings_id integer NOT NULL
);


ALTER TABLE public.site_authorizationkey OWNER TO saleor;

--
-- Name: site_authorizationkey_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.site_authorizationkey_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_authorizationkey_id_seq OWNER TO saleor;

--
-- Name: site_authorizationkey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.site_authorizationkey_id_seq OWNED BY public.site_authorizationkey.id;


--
-- Name: site_sitesettings; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.site_sitesettings (
    id integer NOT NULL,
    header_text character varying(200) NOT NULL,
    description character varying(500) NOT NULL,
    site_id integer NOT NULL,
    bottom_menu_id integer,
    top_menu_id integer,
    display_gross_prices boolean NOT NULL,
    include_taxes_in_prices boolean NOT NULL,
    charge_taxes_on_shipping boolean NOT NULL,
    track_inventory_by_default boolean NOT NULL,
    homepage_collection_id integer
);


ALTER TABLE public.site_sitesettings OWNER TO saleor;

--
-- Name: site_sitesettings_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.site_sitesettings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_sitesettings_id_seq OWNER TO saleor;

--
-- Name: site_sitesettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.site_sitesettings_id_seq OWNED BY public.site_sitesettings.id;


--
-- Name: site_sitesettingstranslation; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.site_sitesettingstranslation (
    id integer NOT NULL,
    language_code character varying(10) NOT NULL,
    header_text character varying(200) NOT NULL,
    description character varying(500) NOT NULL,
    site_settings_id integer NOT NULL
);


ALTER TABLE public.site_sitesettingstranslation OWNER TO saleor;

--
-- Name: site_sitesettingstranslation_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.site_sitesettingstranslation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.site_sitesettingstranslation_id_seq OWNER TO saleor;

--
-- Name: site_sitesettingstranslation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.site_sitesettingstranslation_id_seq OWNED BY public.site_sitesettingstranslation.id;


--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE public.social_auth_association OWNER TO saleor;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.social_auth_association_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_association_id_seq OWNER TO saleor;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.social_auth_association_id_seq OWNED BY public.social_auth_association.id;


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_code OWNER TO saleor;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.social_auth_code_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_code_id_seq OWNER TO saleor;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.social_auth_code_id_seq OWNED BY public.social_auth_code.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE public.social_auth_nonce OWNER TO saleor;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.social_auth_nonce_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_nonce_id_seq OWNER TO saleor;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.social_auth_nonce_id_seq OWNED BY public.social_auth_nonce.id;


--
-- Name: social_auth_partial; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.social_auth_partial (
    id integer NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);


ALTER TABLE public.social_auth_partial OWNER TO saleor;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.social_auth_partial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_partial_id_seq OWNER TO saleor;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.social_auth_partial_id_seq OWNED BY public.social_auth_partial.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: saleor
--

CREATE TABLE public.social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.social_auth_usersocialauth OWNER TO saleor;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.social_auth_usersocialauth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_usersocialauth_id_seq OWNER TO saleor;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.social_auth_usersocialauth_id_seq OWNED BY public.social_auth_usersocialauth.id;


--
-- Name: userprofile_address_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.userprofile_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofile_address_id_seq OWNER TO saleor;

--
-- Name: userprofile_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.userprofile_address_id_seq OWNED BY public.account_address.id;


--
-- Name: userprofile_user_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.userprofile_user_addresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofile_user_addresses_id_seq OWNER TO saleor;

--
-- Name: userprofile_user_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.userprofile_user_addresses_id_seq OWNED BY public.account_user_addresses.id;


--
-- Name: userprofile_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.userprofile_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofile_user_groups_id_seq OWNER TO saleor;

--
-- Name: userprofile_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.userprofile_user_groups_id_seq OWNED BY public.account_user_groups.id;


--
-- Name: userprofile_user_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.userprofile_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofile_user_id_seq OWNER TO saleor;

--
-- Name: userprofile_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.userprofile_user_id_seq OWNED BY public.account_user.id;


--
-- Name: userprofile_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: saleor
--

CREATE SEQUENCE public.userprofile_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofile_user_user_permissions_id_seq OWNER TO saleor;

--
-- Name: userprofile_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: saleor
--

ALTER SEQUENCE public.userprofile_user_user_permissions_id_seq OWNED BY public.account_user_user_permissions.id;


--
-- Name: account_address id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_address ALTER COLUMN id SET DEFAULT nextval('public.userprofile_address_id_seq'::regclass);


--
-- Name: account_customernote id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_customernote ALTER COLUMN id SET DEFAULT nextval('public.account_customernote_id_seq'::regclass);


--
-- Name: account_user id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user ALTER COLUMN id SET DEFAULT nextval('public.userprofile_user_id_seq'::regclass);


--
-- Name: account_user_addresses id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_addresses ALTER COLUMN id SET DEFAULT nextval('public.userprofile_user_addresses_id_seq'::regclass);


--
-- Name: account_user_groups id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_groups ALTER COLUMN id SET DEFAULT nextval('public.userprofile_user_groups_id_seq'::regclass);


--
-- Name: account_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.userprofile_user_user_permissions_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: checkout_cartline id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.checkout_cartline ALTER COLUMN id SET DEFAULT nextval('public.cart_cartline_id_seq'::regclass);


--
-- Name: discount_sale id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale ALTER COLUMN id SET DEFAULT nextval('public.discount_sale_id_seq'::regclass);


--
-- Name: discount_sale_categories id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_categories ALTER COLUMN id SET DEFAULT nextval('public.discount_sale_categories_id_seq'::regclass);


--
-- Name: discount_sale_collections id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_collections ALTER COLUMN id SET DEFAULT nextval('public.discount_sale_collections_id_seq'::regclass);


--
-- Name: discount_sale_products id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_products ALTER COLUMN id SET DEFAULT nextval('public.discount_sale_products_id_seq'::regclass);


--
-- Name: discount_voucher id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher ALTER COLUMN id SET DEFAULT nextval('public.discount_voucher_id_seq'::regclass);


--
-- Name: discount_voucher_categories id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_categories ALTER COLUMN id SET DEFAULT nextval('public.discount_voucher_categories_id_seq'::regclass);


--
-- Name: discount_voucher_collections id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_collections ALTER COLUMN id SET DEFAULT nextval('public.discount_voucher_collections_id_seq'::regclass);


--
-- Name: discount_voucher_products id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_products ALTER COLUMN id SET DEFAULT nextval('public.discount_voucher_products_id_seq'::regclass);


--
-- Name: discount_vouchertranslation id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_vouchertranslation ALTER COLUMN id SET DEFAULT nextval('public.discount_vouchertranslation_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_celery_results_taskresult id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_celery_results_taskresult ALTER COLUMN id SET DEFAULT nextval('public.django_celery_results_taskresult_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_prices_openexchangerates_conversionrate id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_prices_openexchangerates_conversionrate ALTER COLUMN id SET DEFAULT nextval('public.django_prices_openexchangerates_conversionrate_id_seq'::regclass);


--
-- Name: django_prices_vatlayer_ratetypes id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_prices_vatlayer_ratetypes ALTER COLUMN id SET DEFAULT nextval('public.django_prices_vatlayer_ratetypes_id_seq'::regclass);


--
-- Name: django_prices_vatlayer_vat id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_prices_vatlayer_vat ALTER COLUMN id SET DEFAULT nextval('public.django_prices_vatlayer_vat_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: fluent_contents_contentitem id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.fluent_contents_contentitem ALTER COLUMN id SET DEFAULT nextval('public.fluent_contents_contentitem_id_seq'::regclass);


--
-- Name: fluent_contents_placeholder id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.fluent_contents_placeholder ALTER COLUMN id SET DEFAULT nextval('public.fluent_contents_placeholder_id_seq'::regclass);


--
-- Name: impersonate_impersonationlog id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.impersonate_impersonationlog ALTER COLUMN id SET DEFAULT nextval('public.impersonate_impersonationlog_id_seq'::regclass);


--
-- Name: menu_menu id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.menu_menu ALTER COLUMN id SET DEFAULT nextval('public.menu_menu_id_seq'::regclass);


--
-- Name: menu_menuitem id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.menu_menuitem ALTER COLUMN id SET DEFAULT nextval('public.menu_menuitem_id_seq'::regclass);


--
-- Name: menu_menuitemtranslation id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.menu_menuitemtranslation ALTER COLUMN id SET DEFAULT nextval('public.menu_menuitemtranslation_id_seq'::regclass);


--
-- Name: order_fulfillment id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_fulfillment ALTER COLUMN id SET DEFAULT nextval('public.order_fulfillment_id_seq'::regclass);


--
-- Name: order_fulfillmentline id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_fulfillmentline ALTER COLUMN id SET DEFAULT nextval('public.order_fulfillmentline_id_seq'::regclass);


--
-- Name: order_order id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_order ALTER COLUMN id SET DEFAULT nextval('public.order_order_id_seq'::regclass);


--
-- Name: order_orderhistoryentry id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_orderhistoryentry ALTER COLUMN id SET DEFAULT nextval('public.order_orderhistoryentry_id_seq'::regclass);


--
-- Name: order_orderline id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_orderline ALTER COLUMN id SET DEFAULT nextval('public.order_ordereditem_id_seq'::regclass);


--
-- Name: order_ordernote id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_ordernote ALTER COLUMN id SET DEFAULT nextval('public.order_ordernote_id_seq'::regclass);


--
-- Name: order_payment id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_payment ALTER COLUMN id SET DEFAULT nextval('public.order_payment_id_seq'::regclass);


--
-- Name: page_page id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.page_page ALTER COLUMN id SET DEFAULT nextval('public.page_page_id_seq'::regclass);


--
-- Name: page_pagetranslation id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.page_pagetranslation ALTER COLUMN id SET DEFAULT nextval('public.page_pagetranslation_id_seq'::regclass);


--
-- Name: product_attributechoicevalue id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributechoicevalue ALTER COLUMN id SET DEFAULT nextval('public.product_attributechoicevalue_id_seq'::regclass);


--
-- Name: product_attributechoicevaluetranslation id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributechoicevaluetranslation ALTER COLUMN id SET DEFAULT nextval('public.product_attributechoicevaluetranslation_id_seq'::regclass);


--
-- Name: product_category id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_category ALTER COLUMN id SET DEFAULT nextval('public.product_category_id_seq'::regclass);


--
-- Name: product_categorytranslation id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_categorytranslation ALTER COLUMN id SET DEFAULT nextval('public.product_categorytranslation_id_seq'::regclass);


--
-- Name: product_collection id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_collection ALTER COLUMN id SET DEFAULT nextval('public.product_collection_id_seq'::regclass);


--
-- Name: product_collection_products id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_collection_products ALTER COLUMN id SET DEFAULT nextval('public.product_collection_products_id_seq'::regclass);


--
-- Name: product_collectiontranslation id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_collectiontranslation ALTER COLUMN id SET DEFAULT nextval('public.product_collectiontranslation_id_seq'::regclass);


--
-- Name: product_imagedata id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_imagedata ALTER COLUMN id SET DEFAULT nextval('public.product_imagedata_id_seq'::regclass);


--
-- Name: product_product id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_product ALTER COLUMN id SET DEFAULT nextval('public.product_product_id_seq'::regclass);


--
-- Name: product_productattribute id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productattribute ALTER COLUMN id SET DEFAULT nextval('public.product_productattribute_id_seq'::regclass);


--
-- Name: product_productattributetranslation id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productattributetranslation ALTER COLUMN id SET DEFAULT nextval('public.product_productattributetranslation_id_seq'::regclass);


--
-- Name: product_productimage id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productimage ALTER COLUMN id SET DEFAULT nextval('public.product_productimage_id_seq'::regclass);


--
-- Name: product_producttranslation id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_producttranslation ALTER COLUMN id SET DEFAULT nextval('public.product_producttranslation_id_seq'::regclass);


--
-- Name: product_producttype id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_producttype ALTER COLUMN id SET DEFAULT nextval('public.product_productclass_id_seq'::regclass);


--
-- Name: product_producttype_product_attributes id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_producttype_product_attributes ALTER COLUMN id SET DEFAULT nextval('public.product_productclass_product_attributes_id_seq'::regclass);


--
-- Name: product_producttype_variant_attributes id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_producttype_variant_attributes ALTER COLUMN id SET DEFAULT nextval('public.product_productclass_variant_attributes_id_seq'::regclass);


--
-- Name: product_productvariant id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productvariant ALTER COLUMN id SET DEFAULT nextval('public.product_productvariant_id_seq'::regclass);


--
-- Name: product_productvarianttranslation id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productvarianttranslation ALTER COLUMN id SET DEFAULT nextval('public.product_productvarianttranslation_id_seq'::regclass);


--
-- Name: product_variantimage id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_variantimage ALTER COLUMN id SET DEFAULT nextval('public.product_variantimage_id_seq'::regclass);


--
-- Name: sharedcontent_sharedcontent id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.sharedcontent_sharedcontent ALTER COLUMN id SET DEFAULT nextval('public.sharedcontent_sharedcontent_id_seq'::regclass);


--
-- Name: sharedcontent_sharedcontent_translation id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.sharedcontent_sharedcontent_translation ALTER COLUMN id SET DEFAULT nextval('public.sharedcontent_sharedcontent_translation_id_seq'::regclass);


--
-- Name: shipping_shippingmethod id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.shipping_shippingmethod ALTER COLUMN id SET DEFAULT nextval('public.shipping_shippingmethod_id_seq'::regclass);


--
-- Name: shipping_shippingmethodcountry id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.shipping_shippingmethodcountry ALTER COLUMN id SET DEFAULT nextval('public.shipping_shippingmethodcountry_id_seq'::regclass);


--
-- Name: site_authorizationkey id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_authorizationkey ALTER COLUMN id SET DEFAULT nextval('public.site_authorizationkey_id_seq'::regclass);


--
-- Name: site_sitesettings id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_sitesettings ALTER COLUMN id SET DEFAULT nextval('public.site_sitesettings_id_seq'::regclass);


--
-- Name: site_sitesettingstranslation id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_sitesettingstranslation ALTER COLUMN id SET DEFAULT nextval('public.site_sitesettingstranslation_id_seq'::regclass);


--
-- Name: social_auth_association id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_association ALTER COLUMN id SET DEFAULT nextval('public.social_auth_association_id_seq'::regclass);


--
-- Name: social_auth_code id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_code ALTER COLUMN id SET DEFAULT nextval('public.social_auth_code_id_seq'::regclass);


--
-- Name: social_auth_nonce id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('public.social_auth_nonce_id_seq'::regclass);


--
-- Name: social_auth_partial id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_partial ALTER COLUMN id SET DEFAULT nextval('public.social_auth_partial_id_seq'::regclass);


--
-- Name: social_auth_usersocialauth id; Type: DEFAULT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('public.social_auth_usersocialauth_id_seq'::regclass);


--
-- Data for Name: account_address; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.account_address (id, first_name, last_name, company_name, street_address_1, street_address_2, city, postal_code, country, country_area, phone, city_area) FROM stdin;
1	Whitney	Castaneda		027 Houston Fork		Fischerland	04489	TV			
2	Kristina	Shaw		8489 Michael Loop Suite 861		South Erin	68593	TL			
3	Alice	Cook		011 Jones Rapid Suite 990		East Heatherton	11886	ET			
4	Jason	Avila		379 Sarah Stream Apt. 374		South Danielland	82012	TV			
5	Deborah	Spears		202 Emily Orchard		Sullivanhaven	95265	GA			
6	Lori	Hood		41230 Becker Stravenue		Edwardstown	82780	CR			
7	Lisa	Joyce		658 Wilson Flats Apt. 625		North Suzanne	73258	AZ			
8	Amy	Thompson		6893 Victor Bridge Apt. 526		Blackburnside	26963	BT			
9	Julia	King		147 Mejia Plaza Apt. 437		Priscillamouth	74472	JP			
10	Elizabeth	Brown		960 Lambert Coves Apt. 952		Thompsonfurt	14653	FR			
11	John	Little		32570 Lauren Road Apt. 286		East Jeanettemouth	76252	ZW			
12	David	Garcia		1416 Patel Path Apt. 167		West Ericstad	67096	CN			
13	Ashley	Hayes		115 Melissa Radial Apt. 470		Patrickfurt	93577	GD			
14	Paul	Maldonado		58519 Mcintyre Vista		Wisetown	44533	BD			
15	Kathleen	Nielsen		6589 Haas Island Apt. 723		South Steventon	94963	RO			
16	Autumn	Stewart		92891 Wood Route Apt. 595		Julianmouth	65103	GR			
17	James	Cook		675 Jeffrey Road Suite 629		Lisaton	69897	JO			
18	Tiffany	Hughes		459 Melissa Islands Suite 376		South Vickiview	46089	MA			
19	John	Barnes		5985 Miller Fork Apt. 405		Joshuahaven	15666	BS			
20	Tara	Reynolds		523 Watts Pines Apt. 213		New Jamietown	47493	VE			
21	Michael	Sampson		58896 Jonathan Via Apt. 620		Acevedofurt	00556	RW			
22	Jennifer	Mitchell		50517 Waller Corners Apt. 249		West Charles	83376	BH			
23	Danielle	Larson		570 Wang Rapid Suite 874		New Sethfort	21216	AD			
24	Heather	Brown		12136 Mason Wall		New Kathrynhaven	08232	OM			
25	Kaylee	Carroll		33957 Benjamin Pike		Mckinneyburgh	92200	LI			
26	Martin	Diaz		5277 Serrano Run Suite 903		West Denise	86611	GA			
27	Clifford	Garcia		4634 Laura Lakes Suite 125		Smithstad	64422	EG			
28	Lawrence	Thornton		08671 Mendez Lights		Tamaraport	11360	BW			
29	Michael	Kim		9058 Burke Squares		East Michelle	95475	BD			
30	Samuel	Schneider		055 Young Ranch		Emilyland	28703	MT			
31	Lisa	Davis		5276 Thompson Course		Gregorytown	43724	NZ			
32	Sonya	Jones		0653 Anderson Glens Apt. 637		West William	22864	TD			
33	Jamie	Moore		4065 Alexis Union		Rogersberg	56570	BT			
34	Courtney	Moore		20760 Daniels Stravenue Suite 725		Port John	38369	ML			
35	Courtney	Moore		20760 Daniels Stravenue Suite 725		Port John	38369	ML			
\.


--
-- Data for Name: account_customernote; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.account_customernote (id, date, content, is_public, customer_id, user_id) FROM stdin;
\.


--
-- Data for Name: account_user; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.account_user (id, is_superuser, email, is_staff, is_active, password, date_joined, last_login, default_billing_address_id, default_shipping_address_id, note, token) FROM stdin;
1	t	admin@upibo.com	t	t	pbkdf2_sha256$36000$eExb7rnzUnMX$ao/LvTdlhtfOERxVFMx3p63aM9FD2vmWFOAVnM3Oqik=	2018-11-04 21:54:55.817003+07	2018-11-19 22:35:46.127057+07	\N	\N	\N	3cb6a8a9-8323-4f98-aab4-6c484d4b16e4
\.


--
-- Data for Name: account_user_addresses; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.account_user_addresses (id, user_id, address_id) FROM stdin;
\.


--
-- Data for Name: account_user_groups; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.account_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: account_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.account_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add content type	1	add_contenttype
2	Can change content type	1	change_contenttype
3	Can delete content type	1	delete_contenttype
4	Can add session	2	add_session
5	Can change session	2	change_session
6	Can delete session	2	delete_session
7	Can add site	3	add_site
8	Can change site	3	change_site
9	Can delete site	3	delete_site
10	Can add permission	4	add_permission
11	Can change permission	4	change_permission
12	Can delete permission	4	delete_permission
13	Can add group	5	add_group
14	Can change group	5	change_group
15	Can delete group	5	delete_group
16	Can add user	6	add_user
17	Can change user	6	change_user
18	Can delete user	6	delete_user
19	Manage customers.	6	manage_users
20	Manage staff.	6	manage_staff
21	Impersonate customers.	6	impersonate_users
22	Can add address	7	add_address
23	Can change address	7	change_address
24	Can delete address	7	delete_address
25	Can add customer note	8	add_customernote
26	Can change customer note	8	change_customernote
27	Can delete customer note	8	delete_customernote
28	Can add sale	9	add_sale
29	Can change sale	9	change_sale
30	Can delete sale	9	delete_sale
31	Manage sales and vouchers.	9	manage_discounts
32	Can add voucher	10	add_voucher
33	Can change voucher	10	change_voucher
34	Can delete voucher	10	delete_voucher
35	Can add voucher translation	11	add_vouchertranslation
36	Can change voucher translation	11	change_vouchertranslation
37	Can delete voucher translation	11	delete_vouchertranslation
38	Can add attribute choice value	12	add_attributechoicevalue
39	Can change attribute choice value	12	change_attributechoicevalue
40	Can delete attribute choice value	12	delete_attributechoicevalue
41	Can add category	13	add_category
42	Can change category	13	change_category
43	Can delete category	13	delete_category
44	Can add product	14	add_product
45	Can change product	14	change_product
46	Can delete product	14	delete_product
47	Manage products.	14	manage_products
48	Can add product attribute	15	add_productattribute
49	Can change product attribute	15	change_productattribute
50	Can delete product attribute	15	delete_productattribute
51	Can add product image	16	add_productimage
52	Can change product image	16	change_productimage
53	Can delete product image	16	delete_productimage
54	Can add product variant	17	add_productvariant
55	Can change product variant	17	change_productvariant
56	Can delete product variant	17	delete_productvariant
57	Can add variant image	18	add_variantimage
58	Can change variant image	18	change_variantimage
59	Can delete variant image	18	delete_variantimage
60	Can add product type	19	add_producttype
61	Can change product type	19	change_producttype
62	Can delete product type	19	delete_producttype
63	Can add collection	20	add_collection
64	Can change collection	20	change_collection
65	Can delete collection	20	delete_collection
66	Can add attribute choice value translation	21	add_attributechoicevaluetranslation
67	Can change attribute choice value translation	21	change_attributechoicevaluetranslation
68	Can delete attribute choice value translation	21	delete_attributechoicevaluetranslation
69	Can add category translation	22	add_categorytranslation
70	Can change category translation	22	change_categorytranslation
71	Can delete category translation	22	delete_categorytranslation
72	Can add collection translation	23	add_collectiontranslation
73	Can change collection translation	23	change_collectiontranslation
74	Can delete collection translation	23	delete_collectiontranslation
75	Can add product attribute translation	24	add_productattributetranslation
76	Can change product attribute translation	24	change_productattributetranslation
77	Can delete product attribute translation	24	delete_productattributetranslation
78	Can add product translation	25	add_producttranslation
79	Can change product translation	25	change_producttranslation
80	Can delete product translation	25	delete_producttranslation
81	Can add product variant translation	26	add_productvarianttranslation
82	Can change product variant translation	26	change_productvarianttranslation
83	Can delete product variant translation	26	delete_productvarianttranslation
84	Can add cart	27	add_cart
85	Can change cart	27	change_cart
86	Can delete cart	27	delete_cart
87	Can add cart line	28	add_cartline
88	Can change cart line	28	change_cartline
89	Can delete cart line	28	delete_cartline
90	Can add menu	29	add_menu
91	Can change menu	29	change_menu
92	Can delete menu	29	delete_menu
93	Manage navigation.	29	manage_menus
94	Can add menu item	30	add_menuitem
95	Can change menu item	30	change_menuitem
96	Can delete menu item	30	delete_menuitem
97	Can add menu item translation	31	add_menuitemtranslation
98	Can change menu item translation	31	change_menuitemtranslation
99	Can delete menu item translation	31	delete_menuitemtranslation
100	Can add order	32	add_order
101	Can change order	32	change_order
102	Can delete order	32	delete_order
103	Manage orders.	32	manage_orders
104	Can add order history entry	33	add_orderhistoryentry
105	Can change order history entry	33	change_orderhistoryentry
106	Can delete order history entry	33	delete_orderhistoryentry
107	Can add order note	34	add_ordernote
108	Can change order note	34	change_ordernote
109	Can delete order note	34	delete_ordernote
110	Can add payment	35	add_payment
111	Can change payment	35	change_payment
112	Can delete payment	35	delete_payment
113	Can add order line	36	add_orderline
114	Can change order line	36	change_orderline
115	Can delete order line	36	delete_orderline
116	Can add fulfillment	37	add_fulfillment
117	Can change fulfillment	37	change_fulfillment
118	Can delete fulfillment	37	delete_fulfillment
119	Can add fulfillment line	38	add_fulfillmentline
120	Can change fulfillment line	38	change_fulfillmentline
121	Can delete fulfillment line	38	delete_fulfillmentline
122	Can add shipping method	39	add_shippingmethod
123	Can change shipping method	39	change_shippingmethod
124	Can delete shipping method	39	delete_shippingmethod
125	Manage shipping.	39	manage_shipping
126	Can add shipping method country	40	add_shippingmethodcountry
127	Can change shipping method country	40	change_shippingmethodcountry
128	Can delete shipping method country	40	delete_shippingmethodcountry
129	Can add site settings	41	add_sitesettings
130	Can change site settings	41	change_sitesettings
131	Can delete site settings	41	delete_sitesettings
132	Manage settings.	41	manage_settings
133	Can add authorization key	42	add_authorizationkey
134	Can change authorization key	42	change_authorizationkey
135	Can delete authorization key	42	delete_authorizationkey
136	Can add site settings translation	43	add_sitesettingstranslation
137	Can change site settings translation	43	change_sitesettingstranslation
138	Can delete site settings translation	43	delete_sitesettingstranslation
139	Can add page	44	add_page
140	Can change page	44	change_page
141	Can delete page	44	delete_page
142	Manage pages.	44	manage_pages
143	Can add page translation	45	add_pagetranslation
144	Can change page translation	45	change_pagetranslation
145	Can delete page translation	45	delete_pagetranslation
146	Can add conversion rate	46	add_conversionrate
147	Can change conversion rate	46	change_conversionrate
148	Can delete conversion rate	46	delete_conversionrate
149	Can add vat	47	add_vat
150	Can change vat	47	change_vat
151	Can delete vat	47	delete_vat
152	Can add rate types	48	add_ratetypes
153	Can change rate types	48	change_ratetypes
154	Can delete rate types	48	delete_ratetypes
155	Can add association	49	add_association
156	Can change association	49	change_association
157	Can delete association	49	delete_association
158	Can add code	50	add_code
159	Can change code	50	change_code
160	Can delete code	50	delete_code
161	Can add nonce	51	add_nonce
162	Can change nonce	51	change_nonce
163	Can delete nonce	51	delete_nonce
164	Can add user social auth	52	add_usersocialauth
165	Can change user social auth	52	change_usersocialauth
166	Can delete user social auth	52	delete_usersocialauth
167	Can add partial	53	add_partial
168	Can change partial	53	change_partial
169	Can delete partial	53	delete_partial
170	Can add task result	54	add_taskresult
171	Can change task result	54	change_taskresult
172	Can delete task result	54	delete_taskresult
173	Can add impersonation log	55	add_impersonationlog
174	Can change impersonation log	55	change_impersonationlog
175	Can delete impersonation log	55	delete_impersonationlog
176	Can add image data	56	add_imagedata
177	Can change image data	56	change_imagedata
178	Can delete image data	56	delete_imagedata
179	Can add Contentitem link	61	add_contentitem
180	Can change Contentitem link	61	change_contentitem
181	Can delete Contentitem link	61	delete_contentitem
182	Can add Placeholder	62	add_placeholder
183	Can change Placeholder	62	change_placeholder
184	Can delete Placeholder	62	delete_placeholder
185	Can add Code snippet	63	add_codeitem
186	Can change Code snippet	63	change_codeitem
187	Can delete Code snippet	63	delete_codeitem
188	Can add Iframe	64	add_iframeitem
189	Can change Iframe	64	change_iframeitem
190	Can delete Iframe	64	delete_iframeitem
191	Can add Markup code	57	add_markupitem
192	Can change Markup code	57	change_markupitem
193	Can delete Markup code	57	delete_markupitem
194	Can add Markdown	57	add_markdownmarkupitem
195	Can change Markdown	57	change_markdownmarkupitem
196	Can delete Markdown	57	delete_markdownmarkupitem
197	Can add reStructuredText	57	add_restructuredtextmarkupitem
198	Can change reStructuredText	57	change_restructuredtextmarkupitem
199	Can delete reStructuredText	57	delete_restructuredtextmarkupitem
200	Can add Textile	57	add_textilemarkupitem
201	Can change Textile	57	change_textilemarkupitem
202	Can delete Textile	57	delete_textilemarkupitem
203	Can add HTML code	65	add_rawhtmlitem
204	Can change HTML code	65	change_rawhtmlitem
205	Can delete HTML code	65	delete_rawhtmlitem
206	Can add Shared content	66	add_sharedcontent
207	Can change Shared content	66	change_sharedcontent
208	Can delete Shared content	66	delete_sharedcontent
209	Can add Shared content	67	add_sharedcontentitem
210	Can change Shared content	67	change_sharedcontentitem
211	Can delete Shared content	67	delete_sharedcontentitem
212	Can add Text	69	add_textitem
213	Can change Text	69	change_textitem
214	Can delete Text	69	delete_textitem
215	Can add log entry	70	add_logentry
216	Can change log entry	70	change_logentry
217	Can delete log entry	70	delete_logentry
\.


--
-- Data for Name: checkout_cart; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.checkout_cart (created, last_change, email, token, quantity, user_id, billing_address_id, discount_amount, discount_name, note, shipping_address_id, shipping_method_id, voucher_code, translated_discount_name) FROM stdin;
\.


--
-- Data for Name: checkout_cartline; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.checkout_cartline (id, quantity, data, cart_id, variant_id) FROM stdin;
\.


--
-- Data for Name: contentitem_code_codeitem; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.contentitem_code_codeitem (contentitem_ptr_id, language, code, linenumbers) FROM stdin;
\.


--
-- Data for Name: contentitem_iframe_iframeitem; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.contentitem_iframe_iframeitem (contentitem_ptr_id, src, width, height) FROM stdin;
\.


--
-- Data for Name: contentitem_markup_markupitem; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.contentitem_markup_markupitem (contentitem_ptr_id, text, language) FROM stdin;
\.


--
-- Data for Name: contentitem_rawhtml_rawhtmlitem; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.contentitem_rawhtml_rawhtmlitem (contentitem_ptr_id, html) FROM stdin;
\.


--
-- Data for Name: contentitem_sharedcontent_sharedcontentitem; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.contentitem_sharedcontent_sharedcontentitem (contentitem_ptr_id, shared_content_id) FROM stdin;
\.


--
-- Data for Name: contentitem_text_textitem; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.contentitem_text_textitem (contentitem_ptr_id, text, text_final) FROM stdin;
\.


--
-- Data for Name: discount_sale; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.discount_sale (id, name, type, value, end_date, start_date) FROM stdin;
1	Happy rich day!	percentage	10.00	\N	2018-08-23
2	Happy education day!	percentage	30.00	\N	2018-08-23
3	Happy lose day!	percentage	10.00	\N	2018-08-23
4	Happy blood day!	percentage	40.00	\N	2018-08-23
5	Happy art day!	percentage	30.00	\N	2018-08-23
\.


--
-- Data for Name: discount_sale_categories; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.discount_sale_categories (id, sale_id, category_id) FROM stdin;
\.


--
-- Data for Name: discount_sale_collections; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.discount_sale_collections (id, sale_id, collection_id) FROM stdin;
\.


--
-- Data for Name: discount_sale_products; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.discount_sale_products (id, sale_id, product_id) FROM stdin;
\.


--
-- Data for Name: discount_voucher; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.discount_voucher (id, type, name, code, usage_limit, used, start_date, end_date, discount_value_type, discount_value, min_amount_spent, apply_once_per_order, countries) FROM stdin;
1	shipping	Free shipping	FREESHIPPING	\N	0	2018-08-23	\N	percentage	100.00	\N	f	
2	value	Big order discount	DISCOUNT	\N	0	2018-08-23	\N	fixed	25.00	200.00	f	
\.


--
-- Data for Name: discount_voucher_categories; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.discount_voucher_categories (id, voucher_id, category_id) FROM stdin;
\.


--
-- Data for Name: discount_voucher_collections; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.discount_voucher_collections (id, voucher_id, collection_id) FROM stdin;
\.


--
-- Data for Name: discount_voucher_products; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.discount_voucher_products (id, voucher_id, product_id) FROM stdin;
\.


--
-- Data for Name: discount_vouchertranslation; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.discount_vouchertranslation (id, language_code, name, voucher_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_celery_results_taskresult; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.django_celery_results_taskresult (id, task_id, status, content_type, content_encoding, result, date_done, traceback, hidden, meta) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	contenttypes	contenttype
2	sessions	session
3	sites	site
4	auth	permission
5	auth	group
6	account	user
7	account	address
8	account	customernote
9	discount	sale
10	discount	voucher
11	discount	vouchertranslation
12	product	attributechoicevalue
13	product	category
14	product	product
15	product	productattribute
16	product	productimage
17	product	productvariant
18	product	variantimage
19	product	producttype
20	product	collection
21	product	attributechoicevaluetranslation
22	product	categorytranslation
23	product	collectiontranslation
24	product	productattributetranslation
25	product	producttranslation
26	product	productvarianttranslation
27	checkout	cart
28	checkout	cartline
29	menu	menu
30	menu	menuitem
31	menu	menuitemtranslation
32	order	order
33	order	orderhistoryentry
34	order	ordernote
35	order	payment
36	order	orderline
37	order	fulfillment
38	order	fulfillmentline
39	shipping	shippingmethod
40	shipping	shippingmethodcountry
41	site	sitesettings
42	site	authorizationkey
43	site	sitesettingstranslation
44	page	page
45	page	pagetranslation
46	django_prices_openexchangerates	conversionrate
47	django_prices_vatlayer	vat
48	django_prices_vatlayer	ratetypes
49	social_django	association
50	social_django	code
51	social_django	nonce
52	social_django	usersocialauth
53	social_django	partial
54	django_celery_results	taskresult
55	impersonate	impersonationlog
56	product	imagedata
57	markup	markupitem
58	markup	restructuredtextmarkupitem
59	markup	markdownmarkupitem
60	markup	textilemarkupitem
61	fluent_contents	contentitem
62	fluent_contents	placeholder
63	code	codeitem
64	iframe	iframeitem
65	rawhtml	rawhtmlitem
66	sharedcontent	sharedcontent
67	sharedcontent	sharedcontentitem
68	sharedcontent	sharedcontenttranslation
69	text	textitem
70	admin	logentry
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
299	contenttypes	0001_initial	2018-12-03 14:21:56.268485+07
300	contenttypes	0002_remove_content_type_name	2018-12-03 14:21:56.29872+07
301	auth	0001_initial	2018-12-03 14:21:56.302829+07
302	auth	0002_alter_permission_name_max_length	2018-12-03 14:21:56.307508+07
303	auth	0003_alter_user_email_max_length	2018-12-03 14:21:56.311298+07
304	auth	0004_alter_user_username_opts	2018-12-03 14:21:56.315349+07
305	auth	0005_alter_user_last_login_null	2018-12-03 14:21:56.319774+07
306	auth	0006_require_contenttypes_0002	2018-12-03 14:21:56.323074+07
307	userprofile	0001_initial	2018-12-03 14:21:56.326293+07
308	userprofile	0002_auto_20150907_0602	2018-12-03 14:21:56.330356+07
309	userprofile	0003_auto_20151104_1102	2018-12-03 14:21:56.334155+07
310	userprofile	0004_auto_20160114_0419	2018-12-03 14:21:56.337638+07
311	userprofile	0005_auto_20160205_0651	2018-12-03 14:21:56.341344+07
312	userprofile	0006_auto_20160829_0819	2018-12-03 14:21:56.345125+07
313	userprofile	0007_auto_20161115_0940	2018-12-03 14:21:56.349341+07
314	userprofile	0008_auto_20161115_1011	2018-12-03 14:21:56.353532+07
315	userprofile	0009_auto_20170206_0407	2018-12-03 14:21:56.356953+07
316	userprofile	0010_auto_20170919_0839	2018-12-03 14:21:56.360999+07
317	userprofile	0011_auto_20171110_0552	2018-12-03 14:21:56.365388+07
318	userprofile	0012_auto_20171117_0846	2018-12-03 14:21:56.369466+07
319	userprofile	0013_auto_20171120_0521	2018-12-03 14:21:56.373283+07
320	userprofile	0014_auto_20171129_1004	2018-12-03 14:21:56.376915+07
321	userprofile	0015_auto_20171213_0734	2018-12-03 14:21:56.382055+07
322	userprofile	0016_auto_20180108_0814	2018-12-03 14:21:56.388159+07
323	account	0017_auto_20180206_0957	2018-12-03 14:21:56.393175+07
324	account	0018_auto_20180426_0641	2018-12-03 14:21:56.401964+07
325	account	0019_auto_20180528_1205	2018-12-03 14:21:56.406959+07
326	account	0020_user_token	2018-12-03 14:21:56.41415+07
327	account	0021_unique_token	2018-12-03 14:21:56.419444+07
328	account	0022_auto_20180718_0956	2018-12-03 14:21:56.423917+07
329	account	0023_auto_20180719_0520	2018-12-03 14:21:56.429156+07
330	auth	0007_alter_validators_add_error_messages	2018-12-03 14:21:56.435077+07
331	auth	0008_alter_user_username_max_length	2018-12-03 14:21:56.441027+07
332	shipping	0001_initial	2018-12-03 14:21:56.451455+07
333	shipping	0002_auto_20160906_0741	2018-12-03 14:21:56.456281+07
334	shipping	0003_auto_20170116_0700	2018-12-03 14:21:56.463125+07
335	shipping	0004_auto_20170206_0407	2018-12-03 14:21:56.467774+07
336	shipping	0005_auto_20170906_0556	2018-12-03 14:21:56.474416+07
337	shipping	0006_auto_20171109_0908	2018-12-03 14:21:56.48059+07
338	shipping	0007_auto_20171129_1004	2018-12-03 14:21:56.485352+07
339	shipping	0008_auto_20180108_0814	2018-12-03 14:21:56.49195+07
340	product	0001_initial	2018-12-03 14:21:56.497193+07
341	product	0002_auto_20150722_0545	2018-12-03 14:21:56.503354+07
342	product	0003_auto_20150820_2016	2018-12-03 14:21:56.509718+07
343	product	0003_auto_20150820_1955	2018-12-03 14:21:56.515814+07
344	product	0004_merge	2018-12-03 14:21:56.520682+07
345	product	0005_auto_20150825_1433	2018-12-03 14:21:56.526077+07
346	product	0006_product_updated_at	2018-12-03 14:21:56.532493+07
347	product	0007_auto_20160112_1025	2018-12-03 14:21:56.537634+07
348	product	0008_auto_20160114_0733	2018-12-03 14:21:56.542867+07
349	product	0009_discount_categories	2018-12-03 14:21:56.547959+07
350	product	0010_auto_20160129_0826	2018-12-03 14:21:56.555796+07
351	product	0011_stock_quantity_allocated	2018-12-03 14:21:56.560666+07
352	product	0012_auto_20160218_0812	2018-12-03 14:21:56.565993+07
353	discount	0001_initial	2018-12-03 14:21:56.573866+07
354	discount	0002_voucher	2018-12-03 14:21:56.578871+07
355	discount	0003_auto_20160207_0534	2018-12-03 14:21:56.585272+07
356	cart	0001_initial	2018-12-03 14:21:56.591227+07
357	cart	0002_auto_20161014_1221	2018-12-03 14:21:56.595442+07
358	cart	fix_empty_data_in_lines	2018-12-03 14:21:56.605562+07
359	cart	0001_auto_20170113_0435	2018-12-03 14:21:56.610712+07
360	cart	0002_auto_20170206_0407	2018-12-03 14:21:56.61583+07
361	cart	0003_auto_20170906_0556	2018-12-03 14:21:56.621305+07
362	cart	0004_auto_20171129_1004	2018-12-03 14:21:56.627505+07
363	cart	0005_auto_20180108_0814	2018-12-03 14:21:56.63254+07
364	cart	0006_auto_20180221_0825	2018-12-03 14:21:56.63831+07
365	checkout	0007_merge_cart_with_checkout	2018-12-03 14:21:56.643268+07
366	checkout	0008_rename_tables	2018-12-03 14:21:56.6489+07
367	checkout	0009_cart_translated_discount_name	2018-12-03 14:21:56.656023+07
368	fluent_contents	0001_initial	2018-12-03 14:21:56.660484+07
369	code	0001_initial	2018-12-03 14:21:56.666952+07
370	product	0013_auto_20161207_0555	2018-12-03 14:21:56.672205+07
371	product	0014_auto_20161207_0840	2018-12-03 14:21:56.676895+07
372	product	0015_transfer_locations	2018-12-03 14:21:56.682478+07
373	product	0016_auto_20161207_0843	2018-12-03 14:21:56.688892+07
374	product	0017_remove_stock_location	2018-12-03 14:21:56.695524+07
375	product	0018_auto_20161207_0844	2018-12-03 14:21:56.700883+07
376	product	0019_auto_20161212_0230	2018-12-03 14:21:56.707402+07
377	product	0020_attribute_data_to_class	2018-12-03 14:21:56.71222+07
378	product	0021_add_hstore_extension	2018-12-03 14:21:56.719098+07
379	product	0022_auto_20161212_0301	2018-12-03 14:21:56.726532+07
380	product	0023_auto_20161211_1912	2018-12-03 14:21:56.732089+07
381	product	0024_migrate_json_data	2018-12-03 14:21:56.73725+07
382	product	0025_auto_20161219_0517	2018-12-03 14:21:56.741618+07
383	product	0026_auto_20161230_0347	2018-12-03 14:21:56.744645+07
384	product	0027_auto_20170113_0435	2018-12-03 14:21:56.747623+07
385	product	0013_auto_20161130_0608	2018-12-03 14:21:56.751486+07
386	product	0014_remove_productvariant_attributes	2018-12-03 14:21:56.754488+07
387	product	0015_productvariant_attributes	2018-12-03 14:21:56.758975+07
388	product	0016_auto_20161204_0311	2018-12-03 14:21:56.760981+07
389	product	0017_attributechoicevalue_slug	2018-12-03 14:21:56.765147+07
390	product	0018_auto_20161212_0725	2018-12-03 14:21:56.768597+07
391	product	0026_merge_20161221_0845	2018-12-03 14:21:56.77254+07
392	product	0028_merge_20170116_1016	2018-12-03 14:21:56.7768+07
393	product	0029_product_is_featured	2018-12-03 14:21:56.78097+07
394	product	0030_auto_20170206_0407	2018-12-03 14:21:56.784847+07
395	product	0031_auto_20170206_0601	2018-12-03 14:21:56.790344+07
396	product	0032_auto_20170216_0438	2018-12-03 14:21:56.793596+07
397	product	0033_auto_20170227_0757	2018-12-03 14:21:56.79813+07
398	product	0034_product_is_published	2018-12-03 14:21:56.802425+07
399	product	0035_auto_20170919_0846	2018-12-03 14:21:56.806049+07
400	product	0036_auto_20171115_0608	2018-12-03 14:21:56.809273+07
401	product	0037_auto_20171124_0847	2018-12-03 14:21:56.813418+07
402	product	0038_auto_20171129_0616	2018-12-03 14:21:56.817981+07
403	product	0037_auto_20171129_1004	2018-12-03 14:21:56.821481+07
404	product	0039_merge_20171130_0727	2018-12-03 14:21:56.825417+07
405	product	0040_auto_20171205_0428	2018-12-03 14:21:56.828407+07
406	product	0041_auto_20171205_0546	2018-12-03 14:21:56.832164+07
407	product	0042_auto_20171206_0501	2018-12-03 14:21:56.837493+07
408	product	0043_auto_20171207_0839	2018-12-03 14:21:56.840894+07
409	product	0044_auto_20180108_0814	2018-12-03 14:21:56.844794+07
410	product	0045_md_to_html	2018-12-03 14:21:56.848795+07
411	product	0046_product_category	2018-12-03 14:21:56.854079+07
412	product	0047_auto_20180117_0359	2018-12-03 14:21:56.860011+07
413	product	0048_product_class_to_type	2018-12-03 14:21:56.865825+07
414	product	0049_collection	2018-12-03 14:21:56.870393+07
415	product	0050_auto_20180131_0746	2018-12-03 14:21:56.876501+07
416	product	0051_auto_20180202_1106	2018-12-03 14:21:56.883516+07
417	product	0052_slug_field_length	2018-12-03 14:21:56.888059+07
418	product	0053_product_seo_description	2018-12-03 14:21:56.893352+07
419	product	0053_auto_20180305_1002	2018-12-03 14:21:56.899976+07
420	product	0054_merge_20180320_1108	2018-12-03 14:21:56.904627+07
421	product	0055_auto_20180321_0417	2018-12-03 14:21:56.910992+07
422	product	0056_auto_20180330_0321	2018-12-03 14:21:56.917146+07
423	product	0057_auto_20180403_0852	2018-12-03 14:21:56.922286+07
424	order	0001_initial	2018-12-03 14:21:56.931225+07
425	order	0002_auto_20150820_1955	2018-12-03 14:21:56.936646+07
426	order	0003_auto_20150825_1433	2018-12-03 14:21:56.940608+07
427	order	0004_order_total	2018-12-03 14:21:56.945575+07
428	order	0005_deliverygroup_last_updated	2018-12-03 14:21:56.94947+07
429	order	0006_deliverygroup_shipping_method	2018-12-03 14:21:56.95422+07
430	order	0007_deliverygroup_tracking_number	2018-12-03 14:21:56.957274+07
431	order	0008_auto_20151026_0820	2018-12-03 14:21:56.960835+07
432	order	0009_auto_20151201_0820	2018-12-03 14:21:56.967092+07
433	order	0010_auto_20160119_0541	2018-12-03 14:21:56.969998+07
434	order	0011_auto_20160207_0534	2018-12-03 14:21:56.973604+07
435	order	0012_auto_20160216_1032	2018-12-03 14:21:56.975959+07
436	order	0013_auto_20160906_0741	2018-12-03 14:21:56.978958+07
437	order	0014_auto_20161028_0955	2018-12-03 14:21:56.982017+07
438	order	0015_auto_20170206_0407	2018-12-03 14:21:56.984912+07
439	order	0016_order_language_code	2018-12-03 14:21:56.987911+07
440	order	0017_auto_20170906_0556	2018-12-03 14:21:56.990964+07
441	order	0018_auto_20170919_0839	2018-12-03 14:21:56.993964+07
442	order	0019_auto_20171109_1423	2018-12-03 14:21:56.996839+07
443	order	0020_auto_20171123_0609	2018-12-03 14:21:56.999991+07
444	order	0021_auto_20171129_1004	2018-12-03 14:21:57.002527+07
445	order	0022_auto_20171205_0428	2018-12-03 14:21:57.005528+07
446	order	0023_auto_20171206_0506	2018-12-03 14:21:57.007894+07
447	order	0024_remove_order_status	2018-12-03 14:21:57.01144+07
448	order	0025_auto_20171214_1015	2018-12-03 14:21:57.015247+07
449	order	0026_auto_20171218_0428	2018-12-03 14:21:57.018042+07
450	order	0027_auto_20180108_0814	2018-12-03 14:21:57.020047+07
451	order	0028_status_fsm	2018-12-03 14:21:57.023298+07
452	order	0029_auto_20180111_0845	2018-12-03 14:21:57.026314+07
453	order	0030_auto_20180118_0605	2018-12-03 14:21:57.030077+07
454	order	0031_auto_20180119_0405	2018-12-03 14:21:57.033081+07
455	order	0032_orderline_is_shipping_required	2018-12-03 14:21:57.036069+07
456	order	0033_auto_20180123_0832	2018-12-03 14:21:57.039067+07
457	order	0034_auto_20180221_1056	2018-12-03 14:21:57.041805+07
458	order	0035_auto_20180221_1057	2018-12-03 14:21:57.044923+07
459	order	0036_remove_order_total_tax	2018-12-03 14:21:57.048963+07
460	order	0037_auto_20180228_0450	2018-12-03 14:21:57.051712+07
461	order	0038_auto_20180228_0451	2018-12-03 14:21:57.054714+07
462	order	0039_auto_20180312_1203	2018-12-03 14:21:57.057832+07
463	order	0040_auto_20180210_0422	2018-12-03 14:21:57.060548+07
464	order	0041_auto_20180222_0458	2018-12-03 14:21:57.063678+07
465	order	0042_auto_20180227_0436	2018-12-03 14:21:57.066883+07
466	order	0043_auto_20180322_0655	2018-12-03 14:21:57.069676+07
467	order	0044_auto_20180326_1055	2018-12-03 14:21:57.07568+07
468	order	0045_auto_20180329_0142	2018-12-03 14:21:57.080541+07
469	product	0058_auto_20180329_0142	2018-12-03 14:21:57.083515+07
470	product	0059_generate_variant_name_from_attrs	2018-12-03 14:21:57.087735+07
471	product	0060_collection_is_published	2018-12-03 14:21:57.092423+07
472	product	0061_product_taxes	2018-12-03 14:21:57.096027+07
473	product	0062_sortable_models	2018-12-03 14:21:57.099618+07
474	product	0063_required_attr_value_order	2018-12-03 14:21:57.103187+07
475	product	0064_productvariant_handle_stock	2018-12-03 14:21:57.1069+07
476	product	0065_auto_20180719_0520	2018-12-03 14:21:57.110542+07
477	discount	0004_auto_20170206_0407	2018-12-03 14:21:57.113548+07
478	discount	0005_auto_20170919_0839	2018-12-03 14:21:57.117017+07
479	discount	0006_auto_20171129_1004	2018-12-03 14:21:57.120481+07
480	discount	0007_auto_20180108_0814	2018-12-03 14:21:57.124221+07
481	discount	0008_sale_collections	2018-12-03 14:21:57.12841+07
482	discount	0009_auto_20180719_0520	2018-12-03 14:21:57.13205+07
483	discount	0010_auto_20180724_1251	2018-12-03 14:21:57.136633+07
484	discount	0011_auto_20180803_0528	2018-12-03 14:21:57.139768+07
485	django_celery_results	0001_initial	2018-12-03 14:21:57.143181+07
486	django_prices_openexchangerates	0001_initial	2018-12-03 14:21:57.148161+07
487	django_prices_openexchangerates	0002_auto_20160329_0702	2018-12-03 14:21:57.152163+07
488	django_prices_openexchangerates	0003_auto_20161018_0707	2018-12-03 14:21:57.15612+07
489	django_prices_openexchangerates	0004_auto_20170316_0944	2018-12-03 14:21:57.159122+07
490	django_prices_vatlayer	0001_initial	2018-12-03 14:21:57.162818+07
491	django_prices_vatlayer	0002_ratetypes	2018-12-03 14:21:57.167385+07
492	django_prices_vatlayer	0003_auto_20180316_1053	2018-12-03 14:21:57.172306+07
493	iframe	0001_initial	2018-12-03 14:21:57.178452+07
494	impersonate	0001_initial	2018-12-03 14:21:57.184658+07
495	markup	0001_initial	2018-12-03 14:21:57.190753+07
496	markup	0002_fix_polymorphic_ctype	2018-12-03 14:21:57.198183+07
497	page	0001_initial	2018-12-03 14:21:57.202993+07
498	menu	0001_initial	2018-12-03 14:21:57.208431+07
499	menu	0002_auto_20180319_0412	2018-12-03 14:21:57.216741+07
500	menu	0003_auto_20180405_0854	2018-12-03 14:21:57.222485+07
501	menu	0004_sort_order_index	2018-12-03 14:21:57.228058+07
502	menu	0005_auto_20180719_0520	2018-12-03 14:21:57.236902+07
503	menu	0006_auto_20180803_0528	2018-12-03 14:21:57.24282+07
504	menu	0007_auto_20180807_0547	2018-12-03 14:21:57.250347+07
505	order	0046_order_line_taxes	2018-12-03 14:21:57.255893+07
506	order	0047_order_line_name_length	2018-12-03 14:21:57.26139+07
507	order	0048_auto_20180629_1055	2018-12-03 14:21:57.267563+07
508	order	0049_auto_20180719_0520	2018-12-03 14:21:57.273135+07
509	order	0050_auto_20180803_0528	2018-12-03 14:21:57.278846+07
510	order	0050_auto_20180803_0337	2018-12-03 14:21:57.283866+07
511	order	0051_merge_20180807_0704	2018-12-03 14:21:57.289884+07
512	page	0002_auto_20180321_0417	2018-12-03 14:21:57.296548+07
513	page	0003_auto_20180719_0520	2018-12-03 14:21:57.301944+07
514	page	0004_auto_20180803_0528	2018-12-03 14:21:57.310228+07
515	sites	0001_initial	2018-12-03 14:21:57.315373+07
516	sites	0002_alter_domain_unique	2018-12-03 14:21:57.322252+07
517	site	0001_initial	2018-12-03 14:21:57.327469+07
518	site	0002_add_default_data	2018-12-03 14:21:57.332938+07
519	site	0003_sitesettings_description	2018-12-03 14:21:57.339615+07
520	site	0004_auto_20170221_0426	2018-12-03 14:21:57.345018+07
521	site	0005_auto_20170906_0556	2018-12-03 14:21:57.349926+07
522	site	0006_auto_20171025_0454	2018-12-03 14:21:57.355321+07
523	site	0007_auto_20171027_0856	2018-12-03 14:21:57.361432+07
524	site	0008_auto_20171027_0856	2018-12-03 14:21:57.365881+07
525	site	0009_auto_20171109_0849	2018-12-03 14:21:57.372172+07
526	site	0010_auto_20171113_0958	2018-12-03 14:21:57.377263+07
527	site	0011_auto_20180108_0814	2018-12-03 14:21:57.383006+07
528	site	0012_auto_20180405_0757	2018-12-03 14:21:57.39155+07
529	site	0013_assign_default_menus	2018-12-03 14:21:57.397847+07
530	site	0014_handle_taxes	2018-12-03 14:21:57.403374+07
531	site	0015_sitesettings_handle_stock_by_default	2018-12-03 14:21:57.408472+07
532	site	0016_auto_20180719_0520	2018-12-03 14:21:57.416159+07
533	site	0017_auto_20180803_0528	2018-12-03 14:21:57.42212+07
534	product	0066_auto_20180803_0528	2018-12-03 14:21:57.427504+07
535	site	0018_sitesettings_homepage_collection	2018-12-03 14:21:57.43436+07
536	product	0067_remove_product_is_featured	2018-12-03 14:21:57.439722+07
537	product	0068_auto_20181106_2222	2018-12-03 14:21:57.445302+07
538	product	0069_auto_20181113_2108	2018-12-03 14:21:57.451201+07
539	product	0070_auto_20181120_2312	2018-12-03 14:21:57.455951+07
540	product	0071_auto_20181201_1427	2018-12-03 14:21:57.46355+07
541	product	0072_auto_20181201_1453	2018-12-03 14:21:57.469255+07
542	product	0073_auto_20181201_1556	2018-12-03 14:21:57.474608+07
543	product	0074_auto_20181202_2057	2018-12-03 14:21:57.483986+07
544	rawhtml	0001_initial	2018-12-03 14:21:57.489524+07
545	sessions	0001_initial	2018-12-03 14:21:57.496419+07
546	sharedcontent	0001_initial	2018-12-03 14:21:57.501333+07
547	shipping	0009_auto_20180629_1055	2018-12-03 14:21:57.506091+07
548	shipping	0010_auto_20180719_0520	2018-12-03 14:21:57.512492+07
549	shipping	0011_auto_20180802_1238	2018-12-03 14:21:57.518417+07
550	default	0001_initial	2018-12-03 14:21:57.524471+07
551	social_auth	0001_initial	2018-12-03 14:21:57.527854+07
552	default	0002_add_related_name	2018-12-03 14:21:57.535161+07
553	social_auth	0002_add_related_name	2018-12-03 14:21:57.539819+07
554	default	0003_alter_email_max_length	2018-12-03 14:21:57.54727+07
555	social_auth	0003_alter_email_max_length	2018-12-03 14:21:57.549992+07
556	default	0004_auto_20160423_0400	2018-12-03 14:21:57.555258+07
557	social_auth	0004_auto_20160423_0400	2018-12-03 14:21:57.560213+07
558	social_auth	0005_auto_20160727_2333	2018-12-03 14:21:57.568+07
559	social_django	0006_partial	2018-12-03 14:21:57.573147+07
560	social_django	0007_code_timestamp	2018-12-03 14:21:57.578642+07
561	social_django	0008_partial_timestamp	2018-12-03 14:21:57.584709+07
562	text	0001_initial	2018-12-03 14:21:57.589685+07
563	text	0002_textitem_text_final	2018-12-03 14:21:57.59504+07
564	account	0004_auto_20160114_0419	2018-12-03 14:21:57.603569+07
565	account	0001_initial	2018-12-03 14:21:57.608204+07
566	account	0007_auto_20161115_0940	2018-12-03 14:21:57.61242+07
567	account	0013_auto_20171120_0521	2018-12-03 14:21:57.616866+07
568	account	0015_auto_20171213_0734	2018-12-03 14:21:57.619674+07
569	account	0006_auto_20160829_0819	2018-12-03 14:21:57.623903+07
570	account	0008_auto_20161115_1011	2018-12-03 14:21:57.630553+07
571	account	0016_auto_20180108_0814	2018-12-03 14:21:57.633635+07
572	account	0012_auto_20171117_0846	2018-12-03 14:21:57.639123+07
573	account	0014_auto_20171129_1004	2018-12-03 14:21:57.642295+07
574	account	0009_auto_20170206_0407	2018-12-03 14:21:57.645491+07
575	account	0010_auto_20170919_0839	2018-12-03 14:21:57.652494+07
576	account	0005_auto_20160205_0651	2018-12-03 14:21:57.655914+07
577	account	0002_auto_20150907_0602	2018-12-03 14:21:57.659718+07
578	account	0003_auto_20151104_1102	2018-12-03 14:21:57.664181+07
579	account	0011_auto_20171110_0552	2018-12-03 14:21:57.668324+07
580	checkout	0004_auto_20171129_1004	2018-12-03 14:21:57.671895+07
581	checkout	0006_auto_20180221_0825	2018-12-03 14:21:57.675661+07
582	checkout	0002_auto_20170206_0407	2018-12-03 14:21:57.677707+07
583	checkout	0005_auto_20180108_0814	2018-12-03 14:21:57.68139+07
584	checkout	0001_initial	2018-12-03 14:21:57.683772+07
585	checkout	0003_auto_20170906_0556	2018-12-03 14:21:57.685772+07
586	checkout	0002_auto_20161014_1221	2018-12-03 14:21:57.689301+07
587	checkout	0001_auto_20170113_0435	2018-12-03 14:21:57.691495+07
588	checkout	fix_empty_data_in_lines	2018-12-03 14:21:57.694493+07
589	social_django	0002_add_related_name	2018-12-03 14:21:57.697497+07
590	social_django	0001_initial	2018-12-03 14:21:57.699495+07
591	social_django	0004_auto_20160423_0400	2018-12-03 14:21:57.701527+07
592	social_django	0005_auto_20160727_2333	2018-12-03 14:21:57.703659+07
593	social_django	0003_alter_email_max_length	2018-12-03 14:21:57.705695+07
594	admin	0001_initial	2018-12-04 23:31:16.489603+07
595	admin	0002_logentry_remove_auto_add	2018-12-04 23:31:16.524487+07
596	product	0068_add_product_metadata_image	2018-12-06 22:47:14.699155+07
597	product	0069_remove_product_metadata_image	2018-12-06 22:47:14.756692+07
598	product	0070_add_product_templates	2018-12-06 22:47:14.870152+07
599	product	0075_merge_20181206_2247	2018-12-06 22:47:14.874151+07
600	auth	0009_alter_user_last_name_max_length	2018-12-07 23:04:31.906505+07
\.


--
-- Data for Name: django_prices_openexchangerates_conversionrate; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.django_prices_openexchangerates_conversionrate (id, to_currency, rate, modified_at) FROM stdin;
\.


--
-- Data for Name: django_prices_vatlayer_ratetypes; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.django_prices_vatlayer_ratetypes (id, types) FROM stdin;
\.


--
-- Data for Name: django_prices_vatlayer_vat; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.django_prices_vatlayer_vat (id, country_code, data) FROM stdin;
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
cs4j2za5gpod9kvgnfativzh3qduehp4	ZTVhMTMyYTdkZjlhNmVhZWI5MjQyZmI3ZDA1ZTBmNDI2NDQ2M2JlYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MjA5Y2Y0ZDIxYmNmMGMzNGE0N2E4ZjUyYTA3NTA0Y2NlNzY1MjJjIn0=	2018-11-18 21:55:19.384322+07
nl9gy9cfgevrwcsx371wl74eq42ewvvp	ZDU3ZTEzZTlkNTI3NGJkNDI4M2RiM2JhNzA5OWE4NGYzYWE0OTkwZTp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjk5MTUwMjIyZDA3NTIyZDVhMzFlMDhkODg5ZmIyMTEwZTFjNmNiYSJ9	2018-09-06 23:00:28.657804+07
iuolbifcc69jo0hxnq4sz9sw5xuegpd9	ZDU3ZTEzZTlkNTI3NGJkNDI4M2RiM2JhNzA5OWE4NGYzYWE0OTkwZTp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjk5MTUwMjIyZDA3NTIyZDVhMzFlMDhkODg5ZmIyMTEwZTFjNmNiYSJ9	2018-09-07 16:34:42.884653+07
2vsxqkhrt5ihe6usi9q8qpx89bv157b8	ZDU3ZTEzZTlkNTI3NGJkNDI4M2RiM2JhNzA5OWE4NGYzYWE0OTkwZTp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjk5MTUwMjIyZDA3NTIyZDVhMzFlMDhkODg5ZmIyMTEwZTFjNmNiYSJ9	2018-10-07 22:46:07.499518+07
4gbma7629dx361mmfp1w2m9s7y6jqdph	ZDU3ZTEzZTlkNTI3NGJkNDI4M2RiM2JhNzA5OWE4NGYzYWE0OTkwZTp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjk5MTUwMjIyZDA3NTIyZDVhMzFlMDhkODg5ZmIyMTEwZTFjNmNiYSJ9	2018-10-19 11:00:20.605714+07
z1ck9a5sjr6l0rnig9aaxmbtmifwokto	ZDU3ZTEzZTlkNTI3NGJkNDI4M2RiM2JhNzA5OWE4NGYzYWE0OTkwZTp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjk5MTUwMjIyZDA3NTIyZDVhMzFlMDhkODg5ZmIyMTEwZTFjNmNiYSJ9	2018-10-31 16:35:43.197635+07
fcvfz3g0pcd2411lq3ui23is568e000k	ZDU3ZTEzZTlkNTI3NGJkNDI4M2RiM2JhNzA5OWE4NGYzYWE0OTkwZTp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjk5MTUwMjIyZDA3NTIyZDVhMzFlMDhkODg5ZmIyMTEwZTFjNmNiYSJ9	2018-11-13 16:01:01.650875+07
z29mq1mdedazi3ghs8oy81t5ikreuhnr	ZTVhMTMyYTdkZjlhNmVhZWI5MjQyZmI3ZDA1ZTBmNDI2NDQ2M2JlYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MjA5Y2Y0ZDIxYmNmMGMzNGE0N2E4ZjUyYTA3NTA0Y2NlNzY1MjJjIn0=	2018-12-17 00:09:42.567252+07
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.django_site (id, domain, name) FROM stdin;
1	localhost:8000	Saleor e-commerce
\.


--
-- Data for Name: fluent_contents_contentitem; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.fluent_contents_contentitem (id, parent_id, language_code, sort_order, parent_type_id, placeholder_id, polymorphic_ctype_id) FROM stdin;
\.


--
-- Data for Name: fluent_contents_placeholder; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.fluent_contents_placeholder (id, slot, role, parent_id, title, parent_type_id) FROM stdin;
\.


--
-- Data for Name: impersonate_impersonationlog; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.impersonate_impersonationlog (id, session_key, session_started_at, session_ended_at, impersonating_id, impersonator_id) FROM stdin;
\.


--
-- Data for Name: menu_menu; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.menu_menu (id, name, json_content) FROM stdin;
1	navbar	"[]"
2	footer	"[]"
\.


--
-- Data for Name: menu_menuitem; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.menu_menuitem (id, name, sort_order, url, lft, rght, tree_id, level, category_id, collection_id, menu_id, page_id, parent_id) FROM stdin;
1	Apparel	0	\N	1	2	1	0	1	\N	1	\N	\N
2	Accessories	1	\N	1	2	2	0	2	\N	1	\N	\N
4	Coffees	0	\N	2	3	3	1	4	\N	1	\N	3
3	Groceries	2	\N	1	6	3	0	3	\N	1	\N	\N
5	Candies	1	\N	4	5	3	1	5	\N	1	\N	3
6	Books	3	\N	1	2	4	0	6	\N	1	\N	\N
8	Summer collection	0	\N	2	3	5	1	\N	1	2	\N	7
7	Collections	0	\N	1	6	5	0	\N	1	2	\N	\N
9	Winter sale	1	\N	4	5	5	1	\N	2	2	\N	7
10	About	2	\N	1	2	6	0	\N	\N	2	1	\N
\.


--
-- Data for Name: menu_menuitemtranslation; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.menu_menuitemtranslation (id, language_code, name, menu_item_id) FROM stdin;
\.


--
-- Data for Name: order_fulfillment; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.order_fulfillment (id, tracking_number, shipping_date, order_id, fulfillment_order, status) FROM stdin;
\.


--
-- Data for Name: order_fulfillmentline; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.order_fulfillmentline (id, order_line_id, quantity, fulfillment_id) FROM stdin;
\.


--
-- Data for Name: order_order; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.order_order (id, created, tracking_client_id, user_email, token, billing_address_id, shipping_address_id, user_id, total_net, discount_amount, discount_name, voucher_id, language_code, shipping_price_gross, total_gross, shipping_price_net, status, shipping_method_name, shipping_method_id, display_gross_prices, translated_discount_name, customer_note) FROM stdin;
\.


--
-- Data for Name: order_orderhistoryentry; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.order_orderhistoryentry (id, date, order_id, user_id, content) FROM stdin;
\.


--
-- Data for Name: order_orderline; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.order_orderline (id, product_name, product_sku, quantity, unit_price_net, unit_price_gross, is_shipping_required, order_id, quantity_fulfilled, variant_id, tax_rate, translated_product_name) FROM stdin;
\.


--
-- Data for Name: order_ordernote; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.order_ordernote (id, date, content, order_id, user_id) FROM stdin;
\.


--
-- Data for Name: order_payment; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.order_payment (id, variant, status, fraud_status, fraud_message, created, modified, transaction_id, currency, total, delivery, tax, description, billing_first_name, billing_last_name, billing_address_1, billing_address_2, billing_city, billing_postcode, billing_country_code, billing_country_area, billing_email, customer_ip_address, extra_data, message, token, captured_amount, order_id) FROM stdin;
\.


--
-- Data for Name: page_page; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.page_page (id, slug, title, content, created, is_visible, available_on, seo_description, seo_title) FROM stdin;
1	about	About	<h2 align="center">AN OPENSOURCE STOREFRONT PLATFORM FOR PERFECTIONISTS</h2>\n    <h3 align="center">WRITTEN IN PYTHON, BEST SERVED AS A BESPOKE, HIGH-PERFORMANCE E-COMMERCE SOLUTION</h3>\n    <p><br></p>\n    <p><img src="http://getsaleor.com/images/main-pic.svg"></p>\n    <p style="text-align: center;">\n        <a href="https://github.com/mirumee/saleor/">Get Saleor</a> today!\n    </p>	2018-08-23 22:41:59.39887+07	t	\N	 AN OPENSOURCE STOREFRONT PLATFORM FOR PERFECTIONISTS WRITTEN IN PYTHON, BEST SERVED AS A BESPOKE, HIGH-PERFORMANCE E-COMMERCE SOLUTION    Get Saleor today!  	
\.


--
-- Data for Name: page_pagetranslation; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.page_pagetranslation (id, seo_title, seo_description, language_code, title, content, page_id) FROM stdin;
\.


--
-- Data for Name: product_attributechoicevalue; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_attributechoicevalue (id, name, attribute_id, slug, sort_order) FROM stdin;
1	Blue	1	blue	0
2	White	1	white	1
3	Round	2	round	0
4	V-Neck	2	v-neck	1
5	Polo	2	polo	2
6	Saleor	3	saleor	0
7	XS	4	xs	0
8	S	4	s	1
9	M	4	m	2
10	L	4	l	3
11	XL	4	xl	4
12	XXL	4	xxl	5
13	Arabica	5	arabica	0
14	Robusta	5	robusta	1
15	100g	6	100g	0
16	250g	6	250g	1
17	500g	6	500g	2
18	1kg	6	1kg	3
19	Sour	7	sour	0
20	Sweet	7	sweet	1
21	100g	8	100g	0
22	250g	8	250g	1
23	500g	8	500g	2
24	John Doe	9	john-doe	0
25	Milionare Pirate	9	milionare-pirate	1
26	Mirumee Press	10	mirumee-press	0
27	Saleor Publishing	10	saleor-publishing	1
28	English	11	english	0
29	Pirate	11	pirate	1
30	Soft	12	soft	0
31	Hard	12	hard	1
\.


--
-- Data for Name: product_attributechoicevaluetranslation; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_attributechoicevaluetranslation (id, language_code, name, attribute_choice_value_id) FROM stdin;
\.


--
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_category (id, name, slug, description, lft, rght, tree_id, level, parent_id, background_image, seo_description, seo_title) FROM stdin;
1	Apparel	apparel	Approach stop election garden dream popular.\nAbility week leg example maintain. Team analysis sign describe own here eight sense.	1	2	1	0	\N	category-backgrounds/saleor/static/placeholders/products-list/apparel.jpg	\N	\N
2	Accessories	accessories	Attention once relationship difference history along. Yourself will be staff eight ago require.\nForget its dog onto. Create paper budget deal. Congress amount family Republican into dog there.	1	2	2	0	\N	category-backgrounds/saleor/static/placeholders/products-list/accessories.jpg	\N	\N
4	Coffees	coffees	Seek culture media significant general end age. Whatever college space.	2	3	3	1	3	category-backgrounds/saleor/static/placeholders/products-list/coffees.jpg	\N	\N
3	Groceries	groceries	Expect so policy explain. Necessary you federal onto. Mr music place act kid above nice method.	1	6	3	0	\N	category-backgrounds/saleor/static/placeholders/products-list/groceries.jpg	\N	\N
5	Candies	candies	Education sort discover blood machine whatever street inside. Blue best risk fight nor.	4	5	3	1	3	category-backgrounds/saleor/static/placeholders/products-list/candies.jpg	\N	\N
6	Books	books	Consider anyone wish decide consumer rather let right. Fear wide land home carry affect knowledge.	1	2	4	0	\N	category-backgrounds/saleor/static/placeholders/products-list/books.jpg	\N	\N
\.


--
-- Data for Name: product_categorytranslation; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_categorytranslation (id, seo_title, seo_description, language_code, name, description, category_id) FROM stdin;
\.


--
-- Data for Name: product_collection; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_collection (id, name, slug, background_image, seo_description, seo_title, is_published) FROM stdin;
1	Summer collection	summer-collection	collection-backgrounds/saleor/static/placeholders/products-list/summer.jpg	\N	\N	f
2	Winter sale	winter-sale	collection-backgrounds/saleor/static/placeholders/products-list/sale.jpg	\N	\N	f
\.


--
-- Data for Name: product_collection_products; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_collection_products (id, collection_id, product_id) FROM stdin;
\.


--
-- Data for Name: product_collectiontranslation; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_collectiontranslation (id, seo_title, seo_description, language_code, name, collection_id) FROM stdin;
\.


--
-- Data for Name: product_imagedata; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_imagedata (id, image, ppoi, height, name, width, sort_order) FROM stdin;
1	medias/thaihuan.jpg	0.5x0.5	\N	Thai Huan	\N	0
31	medias/flower1_RIKq344.jpg	0.5x0.5	\N	flower1.jpg	\N	1
32	medias/wolf1_UTqpgdZ.jpg	0.39x0.71	\N	Dog	\N	2
\.


--
-- Data for Name: product_product; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_product (id, name, description, price, available_on, updated_at, product_type_id, attributes, is_published, category_id, seo_description, seo_title, charge_taxes, tax_rate) FROM stdin;
1	Dickerson-Sherman	Quite yard human report. Among bank research church nation.\n\nLight evidence indeed choice possible answer. Run they age couple final we stop.\n\nConcern suffer able plant. Car much move guess put step sea. Floor talk speak fall beyond image. Possible figure anything student anyone.\n\nSchool paper current someone sport. After very believe.\n\nStory challenge if cup situation anyone shoulder. Age note discussion challenge order series. News event speak give gun fund gas.	11.90	\N	2018-08-23 22:41:41.807884+07	1	"1"=>"1", "2"=>"5", "3"=>"6"	t	1	Quite yard human report. Among bank research church nation.	\N	t	standard
2	Vincent LLC	Know whose media kid middle five.\n\nThird myself trade enjoy poor. Paper tell able raise.\n\nKind become include ago me return action. West audience our. Wide significant foot east already chance accept. Thus sure he.\n\nAlthough it quickly page fall there. Language western exactly save ten ground college.\n\nFinally view movement where staff his quite. Chance lawyer green pass play.	82.45	\N	2018-08-23 22:41:42.143147+07	1	"1"=>"1", "2"=>"5", "3"=>"6"	t	1	Know whose media kid middle five.	\N	t	standard
3	Howell-Russell	National choice course campaign. Everything individual both social middle.\n\nBook season support next. Role team toward small voice. Per authority fire sell south.\n\nMrs citizen decide add us. Although inside sure serve base laugh. Spring he finally east.\n\nBelieve miss south. Mouth meet international. Policy kid have ready picture.\n\nBar of leader moment put military. Yeah record against. Sign beyond paper return.	74.21	\N	2018-08-23 22:41:42.570972+07	1	"1"=>"2", "2"=>"4", "3"=>"6"	t	1	National choice course campaign. Everything individual both social middle.	\N	t	standard
4	Rogers PLC	Begin general age law. Expect baby glass box provide. Well rate student model south.\n\nState population game wonder simply town view. White politics find great. Reach full sister actually.\n\nFill from stand. Left probably live school long travel.\n\nThen where let ability want strong picture. Success father activity build choose.\n\nBehind visit between ago. Probably foot spend reduce light body several. Affect dog accept specific that approach head. Yet third trial either.	11.88	\N	2018-08-23 22:41:42.963297+07	1	"1"=>"1", "2"=>"3", "3"=>"6"	t	1	Begin general age law. Expect baby glass box provide. Well rate student model south.	\N	t	standard
5	Murray Ltd	Mother action ahead man. Today often executive approach hundred.\n\nOwn how picture strategy left. Cup star nor.\n\nAdd follow I together main almost. Sell Republican wall most somebody individual both.\n\nSince sound camera. At behind data man recognize while education.\n\nLeg senior have laugh movie book house. Even point their help.	62.45	\N	2018-08-23 22:41:43.398618+07	1	"1"=>"1", "2"=>"4", "3"=>"6"	t	1	Mother action ahead man. Today often executive approach hundred.	\N	t	standard
6	White-Johnson	Than here or stop. Friend size age. Area surface determine sell commercial.\n\nDespite behind will tough him control summer. Box family whose. Describe environment say watch finish hold action western.\n\nStay green section cold much magazine whatever. Police over mouth direction. Enough class benefit chair.\n\nPower west imagine care. Center market wait yourself where speak collection. Job itself rich.\n\nAttack until worker walk. All pay rich near.	26.80	\N	2018-08-23 22:41:43.724349+07	1	"1"=>"1", "2"=>"4", "3"=>"6"	t	1	Than here or stop. Friend size age. Area surface determine sell commercial.	\N	t	standard
7	Maxwell-Camacho	Wind case seat key his wish. Hundred traditional member some area five magazine. Your she hit main first.\n\nSort president level focus certain example.\n\nReflect general thought.\n\nLate discuss until piece your. National message foreign explain whatever oil. Picture popular represent pattern similar along option.\n\nOften water study fine administration one. Task myself benefit then investment.	46.42	\N	2018-08-23 22:41:44.06556+07	1	"1"=>"1", "2"=>"5", "3"=>"6"	t	1	Wind case seat key his wish. Hundred traditional member some area five magazine. Your she hit main first.	\N	t	standard
8	Ramirez, Pena and Morgan	Night true half message rather. Interview table necessary general.\n\nImage bring national. Myself let top decision break. Would purpose instead trouble. Different cause up policy require while.\n\nReally ready risk also environment attorney behavior. Drive because pick surface control voice. Federal our left whole.\n\nImagine short accept beat religious. Spring should benefit or society. Too local social hospital deep. Rather commercial above reflect democratic.\n\nArgue list involve bank find enter test. Decision prepare spend brother business because. Open win sometimes represent dark nice prevent.	66.87	\N	2018-08-23 22:41:44.619614+07	1	"1"=>"1", "2"=>"5", "3"=>"6"	t	1	Night true half message rather. Interview table necessary general.	\N	t	standard
9	Marshall-Harper	First organization shoulder though. Degree hard third pressure.\n\nReal hand fly structure. Hair new final condition issue soldier. Build mother investment more product. Everything build music.\n\nInterview they property foot national positive occur. Visit local religious strong. Accept offer focus order staff.\n\nStar huge consider on item paper rest clearly. Explain shoulder name Congress against back.\n\nSituation less beyond season argue game read. Son fish clearly simply not down. Help gas common chance.	31.90	\N	2018-08-23 22:41:45.045978+07	1	"1"=>"1", "2"=>"5", "3"=>"6"	t	1	First organization shoulder though. Degree hard third pressure.	\N	t	standard
10	Smith-Williams	But population respond sit prepare whole nearly key. Information drug green all second.\n\nTrial structure public cause chance than cup. Tree exist away oil machine investment.\n\nAffect democratic describe difference analysis finally many save. Sport role produce community deal continue travel.\n\nSingle charge create painting. Old out education close give suddenly.\n\nEven product great education read pass consider. Stand subject area whatever. Already force speak ability least civil air. Quickly our believe you share challenge.	42.46	\N	2018-08-23 22:41:45.43302+07	1	"1"=>"1", "2"=>"3", "3"=>"6"	t	1	But population respond sit prepare whole nearly key. Information drug green all second.	\N	t	standard
11	Thompson-Hale	List manage nor. Wrong bank large response task social. Subject add report determine result Mr.\n\nSport reality return green pay thing deep. Student girl themselves.\n\nMission quality reduce right national. Exactly relate possible technology art from speech. Watch surface performance organization according energy.\n\nCommunity some sound with room civil team.\n\nDescribe answer cell main three light. Boy trade finally sometimes.	40.96	\N	2018-08-23 22:41:45.885982+07	2	"3"=>"6"	t	2	List manage nor. Wrong bank large response task social. Subject add report determine result Mr.	\N	t	standard
12	Charles, Alvarez and Oneill	Degree ten plan begin open south piece. Matter sea mission deal while we my buy.\n\nIncluding sister power front success tax they. Open thought actually over pass actually officer.\n\nIdea necessary list. Leave trial discussion use cultural quality walk. Hundred himself offer event. Campaign make situation eat.\n\nSister simple recent consumer. Hour happen similar difficult.\n\nRequire particular include seven check. Truth moment scene threat information point send.	85.76	\N	2018-08-23 22:41:45.977131+07	2	"3"=>"6"	t	2	Degree ten plan begin open south piece. Matter sea mission deal while we my buy.	\N	t	standard
13	Smith Group	Major decision stand school while quality these major. Event country dark address young television. Me everything enough lay rise.\n\nDecade understand manager.\n\nBoy do protect treatment. Ten dog until land key shoulder. Degree executive but western often back speech.\n\nMoney cause police son. Fish decision minute measure way.\n\nRule control control model attack dinner no. Marriage item ever away high professor.	92.68	\N	2018-08-23 22:41:46.02704+07	2	"3"=>"6"	t	2	Major decision stand school while quality these major. Event country dark address young television. Me everything enough lay rise.	\N	t	standard
14	Cox, Moreno and Brown	Car see policy short sport than family professor. Study question wide spring move billion.\n\nWindow growth specific song nice. Happen pay quite toward gas arm.\n\nGoal design soon available ahead affect give finally. Perform knowledge idea over husband. Should suggest TV street race I should.\n\nDiscover contain sea wear. Use program so use. Piece join paper soon end office.\n\nReduce finish carry value up she their. Describe add heart. Quite remember where continue probably.	75.19	\N	2018-08-23 22:41:46.088715+07	2	"3"=>"6"	t	2	Car see policy short sport than family professor. Study question wide spring move billion.	\N	t	standard
15	Campbell, Quinn and Barnett	Wide partner power. Wonder film occur sometimes. Break huge less piece.\n\nProcess likely federal difference. Involve sister house your.\n\nLocal foreign since brother so player. Religious ago none election record team score order.\n\nOfficial miss agree. Better your and. Police unit live not Congress recent music.\n\nIt wrong enjoy team say.	38.87	\N	2018-08-23 22:41:46.137252+07	2	"3"=>"6"	t	2	Wide partner power. Wonder film occur sometimes. Break huge less piece.	\N	t	standard
16	Carter, Mercer and Bowman	Civil with cultural book. Woman account magazine stay size friend single.\n\nStrong event institution summer better deep. Score run money plan brother production season certain.\n\nIn federal gun across ago. As air turn time.\n\nFirm production herself candidate hotel enter little. Tree no remember item partner throw finally. My several live its response sure.\n\nKnow staff American may. North probably officer night.	13.76	\N	2018-08-23 22:41:46.171706+07	2	"3"=>"6"	t	2	Civil with cultural book. Woman account magazine stay size friend single.	\N	t	standard
17	Stevens-Harris	On wind evidence family school through son. Suggest difficult spend training. Popular second figure recognize force away mind involve.\n\nBelieve season animal minute executive condition call. Increase another owner face around beat speech.\n\nRepresent present better face. Measure ok cell gas.\n\nGarden happy answer forget executive value. Instead political focus total operation check share realize. Continue there wife where baby since during.\n\nLet dog any design would on. Maintain so author debate. Level newspaper your morning western.	13.30	\N	2018-08-23 22:41:46.242998+07	2	"3"=>"6"	t	2	On wind evidence family school through son. Suggest difficult spend training. Popular second figure recognize force away mind involve.	\N	t	standard
18	Mcclure Ltd	Compare anyone leave officer land behind. Dark accept choice head. Voice find particular property mother region.\n\nPick represent economic enjoy a member. Represent difficult owner house.\n\nNor trial bit wish best door. Huge indicate forget thousand their manager senior environmental. Become buy room against small.\n\nBy safe respond discuss drive. Lawyer plan Mrs growth read exist happy red.\n\nWhatever good why sometimes power network sing. Government way walk show meeting. Kitchen but employee will energy in brother.	51.75	\N	2018-08-23 22:41:46.353182+07	2	"3"=>"6"	t	2	Compare anyone leave officer land behind. Dark accept choice head. Voice find particular property mother region.	\N	t	standard
19	Christensen, Davila and Kelley	Run address inside might audience great be bit.\n\nJoin pressure point she act white. Would take ability bed. Main few reach relate end last.\n\nItem chair theory hospital thank agree. Beat account man president return.\n\nAcross station year sister leave. Never effect newspaper understand teach range laugh since. Trial mind language identify set debate himself.\n\nRegion player manager around garden hotel. She respond owner. Level really center head.	60.00	\N	2018-08-23 22:41:46.422862+07	2	"3"=>"6"	t	2	Run address inside might audience great be bit.	\N	t	standard
20	Cruz PLC	Consumer member true explain decision note. Follow very church evening box.\n\nAgency join gas popular whole million threat. Edge alone well cut. Assume key add ready million hot southern mention.\n\nCost fund seat table push toward purpose. Half few article large that.\n\nAs place this environmental phone kid. Agreement trip once score while. Education beyond cultural four who.\n\nThree between last whether site economy trouble. Around everybody order specific.	61.34	\N	2018-08-23 22:41:46.501499+07	2	"3"=>"6"	t	2	Consumer member true explain decision note. Follow very church evening box.	\N	t	standard
21	Middleton-Hawkins	Throughout man talk improve yard. Close perhaps investment able partner serve while. Likely born particularly five watch prepare child.\n\nHe cost year else amount form inside. Station involve most bill. Under figure theory me successful help system.\n\nFact others apply buy project. Later even news page water provide talk themselves. Single parent could offer offer wrong respond.\n\nHappy well sell natural specific they prevent matter. Early everything war security thing. Total there account including matter toward fast. Break reach student total even.\n\nMean even in. Center assume senior article.	11.23	\N	2018-08-23 22:41:46.621925+07	3	"3"=>"6", "5"=>"13"	t	4	Throughout man talk improve yard. Close perhaps investment able partner serve while. Likely born particularly five watch prepare child.	\N	t	standard
22	Rangel and Sons	Set usually no situation resource already. Stop hour age student really west. Yet big themselves mother heart sign region situation.\n\nFeel city deal wait what. Big four discover option decade find choice.\n\nGlass onto parent medical phone anything forget ball. Wall you candidate part at happen floor.\n\nSoon personal bed nothing care town. Level economy reason own never.\n\nSimply out structure. Avoid election space pass. No where past sense.	81.36	\N	2018-08-23 22:41:46.862202+07	3	"3"=>"6", "5"=>"13"	t	4	Set usually no situation resource already. Stop hour age student really west. Yet big themselves mother heart sign region situation.	\N	t	standard
23	Singleton Inc	Source prevent indicate hope call security point. Hospital trip century knowledge vote forget reduce.\n\nStart mind trouble move.\n\nProfessional list ball improve start think. Part tonight idea whole coach issue do.\n\nSit watch him authority part fly. Per southern east still. Nothing police suddenly prevent.\n\nNo other administration loss how again. Special production exactly run seem.	36.17	\N	2018-08-23 22:41:47.239508+07	3	"3"=>"6", "5"=>"14"	t	4	Source prevent indicate hope call security point. Hospital trip century knowledge vote forget reduce.	\N	t	standard
24	Richards, Cooley and Leonard	Apply fall he debate others offer common. Huge rise program in consider top.\n\nMethod house one from list act. Phone low consider professional black top.\n\nReflect behavior past blood. Church able mother institution continue pass good visit. Green page beat direction yeah now.\n\nDescribe while would certain compare trip. Give deal treat seven truth off.\n\nEdge suddenly home call option court. Property world decade. Relate wait sport seem tell.	38.36	\N	2018-08-23 22:41:47.536384+07	3	"3"=>"6", "5"=>"14"	t	4	Apply fall he debate others offer common. Huge rise program in consider top.	\N	t	standard
25	Koch, Barnes and Miller	Citizen discuss fight professional source hand since. Base better TV send I start probably picture. Movement lose food course source.\n\nHuman war improve project across. Low save experience charge. Hot wish word service.\n\nOrder arrive major. Yet blood learn eight. Current information entire character good capital. Wish throw task many economic garden deal and.\n\nTake eye impact arm. After those for take just authority play.\n\nVarious budget support fire medical.	7.39	\N	2018-08-23 22:41:47.73158+07	3	"3"=>"6", "5"=>"13"	t	4	Citizen discuss fight professional source hand since. Base better TV send I start probably picture. Movement lose food course source.	\N	t	standard
26	Freeman-Burgess	Marriage meet along action owner. For feeling Congress candidate tonight let almost class. Item leave note thank wind population section game.\n\nLaw another society sound foreign government letter conference. Far if open yourself.\n\nGun answer husband young staff throughout notice. Magazine whole for million popular possible. Heavy how eat argue before. Land individual citizen resource the station item reveal.\n\nCultural because new couple wonder. Father professor by hard property reason enter. Federal medical perform relate.\n\nDo system above wife we along. Attention meeting blood term picture meet experience. Time method whole couple vote light both.	44.60	\N	2018-08-23 22:41:47.906642+07	3	"3"=>"6", "5"=>"13"	t	4	Marriage meet along action owner. For feeling Congress candidate tonight let almost class. Item leave note thank wind population section game.	\N	t	standard
27	Yang, Day and Mueller	Beautiful effect public. No treatment decision side break help large. Daughter million now.\n\nReport every capital campaign level instead. Rich though drug money player our piece. Perform model sound environment thought each.\n\nDesign arrive learn yet itself claim. Across sell response buy such. Guess leg song paper. Claim believe both field federal why yet.\n\nStaff value gun approach finish. Visit claim summer total. Work car expect doctor.\n\nPresident range debate allow have public medical. Available money increase PM.	27.43	\N	2018-08-23 22:41:48.085753+07	3	"3"=>"6", "5"=>"13"	t	4	Beautiful effect public. No treatment decision side break help large. Daughter million now.	\N	t	standard
28	Jackson Ltd	Market break hard term. Miss data conference doctor federal arrive join technology. Prevent each grow themselves including my.\n\nExperience far already. Six he without event kitchen later. Direction character almost possible resource week machine. Job visit head someone rate.\n\nGreen actually reach hear add modern. At laugh strong.\n\nBillion kind exactly crime enter. Important travel million keep travel our.\n\nMuch action TV door economy. Mention can we push model others attention.	90.22	\N	2018-08-23 22:41:48.249937+07	3	"3"=>"6", "5"=>"14"	t	4	Market break hard term. Miss data conference doctor federal arrive join technology. Prevent each grow themselves including my.	\N	t	standard
29	Parker, Ray and Reed	Gas hundred choice how program build. Without form ago car. However low five already.\n\nResource generation experience rate appear gun. Whatever they realize order myself cold. Season big thank then nothing allow perhaps service. Sometimes try response per address drug industry.\n\nThank result sort after two learn. Page crime type inside if special grow know.\n\nNorth series yourself professional physical. Example first easy door out stock individual.\n\nHusband message no sort. Practice step skin future.	80.12	\N	2018-08-23 22:41:48.44707+07	3	"3"=>"6", "5"=>"14"	t	4	Gas hundred choice how program build. Without form ago car. However low five already.	\N	t	standard
30	Sanders-Phillips	When institution child on receive value task. Statement represent within both camera claim teach analysis. Real order necessary seven character area.\n\nParticularly leave two prove.\n\nMemory four during mouth dinner lead. Avoid phone program entire. Dark trip other make majority speak treatment concern.\n\nBut provide that election fall. Whether pay interesting cup above.\n\nOther into try participant week place security. Blood need focus test health hold nature.	39.90	\N	2018-08-23 22:41:48.590802+07	3	"3"=>"6", "5"=>"14"	t	4	When institution child on receive value task. Statement represent within both camera claim teach analysis. Real order necessary seven character area.	\N	t	standard
31	Miller-Harvey	Right only enjoy subject everyone suggest. Shake people ability national ever listen. High per race. Democrat popular sound foot medical hear side.\n\nCard impact best try. Leader become information wall type sing. Entire whether officer.\n\nFour eight write choice ahead figure property. Him serve college history nation power travel. Address building talk citizen.\n\nHe range challenge month fact create. Never there computer cost air turn.\n\nActually case than. Finish be dinner shake enough source.	90.96	\N	2018-08-23 22:41:48.807445+07	4	"3"=>"6", "7"=>"20"	t	5	Right only enjoy subject everyone suggest. Shake people ability national ever listen. High per race. Democrat popular sound foot medical hear side.	\N	t	standard
32	Long Ltd	Firm successful tell most art. Pretty yeah spring industry say strong final blue. Fill edge attorney actually until yeah pick series.\n\nSoldier dark put free describe general. Action somebody remember accept garden. Ahead there police when chair.\n\nOk wonder very. Head skill individual.\n\nArm before great language increase firm. Begin surface cell scientist professor. Report this trial news dinner check.\n\nGrowth picture important suggest PM.	32.15	\N	2018-08-23 22:41:48.96721+07	4	"3"=>"6", "7"=>"19"	t	5	Firm successful tell most art. Pretty yeah spring industry say strong final blue. Fill edge attorney actually until yeah pick series.	\N	t	standard
33	Wells, Payne and Thornton	Important read claim stage hold per child.\n\nCar collection know strong. Series around establish game. Again cell walk generation among five have.\n\nPolice guess soon safe detail know. Exactly subject not big. Night ahead possible various street.\n\nRace gun remain. Away itself and past director stock end.\n\nDinner get whether rich. Until national town control court someone. Deal reduce raise president drive a strong.	87.10	\N	2018-08-23 22:41:49.120016+07	4	"3"=>"6", "7"=>"20"	t	5	Important read claim stage hold per child.	\N	t	standard
34	Aguilar, Miller and Garrison	Service particularly pay establish individual be themselves. Decision cultural as stay would. Serve leave west raise which. Specific there father fast down.\n\nAt teacher as production. Church ask interview animal difference.\n\nYes for nature note today company. Understand another sell traditional.\n\nEnough southern radio memory. Debate positive miss let scientist middle pull. Where mission what bed.\n\nCarry marriage than join course answer. Protect spring wait big focus ask through also.	53.32	\N	2018-08-23 22:41:49.246613+07	4	"3"=>"6", "7"=>"20"	t	5	Service particularly pay establish individual be themselves. Decision cultural as stay would. Serve leave west raise which. Specific there father fast down.	\N	t	standard
35	Miller and Sons	Name hand several. Various ahead tell forget after camera. Institution risk voice marriage read law.\n\nBetween matter sound treatment practice. Office money have job recognize often. Service recent four product election plan.\n\nReturn teacher when already. Grow share former course enough arm discussion.\n\nUpon within foreign theory statement record if. Grow Mrs economy professional.\n\nBrother measure age. Society research happy protect exactly.	42.53	\N	2018-08-23 22:41:49.360181+07	4	"3"=>"6", "7"=>"19"	t	5	Name hand several. Various ahead tell forget after camera. Institution risk voice marriage read law.	\N	t	standard
36	Little-Vazquez	Agent describe easy wish. Information attention eight life.\n\nReality during whether growth current. Agree pressure officer possible whether. Soon campaign city matter two stuff exactly list.\n\nPersonal clearly thank small. Chance traditional including staff mention name enter myself. Woman expect pressure chair.\n\nSame support my class college talk.\n\nTable read oil over shoulder.	68.82	\N	2018-08-23 22:41:49.489367+07	4	"3"=>"6", "7"=>"20"	t	5	Agent describe easy wish. Information attention eight life.	\N	t	standard
37	Maldonado-Daniels	Tv upon involve seem model shoulder possible. Through fast cold prevent financial. Per whole kid arrive answer.\n\nCould assume there another this trial.\n\nParticularly find feeling build save even. Professor community alone direction still. Candidate teacher still.\n\nRequire book remember model free theory most. Recently become such paper glass ready. Easy central drug like question.\n\nMoney although president official traditional voice produce. Tv region campaign stage.	15.42	\N	2018-08-23 22:41:49.705985+07	4	"3"=>"6", "7"=>"19"	t	5	Tv upon involve seem model shoulder possible. Through fast cold prevent financial. Per whole kid arrive answer.	\N	t	standard
38	Williams Ltd	Task concern white very point term process. Argue particularly service page less let. Who wonder most size mother although.\n\nPast indeed lead them. Friend phone you claim language improve. Great check student far produce.\n\nPick beyond area determine us commercial. Trade agreement court card nation.\n\nAir different land out arrive hand like. Modern machine notice determine this particularly.\n\nBy which take skill. Age fear significant know wear over begin week.	96.32	\N	2018-08-23 22:41:49.879767+07	4	"3"=>"6", "7"=>"20"	t	5	Task concern white very point term process. Argue particularly service page less let. Who wonder most size mother although.	\N	t	standard
39	Conley Group	Deep Mrs development continue never more. Lot reduce maintain real decide key national. Son choice range however list concern.\n\nTough example north one smile. With four firm important response my hour. Since common girl leg wind early specific. Themselves prevent form either happen but expect.\n\nBack nice many black. Listen actually foreign pull old break.\n\nChoose public town small take sit. Authority billion watch. Gun staff child run fish.\n\nPerson data east interesting. Shake important it pull rich let hour. Positive take before lose let customer.	71.30	\N	2018-08-23 22:41:49.966169+07	4	"3"=>"6", "7"=>"19"	t	5	Deep Mrs development continue never more. Lot reduce maintain real decide key national. Son choice range however list concern.	\N	t	standard
40	Sloan, Clark and Benjamin	School above impact trouble oil alone edge. This force or force myself after certain. Character story ten lot article.\n\nThe push truth. Today might commercial glass best hotel. Throughout international into radio.\n\nSure challenge more fall apply still trial.\n\nTv process memory usually forget way. Involve coach shoulder finish firm skin size. Culture evidence morning maybe whom pressure.\n\nReturn focus remember account also person happy.	26.33	\N	2018-08-23 22:41:50.067244+07	4	"3"=>"6", "7"=>"19"	t	5	School above impact trouble oil alone edge. This force or force myself after certain. Character story ten lot article.	\N	t	standard
52	Johnson, Rodriguez and Chung	Major hard seven. One member month my there. Speech military fast.\n\nPeople great film age safe.\n\nStaff deep TV wall nation president capital every. Picture reality three various feeling. Down American social seat.\n\nDeal source attorney.\n\nLaugh activity consumer forget. Property enjoy create thing.	69.20	\N	2018-08-23 22:41:50.756912+07	6	"9"=>"25", "10"=>"27", "11"=>"28"	t	6	Major hard seven. One member month my there. Speech military fast.	\N	t	standard
41	Davis-Jimenez	Yourself seek someone news card. With participant nothing decade. Receive simple mission.\n\nJob fact property see force war movie suddenly. Agree others seven soon. Business economic amount fear.\n\nForward over number financial this impact building. Become town focus campaign once.\n\nHer yeah sell. Be their age own alone represent pick. Meeting newspaper eat shoulder collection five.\n\nOften hold know white should receive support. Product finish side threat only instead generation hear. Series able TV letter form recognize.	69.49	\N	2018-08-23 22:41:50.161934+07	5	"9"=>"24", "10"=>"27", "11"=>"29"	t	6	Yourself seek someone news card. With participant nothing decade. Receive simple mission.	\N	t	standard
42	Webb, Stanley and Jones	Sort nature someone. Fund card answer.\n\nSuddenly Democrat plant voice. Institution step avoid around building.\n\nPretty them company real through eight. North until parent administration coach. Benefit author truth painting public ready.\n\nTeacher foreign behavior tough teach. Police put street side prevent attention evidence. Major near trial relate day effort.\n\nEver to threat left without. Enough the fast suddenly cold.	19.29	\N	2018-08-23 22:41:50.211685+07	5	"9"=>"24", "10"=>"26", "11"=>"29"	t	6	Sort nature someone. Fund card answer.	\N	t	standard
43	Mitchell Ltd	Century reflect society our while impact eat. Range attack player American. Film reach include ball assume country federal.\n\nStock either be interesting difficult south. Player finally store range no.\n\nWhy Democrat animal live yourself newspaper. Happy size set Republican significant ball. Class media head entire cell several.\n\nParent last television. Show plant itself easy its. State successful because summer necessary parent.\n\nWith today front. Recent recognize near body present. Form size either deal certainly audience decide.	46.14	\N	2018-08-23 22:41:50.260031+07	5	"9"=>"24", "10"=>"26", "11"=>"28"	t	6	Century reflect society our while impact eat. Range attack player American. Film reach include ball assume country federal.	\N	t	standard
44	Doyle-Powell	Name place sort my meeting room. Feel hundred history stuff attack choose east. Campaign most be art late another.\n\nMiss television least attorney own. Cost discuss evidence free hand production central. Less check wall defense see officer soon. Add site action month character.\n\nCompany significant billion month cup official thank. Let prepare raise. Table page catch see detail chance.\n\nTravel show child yourself group. Discover bag provide war true deal. See address financial ahead. Seat much bag boy will Democrat similar perform.\n\nBlue pay easy effort your.	10.49	\N	2018-08-23 22:41:50.297391+07	5	"9"=>"25", "10"=>"26", "11"=>"29"	t	6	Name place sort my meeting room. Feel hundred history stuff attack choose east. Campaign most be art late another.	\N	t	standard
45	Bailey Inc	Owner officer machine now stand into read. Probably western good we Democrat this rule. Show him serious mouth key.\n\nLook check police easy energy three. Speech long page across final before wonder. Several new sort add.\n\nSide happen drop measure. Suffer too compare way will. Style maybe tonight fact anything budget full.\n\nRoom make can any almost those. Doctor area event step house huge. Than if all effort sister into.\n\nToday can whose position surface. More resource sing build alone ok draw country.	51.81	\N	2018-08-23 22:41:50.333647+07	5	"9"=>"24", "10"=>"26", "11"=>"29"	t	6	Owner officer machine now stand into read. Probably western good we Democrat this rule. Show him serious mouth key.	\N	t	standard
46	Salas-Carter	Four improve more. Speech conference someone close probably. Entire section assume worker bring television before.\n\nConcern research toward almost heavy executive product. Agreement increase not method. Under store gas growth play huge international.\n\nOld up voice away stay effect arm area. Cup line story ahead time magazine sort free. Attorney resource heavy information keep across strategy.\n\nPage number plant network tell camera debate of. Remember heart no enough artist yes threat send.\n\nGarden of be forget large. Phone address sit huge environment expert.	72.34	\N	2018-08-23 22:41:50.40397+07	5	"9"=>"25", "10"=>"26", "11"=>"28"	t	6	Four improve more. Speech conference someone close probably. Entire section assume worker bring television before.	\N	t	standard
47	Lee PLC	Event college hundred soon. Of talk arrive smile happen doctor. Charge rather hand report.\n\nCampaign set standard claim mention medical Democrat. Must first imagine television. Trip than marriage product according.\n\nSomebody high determine ok character. Box factor investment baby. Source know road.\n\nFeeling all during investment write hotel direction.\n\nBecome company institution subject chair cell result. Voice culture whether class.	96.42	\N	2018-08-23 22:41:50.464868+07	5	"9"=>"24", "10"=>"26", "11"=>"29"	t	6	Event college hundred soon. Of talk arrive smile happen doctor. Charge rather hand report.	\N	t	standard
48	Valdez-Barton	Surface maintain reduce reason term there hotel.\n\nInterest each would fine would often put how. Evidence it short food contain then agreement. Prevent create despite.\n\nFund result style field religious country. Crime these rise them hit Mr song worker. Wear them lay international.\n\nSister over arrive society seek. Case project sell whose. Down coach style piece reality end.\n\nProtect sing rate clearly national feeling. Wall throw account capital.	73.98	\N	2018-08-23 22:41:50.525728+07	5	"9"=>"25", "10"=>"26", "11"=>"29"	t	6	Surface maintain reduce reason term there hotel.	\N	t	standard
49	Peters Group	Possible boy blood morning expect occur door. Matter black eight I seat specific.\n\nRest its series than look edge reality.\n\nProve ability performance. Bring thank describe blue part support maybe give. Their section box go.\n\nMethod third very share grow two office. Visit body though result memory girl clearly around. Poor week industry.\n\nSell might one. Mission night all senior term site.	54.23	\N	2018-08-23 22:41:50.572236+07	5	"9"=>"24", "10"=>"27", "11"=>"29"	t	6	Possible boy blood morning expect occur door. Matter black eight I seat specific.	\N	t	standard
50	Fischer Group	Cut generation international market film assume form. Check just cost environment teacher.\n\nParticipant interesting tough shake get agency season. Wonder different dog air appear you safe. Political ok room base evidence meeting.\n\nForeign ever finish very can them. Ground detail discussion for evidence stuff. People course west meet center water happy probably.\n\nOther power world fine career mind bring. Meet but should official.\n\nSeason significant dog no story treat. Right car wind contain. Much base TV read performance suddenly financial. Number mean front Congress lay.	18.73	\N	2018-08-23 22:41:50.629997+07	5	"9"=>"25", "10"=>"27", "11"=>"29"	t	6	Cut generation international market film assume form. Check just cost environment teacher.	\N	t	standard
51	Martin, Love and Johnston	During resource team news billion.\n\nControl bed list whatever detail consider. Entire artist deep lay. Brother customer group entire find car action.\n\nBecome drop than field short poor physical finish. Simply team vote approach practice pressure husband.\n\nBoard whatever improve trip. Son short music identify economy. Score amount avoid head firm middle son around.\n\nWhat perform really whom. Among since public several. Sport begin under might whatever.	34.47	\N	2018-08-23 22:41:50.693474+07	6	"9"=>"24", "10"=>"26", "11"=>"29"	t	6	During resource team news billion.	\N	t	standard
53	Allen, Nichols and Perez	Heavy speak guy.\n\nDrive lose wait. East language without scientist society note pattern reality. Large always throughout natural other. Present green letter him price.\n\nHimself effect win case according. South laugh likely.\n\nCard wind camera. Other item second off. House education state drug main.\n\nTalk able set feeling. Agency threat center ability order bed second.	5.22	\N	2018-08-23 22:41:50.861462+07	6	"9"=>"24", "10"=>"27", "11"=>"29"	t	6	Heavy speak guy.	\N	t	standard
54	Green, Berry and Moore	Short glass recently trade quality. Computer value finish else audience base finally.\n\nJob follow option environment kid. Somebody find nice card different world.\n\nMight forward PM or. Read some member bank.\n\nPm believe he name line much former. Speech chair test key. Lot care open society produce similar catch on.\n\nNorth send certain sometimes sea responsibility. Travel heart situation focus strategy arm citizen must. Discuss federal talk relationship sense kind scene.	45.76	\N	2018-08-23 22:41:50.934786+07	6	"9"=>"24", "10"=>"26", "11"=>"29"	t	6	Short glass recently trade quality. Computer value finish else audience base finally.	\N	t	standard
55	Green Ltd	Media teach store.\n\nDeal war free leave economy. People project night certainly.\n\nClearly detail decade concern. Quality black media consumer all adult share.\n\nYear down able affect. Ball lead through. Writer performance away improve our action west.\n\nThen hotel page. Catch society become then reach according.	92.89	\N	2018-08-23 22:41:51.029665+07	6	"9"=>"24", "10"=>"26", "11"=>"29"	t	6	Media teach store.	\N	t	standard
56	Edwards Ltd	Cold after make discussion suffer style. Place door cut prevent raise whole.\n\nEdge whom street model commercial social. Use above discussion throw yard positive finish blue. Man case traditional hand scientist air black what.\n\nStrong father fast site foreign budget watch. Baby news modern system light. East issue say together.\n\nUs fear in partner worry glass. Deep deal continue direction boy.\n\nNews woman thank take program politics study. Pay far station race city.	57.60	\N	2018-08-23 22:41:51.121756+07	6	"9"=>"24", "10"=>"27", "11"=>"28"	t	6	Cold after make discussion suffer style. Place door cut prevent raise whole.	\N	t	standard
57	Cisneros, Fuentes and Anderson	Back especially choose phone despite someone woman end.\n\nBuild middle agree beyond religious. Traditional prepare card human current. Law become say moment.\n\nExactly even ok child simply project. Federal age son address in drive. Unit miss budget age stuff.\n\nVote deep weight reduce how nothing send. Those newspaper great thing road fund choice chair.\n\nThreat car prevent. When care tough.	38.82	\N	2018-08-23 22:41:51.192864+07	6	"9"=>"24", "10"=>"26", "11"=>"29"	t	6	Back especially choose phone despite someone woman end.	\N	t	standard
58	Leon Inc	Write type ready.\n\nStuff husband physical indeed about foreign. Southern garden understand affect less catch public.\n\nProve hospital his notice. Effect produce old soldier eye director.\n\nEvent discussion whom hour detail improve. World pull maintain population thousand local from less. Likely give son somebody few.\n\nOther across owner special nothing friend anyone above. Possible especially heart huge assume. Condition traditional through natural hospital positive course.	63.25	\N	2018-08-23 22:41:51.272013+07	6	"9"=>"25", "10"=>"26", "11"=>"28"	t	6	Write type ready.	\N	t	standard
59	Morris, Fisher and Campos	By commercial over school responsibility include partner. Board program already amount who none.\n\nCause garden standard. Add fight these throw road room.\n\nTrip return democratic economy. Drug sing big Republican. Writer property between hot they party for. Stage area drop hour person positive rock public.\n\nStudy suddenly entire land most. Young staff let others owner race back.\n\nModern often minute final audience indeed else. Several reason leader.	27.80	\N	2018-08-23 22:41:51.384096+07	6	"9"=>"25", "10"=>"27", "11"=>"28"	t	6	By commercial over school responsibility include partner. Board program already amount who none.	\N	t	standard
60	Morrison-Martin	Response college more officer play sea. Somebody almost rich type ahead common.\n\nHow study fire stand name rock huge. Window result my necessary.\n\nThought record green note pressure threat really. Without pattern heart direction.\n\nQuestion work morning quickly. Whether growth lay attack election case.\n\nEveryone college big else cup strategy region. Alone now happen special letter. Something bed election talk.	77.95	\N	2018-08-23 22:41:51.475704+07	6	"9"=>"24", "10"=>"26", "11"=>"28"	t	6	Response college more officer play sea. Somebody almost rich type ahead common.	\N	t	standard
\.


--
-- Data for Name: product_productattribute; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_productattribute (id, slug, name) FROM stdin;
1	color	Color
2	collar	Collar
3	brand	Brand
4	size	Size
5	coffee-genre	Coffee Genre
6	box-size	Box Size
7	flavor	Flavor
8	candy-box-size	Candy Box Size
9	author	Author
10	publisher	Publisher
11	language	Language
12	cover	Cover
\.


--
-- Data for Name: product_productattributetranslation; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_productattributetranslation (id, language_code, name, product_attribute_id) FROM stdin;
\.


--
-- Data for Name: product_productimage; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_productimage (id, image_id, alt, sort_order, product_id) FROM stdin;
15	1		100	34
16	32		100	34
\.


--
-- Data for Name: product_producttranslation; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_producttranslation (id, seo_title, seo_description, language_code, name, description, product_id) FROM stdin;
\.


--
-- Data for Name: product_producttype; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_producttype (id, name, has_variants, is_shipping_required, tax_rate) FROM stdin;
1	T-Shirt	t	t	standard
2	Mugs	t	t	standard
3	Coffee	t	t	standard
4	Candy	t	t	standard
5	E-books	t	f	standard
6	Books	t	t	standard
\.


--
-- Data for Name: product_producttype_product_attributes; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_producttype_product_attributes (id, producttype_id, productattribute_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	2	3
5	3	3
6	3	5
7	4	3
8	4	7
9	5	9
10	5	10
11	5	11
12	6	9
13	6	10
14	6	11
\.


--
-- Data for Name: product_producttype_variant_attributes; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_producttype_variant_attributes (id, producttype_id, productattribute_id) FROM stdin;
1	1	4
2	3	6
3	4	8
4	6	12
\.


--
-- Data for Name: product_productvariant; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_productvariant (id, sku, name, price_override, product_id, attributes, cost_price, quantity, quantity_allocated, track_inventory, product_template) FROM stdin;
1	1-1337	XS	\N	1	"4"=>"7"	9.52	29	44	t	{}
2	1-1338	S	\N	1	"4"=>"8"	4.40	36	18	t	{}
3	1-1339	M	\N	1	"4"=>"9"	10.47	2	6	t	{}
4	1-1340	L	\N	1	"4"=>"10"	1.78	22	33	t	{}
5	1-1341	XL	\N	1	"4"=>"11"	11.66	19	25	t	{}
6	1-1342	XXL	\N	1	"4"=>"12"	2.14	10	41	t	{}
7	2-1337	XS	\N	2	"4"=>"7"	81.63	23	15	t	{}
8	2-1338	S	\N	2	"4"=>"8"	10.72	17	2	t	{}
9	2-1339	M	\N	2	"4"=>"9"	56.89	35	49	t	{}
10	2-1340	L	\N	2	"4"=>"10"	53.59	14	20	t	{}
11	2-1341	XL	\N	2	"4"=>"11"	65.96	32	3	t	{}
12	2-1342	XXL	\N	2	"4"=>"12"	21.44	25	13	t	{}
13	3-1337	XS	\N	3	"4"=>"7"	50.46	6	8	t	{}
14	3-1338	S	\N	3	"4"=>"8"	60.85	29	22	t	{}
15	3-1339	M	\N	3	"4"=>"9"	71.24	13	2	t	{}
16	3-1340	L	\N	3	"4"=>"10"	11.13	31	38	t	{}
17	3-1341	XL	\N	3	"4"=>"11"	22.26	29	16	t	{}
19	4-1337	XS	\N	4	"4"=>"7"	5.58	44	3	t	{}
20	4-1338	S	\N	4	"4"=>"8"	4.87	8	44	t	{}
21	4-1339	M	\N	4	"4"=>"9"	1.19	5	43	t	{}
22	4-1340	L	\N	4	"4"=>"10"	7.48	34	19	t	{}
23	4-1341	XL	\N	4	"4"=>"11"	8.79	3	38	t	{}
25	5-1337	XS	\N	5	"4"=>"7"	54.96	4	5	t	{}
26	5-1338	S	\N	5	"4"=>"8"	38.09	50	48	t	{}
27	5-1339	M	\N	5	"4"=>"9"	16.86	46	5	t	{}
28	5-1340	L	\N	5	"4"=>"10"	14.99	50	13	t	{}
29	5-1341	XL	\N	5	"4"=>"11"	18.73	45	44	t	{}
30	5-1342	XXL	\N	5	"4"=>"12"	31.85	13	29	t	{}
31	6-1337	XS	\N	6	"4"=>"7"	19.83	23	38	t	{}
32	6-1338	S	\N	6	"4"=>"8"	5.36	33	18	t	{}
33	6-1339	M	\N	6	"4"=>"9"	23.05	47	49	t	{}
34	6-1340	L	\N	6	"4"=>"10"	8.31	6	22	t	{}
35	6-1341	XL	\N	6	"4"=>"11"	21.44	4	11	t	{}
37	7-1337	XS	\N	7	"4"=>"7"	37.14	2	33	t	{}
38	7-1338	S	\N	7	"4"=>"8"	19.50	14	1	t	{}
39	7-1339	M	\N	7	"4"=>"9"	42.24	26	44	t	{}
40	7-1340	L	\N	7	"4"=>"10"	15.78	42	7	t	{}
41	7-1341	XL	\N	7	"4"=>"11"	24.14	28	44	t	{}
43	8-1337	XS	\N	8	"4"=>"7"	14.71	29	39	t	{}
44	8-1338	S	\N	8	"4"=>"8"	42.13	13	41	t	{}
45	8-1339	M	\N	8	"4"=>"9"	36.11	50	13	t	{}
46	8-1340	L	\N	8	"4"=>"10"	63.53	16	11	t	{}
47	8-1341	XL	\N	8	"4"=>"11"	63.53	1	23	t	{}
49	9-1337	XS	\N	9	"4"=>"7"	28.07	2	32	t	{}
50	9-1338	S	\N	9	"4"=>"8"	10.21	38	17	t	{}
51	9-1339	M	\N	9	"4"=>"9"	28.07	50	19	t	{}
52	9-1340	L	\N	9	"4"=>"10"	12.12	46	22	t	{}
53	9-1341	XL	\N	9	"4"=>"11"	27.43	5	23	t	{}
54	9-1342	XXL	\N	9	"4"=>"12"	12.44	13	2	t	{}
55	10-1337	XS	\N	10	"4"=>"7"	16.56	23	23	t	{}
56	10-1338	S	\N	10	"4"=>"8"	4.25	24	18	t	{}
57	10-1339	M	\N	10	"4"=>"9"	40.76	7	5	t	{}
58	10-1340	L	\N	10	"4"=>"10"	36.94	17	4	t	{}
59	10-1341	XL	\N	10	"4"=>"11"	14.01	16	24	t	{}
60	10-1342	XXL	\N	10	"4"=>"12"	14.01	40	28	t	{}
61	11-1337		\N	11		8.19	23	4	t	{}
63	13-1337		\N	13		35.22	21	41	t	{}
65	15-1337		\N	15		14.38	5	37	t	{}
67	17-1337		\N	17		7.45	6	44	t	{}
69	19-1337		\N	19		48.60	40	11	t	{}
70	20-1337		\N	20		21.47	45	14	t	{}
71	21-1337	100g	80.23	21	"6"=>"15"	28.08	39	6	t	{}
72	21-1338	250g	76.84	21	"6"=>"16"	43.03	23	27	t	{}
73	21-1339	500g	68.59	21	"6"=>"17"	38.41	13	3	t	{}
74	21-1340	1kg	30.68	21	"6"=>"18"	22.09	1	12	t	{}
75	22-1337	100g	157.88	22	"6"=>"15"	37.89	2	31	t	{}
76	22-1338	250g	151.84	22	"6"=>"16"	50.11	48	9	t	{}
77	22-1339	500g	112.61	22	"6"=>"17"	40.54	24	8	t	{}
79	23-1337	100g	127.29	23	"6"=>"15"	113.29	15	48	t	{}
80	23-1338	250g	126.38	23	"6"=>"16"	63.19	37	42	t	{}
81	23-1339	500g	53.48	23	"6"=>"17"	39.04	1	30	t	{}
83	24-1337	100g	121.59	24	"6"=>"15"	94.84	8	7	t	{}
84	24-1338	250g	117.99	24	"6"=>"16"	93.21	16	19	t	{}
85	24-1339	500g	98.02	24	"6"=>"17"	80.38	42	15	t	{}
86	24-1340	1kg	88.86	24	"6"=>"18"	52.43	33	13	t	{}
87	25-1337	100g	97.59	25	"6"=>"15"	90.76	31	33	t	{}
88	25-1338	250g	95.66	25	"6"=>"16"	22.96	31	14	t	{}
89	25-1339	500g	52.39	25	"6"=>"17"	46.63	43	14	t	{}
90	25-1340	1kg	11.95	25	"6"=>"18"	4.54	35	17	t	{}
91	26-1337	100g	127.03	26	"6"=>"15"	66.06	23	35	t	{}
92	26-1338	250g	126.22	26	"6"=>"16"	23.98	6	11	t	{}
93	26-1339	500g	106.85	26	"6"=>"17"	27.78	42	41	t	{}
95	27-1337	100g	117.99	27	"6"=>"15"	14.16	11	17	t	{}
96	27-1338	250g	104.33	27	"6"=>"16"	47.99	49	25	t	{}
97	27-1339	500g	93.23	27	"6"=>"17"	47.55	8	49	t	{}
98	27-1340	1kg	87.25	27	"6"=>"18"	65.44	43	28	t	{}
99	28-1337	100g	165.37	28	"6"=>"15"	94.26	44	41	t	{}
100	28-1338	250g	120.63	28	"6"=>"16"	117.01	44	27	t	{}
101	28-1339	500g	119.85	28	"6"=>"17"	43.15	18	24	t	{}
103	29-1337	100g	168.46	29	"6"=>"15"	38.75	35	39	t	{}
104	29-1338	250g	155.59	29	"6"=>"16"	88.69	10	38	t	{}
105	29-1339	500g	97.93	29	"6"=>"17"	94.01	41	48	t	{}
107	30-1337	100g	88.77	30	"6"=>"15"	11.54	30	2	t	{}
108	30-1338	250g	77.30	30	"6"=>"16"	27.05	19	25	t	{}
109	30-1339	500g	57.01	30	"6"=>"17"	33.64	8	23	t	{}
110	30-1340	1kg	56.77	30	"6"=>"18"	6.81	40	11	t	{}
111	31-1337	100g	\N	31	"8"=>"21"	87.32	26	5	t	{}
112	31-1338	250g	\N	31	"8"=>"22"	30.02	6	26	t	{}
114	32-1337	100g	\N	32	"8"=>"21"	28.29	25	33	t	{}
115	32-1338	250g	\N	32	"8"=>"22"	3.54	30	46	t	{}
116	32-1339	500g	\N	32	"8"=>"23"	10.61	29	3	t	{}
117	33-1337	100g	\N	33	"8"=>"21"	57.49	16	46	t	{}
118	33-1338	250g	\N	33	"8"=>"22"	21.78	14	50	t	{}
120	34-1337	100g	\N	34	"8"=>"21"	26.13	25	48	t	{}
121	34-1338	250g	\N	34	"8"=>"22"	12.26	7	33	t	{}
122	34-1339	500g	\N	34	"8"=>"23"	49.05	22	45	t	{}
123	35-1337	100g	\N	35	"8"=>"21"	37.85	49	10	t	{}
124	35-1338	250g	\N	35	"8"=>"22"	6.80	14	38	t	{}
125	35-1339	500g	\N	35	"8"=>"23"	20.84	30	36	t	{}
126	36-1337	100g	\N	36	"8"=>"21"	27.53	39	22	t	{}
127	36-1338	250g	\N	36	"8"=>"22"	68.13	15	34	t	{}
128	36-1339	500g	\N	36	"8"=>"23"	32.35	19	41	t	{}
129	37-1337	100g	\N	37	"8"=>"21"	11.57	9	28	t	{}
130	37-1338	250g	\N	37	"8"=>"22"	14.49	29	43	t	{}
132	38-1337	100g	\N	38	"8"=>"21"	84.76	36	36	t	{}
133	38-1338	250g	\N	38	"8"=>"22"	90.54	27	6	t	{}
135	39-1337	100g	\N	39	"8"=>"21"	70.59	27	6	t	{}
136	39-1338	250g	\N	39	"8"=>"22"	55.61	11	25	t	{}
137	39-1339	500g	\N	39	"8"=>"23"	14.26	31	49	t	{}
138	40-1337	100g	\N	40	"8"=>"21"	20.01	42	12	t	{}
139	40-1338	250g	\N	40	"8"=>"22"	18.69	10	3	t	{}
140	40-1339	500g	\N	40	"8"=>"23"	25.80	36	5	t	{}
142	42-1337		\N	42		15.82	3	13	t	{}
143	43-1337		\N	43		35.53	12	13	t	{}
146	46-1337		\N	46		57.15	16	29	t	{}
147	47-1337		\N	47		40.50	35	41	t	{}
148	48-1337		\N	48		42.17	9	18	t	{}
149	49-1337		\N	49		16.81	20	43	t	{}
151	51-1337	Soft	\N	51	"12"=>"30"	21.03	25	47	t	{}
152	51-1338	Hard	\N	51	"12"=>"31"	21.72	50	40	t	{}
153	52-1337	Soft	\N	52	"12"=>"30"	20.07	13	21	t	{}
154	52-1338	Hard	\N	52	"12"=>"31"	28.37	33	42	t	{}
155	53-1337	Soft	\N	53	"12"=>"30"	3.13	2	3	t	{}
157	54-1337	Soft	\N	54	"12"=>"30"	5.95	3	35	t	{}
159	55-1337	Soft	\N	55	"12"=>"30"	62.24	29	4	t	{}
161	56-1337	Soft	\N	56	"12"=>"30"	31.10	28	16	t	{}
163	57-1337	Soft	\N	57	"12"=>"30"	31.83	44	9	t	{}
164	57-1338	Hard	\N	57	"12"=>"31"	24.84	34	36	t	{}
165	58-1337	Soft	\N	58	"12"=>"30"	51.86	3	44	t	{}
167	59-1337	Soft	\N	59	"12"=>"30"	13.90	43	15	t	{}
168	59-1338	Hard	\N	59	"12"=>"31"	9.73	24	40	t	{}
169	60-1337	Soft	\N	60	"12"=>"30"	62.36	22	11	t	{}
42	7-1342	XXL	\N	7	"4"=>"12"	29.24	42	14	t	{}
82	23-1340	1kg	42.36	23	"6"=>"18"	38.55	38	45	t	{}
106	29-1340	1kg	90.51	29	"6"=>"18"	78.74	47	24	t	{}
150	50-1337		\N	50		13.49	26	48	t	{}
131	37-1339	500g	\N	37	"8"=>"23"	11.41	48	6	t	{}
144	44-1337		\N	44		8.39	17	44	t	{}
170	60-1338	Hard	\N	60	"12"=>"31"	63.92	14	38	t	{}
160	55-1338	Hard	\N	55	"12"=>"31"	32.51	52	22	t	{}
102	28-1340	1kg	106.82	28	"6"=>"18"	83.32	36	20	t	{}
162	56-1338	Hard	\N	56	"12"=>"31"	19.01	30	46	t	{}
48	8-1342	XXL	\N	8	"4"=>"12"	10.03	47	10	t	{}
24	4-1342	XXL	\N	4	"4"=>"12"	1.90	18	18	t	{}
36	6-1342	XXL	\N	6	"4"=>"12"	18.76	27	41	t	{}
62	12-1337		\N	12		12.01	47	39	t	{}
66	16-1337		\N	16		5.37	35	43	t	{}
141	41-1337		\N	41		18.76	20	24	t	{}
78	22-1340	1kg	91.34	22	"6"=>"18"	80.38	53	11	t	{}
68	18-1337		\N	18		24.84	3	25	t	{}
156	53-1338	Hard	\N	53	"12"=>"31"	3.34	10	9	t	{}
94	26-1340	1kg	70.32	26	"6"=>"18"	40.08	11	19	t	{}
166	58-1338	Hard	\N	58	"12"=>"31"	37.32	42	7	t	{}
158	54-1338	Hard	\N	54	"12"=>"31"	32.03	4	42	t	{}
119	33-1339	500g	\N	33	"8"=>"23"	56.62	38	25	t	{}
134	38-1339	500g	\N	38	"8"=>"23"	79.95	17	52	t	{}
18	3-1342	XXL	\N	3	"4"=>"12"	43.04	46	48	t	{}
113	31-1339	500g	\N	31	"8"=>"23"	77.32	55	32	t	{}
64	14-1337		\N	14		14.29	49	15	t	{}
145	45-1337		\N	45		33.68	25	35	t	{}
\.


--
-- Data for Name: product_productvarianttranslation; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_productvarianttranslation (id, language_code, name, product_variant_id) FROM stdin;
\.


--
-- Data for Name: product_variantimage; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.product_variantimage (id, image_id, variant_id) FROM stdin;
\.


--
-- Data for Name: sharedcontent_sharedcontent; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.sharedcontent_sharedcontent (id, slug, is_cross_site, parent_site_id) FROM stdin;
\.


--
-- Data for Name: sharedcontent_sharedcontent_translation; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.sharedcontent_sharedcontent_translation (id, language_code, title, master_id) FROM stdin;
\.


--
-- Data for Name: shipping_shippingmethod; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.shipping_shippingmethod (id, name, description) FROM stdin;
1	UPC	
2	DHL	
\.


--
-- Data for Name: shipping_shippingmethodcountry; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.shipping_shippingmethodcountry (id, country_code, price, shipping_method_id) FROM stdin;
1		74.00	1
2		50.76	2
\.


--
-- Data for Name: site_authorizationkey; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.site_authorizationkey (id, name, key, password, site_settings_id) FROM stdin;
\.


--
-- Data for Name: site_sitesettings; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.site_sitesettings (id, header_text, description, site_id, bottom_menu_id, top_menu_id, display_gross_prices, include_taxes_in_prices, charge_taxes_on_shipping, track_inventory_by_default, homepage_collection_id) FROM stdin;
1	Test Saleor - a sample shop!		1	2	1	t	t	t	t	\N
\.


--
-- Data for Name: site_sitesettingstranslation; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.site_sitesettingstranslation (id, language_code, header_text, description, site_settings_id) FROM stdin;
\.


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.social_auth_partial (id, token, next_step, backend, data, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: saleor
--

COPY public.social_auth_usersocialauth (id, provider, uid, extra_data, user_id) FROM stdin;
\.


--
-- Name: account_customernote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.account_customernote_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 217, true);


--
-- Name: cart_cartline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.cart_cartline_id_seq', 1, true);


--
-- Name: discount_sale_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.discount_sale_categories_id_seq', 1, false);


--
-- Name: discount_sale_collections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.discount_sale_collections_id_seq', 1, false);


--
-- Name: discount_sale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.discount_sale_id_seq', 5, true);


--
-- Name: discount_sale_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.discount_sale_products_id_seq', 20, true);


--
-- Name: discount_voucher_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.discount_voucher_categories_id_seq', 1, false);


--
-- Name: discount_voucher_collections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.discount_voucher_collections_id_seq', 1, false);


--
-- Name: discount_voucher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.discount_voucher_id_seq', 2, true);


--
-- Name: discount_voucher_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.discount_voucher_products_id_seq', 1, false);


--
-- Name: discount_vouchertranslation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.discount_vouchertranslation_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_celery_results_taskresult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.django_celery_results_taskresult_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 70, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 600, true);


--
-- Name: django_prices_openexchangerates_conversionrate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.django_prices_openexchangerates_conversionrate_id_seq', 1, false);


--
-- Name: django_prices_vatlayer_ratetypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.django_prices_vatlayer_ratetypes_id_seq', 1, false);


--
-- Name: django_prices_vatlayer_vat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.django_prices_vatlayer_vat_id_seq', 1, false);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: fluent_contents_contentitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.fluent_contents_contentitem_id_seq', 1, false);


--
-- Name: fluent_contents_placeholder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.fluent_contents_placeholder_id_seq', 5, true);


--
-- Name: impersonate_impersonationlog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.impersonate_impersonationlog_id_seq', 1, false);


--
-- Name: menu_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.menu_menu_id_seq', 2, true);


--
-- Name: menu_menuitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.menu_menuitem_id_seq', 10, true);


--
-- Name: menu_menuitemtranslation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.menu_menuitemtranslation_id_seq', 1, false);


--
-- Name: order_fulfillment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.order_fulfillment_id_seq', 12, true);


--
-- Name: order_fulfillmentline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.order_fulfillmentline_id_seq', 16, true);


--
-- Name: order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.order_order_id_seq', 20, true);


--
-- Name: order_ordereditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.order_ordereditem_id_seq', 35, true);


--
-- Name: order_orderhistoryentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.order_orderhistoryentry_id_seq', 1, false);


--
-- Name: order_ordernote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.order_ordernote_id_seq', 1, false);


--
-- Name: order_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.order_payment_id_seq', 20, true);


--
-- Name: page_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.page_page_id_seq', 1, true);


--
-- Name: page_pagetranslation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.page_pagetranslation_id_seq', 1, false);


--
-- Name: product_attributechoicevalue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_attributechoicevalue_id_seq', 31, true);


--
-- Name: product_attributechoicevaluetranslation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_attributechoicevaluetranslation_id_seq', 1, false);


--
-- Name: product_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_category_id_seq', 6, true);


--
-- Name: product_categorytranslation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_categorytranslation_id_seq', 1, false);


--
-- Name: product_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_collection_id_seq', 2, true);


--
-- Name: product_collection_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_collection_products_id_seq', 8, true);


--
-- Name: product_collectiontranslation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_collectiontranslation_id_seq', 1, false);


--
-- Name: product_imagedata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_imagedata_id_seq', 32, true);


--
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_product_id_seq', 60, true);


--
-- Name: product_productattribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_productattribute_id_seq', 13, true);


--
-- Name: product_productattributetranslation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_productattributetranslation_id_seq', 1, false);


--
-- Name: product_productclass_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_productclass_id_seq', 6, true);


--
-- Name: product_productclass_product_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_productclass_product_attributes_id_seq', 14, true);


--
-- Name: product_productclass_variant_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_productclass_variant_attributes_id_seq', 4, true);


--
-- Name: product_productimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_productimage_id_seq', 16, true);


--
-- Name: product_producttranslation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_producttranslation_id_seq', 1, false);


--
-- Name: product_productvariant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_productvariant_id_seq', 170, true);


--
-- Name: product_productvarianttranslation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_productvarianttranslation_id_seq', 1, false);


--
-- Name: product_variantimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.product_variantimage_id_seq', 1, true);


--
-- Name: sharedcontent_sharedcontent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.sharedcontent_sharedcontent_id_seq', 1, false);


--
-- Name: sharedcontent_sharedcontent_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.sharedcontent_sharedcontent_translation_id_seq', 1, false);


--
-- Name: shipping_shippingmethod_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.shipping_shippingmethod_id_seq', 2, true);


--
-- Name: shipping_shippingmethodcountry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.shipping_shippingmethodcountry_id_seq', 2, true);


--
-- Name: site_authorizationkey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.site_authorizationkey_id_seq', 1, false);


--
-- Name: site_sitesettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.site_sitesettings_id_seq', 1, true);


--
-- Name: site_sitesettingstranslation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.site_sitesettingstranslation_id_seq', 1, false);


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.social_auth_association_id_seq', 1, false);


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.social_auth_code_id_seq', 1, false);


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.social_auth_nonce_id_seq', 1, false);


--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.social_auth_partial_id_seq', 1, false);


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.social_auth_usersocialauth_id_seq', 1, false);


--
-- Name: userprofile_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.userprofile_address_id_seq', 35, true);


--
-- Name: userprofile_user_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.userprofile_user_addresses_id_seq', 21, true);


--
-- Name: userprofile_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.userprofile_user_groups_id_seq', 1, false);


--
-- Name: userprofile_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.userprofile_user_id_seq', 21, true);


--
-- Name: userprofile_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: saleor
--

SELECT pg_catalog.setval('public.userprofile_user_user_permissions_id_seq', 1, false);


--
-- Name: account_customernote account_customernote_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_customernote
    ADD CONSTRAINT account_customernote_pkey PRIMARY KEY (id);


--
-- Name: account_user account_user_token_40f69349_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user
    ADD CONSTRAINT account_user_token_40f69349_uniq UNIQUE (token);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: checkout_cart cart_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.checkout_cart
    ADD CONSTRAINT cart_cart_pkey PRIMARY KEY (token);


--
-- Name: checkout_cartline cart_cartline_cart_id_product_id_data_fc3556b7_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.checkout_cartline
    ADD CONSTRAINT cart_cartline_cart_id_product_id_data_fc3556b7_uniq UNIQUE (cart_id, variant_id, data);


--
-- Name: checkout_cartline cart_cartline_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.checkout_cartline
    ADD CONSTRAINT cart_cartline_pkey PRIMARY KEY (id);


--
-- Name: contentitem_code_codeitem contentitem_code_codeitem_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.contentitem_code_codeitem
    ADD CONSTRAINT contentitem_code_codeitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_iframe_iframeitem contentitem_iframe_iframeitem_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.contentitem_iframe_iframeitem
    ADD CONSTRAINT contentitem_iframe_iframeitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_markup_markupitem contentitem_markup_markupitem_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.contentitem_markup_markupitem
    ADD CONSTRAINT contentitem_markup_markupitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_rawhtml_rawhtmlitem contentitem_rawhtml_rawhtmlitem_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.contentitem_rawhtml_rawhtmlitem
    ADD CONSTRAINT contentitem_rawhtml_rawhtmlitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_sharedcontent_sharedcontentitem contentitem_sharedcontent_sharedcontentitem_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.contentitem_sharedcontent_sharedcontentitem
    ADD CONSTRAINT contentitem_sharedcontent_sharedcontentitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_text_textitem contentitem_text_textitem_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.contentitem_text_textitem
    ADD CONSTRAINT contentitem_text_textitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: discount_sale_categories discount_sale_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_categories
    ADD CONSTRAINT discount_sale_categories_pkey PRIMARY KEY (id);


--
-- Name: discount_sale_categories discount_sale_categories_sale_id_category_id_be438401_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_categories
    ADD CONSTRAINT discount_sale_categories_sale_id_category_id_be438401_uniq UNIQUE (sale_id, category_id);


--
-- Name: discount_sale_collections discount_sale_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_collections
    ADD CONSTRAINT discount_sale_collections_pkey PRIMARY KEY (id);


--
-- Name: discount_sale_collections discount_sale_collections_sale_id_collection_id_01b57fc3_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_collections
    ADD CONSTRAINT discount_sale_collections_sale_id_collection_id_01b57fc3_uniq UNIQUE (sale_id, collection_id);


--
-- Name: discount_sale discount_sale_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale
    ADD CONSTRAINT discount_sale_pkey PRIMARY KEY (id);


--
-- Name: discount_sale_products discount_sale_products_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_products
    ADD CONSTRAINT discount_sale_products_pkey PRIMARY KEY (id);


--
-- Name: discount_sale_products discount_sale_products_sale_id_product_id_1c2df1f8_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_products
    ADD CONSTRAINT discount_sale_products_sale_id_product_id_1c2df1f8_uniq UNIQUE (sale_id, product_id);


--
-- Name: discount_voucher_categories discount_voucher_categor_voucher_id_category_id_bb5f8954_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_categories
    ADD CONSTRAINT discount_voucher_categor_voucher_id_category_id_bb5f8954_uniq UNIQUE (voucher_id, category_id);


--
-- Name: discount_voucher_categories discount_voucher_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_categories
    ADD CONSTRAINT discount_voucher_categories_pkey PRIMARY KEY (id);


--
-- Name: discount_voucher discount_voucher_code_key; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher
    ADD CONSTRAINT discount_voucher_code_key UNIQUE (code);


--
-- Name: discount_voucher_collections discount_voucher_collect_voucher_id_collection_id_736b8f24_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_collections
    ADD CONSTRAINT discount_voucher_collect_voucher_id_collection_id_736b8f24_uniq UNIQUE (voucher_id, collection_id);


--
-- Name: discount_voucher_collections discount_voucher_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_collections
    ADD CONSTRAINT discount_voucher_collections_pkey PRIMARY KEY (id);


--
-- Name: discount_voucher discount_voucher_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher
    ADD CONSTRAINT discount_voucher_pkey PRIMARY KEY (id);


--
-- Name: discount_voucher_products discount_voucher_products_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_products
    ADD CONSTRAINT discount_voucher_products_pkey PRIMARY KEY (id);


--
-- Name: discount_voucher_products discount_voucher_products_voucher_id_product_id_2b092ec4_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_products
    ADD CONSTRAINT discount_voucher_products_voucher_id_product_id_2b092ec4_uniq UNIQUE (voucher_id, product_id);


--
-- Name: discount_vouchertranslation discount_vouchertranslat_language_code_voucher_id_af4428b5_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_vouchertranslation
    ADD CONSTRAINT discount_vouchertranslat_language_code_voucher_id_af4428b5_uniq UNIQUE (language_code, voucher_id);


--
-- Name: discount_vouchertranslation discount_vouchertranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_vouchertranslation
    ADD CONSTRAINT discount_vouchertranslation_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_celery_results_taskresult django_celery_results_taskresult_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_celery_results_taskresult
    ADD CONSTRAINT django_celery_results_taskresult_pkey PRIMARY KEY (id);


--
-- Name: django_celery_results_taskresult django_celery_results_taskresult_task_id_key; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_celery_results_taskresult
    ADD CONSTRAINT django_celery_results_taskresult_task_id_key UNIQUE (task_id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_prices_openexchangerates_conversionrate django_prices_openexchangerates_conversionrate_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_prices_openexchangerates_conversionrate
    ADD CONSTRAINT django_prices_openexchangerates_conversionrate_pkey PRIMARY KEY (id);


--
-- Name: django_prices_openexchangerates_conversionrate django_prices_openexchangerates_conversionrate_to_currency_key; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_prices_openexchangerates_conversionrate
    ADD CONSTRAINT django_prices_openexchangerates_conversionrate_to_currency_key UNIQUE (to_currency);


--
-- Name: django_prices_vatlayer_ratetypes django_prices_vatlayer_ratetypes_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_prices_vatlayer_ratetypes
    ADD CONSTRAINT django_prices_vatlayer_ratetypes_pkey PRIMARY KEY (id);


--
-- Name: django_prices_vatlayer_vat django_prices_vatlayer_vat_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_prices_vatlayer_vat
    ADD CONSTRAINT django_prices_vatlayer_vat_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: fluent_contents_contentitem fluent_contents_contentitem_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.fluent_contents_contentitem
    ADD CONSTRAINT fluent_contents_contentitem_pkey PRIMARY KEY (id);


--
-- Name: fluent_contents_placeholder fluent_contents_placehol_parent_type_id_parent_id_93a6e260_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.fluent_contents_placeholder
    ADD CONSTRAINT fluent_contents_placehol_parent_type_id_parent_id_93a6e260_uniq UNIQUE (parent_type_id, parent_id, slot);


--
-- Name: fluent_contents_placeholder fluent_contents_placeholder_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.fluent_contents_placeholder
    ADD CONSTRAINT fluent_contents_placeholder_pkey PRIMARY KEY (id);


--
-- Name: impersonate_impersonationlog impersonate_impersonationlog_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.impersonate_impersonationlog
    ADD CONSTRAINT impersonate_impersonationlog_pkey PRIMARY KEY (id);


--
-- Name: menu_menu menu_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.menu_menu
    ADD CONSTRAINT menu_menu_pkey PRIMARY KEY (id);


--
-- Name: menu_menuitem menu_menuitem_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.menu_menuitem
    ADD CONSTRAINT menu_menuitem_pkey PRIMARY KEY (id);


--
-- Name: menu_menuitemtranslation menu_menuitemtranslation_language_code_menu_item__508dcdd8_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.menu_menuitemtranslation
    ADD CONSTRAINT menu_menuitemtranslation_language_code_menu_item__508dcdd8_uniq UNIQUE (language_code, menu_item_id);


--
-- Name: menu_menuitemtranslation menu_menuitemtranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.menu_menuitemtranslation
    ADD CONSTRAINT menu_menuitemtranslation_pkey PRIMARY KEY (id);


--
-- Name: order_fulfillment order_fulfillment_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_fulfillment
    ADD CONSTRAINT order_fulfillment_pkey PRIMARY KEY (id);


--
-- Name: order_fulfillmentline order_fulfillmentline_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_fulfillmentline
    ADD CONSTRAINT order_fulfillmentline_pkey PRIMARY KEY (id);


--
-- Name: order_order order_order_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_pkey PRIMARY KEY (id);


--
-- Name: order_order order_order_token_key; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_token_key UNIQUE (token);


--
-- Name: order_orderline order_ordereditem_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_orderline
    ADD CONSTRAINT order_ordereditem_pkey PRIMARY KEY (id);


--
-- Name: order_orderhistoryentry order_orderhistoryentry_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_orderhistoryentry
    ADD CONSTRAINT order_orderhistoryentry_pkey PRIMARY KEY (id);


--
-- Name: order_ordernote order_ordernote_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_ordernote
    ADD CONSTRAINT order_ordernote_pkey PRIMARY KEY (id);


--
-- Name: order_payment order_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_payment
    ADD CONSTRAINT order_payment_pkey PRIMARY KEY (id);


--
-- Name: page_page page_page_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.page_page
    ADD CONSTRAINT page_page_pkey PRIMARY KEY (id);


--
-- Name: page_page page_page_slug_key; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.page_page
    ADD CONSTRAINT page_page_slug_key UNIQUE (slug);


--
-- Name: page_pagetranslation page_pagetranslation_language_code_page_id_35685962_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.page_pagetranslation
    ADD CONSTRAINT page_pagetranslation_language_code_page_id_35685962_uniq UNIQUE (language_code, page_id);


--
-- Name: page_pagetranslation page_pagetranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.page_pagetranslation
    ADD CONSTRAINT page_pagetranslation_pkey PRIMARY KEY (id);


--
-- Name: product_attributechoicevaluetranslation product_attributechoicev_language_code_attribute__9b58af18_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributechoicevaluetranslation
    ADD CONSTRAINT product_attributechoicev_language_code_attribute__9b58af18_uniq UNIQUE (language_code, attribute_choice_value_id);


--
-- Name: product_attributechoicevalue product_attributechoicevalue_display_attribute_id_6d8b2d87_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributechoicevalue
    ADD CONSTRAINT product_attributechoicevalue_display_attribute_id_6d8b2d87_uniq UNIQUE (name, attribute_id);


--
-- Name: product_attributechoicevalue product_attributechoicevalue_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributechoicevalue
    ADD CONSTRAINT product_attributechoicevalue_pkey PRIMARY KEY (id);


--
-- Name: product_attributechoicevaluetranslation product_attributechoicevaluetranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributechoicevaluetranslation
    ADD CONSTRAINT product_attributechoicevaluetranslation_pkey PRIMARY KEY (id);


--
-- Name: product_category product_category_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_pkey PRIMARY KEY (id);


--
-- Name: product_categorytranslation product_categorytranslat_language_code_category_i_f71fd11d_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_categorytranslation
    ADD CONSTRAINT product_categorytranslat_language_code_category_i_f71fd11d_uniq UNIQUE (language_code, category_id);


--
-- Name: product_categorytranslation product_categorytranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_categorytranslation
    ADD CONSTRAINT product_categorytranslation_pkey PRIMARY KEY (id);


--
-- Name: product_collection product_collection_name_key; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_collection
    ADD CONSTRAINT product_collection_name_key UNIQUE (name);


--
-- Name: product_collection product_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_collection
    ADD CONSTRAINT product_collection_pkey PRIMARY KEY (id);


--
-- Name: product_collection_products product_collection_produ_collection_id_product_id_abec4cf3_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_collection_products
    ADD CONSTRAINT product_collection_produ_collection_id_product_id_abec4cf3_uniq UNIQUE (collection_id, product_id);


--
-- Name: product_collection_products product_collection_products_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_collection_products
    ADD CONSTRAINT product_collection_products_pkey PRIMARY KEY (id);


--
-- Name: product_collectiontranslation product_collectiontransl_language_code_collection_b1200cd5_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_collectiontranslation
    ADD CONSTRAINT product_collectiontransl_language_code_collection_b1200cd5_uniq UNIQUE (language_code, collection_id);


--
-- Name: product_collectiontranslation product_collectiontranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_collectiontranslation
    ADD CONSTRAINT product_collectiontranslation_pkey PRIMARY KEY (id);


--
-- Name: product_imagedata product_imagedata_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_imagedata
    ADD CONSTRAINT product_imagedata_pkey PRIMARY KEY (id);


--
-- Name: product_product product_product_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_product
    ADD CONSTRAINT product_product_pkey PRIMARY KEY (id);


--
-- Name: product_productattributetranslation product_productattribute_language_code_product_at_58451db2_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productattributetranslation
    ADD CONSTRAINT product_productattribute_language_code_product_at_58451db2_uniq UNIQUE (language_code, product_attribute_id);


--
-- Name: product_productattribute product_productattribute_name_key; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productattribute
    ADD CONSTRAINT product_productattribute_name_key UNIQUE (slug);


--
-- Name: product_productattribute product_productattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productattribute
    ADD CONSTRAINT product_productattribute_pkey PRIMARY KEY (id);


--
-- Name: product_productattributetranslation product_productattributetranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productattributetranslation
    ADD CONSTRAINT product_productattributetranslation_pkey PRIMARY KEY (id);


--
-- Name: product_producttype product_productclass_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_producttype
    ADD CONSTRAINT product_productclass_pkey PRIMARY KEY (id);


--
-- Name: product_producttype_product_attributes product_productclass_pro_productclass_id_producta_0f5adffd_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_producttype_product_attributes
    ADD CONSTRAINT product_productclass_pro_productclass_id_producta_0f5adffd_uniq UNIQUE (producttype_id, productattribute_id);


--
-- Name: product_producttype_product_attributes product_productclass_product_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_producttype_product_attributes
    ADD CONSTRAINT product_productclass_product_attributes_pkey PRIMARY KEY (id);


--
-- Name: product_producttype_variant_attributes product_productclass_var_productclass_id_producta_99509fad_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_producttype_variant_attributes
    ADD CONSTRAINT product_productclass_var_productclass_id_producta_99509fad_uniq UNIQUE (producttype_id, productattribute_id);


--
-- Name: product_producttype_variant_attributes product_productclass_variant_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_producttype_variant_attributes
    ADD CONSTRAINT product_productclass_variant_attributes_pkey PRIMARY KEY (id);


--
-- Name: product_productimage product_productimage_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productimage
    ADD CONSTRAINT product_productimage_pkey PRIMARY KEY (id);


--
-- Name: product_producttranslation product_producttranslati_language_code_product_id_b06ba774_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_producttranslation
    ADD CONSTRAINT product_producttranslati_language_code_product_id_b06ba774_uniq UNIQUE (language_code, product_id);


--
-- Name: product_producttranslation product_producttranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_producttranslation
    ADD CONSTRAINT product_producttranslation_pkey PRIMARY KEY (id);


--
-- Name: product_productvariant product_productvariant_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productvariant
    ADD CONSTRAINT product_productvariant_pkey PRIMARY KEY (id);


--
-- Name: product_productvariant product_productvariant_sku_key; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productvariant
    ADD CONSTRAINT product_productvariant_sku_key UNIQUE (sku);


--
-- Name: product_productvarianttranslation product_productvarianttr_language_code_product_va_cf16d8d0_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productvarianttranslation
    ADD CONSTRAINT product_productvarianttr_language_code_product_va_cf16d8d0_uniq UNIQUE (language_code, product_variant_id);


--
-- Name: product_productvarianttranslation product_productvarianttranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productvarianttranslation
    ADD CONSTRAINT product_productvarianttranslation_pkey PRIMARY KEY (id);


--
-- Name: product_variantimage product_variantimage_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_variantimage
    ADD CONSTRAINT product_variantimage_pkey PRIMARY KEY (id);


--
-- Name: sharedcontent_sharedcontent_translation sharedcontent_sharedcont_language_code_master_id_5b41670f_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.sharedcontent_sharedcontent_translation
    ADD CONSTRAINT sharedcontent_sharedcont_language_code_master_id_5b41670f_uniq UNIQUE (language_code, master_id);


--
-- Name: sharedcontent_sharedcontent sharedcontent_sharedcontent_parent_site_id_slug_f384bc82_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.sharedcontent_sharedcontent
    ADD CONSTRAINT sharedcontent_sharedcontent_parent_site_id_slug_f384bc82_uniq UNIQUE (parent_site_id, slug);


--
-- Name: sharedcontent_sharedcontent sharedcontent_sharedcontent_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.sharedcontent_sharedcontent
    ADD CONSTRAINT sharedcontent_sharedcontent_pkey PRIMARY KEY (id);


--
-- Name: sharedcontent_sharedcontent_translation sharedcontent_sharedcontent_translation_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.sharedcontent_sharedcontent_translation
    ADD CONSTRAINT sharedcontent_sharedcontent_translation_pkey PRIMARY KEY (id);


--
-- Name: shipping_shippingmethod shipping_shippingmethod_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.shipping_shippingmethod
    ADD CONSTRAINT shipping_shippingmethod_pkey PRIMARY KEY (id);


--
-- Name: shipping_shippingmethodcountry shipping_shippingmethodc_country_code_shipping_me_0e63c403_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.shipping_shippingmethodcountry
    ADD CONSTRAINT shipping_shippingmethodc_country_code_shipping_me_0e63c403_uniq UNIQUE (country_code, shipping_method_id);


--
-- Name: shipping_shippingmethodcountry shipping_shippingmethodcountry_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.shipping_shippingmethodcountry
    ADD CONSTRAINT shipping_shippingmethodcountry_pkey PRIMARY KEY (id);


--
-- Name: site_authorizationkey site_authorizationkey_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_authorizationkey
    ADD CONSTRAINT site_authorizationkey_pkey PRIMARY KEY (id);


--
-- Name: site_authorizationkey site_authorizationkey_site_settings_id_name_c5f8d1e6_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_authorizationkey
    ADD CONSTRAINT site_authorizationkey_site_settings_id_name_c5f8d1e6_uniq UNIQUE (site_settings_id, name);


--
-- Name: site_sitesettings site_sitesettings_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_sitesettings
    ADD CONSTRAINT site_sitesettings_pkey PRIMARY KEY (id);


--
-- Name: site_sitesettings site_sitesettings_site_id_key; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_sitesettings
    ADD CONSTRAINT site_sitesettings_site_id_key UNIQUE (site_id);


--
-- Name: site_sitesettingstranslation site_sitesettingstransla_language_code_site_setti_e767d9e7_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_sitesettingstranslation
    ADD CONSTRAINT site_sitesettingstransla_language_code_site_setti_e767d9e7_uniq UNIQUE (language_code, site_settings_id);


--
-- Name: site_sitesettingstranslation site_sitesettingstranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_sitesettingstranslation
    ADD CONSTRAINT site_sitesettingstranslation_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_server_url_handle_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq UNIQUE (server_url, handle);


--
-- Name: social_auth_code social_auth_code_email_code_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_email_code_801b2d02_uniq UNIQUE (email, code);


--
-- Name: social_auth_code social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_server_url_timestamp_salt_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_partial social_auth_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_provider_uid_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq UNIQUE (provider, uid);


--
-- Name: account_address userprofile_address_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_address
    ADD CONSTRAINT userprofile_address_pkey PRIMARY KEY (id);


--
-- Name: account_user_addresses userprofile_user_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_addresses
    ADD CONSTRAINT userprofile_user_addresses_pkey PRIMARY KEY (id);


--
-- Name: account_user_addresses userprofile_user_addresses_user_id_address_id_6cb87bcc_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_addresses
    ADD CONSTRAINT userprofile_user_addresses_user_id_address_id_6cb87bcc_uniq UNIQUE (user_id, address_id);


--
-- Name: account_user userprofile_user_email_key; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user
    ADD CONSTRAINT userprofile_user_email_key UNIQUE (email);


--
-- Name: account_user_groups userprofile_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_groups
    ADD CONSTRAINT userprofile_user_groups_pkey PRIMARY KEY (id);


--
-- Name: account_user_groups userprofile_user_groups_user_id_group_id_90ce1781_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_groups
    ADD CONSTRAINT userprofile_user_groups_user_id_group_id_90ce1781_uniq UNIQUE (user_id, group_id);


--
-- Name: account_user userprofile_user_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user
    ADD CONSTRAINT userprofile_user_pkey PRIMARY KEY (id);


--
-- Name: account_user_user_permissions userprofile_user_user_pe_user_id_permission_id_706d65c8_uniq; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_user_permissions
    ADD CONSTRAINT userprofile_user_user_pe_user_id_permission_id_706d65c8_uniq UNIQUE (user_id, permission_id);


--
-- Name: account_user_user_permissions userprofile_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_user_permissions
    ADD CONSTRAINT userprofile_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: account_customernote_customer_id_ec50cbf6; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX account_customernote_customer_id_ec50cbf6 ON public.account_customernote USING btree (customer_id);


--
-- Name: account_customernote_date_231c3474; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX account_customernote_date_231c3474 ON public.account_customernote USING btree (date);


--
-- Name: account_customernote_user_id_b10a6c14; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX account_customernote_user_id_b10a6c14 ON public.account_customernote USING btree (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: cart_cart_billing_address_id_9eb62ddd; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX cart_cart_billing_address_id_9eb62ddd ON public.checkout_cart USING btree (billing_address_id);


--
-- Name: cart_cart_shipping_address_id_adfddaf9; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX cart_cart_shipping_address_id_adfddaf9 ON public.checkout_cart USING btree (shipping_address_id);


--
-- Name: cart_cart_shipping_method_id_835c02e0; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX cart_cart_shipping_method_id_835c02e0 ON public.checkout_cart USING btree (shipping_method_id);


--
-- Name: cart_cart_user_id_9b4220b9; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX cart_cart_user_id_9b4220b9 ON public.checkout_cart USING btree (user_id);


--
-- Name: cart_cartline_cart_id_c7b9981e; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX cart_cartline_cart_id_c7b9981e ON public.checkout_cartline USING btree (cart_id);


--
-- Name: cart_cartline_product_id_1a54130f; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX cart_cartline_product_id_1a54130f ON public.checkout_cartline USING btree (variant_id);


--
-- Name: contentitem_markup_markupitem_language_dc97746e; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX contentitem_markup_markupitem_language_dc97746e ON public.contentitem_markup_markupitem USING btree (language);


--
-- Name: contentitem_markup_markupitem_language_dc97746e_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX contentitem_markup_markupitem_language_dc97746e_like ON public.contentitem_markup_markupitem USING btree (language varchar_pattern_ops);


--
-- Name: contentitem_sharedcontent__shared_content_id_0333a198; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX contentitem_sharedcontent__shared_content_id_0333a198 ON public.contentitem_sharedcontent_sharedcontentitem USING btree (shared_content_id);


--
-- Name: discount_sale_categories_category_id_64e132af; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_sale_categories_category_id_64e132af ON public.discount_sale_categories USING btree (category_id);


--
-- Name: discount_sale_categories_sale_id_2aeee4a7; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_sale_categories_sale_id_2aeee4a7 ON public.discount_sale_categories USING btree (sale_id);


--
-- Name: discount_sale_collections_collection_id_f66df9d7; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_sale_collections_collection_id_f66df9d7 ON public.discount_sale_collections USING btree (collection_id);


--
-- Name: discount_sale_collections_sale_id_a912da4a; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_sale_collections_sale_id_a912da4a ON public.discount_sale_collections USING btree (sale_id);


--
-- Name: discount_sale_products_product_id_d42c9636; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_sale_products_product_id_d42c9636 ON public.discount_sale_products USING btree (product_id);


--
-- Name: discount_sale_products_sale_id_10e3a20f; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_sale_products_sale_id_10e3a20f ON public.discount_sale_products USING btree (sale_id);


--
-- Name: discount_voucher_categories_category_id_fc9d044a; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_voucher_categories_category_id_fc9d044a ON public.discount_voucher_categories USING btree (category_id);


--
-- Name: discount_voucher_categories_voucher_id_19a56338; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_voucher_categories_voucher_id_19a56338 ON public.discount_voucher_categories USING btree (voucher_id);


--
-- Name: discount_voucher_code_ff8dc52c_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_voucher_code_ff8dc52c_like ON public.discount_voucher USING btree (code varchar_pattern_ops);


--
-- Name: discount_voucher_collections_collection_id_b9de6b54; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_voucher_collections_collection_id_b9de6b54 ON public.discount_voucher_collections USING btree (collection_id);


--
-- Name: discount_voucher_collections_voucher_id_4ce1fde3; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_voucher_collections_voucher_id_4ce1fde3 ON public.discount_voucher_collections USING btree (voucher_id);


--
-- Name: discount_voucher_products_product_id_4a3131ff; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_voucher_products_product_id_4a3131ff ON public.discount_voucher_products USING btree (product_id);


--
-- Name: discount_voucher_products_voucher_id_8a2e6c3a; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_voucher_products_voucher_id_8a2e6c3a ON public.discount_voucher_products USING btree (voucher_id);


--
-- Name: discount_vouchertranslation_voucher_id_288246a9; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX discount_vouchertranslation_voucher_id_288246a9 ON public.discount_vouchertranslation USING btree (voucher_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_celery_results_taskresult_hidden_cd77412f; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX django_celery_results_taskresult_hidden_cd77412f ON public.django_celery_results_taskresult USING btree (hidden);


--
-- Name: django_celery_results_taskresult_task_id_de0d95bf_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX django_celery_results_taskresult_task_id_de0d95bf_like ON public.django_celery_results_taskresult USING btree (task_id varchar_pattern_ops);


--
-- Name: django_prices_openexchan_to_currency_92c4a4e1_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX django_prices_openexchan_to_currency_92c4a4e1_like ON public.django_prices_openexchangerates_conversionrate USING btree (to_currency varchar_pattern_ops);


--
-- Name: django_prices_vatlayer_vat_country_code_858b2cc4; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX django_prices_vatlayer_vat_country_code_858b2cc4 ON public.django_prices_vatlayer_vat USING btree (country_code);


--
-- Name: django_prices_vatlayer_vat_country_code_858b2cc4_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX django_prices_vatlayer_vat_country_code_858b2cc4_like ON public.django_prices_vatlayer_vat USING btree (country_code varchar_pattern_ops);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: fluent_contents_contentitem_language_code_2304b6a8; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX fluent_contents_contentitem_language_code_2304b6a8 ON public.fluent_contents_contentitem USING btree (language_code);


--
-- Name: fluent_contents_contentitem_language_code_2304b6a8_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX fluent_contents_contentitem_language_code_2304b6a8_like ON public.fluent_contents_contentitem USING btree (language_code varchar_pattern_ops);


--
-- Name: fluent_contents_contentitem_parent_type_id_9a2fbcb3; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX fluent_contents_contentitem_parent_type_id_9a2fbcb3 ON public.fluent_contents_contentitem USING btree (parent_type_id);


--
-- Name: fluent_contents_contentitem_placeholder_id_fb2e98ff; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX fluent_contents_contentitem_placeholder_id_fb2e98ff ON public.fluent_contents_contentitem USING btree (placeholder_id);


--
-- Name: fluent_contents_contentitem_polymorphic_ctype_id_8989bd3f; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX fluent_contents_contentitem_polymorphic_ctype_id_8989bd3f ON public.fluent_contents_contentitem USING btree (polymorphic_ctype_id);


--
-- Name: fluent_contents_contentitem_sort_order_46b4ca91; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX fluent_contents_contentitem_sort_order_46b4ca91 ON public.fluent_contents_contentitem USING btree (sort_order);


--
-- Name: fluent_contents_placeholder_parent_type_id_01f70240; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX fluent_contents_placeholder_parent_type_id_01f70240 ON public.fluent_contents_placeholder USING btree (parent_type_id);


--
-- Name: fluent_contents_placeholder_slot_d7cb855e; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX fluent_contents_placeholder_slot_d7cb855e ON public.fluent_contents_placeholder USING btree (slot);


--
-- Name: fluent_contents_placeholder_slot_d7cb855e_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX fluent_contents_placeholder_slot_d7cb855e_like ON public.fluent_contents_placeholder USING btree (slot varchar_pattern_ops);


--
-- Name: impersonate_impersonationlog_impersonating_id_afd114fc; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX impersonate_impersonationlog_impersonating_id_afd114fc ON public.impersonate_impersonationlog USING btree (impersonating_id);


--
-- Name: impersonate_impersonationlog_impersonator_id_1ecfe8ce; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX impersonate_impersonationlog_impersonator_id_1ecfe8ce ON public.impersonate_impersonationlog USING btree (impersonator_id);


--
-- Name: menu_menuitem_category_id_af353a3b; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX menu_menuitem_category_id_af353a3b ON public.menu_menuitem USING btree (category_id);


--
-- Name: menu_menuitem_collection_id_b913b19e; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX menu_menuitem_collection_id_b913b19e ON public.menu_menuitem USING btree (collection_id);


--
-- Name: menu_menuitem_level_235a7959; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX menu_menuitem_level_235a7959 ON public.menu_menuitem USING btree (level);


--
-- Name: menu_menuitem_lft_ee554b30; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX menu_menuitem_lft_ee554b30 ON public.menu_menuitem USING btree (lft);


--
-- Name: menu_menuitem_menu_id_f466b139; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX menu_menuitem_menu_id_f466b139 ON public.menu_menuitem USING btree (menu_id);


--
-- Name: menu_menuitem_page_id_a0c8f92d; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX menu_menuitem_page_id_a0c8f92d ON public.menu_menuitem USING btree (page_id);


--
-- Name: menu_menuitem_parent_id_439f55a5; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX menu_menuitem_parent_id_439f55a5 ON public.menu_menuitem USING btree (parent_id);


--
-- Name: menu_menuitem_rght_f86bd5c2; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX menu_menuitem_rght_f86bd5c2 ON public.menu_menuitem USING btree (rght);


--
-- Name: menu_menuitem_sort_order_f96ed184; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX menu_menuitem_sort_order_f96ed184 ON public.menu_menuitem USING btree (sort_order);


--
-- Name: menu_menuitem_tree_id_0d2e9c9a; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX menu_menuitem_tree_id_0d2e9c9a ON public.menu_menuitem USING btree (tree_id);


--
-- Name: menu_menuitemtranslation_menu_item_id_3445926c; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX menu_menuitemtranslation_menu_item_id_3445926c ON public.menu_menuitemtranslation USING btree (menu_item_id);


--
-- Name: order_fulfillment_order_id_02695111; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_fulfillment_order_id_02695111 ON public.order_fulfillment USING btree (order_id);


--
-- Name: order_fulfillmentline_fulfillment_id_68f3291d; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_fulfillmentline_fulfillment_id_68f3291d ON public.order_fulfillmentline USING btree (fulfillment_id);


--
-- Name: order_fulfillmentline_order_line_id_7d40e054; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_fulfillmentline_order_line_id_7d40e054 ON public.order_fulfillmentline USING btree (order_line_id);


--
-- Name: order_order_billing_address_id_8fe537cf; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_order_billing_address_id_8fe537cf ON public.order_order USING btree (billing_address_id);


--
-- Name: order_order_shipping_address_id_57e64931; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_order_shipping_address_id_57e64931 ON public.order_order USING btree (shipping_address_id);


--
-- Name: order_order_shipping_method_id_2a742834; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_order_shipping_method_id_2a742834 ON public.order_order USING btree (shipping_method_id);


--
-- Name: order_order_token_ddb7fb7b_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_order_token_ddb7fb7b_like ON public.order_order USING btree (token varchar_pattern_ops);


--
-- Name: order_order_user_id_7cf9bc2b; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_order_user_id_7cf9bc2b ON public.order_order USING btree (user_id);


--
-- Name: order_order_voucher_id_0748ca22; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_order_voucher_id_0748ca22 ON public.order_order USING btree (voucher_id);


--
-- Name: order_orderhistoryentry_order_id_ea3bf4c4; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_orderhistoryentry_order_id_ea3bf4c4 ON public.order_orderhistoryentry USING btree (order_id);


--
-- Name: order_orderhistoryentry_user_id_1070bf50; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_orderhistoryentry_user_id_1070bf50 ON public.order_orderhistoryentry USING btree (user_id);


--
-- Name: order_orderline_order_id_eb04ec2d; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_orderline_order_id_eb04ec2d ON public.order_orderline USING btree (order_id);


--
-- Name: order_orderline_variant_id_866774cb; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_orderline_variant_id_866774cb ON public.order_orderline USING btree (variant_id);


--
-- Name: order_ordernote_date_715fe7c7; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_ordernote_date_715fe7c7 ON public.order_ordernote USING btree (date);


--
-- Name: order_ordernote_order_id_7d97583d; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_ordernote_order_id_7d97583d ON public.order_ordernote USING btree (order_id);


--
-- Name: order_ordernote_user_id_48d7a672; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_ordernote_user_id_48d7a672 ON public.order_ordernote USING btree (user_id);


--
-- Name: order_payment_order_id_588933b6; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX order_payment_order_id_588933b6 ON public.order_payment USING btree (order_id);


--
-- Name: page_page_slug_d6b7c8ed_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX page_page_slug_d6b7c8ed_like ON public.page_page USING btree (slug varchar_pattern_ops);


--
-- Name: page_pagetranslation_page_id_60216ef5; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX page_pagetranslation_page_id_60216ef5 ON public.page_pagetranslation USING btree (page_id);


--
-- Name: product_attributechoiceval_attribute_choice_value_id_71c4c0a7; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_attributechoiceval_attribute_choice_value_id_71c4c0a7 ON public.product_attributechoicevaluetranslation USING btree (attribute_choice_value_id);


--
-- Name: product_attributechoicevalue_attribute_id_c28c6c92; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_attributechoicevalue_attribute_id_c28c6c92 ON public.product_attributechoicevalue USING btree (attribute_id);


--
-- Name: product_attributechoicevalue_slug_e0d2d25b; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_attributechoicevalue_slug_e0d2d25b ON public.product_attributechoicevalue USING btree (slug);


--
-- Name: product_attributechoicevalue_slug_e0d2d25b_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_attributechoicevalue_slug_e0d2d25b_like ON public.product_attributechoicevalue USING btree (slug varchar_pattern_ops);


--
-- Name: product_attributechoicevalue_sort_order_c4c071c4; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_attributechoicevalue_sort_order_c4c071c4 ON public.product_attributechoicevalue USING btree (sort_order);


--
-- Name: product_category_level_b59332d3; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_category_level_b59332d3 ON public.product_category USING btree (level);


--
-- Name: product_category_lft_3708054f; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_category_lft_3708054f ON public.product_category USING btree (lft);


--
-- Name: product_category_parent_id_f6860923; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_category_parent_id_f6860923 ON public.product_category USING btree (parent_id);


--
-- Name: product_category_rght_fcbf9e79; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_category_rght_fcbf9e79 ON public.product_category USING btree (rght);


--
-- Name: product_category_slug_e1f8ccc4; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_category_slug_e1f8ccc4 ON public.product_category USING btree (slug);


--
-- Name: product_category_slug_e1f8ccc4_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_category_slug_e1f8ccc4_like ON public.product_category USING btree (slug varchar_pattern_ops);


--
-- Name: product_category_tree_id_f3c46461; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_category_tree_id_f3c46461 ON public.product_category USING btree (tree_id);


--
-- Name: product_categorytranslation_category_id_aa8d0917; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_categorytranslation_category_id_aa8d0917 ON public.product_categorytranslation USING btree (category_id);


--
-- Name: product_collection_name_03bb818b_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_collection_name_03bb818b_like ON public.product_collection USING btree (name varchar_pattern_ops);


--
-- Name: product_collection_products_collection_id_0bc817dc; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_collection_products_collection_id_0bc817dc ON public.product_collection_products USING btree (collection_id);


--
-- Name: product_collection_products_product_id_a45a5b06; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_collection_products_product_id_a45a5b06 ON public.product_collection_products USING btree (product_id);


--
-- Name: product_collection_slug_ec186116; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_collection_slug_ec186116 ON public.product_collection USING btree (slug);


--
-- Name: product_collection_slug_ec186116_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_collection_slug_ec186116_like ON public.product_collection USING btree (slug varchar_pattern_ops);


--
-- Name: product_collectiontranslation_collection_id_cfbbd453; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_collectiontranslation_collection_id_cfbbd453 ON public.product_collectiontranslation USING btree (collection_id);


--
-- Name: product_imagedata_sort_order_260e8bf1; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_imagedata_sort_order_260e8bf1 ON public.product_imagedata USING btree (sort_order);


--
-- Name: product_product_category_id_0c725779; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_product_category_id_0c725779 ON public.product_product USING btree (category_id);


--
-- Name: product_product_product_class_id_0547c998; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_product_product_class_id_0547c998 ON public.product_product USING btree (product_type_id);


--
-- Name: product_productattribute_name_97ca2b51_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_productattribute_name_97ca2b51_like ON public.product_productattribute USING btree (slug varchar_pattern_ops);


--
-- Name: product_productattributetr_product_attribute_id_56b48511; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_productattributetr_product_attribute_id_56b48511 ON public.product_productattributetranslation USING btree (product_attribute_id);


--
-- Name: product_productclass_produ_productattribute_id_de46d651; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_productclass_produ_productattribute_id_de46d651 ON public.product_producttype_product_attributes USING btree (productattribute_id);


--
-- Name: product_productclass_produ_productclass_id_afa141a4; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_productclass_produ_productclass_id_afa141a4 ON public.product_producttype_product_attributes USING btree (producttype_id);


--
-- Name: product_productclass_varia_productattribute_id_4843d626; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_productclass_varia_productattribute_id_4843d626 ON public.product_producttype_variant_attributes USING btree (productattribute_id);


--
-- Name: product_productclass_varia_productclass_id_0903f8b6; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_productclass_varia_productclass_id_0903f8b6 ON public.product_producttype_variant_attributes USING btree (producttype_id);


--
-- Name: product_productimage_image_id_bb48efd0; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_productimage_image_id_bb48efd0 ON public.product_productimage USING btree (image_id);


--
-- Name: product_productimage_product_id_544084bb; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_productimage_product_id_544084bb ON public.product_productimage USING btree (product_id);


--
-- Name: product_productimage_sort_order_dfda9c19; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_productimage_sort_order_dfda9c19 ON public.product_productimage USING btree (sort_order);


--
-- Name: product_producttranslation_product_id_2c2c7532; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_producttranslation_product_id_2c2c7532 ON public.product_producttranslation USING btree (product_id);


--
-- Name: product_productvariant_product_id_43c5a310; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_productvariant_product_id_43c5a310 ON public.product_productvariant USING btree (product_id);


--
-- Name: product_productvariant_sku_50706818_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_productvariant_sku_50706818_like ON public.product_productvariant USING btree (sku varchar_pattern_ops);


--
-- Name: product_productvarianttranslation_product_variant_id_1b144a85; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_productvarianttranslation_product_variant_id_1b144a85 ON public.product_productvarianttranslation USING btree (product_variant_id);


--
-- Name: product_variantimage_image_id_bef14106; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_variantimage_image_id_bef14106 ON public.product_variantimage USING btree (image_id);


--
-- Name: product_variantimage_variant_id_81123814; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX product_variantimage_variant_id_81123814 ON public.product_variantimage USING btree (variant_id);


--
-- Name: sharedcontent_sharedcont_language_code_ab3c904c_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX sharedcontent_sharedcont_language_code_ab3c904c_like ON public.sharedcontent_sharedcontent_translation USING btree (language_code varchar_pattern_ops);


--
-- Name: sharedcontent_sharedcontent_parent_site_id_c9ee0f73; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX sharedcontent_sharedcontent_parent_site_id_c9ee0f73 ON public.sharedcontent_sharedcontent USING btree (parent_site_id);


--
-- Name: sharedcontent_sharedcontent_slug_ebe1a524; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX sharedcontent_sharedcontent_slug_ebe1a524 ON public.sharedcontent_sharedcontent USING btree (slug);


--
-- Name: sharedcontent_sharedcontent_slug_ebe1a524_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX sharedcontent_sharedcontent_slug_ebe1a524_like ON public.sharedcontent_sharedcontent USING btree (slug varchar_pattern_ops);


--
-- Name: sharedcontent_sharedcontent_translation_language_code_ab3c904c; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX sharedcontent_sharedcontent_translation_language_code_ab3c904c ON public.sharedcontent_sharedcontent_translation USING btree (language_code);


--
-- Name: sharedcontent_sharedcontent_translation_master_id_ff437c98; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX sharedcontent_sharedcontent_translation_master_id_ff437c98 ON public.sharedcontent_sharedcontent_translation USING btree (master_id);


--
-- Name: shipping_shippingmethodcountry_shipping_method_id_9b026f8b; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX shipping_shippingmethodcountry_shipping_method_id_9b026f8b ON public.shipping_shippingmethodcountry USING btree (shipping_method_id);


--
-- Name: site_authorizationkey_site_settings_id_d8397c0f; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX site_authorizationkey_site_settings_id_d8397c0f ON public.site_authorizationkey USING btree (site_settings_id);


--
-- Name: site_sitesettings_bottom_menu_id_e2a78098; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX site_sitesettings_bottom_menu_id_e2a78098 ON public.site_sitesettings USING btree (bottom_menu_id);


--
-- Name: site_sitesettings_homepage_collection_id_82f45d33; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX site_sitesettings_homepage_collection_id_82f45d33 ON public.site_sitesettings USING btree (homepage_collection_id);


--
-- Name: site_sitesettings_top_menu_id_ab6f8c46; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX site_sitesettings_top_menu_id_ab6f8c46 ON public.site_sitesettings USING btree (top_menu_id);


--
-- Name: site_sitesettingstranslation_site_settings_id_ca085ff6; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX site_sitesettingstranslation_site_settings_id_ca085ff6 ON public.site_sitesettingstranslation USING btree (site_settings_id);


--
-- Name: social_auth_code_code_a2393167; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX social_auth_code_code_a2393167 ON public.social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX social_auth_code_code_a2393167_like ON public.social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_code_timestamp_176b341f; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX social_auth_code_timestamp_176b341f ON public.social_auth_code USING btree ("timestamp");


--
-- Name: social_auth_partial_timestamp_50f2119f; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX social_auth_partial_timestamp_50f2119f ON public.social_auth_partial USING btree ("timestamp");


--
-- Name: social_auth_partial_token_3017fea3; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX social_auth_partial_token_3017fea3 ON public.social_auth_partial USING btree (token);


--
-- Name: social_auth_partial_token_3017fea3_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX social_auth_partial_token_3017fea3_like ON public.social_auth_partial USING btree (token varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_user_id_17d28448; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX social_auth_usersocialauth_user_id_17d28448 ON public.social_auth_usersocialauth USING btree (user_id);


--
-- Name: userprofile_user_addresses_address_id_ad7646b4; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX userprofile_user_addresses_address_id_ad7646b4 ON public.account_user_addresses USING btree (address_id);


--
-- Name: userprofile_user_addresses_user_id_bb5aa55e; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX userprofile_user_addresses_user_id_bb5aa55e ON public.account_user_addresses USING btree (user_id);


--
-- Name: userprofile_user_default_billing_address_id_0489abf1; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX userprofile_user_default_billing_address_id_0489abf1 ON public.account_user USING btree (default_billing_address_id);


--
-- Name: userprofile_user_default_shipping_address_id_aae7a203; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX userprofile_user_default_shipping_address_id_aae7a203 ON public.account_user USING btree (default_shipping_address_id);


--
-- Name: userprofile_user_email_b0fb0137_like; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX userprofile_user_email_b0fb0137_like ON public.account_user USING btree (email varchar_pattern_ops);


--
-- Name: userprofile_user_groups_group_id_c7eec74e; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX userprofile_user_groups_group_id_c7eec74e ON public.account_user_groups USING btree (group_id);


--
-- Name: userprofile_user_groups_user_id_5e712a24; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX userprofile_user_groups_user_id_5e712a24 ON public.account_user_groups USING btree (user_id);


--
-- Name: userprofile_user_user_permissions_permission_id_1caa8a71; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX userprofile_user_user_permissions_permission_id_1caa8a71 ON public.account_user_user_permissions USING btree (permission_id);


--
-- Name: userprofile_user_user_permissions_user_id_6d654469; Type: INDEX; Schema: public; Owner: saleor
--

CREATE INDEX userprofile_user_user_permissions_user_id_6d654469 ON public.account_user_user_permissions USING btree (user_id);


--
-- Name: account_customernote account_customernote_customer_id_ec50cbf6_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_customernote
    ADD CONSTRAINT account_customernote_customer_id_ec50cbf6_fk_account_user_id FOREIGN KEY (customer_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_customernote account_customernote_user_id_b10a6c14_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_customernote
    ADD CONSTRAINT account_customernote_user_id_b10a6c14_fk_account_user_id FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user_addresses account_user_address_address_id_d218822a_fk_account_a; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_addresses
    ADD CONSTRAINT account_user_address_address_id_d218822a_fk_account_a FOREIGN KEY (address_id) REFERENCES public.account_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user_addresses account_user_addresses_user_id_2fcc8301_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_addresses
    ADD CONSTRAINT account_user_addresses_user_id_2fcc8301_fk_account_user_id FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: checkout_cart cart_cart_billing_address_id_9eb62ddd_fk_account_address_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.checkout_cart
    ADD CONSTRAINT cart_cart_billing_address_id_9eb62ddd_fk_account_address_id FOREIGN KEY (billing_address_id) REFERENCES public.account_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: checkout_cart cart_cart_shipping_address_id_adfddaf9_fk_account_address_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.checkout_cart
    ADD CONSTRAINT cart_cart_shipping_address_id_adfddaf9_fk_account_address_id FOREIGN KEY (shipping_address_id) REFERENCES public.account_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: checkout_cart cart_cart_shipping_method_id_835c02e0_fk_shipping_; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.checkout_cart
    ADD CONSTRAINT cart_cart_shipping_method_id_835c02e0_fk_shipping_ FOREIGN KEY (shipping_method_id) REFERENCES public.shipping_shippingmethodcountry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: checkout_cart cart_cart_user_id_9b4220b9_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.checkout_cart
    ADD CONSTRAINT cart_cart_user_id_9b4220b9_fk_account_user_id FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: checkout_cartline cart_cartline_cart_id_c7b9981e_fk_cart_cart_token; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.checkout_cartline
    ADD CONSTRAINT cart_cartline_cart_id_c7b9981e_fk_cart_cart_token FOREIGN KEY (cart_id) REFERENCES public.checkout_cart(token) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: checkout_cartline cart_cartline_variant_id_dbca56c9_fk_product_productvariant_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.checkout_cartline
    ADD CONSTRAINT cart_cartline_variant_id_dbca56c9_fk_product_productvariant_id FOREIGN KEY (variant_id) REFERENCES public.product_productvariant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_code_codeitem contentitem_code_cod_contentitem_ptr_id_72bbe1af_fk_fluent_co; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.contentitem_code_codeitem
    ADD CONSTRAINT contentitem_code_cod_contentitem_ptr_id_72bbe1af_fk_fluent_co FOREIGN KEY (contentitem_ptr_id) REFERENCES public.fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_iframe_iframeitem contentitem_iframe_i_contentitem_ptr_id_115f19ef_fk_fluent_co; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.contentitem_iframe_iframeitem
    ADD CONSTRAINT contentitem_iframe_i_contentitem_ptr_id_115f19ef_fk_fluent_co FOREIGN KEY (contentitem_ptr_id) REFERENCES public.fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_markup_markupitem contentitem_markup_m_contentitem_ptr_id_64ef0d49_fk_fluent_co; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.contentitem_markup_markupitem
    ADD CONSTRAINT contentitem_markup_m_contentitem_ptr_id_64ef0d49_fk_fluent_co FOREIGN KEY (contentitem_ptr_id) REFERENCES public.fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_rawhtml_rawhtmlitem contentitem_rawhtml__contentitem_ptr_id_a20d2b03_fk_fluent_co; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.contentitem_rawhtml_rawhtmlitem
    ADD CONSTRAINT contentitem_rawhtml__contentitem_ptr_id_a20d2b03_fk_fluent_co FOREIGN KEY (contentitem_ptr_id) REFERENCES public.fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_sharedcontent_sharedcontentitem contentitem_sharedco_contentitem_ptr_id_48add792_fk_fluent_co; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.contentitem_sharedcontent_sharedcontentitem
    ADD CONSTRAINT contentitem_sharedco_contentitem_ptr_id_48add792_fk_fluent_co FOREIGN KEY (contentitem_ptr_id) REFERENCES public.fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_sharedcontent_sharedcontentitem contentitem_sharedco_shared_content_id_0333a198_fk_sharedcon; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.contentitem_sharedcontent_sharedcontentitem
    ADD CONSTRAINT contentitem_sharedco_shared_content_id_0333a198_fk_sharedcon FOREIGN KEY (shared_content_id) REFERENCES public.sharedcontent_sharedcontent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: contentitem_text_textitem contentitem_text_tex_contentitem_ptr_id_dcbe22d0_fk_fluent_co; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.contentitem_text_textitem
    ADD CONSTRAINT contentitem_text_tex_contentitem_ptr_id_dcbe22d0_fk_fluent_co FOREIGN KEY (contentitem_ptr_id) REFERENCES public.fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: discount_sale_categories discount_sale_catego_category_id_64e132af_fk_product_c; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_categories
    ADD CONSTRAINT discount_sale_catego_category_id_64e132af_fk_product_c FOREIGN KEY (category_id) REFERENCES public.product_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: discount_sale_categories discount_sale_categories_sale_id_2aeee4a7_fk_discount_sale_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_categories
    ADD CONSTRAINT discount_sale_categories_sale_id_2aeee4a7_fk_discount_sale_id FOREIGN KEY (sale_id) REFERENCES public.discount_sale(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: discount_sale_collections discount_sale_collec_collection_id_f66df9d7_fk_product_c; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_collections
    ADD CONSTRAINT discount_sale_collec_collection_id_f66df9d7_fk_product_c FOREIGN KEY (collection_id) REFERENCES public.product_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: discount_sale_collections discount_sale_collections_sale_id_a912da4a_fk_discount_sale_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_collections
    ADD CONSTRAINT discount_sale_collections_sale_id_a912da4a_fk_discount_sale_id FOREIGN KEY (sale_id) REFERENCES public.discount_sale(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: discount_sale_products discount_sale_produc_product_id_d42c9636_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_products
    ADD CONSTRAINT discount_sale_produc_product_id_d42c9636_fk_product_p FOREIGN KEY (product_id) REFERENCES public.product_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: discount_sale_products discount_sale_products_sale_id_10e3a20f_fk_discount_sale_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_sale_products
    ADD CONSTRAINT discount_sale_products_sale_id_10e3a20f_fk_discount_sale_id FOREIGN KEY (sale_id) REFERENCES public.discount_sale(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: discount_voucher_categories discount_voucher_cat_category_id_fc9d044a_fk_product_c; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_categories
    ADD CONSTRAINT discount_voucher_cat_category_id_fc9d044a_fk_product_c FOREIGN KEY (category_id) REFERENCES public.product_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: discount_voucher_categories discount_voucher_cat_voucher_id_19a56338_fk_discount_; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_categories
    ADD CONSTRAINT discount_voucher_cat_voucher_id_19a56338_fk_discount_ FOREIGN KEY (voucher_id) REFERENCES public.discount_voucher(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: discount_voucher_collections discount_voucher_col_collection_id_b9de6b54_fk_product_c; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_collections
    ADD CONSTRAINT discount_voucher_col_collection_id_b9de6b54_fk_product_c FOREIGN KEY (collection_id) REFERENCES public.product_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: discount_voucher_collections discount_voucher_col_voucher_id_4ce1fde3_fk_discount_; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_collections
    ADD CONSTRAINT discount_voucher_col_voucher_id_4ce1fde3_fk_discount_ FOREIGN KEY (voucher_id) REFERENCES public.discount_voucher(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: discount_voucher_products discount_voucher_pro_product_id_4a3131ff_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_products
    ADD CONSTRAINT discount_voucher_pro_product_id_4a3131ff_fk_product_p FOREIGN KEY (product_id) REFERENCES public.product_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: discount_voucher_products discount_voucher_pro_voucher_id_8a2e6c3a_fk_discount_; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_voucher_products
    ADD CONSTRAINT discount_voucher_pro_voucher_id_8a2e6c3a_fk_discount_ FOREIGN KEY (voucher_id) REFERENCES public.discount_voucher(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: discount_vouchertranslation discount_vouchertran_voucher_id_288246a9_fk_discount_; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.discount_vouchertranslation
    ADD CONSTRAINT discount_vouchertran_voucher_id_288246a9_fk_discount_ FOREIGN KEY (voucher_id) REFERENCES public.discount_voucher(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_account_user_id FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fluent_contents_contentitem fluent_contents_cont_parent_type_id_9a2fbcb3_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.fluent_contents_contentitem
    ADD CONSTRAINT fluent_contents_cont_parent_type_id_9a2fbcb3_fk_django_co FOREIGN KEY (parent_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fluent_contents_contentitem fluent_contents_cont_placeholder_id_fb2e98ff_fk_fluent_co; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.fluent_contents_contentitem
    ADD CONSTRAINT fluent_contents_cont_placeholder_id_fb2e98ff_fk_fluent_co FOREIGN KEY (placeholder_id) REFERENCES public.fluent_contents_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fluent_contents_contentitem fluent_contents_cont_polymorphic_ctype_id_8989bd3f_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.fluent_contents_contentitem
    ADD CONSTRAINT fluent_contents_cont_polymorphic_ctype_id_8989bd3f_fk_django_co FOREIGN KEY (polymorphic_ctype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fluent_contents_placeholder fluent_contents_plac_parent_type_id_01f70240_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.fluent_contents_placeholder
    ADD CONSTRAINT fluent_contents_plac_parent_type_id_01f70240_fk_django_co FOREIGN KEY (parent_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: impersonate_impersonationlog impersonate_imperson_impersonating_id_afd114fc_fk_account_u; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.impersonate_impersonationlog
    ADD CONSTRAINT impersonate_imperson_impersonating_id_afd114fc_fk_account_u FOREIGN KEY (impersonating_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: impersonate_impersonationlog impersonate_imperson_impersonator_id_1ecfe8ce_fk_account_u; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.impersonate_impersonationlog
    ADD CONSTRAINT impersonate_imperson_impersonator_id_1ecfe8ce_fk_account_u FOREIGN KEY (impersonator_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: menu_menuitem menu_menuitem_category_id_af353a3b_fk_product_category_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.menu_menuitem
    ADD CONSTRAINT menu_menuitem_category_id_af353a3b_fk_product_category_id FOREIGN KEY (category_id) REFERENCES public.product_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: menu_menuitem menu_menuitem_collection_id_b913b19e_fk_product_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.menu_menuitem
    ADD CONSTRAINT menu_menuitem_collection_id_b913b19e_fk_product_collection_id FOREIGN KEY (collection_id) REFERENCES public.product_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: menu_menuitem menu_menuitem_menu_id_f466b139_fk_menu_menu_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.menu_menuitem
    ADD CONSTRAINT menu_menuitem_menu_id_f466b139_fk_menu_menu_id FOREIGN KEY (menu_id) REFERENCES public.menu_menu(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: menu_menuitem menu_menuitem_page_id_a0c8f92d_fk_page_page_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.menu_menuitem
    ADD CONSTRAINT menu_menuitem_page_id_a0c8f92d_fk_page_page_id FOREIGN KEY (page_id) REFERENCES public.page_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: menu_menuitem menu_menuitem_parent_id_439f55a5_fk_menu_menuitem_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.menu_menuitem
    ADD CONSTRAINT menu_menuitem_parent_id_439f55a5_fk_menu_menuitem_id FOREIGN KEY (parent_id) REFERENCES public.menu_menuitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: menu_menuitemtranslation menu_menuitemtransla_menu_item_id_3445926c_fk_menu_menu; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.menu_menuitemtranslation
    ADD CONSTRAINT menu_menuitemtransla_menu_item_id_3445926c_fk_menu_menu FOREIGN KEY (menu_item_id) REFERENCES public.menu_menuitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_fulfillment order_fulfillment_order_id_02695111_fk_order_order_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_fulfillment
    ADD CONSTRAINT order_fulfillment_order_id_02695111_fk_order_order_id FOREIGN KEY (order_id) REFERENCES public.order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_fulfillmentline order_fulfillmentlin_fulfillment_id_68f3291d_fk_order_ful; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_fulfillmentline
    ADD CONSTRAINT order_fulfillmentlin_fulfillment_id_68f3291d_fk_order_ful FOREIGN KEY (fulfillment_id) REFERENCES public.order_fulfillment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_fulfillmentline order_fulfillmentlin_order_line_id_7d40e054_fk_order_ord; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_fulfillmentline
    ADD CONSTRAINT order_fulfillmentlin_order_line_id_7d40e054_fk_order_ord FOREIGN KEY (order_line_id) REFERENCES public.order_orderline(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order order_order_billing_address_id_8fe537cf_fk_account_address_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_billing_address_id_8fe537cf_fk_account_address_id FOREIGN KEY (billing_address_id) REFERENCES public.account_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order order_order_shipping_address_id_57e64931_fk_account_address_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_shipping_address_id_57e64931_fk_account_address_id FOREIGN KEY (shipping_address_id) REFERENCES public.account_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order order_order_shipping_method_id_2a742834_fk_shipping_; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_shipping_method_id_2a742834_fk_shipping_ FOREIGN KEY (shipping_method_id) REFERENCES public.shipping_shippingmethodcountry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order order_order_user_id_7cf9bc2b_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_user_id_7cf9bc2b_fk_account_user_id FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order order_order_voucher_id_0748ca22_fk_discount_voucher_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_voucher_id_0748ca22_fk_discount_voucher_id FOREIGN KEY (voucher_id) REFERENCES public.discount_voucher(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_orderhistoryentry order_orderhistoryentry_order_id_ea3bf4c4_fk_order_order_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_orderhistoryentry
    ADD CONSTRAINT order_orderhistoryentry_order_id_ea3bf4c4_fk_order_order_id FOREIGN KEY (order_id) REFERENCES public.order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_orderhistoryentry order_orderhistoryentry_user_id_1070bf50_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_orderhistoryentry
    ADD CONSTRAINT order_orderhistoryentry_user_id_1070bf50_fk_account_user_id FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_orderline order_orderline_order_id_eb04ec2d_fk_order_order_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_orderline
    ADD CONSTRAINT order_orderline_order_id_eb04ec2d_fk_order_order_id FOREIGN KEY (order_id) REFERENCES public.order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_orderline order_orderline_variant_id_866774cb_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_orderline
    ADD CONSTRAINT order_orderline_variant_id_866774cb_fk_product_p FOREIGN KEY (variant_id) REFERENCES public.product_productvariant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_ordernote order_ordernote_order_id_7d97583d_fk_order_order_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_ordernote
    ADD CONSTRAINT order_ordernote_order_id_7d97583d_fk_order_order_id FOREIGN KEY (order_id) REFERENCES public.order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_ordernote order_ordernote_user_id_48d7a672_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_ordernote
    ADD CONSTRAINT order_ordernote_user_id_48d7a672_fk_account_user_id FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_payment order_payment_order_id_588933b6_fk_order_order_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.order_payment
    ADD CONSTRAINT order_payment_order_id_588933b6_fk_order_order_id FOREIGN KEY (order_id) REFERENCES public.order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: page_pagetranslation page_pagetranslation_page_id_60216ef5_fk_page_page_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.page_pagetranslation
    ADD CONSTRAINT page_pagetranslation_page_id_60216ef5_fk_page_page_id FOREIGN KEY (page_id) REFERENCES public.page_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_attributechoicevaluetranslation product_attributecho_attribute_choice_val_71c4c0a7_fk_product_a; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributechoicevaluetranslation
    ADD CONSTRAINT product_attributecho_attribute_choice_val_71c4c0a7_fk_product_a FOREIGN KEY (attribute_choice_value_id) REFERENCES public.product_attributechoicevalue(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_attributechoicevalue product_attributecho_attribute_id_c28c6c92_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_attributechoicevalue
    ADD CONSTRAINT product_attributecho_attribute_id_c28c6c92_fk_product_p FOREIGN KEY (attribute_id) REFERENCES public.product_productattribute(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_category product_category_parent_id_f6860923_fk_product_category_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_parent_id_f6860923_fk_product_category_id FOREIGN KEY (parent_id) REFERENCES public.product_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_categorytranslation product_categorytran_category_id_aa8d0917_fk_product_c; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_categorytranslation
    ADD CONSTRAINT product_categorytran_category_id_aa8d0917_fk_product_c FOREIGN KEY (category_id) REFERENCES public.product_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_collection_products product_collection_p_collection_id_0bc817dc_fk_product_c; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_collection_products
    ADD CONSTRAINT product_collection_p_collection_id_0bc817dc_fk_product_c FOREIGN KEY (collection_id) REFERENCES public.product_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_collection_products product_collection_p_product_id_a45a5b06_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_collection_products
    ADD CONSTRAINT product_collection_p_product_id_a45a5b06_fk_product_p FOREIGN KEY (product_id) REFERENCES public.product_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_collectiontranslation product_collectiontr_collection_id_cfbbd453_fk_product_c; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_collectiontranslation
    ADD CONSTRAINT product_collectiontr_collection_id_cfbbd453_fk_product_c FOREIGN KEY (collection_id) REFERENCES public.product_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_product product_product_category_id_0c725779_fk_product_category_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_product
    ADD CONSTRAINT product_product_category_id_0c725779_fk_product_category_id FOREIGN KEY (category_id) REFERENCES public.product_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_product product_product_product_type_id_4bfbbfda_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_product
    ADD CONSTRAINT product_product_product_type_id_4bfbbfda_fk_product_p FOREIGN KEY (product_type_id) REFERENCES public.product_producttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_productattributetranslation product_productattri_product_attribute_id_56b48511_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productattributetranslation
    ADD CONSTRAINT product_productattri_product_attribute_id_56b48511_fk_product_p FOREIGN KEY (product_attribute_id) REFERENCES public.product_productattribute(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_productimage product_productimage_image_id_bb48efd0_fk_product_imagedata_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productimage
    ADD CONSTRAINT product_productimage_image_id_bb48efd0_fk_product_imagedata_id FOREIGN KEY (image_id) REFERENCES public.product_imagedata(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_productimage product_productimage_product_id_544084bb_fk_product_product_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productimage
    ADD CONSTRAINT product_productimage_product_id_544084bb_fk_product_product_id FOREIGN KEY (product_id) REFERENCES public.product_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_producttranslation product_producttrans_product_id_2c2c7532_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_producttranslation
    ADD CONSTRAINT product_producttrans_product_id_2c2c7532_fk_product_p FOREIGN KEY (product_id) REFERENCES public.product_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_producttype_variant_attributes product_producttype__productattribute_id_b8d262c5_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_producttype_variant_attributes
    ADD CONSTRAINT product_producttype__productattribute_id_b8d262c5_fk_product_p FOREIGN KEY (productattribute_id) REFERENCES public.product_productattribute(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_producttype_product_attributes product_producttype__productattribute_id_bae1e1f2_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_producttype_product_attributes
    ADD CONSTRAINT product_producttype__productattribute_id_bae1e1f2_fk_product_p FOREIGN KEY (productattribute_id) REFERENCES public.product_productattribute(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_producttype_product_attributes product_producttype__producttype_id_20645558_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_producttype_product_attributes
    ADD CONSTRAINT product_producttype__producttype_id_20645558_fk_product_p FOREIGN KEY (producttype_id) REFERENCES public.product_producttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_producttype_variant_attributes product_producttype__producttype_id_a66f591a_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_producttype_variant_attributes
    ADD CONSTRAINT product_producttype__producttype_id_a66f591a_fk_product_p FOREIGN KEY (producttype_id) REFERENCES public.product_producttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_productvariant product_productvaria_product_id_43c5a310_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productvariant
    ADD CONSTRAINT product_productvaria_product_id_43c5a310_fk_product_p FOREIGN KEY (product_id) REFERENCES public.product_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_productvarianttranslation product_productvaria_product_variant_id_1b144a85_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_productvarianttranslation
    ADD CONSTRAINT product_productvaria_product_variant_id_1b144a85_fk_product_p FOREIGN KEY (product_variant_id) REFERENCES public.product_productvariant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_variantimage product_variantimage_image_id_bef14106_fk_product_imagedata_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_variantimage
    ADD CONSTRAINT product_variantimage_image_id_bef14106_fk_product_imagedata_id FOREIGN KEY (image_id) REFERENCES public.product_imagedata(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: product_variantimage product_variantimage_variant_id_81123814_fk_product_p; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.product_variantimage
    ADD CONSTRAINT product_variantimage_variant_id_81123814_fk_product_p FOREIGN KEY (variant_id) REFERENCES public.product_productvariant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sharedcontent_sharedcontent_translation sharedcontent_shared_master_id_ff437c98_fk_sharedcon; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.sharedcontent_sharedcontent_translation
    ADD CONSTRAINT sharedcontent_shared_master_id_ff437c98_fk_sharedcon FOREIGN KEY (master_id) REFERENCES public.sharedcontent_sharedcontent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sharedcontent_sharedcontent sharedcontent_shared_parent_site_id_c9ee0f73_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.sharedcontent_sharedcontent
    ADD CONSTRAINT sharedcontent_shared_parent_site_id_c9ee0f73_fk_django_si FOREIGN KEY (parent_site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shipping_shippingmethodcountry shipping_shippingmet_shipping_method_id_9b026f8b_fk_shipping_; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.shipping_shippingmethodcountry
    ADD CONSTRAINT shipping_shippingmet_shipping_method_id_9b026f8b_fk_shipping_ FOREIGN KEY (shipping_method_id) REFERENCES public.shipping_shippingmethod(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_authorizationkey site_authorizationke_site_settings_id_d8397c0f_fk_site_site; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_authorizationkey
    ADD CONSTRAINT site_authorizationke_site_settings_id_d8397c0f_fk_site_site FOREIGN KEY (site_settings_id) REFERENCES public.site_sitesettings(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_sitesettings site_sitesettings_bottom_menu_id_e2a78098_fk_menu_menu_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_sitesettings
    ADD CONSTRAINT site_sitesettings_bottom_menu_id_e2a78098_fk_menu_menu_id FOREIGN KEY (bottom_menu_id) REFERENCES public.menu_menu(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_sitesettings site_sitesettings_homepage_collection__82f45d33_fk_product_c; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_sitesettings
    ADD CONSTRAINT site_sitesettings_homepage_collection__82f45d33_fk_product_c FOREIGN KEY (homepage_collection_id) REFERENCES public.product_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_sitesettings site_sitesettings_site_id_64dd8ff8_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_sitesettings
    ADD CONSTRAINT site_sitesettings_site_id_64dd8ff8_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_sitesettings site_sitesettings_top_menu_id_ab6f8c46_fk_menu_menu_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_sitesettings
    ADD CONSTRAINT site_sitesettings_top_menu_id_ab6f8c46_fk_menu_menu_id FOREIGN KEY (top_menu_id) REFERENCES public.menu_menu(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: site_sitesettingstranslation site_sitesettingstra_site_settings_id_ca085ff6_fk_site_site; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.site_sitesettingstranslation
    ADD CONSTRAINT site_sitesettingstra_site_settings_id_ca085ff6_fk_site_site FOREIGN KEY (site_settings_id) REFERENCES public.site_sitesettings(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_user_id_17d28448_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_account_user_id FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user userprofile_user_default_billing_addr_0489abf1_fk_userprofi; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user
    ADD CONSTRAINT userprofile_user_default_billing_addr_0489abf1_fk_userprofi FOREIGN KEY (default_billing_address_id) REFERENCES public.account_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user userprofile_user_default_shipping_add_aae7a203_fk_userprofi; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user
    ADD CONSTRAINT userprofile_user_default_shipping_add_aae7a203_fk_userprofi FOREIGN KEY (default_shipping_address_id) REFERENCES public.account_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user_groups userprofile_user_groups_group_id_c7eec74e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_groups
    ADD CONSTRAINT userprofile_user_groups_group_id_c7eec74e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user_groups userprofile_user_groups_user_id_5e712a24_fk_userprofile_user_id; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_groups
    ADD CONSTRAINT userprofile_user_groups_user_id_5e712a24_fk_userprofile_user_id FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user_user_permissions userprofile_user_use_permission_id_1caa8a71_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_user_permissions
    ADD CONSTRAINT userprofile_user_use_permission_id_1caa8a71_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user_user_permissions userprofile_user_use_user_id_6d654469_fk_userprofi; Type: FK CONSTRAINT; Schema: public; Owner: saleor
--

ALTER TABLE ONLY public.account_user_user_permissions
    ADD CONSTRAINT userprofile_user_use_user_id_6d654469_fk_userprofi FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

