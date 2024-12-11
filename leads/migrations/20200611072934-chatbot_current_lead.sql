
-- +migrate Up
ALTER TABLE chatbot_bindings ADD COLUMN current_lead_id BIGINT DEFAULT 0;
ALTER TABLE chatbot_bindings DROP COLUMN free_for_sure;

-- +migrate Down
