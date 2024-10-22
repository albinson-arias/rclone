BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "pixels" (
    "id" bigserial PRIMARY KEY,
    "x" double precision NOT NULL,
    "y" double precision NOT NULL,
    "color" text NOT NULL
);


--
-- MIGRATION VERSION FOR rclone
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('rclone', '20241022054253059', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241022054253059', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
