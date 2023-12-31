-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public."CAUTHU"
(
    "MaCauThu" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1000 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "TenCauThu" character varying(150) COLLATE pg_catalog."default" NOT NULL,
    "NgaySinh" date NOT NULL,
    "MaLoaiCauThu" integer NOT NULL,
    "MaDoi" integer NOT NULL,
    "GhiBan" integer,
    "NgoaiQuoc" boolean NOT NULL DEFAULT false,
    CONSTRAINT "CAUTHU_pkey" PRIMARY KEY ("MaCauThu")
);

CREATE TABLE IF NOT EXISTS public."DOI"
(
    "MaDoi" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1000 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "TenDoi" character varying(150) COLLATE pg_catalog."default" NOT NULL,
    "MaSan" integer NOT NULL,
    "SoCauThu" integer NOT NULL,
    CONSTRAINT "DOI_pkey" PRIMARY KEY ("MaDoi")
);

CREATE TABLE IF NOT EXISTS public."GHIBAN"
(
    "MaBanThang" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1000 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "MaTranDau" integer NOT NULL,
    "MaCauThu" integer NOT NULL,
    "ThoiDiem" integer NOT NULL,
    "MaLoaiBanThang" integer NOT NULL,
    CONSTRAINT "GHIBAN_pkey" PRIMARY KEY ("MaBanThang")
);

CREATE TABLE IF NOT EXISTS public."LOAIBANTHANG"
(
    "MaLoaiBanThang" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1000 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "TenLoaiBanThang" character varying(40) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "LOAIBANTHANG_pkey" PRIMARY KEY ("MaLoaiBanThang")
);

CREATE TABLE IF NOT EXISTS public."LOAICAUTHU"
(
    "MaLoaiCauThu" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1000 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "TenLoaiCauThu" character varying(40) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "LOAICAUTHU_pkey" PRIMARY KEY ("MaLoaiCauThu")
);

CREATE TABLE IF NOT EXISTS public."RANKING"
(
    "MaDoi" integer NOT NULL,
    "SoTranThang" integer,
    "SoTranHoa" integer,
    "SoTranThua" integer,
    "HieuSo" integer,
    "Rank" integer,
    CONSTRAINT "RANKING_pkey" PRIMARY KEY ("MaDoi")
);

CREATE TABLE IF NOT EXISTS public."SAN"
(
    "MaSan" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1000 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "TenSan" character varying(150) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "SAN_pkey" PRIMARY KEY ("MaSan")
);

CREATE TABLE IF NOT EXISTS public."TAIKHOAN"
(
    "MaTK" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1000 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "TenTaiKhoanAdmin" character varying(10) COLLATE pg_catalog."default" NOT NULL,
    "MatKhau" character varying(128) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "TAIKHOAN_pkey" PRIMARY KEY ("MaTK")
);

CREATE TABLE IF NOT EXISTS public."THAMSO"
(
    "TuoiToiThieu" integer NOT NULL,
    "TuoiToiDa" integer NOT NULL,
    "SoCauthutoiThieu" integer NOT NULL,
    "SoCauThuNuocNgoaiToiDa" integer NOT NULL,
    "SoCauThuToiDa" integer NOT NULL,
    "TDGhiBanToithieu" integer NOT NULL,
    "TDGhiBanToiDa" integer NOT NULL,
    "DiemBanThang" integer NOT NULL,
    "DiemBanHoa" integer NOT NULL,
    "DiemBanThua" integer NOT NULL,
    "MaThamSo" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    CONSTRAINT "THAMSO_pkey" PRIMARY KEY ("MaThamSo")
);

CREATE TABLE IF NOT EXISTS public."TRANDAU"
(
    "MaTranDau" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1000 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "MaDoi1" integer NOT NULL,
    "MaDoi2" integer NOT NULL,
    "NgayGio" timestamp with time zone NOT NULL,
    "MaSan" integer NOT NULL,
    "VongDau" integer NOT NULL,
    "SoBanThangDoi1" integer,
    "SoBanThangDoi2" integer,
    CONSTRAINT "MaSan" PRIMARY KEY ("MaTranDau")
);

ALTER TABLE IF EXISTS public."CAUTHU"
    ADD CONSTRAINT "MaDoi" FOREIGN KEY ("MaDoi")
    REFERENCES public."DOI" ("MaDoi") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."CAUTHU"
    ADD CONSTRAINT "MaLoaiCauThu" FOREIGN KEY ("MaLoaiCauThu")
    REFERENCES public."LOAICAUTHU" ("MaLoaiCauThu") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."DOI"
    ADD CONSTRAINT "MaSan" FOREIGN KEY ("MaSan")
    REFERENCES public."SAN" ("MaSan") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."GHIBAN"
    ADD CONSTRAINT "MaCauThu" FOREIGN KEY ("MaCauThu")
    REFERENCES public."CAUTHU" ("MaCauThu") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."GHIBAN"
    ADD CONSTRAINT "MaLoaiBanThang" FOREIGN KEY ("MaLoaiBanThang")
    REFERENCES public."LOAIBANTHANG" ("MaLoaiBanThang") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."GHIBAN"
    ADD CONSTRAINT "MaTranDau" FOREIGN KEY ("MaTranDau")
    REFERENCES public."TRANDAU" ("MaTranDau") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."RANKING"
    ADD CONSTRAINT "MaDoi" FOREIGN KEY ("MaDoi")
    REFERENCES public."DOI" ("MaDoi") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS "RANKING_pkey"
    ON public."RANKING"("MaDoi");


ALTER TABLE IF EXISTS public."TRANDAU"
    ADD CONSTRAINT "MaDoi1" FOREIGN KEY ("MaDoi1")
    REFERENCES public."DOI" ("MaDoi") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."TRANDAU"
    ADD CONSTRAINT "MaDoi2" FOREIGN KEY ("MaDoi2")
    REFERENCES public."DOI" ("MaDoi") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."TRANDAU"
    ADD CONSTRAINT "Ma_San" FOREIGN KEY ("MaSan")
    REFERENCES public."SAN" ("MaSan") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;