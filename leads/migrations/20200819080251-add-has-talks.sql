
-- +migrate Up
ALTER TABLE leads ADD COLUMN has_talks BOOLEAN DEFAULT FALSE;

-- +migrate Down

ALTER TABLE leads DROP COLUMN has_talks;