
-- +migrate Up
ALTER TABLE chatbot_bindings ADD COLUMN tg_username VARCHAR(255);
ALTER TABLE chatbot_bindings ADD COLUMN last_interaction TIMESTAMP;
ALTER TABLE chatbot_bindings ADD COLUMN free_for_sure BOOLEAN DEFAULT FALSE;

-- +migrate Down
ALTER TABLE chatbot_bindings DROP COLUMN tg_username;
ALTER TABLE chatbot_bindings DROP COLUMN last_interaction;
ALTER TABLE chatbot_bindings DROP COLUMN free_for_sure;