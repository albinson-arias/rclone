BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "board_pixels" ADD COLUMN "username" text NOT NULL DEFAULT ''::text;
CREATE INDEX "pixel_user" ON "board_pixels" USING btree ("username");

--
-- MIGRATION VERSION FOR rclone
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('rclone', '20241024230109881', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241024230109881', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
