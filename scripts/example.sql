-- Insert sample users
INSERT INTO Users (name, email, tags) VALUES
('Alice', 'alice@example.com', ARRAY['reading', 'gaming']),
('Bob', 'bob@example.com', ARRAY['gaming', 'traveling']),
('Charlie', 'charlie@example.com', ARRAY['reading', 'photography']);

-- Insert sample chats
INSERT INTO Chats (user1_id, user2_id, tag) VALUES
(1, 2, 'gaming'),
(1, 3, 'reading');

-- Insert sample messages
INSERT INTO Messages (chat_id, sender_id, message) VALUES
(1, 1, 'Hi Bob!'),
(1, 2, 'Hello Alice!'),
(2, 1, 'Hey Charlie!'),
(2, 3, 'Hi Alice!');

-- Insert sample login codes
INSERT INTO LoginCodes (email, code, expires_at) VALUES
('alice@example.com', '123456', NOW() + INTERVAL '5 minutes'),
('bob@example.com', '654321', NOW() + INTERVAL '5 minutes');
