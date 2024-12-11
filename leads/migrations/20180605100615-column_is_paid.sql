
-- +migrate Up
ALTER TABLE leads ADD COLUMN is_paid BOOLEAN DEFAULT FALSE;
-- +migrate Down
ALTER TABLE leads DROP COLUMN is_paid;