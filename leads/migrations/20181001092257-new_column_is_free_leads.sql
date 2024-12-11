
-- +migrate Up
ALTER TABLE leads ADD COLUMN is_free BOOLEAN DEFAULT FALSE;
-- +migrate Down
ALTER TABLE leads DROP COLUMN is_free;