
-- +migrate Up
ALTER TABLE leads ADD COLUMN bot_name VARCHAR(100);
ALTER TABLE leads ADD COLUMN chat_id BIGINT DEFAULT 0;

-- +migrate Down

ALTER TABLE leads DROP COLUMN bot_name;
ALTER TABLE leads DROP COLUMN chat_id;
