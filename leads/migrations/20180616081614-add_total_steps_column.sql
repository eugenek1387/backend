
-- +migrate Up
ALTER TABLE leads ADD COLUMN total_steps INT;
-- +migrate Down
ALTER TABLE leads DROP COLUMN total_steps;
