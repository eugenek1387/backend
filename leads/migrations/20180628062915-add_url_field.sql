
-- +migrate Up
ALTER TABLE leads ADD COLUMN url VARCHAR(2000);
-- +migrate Down
ALTER TABLE leads DROP COLUMN url;