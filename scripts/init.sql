CREATE DATABASE shared_tags_db;

-- Create the Users table
CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    tags TEXT[] -- Array of hobbies (e.g., ["reading", "gaming", "traveling"])
);

-- Create the Chats table
CREATE TABLE Chats (
    id SERIAL PRIMARY KEY,
    user1_id INT NOT NULL,
    user2_id INT NOT NULL,
    tag VARCHAR(255) NOT NULL, -- Hobby/tag for the chat
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user1_id) REFERENCES Users(id) ON DELETE CASCADE,
    FOREIGN KEY (user2_id) REFERENCES Users(id) ON DELETE CASCADE
);

-- Create the Messages table
CREATE TABLE Messages (
    id SERIAL PRIMARY KEY,
    chat_id INT NOT NULL,
    sender_id INT NOT NULL,
    message TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (chat_id) REFERENCES Chats(id) ON DELETE CASCADE,
    FOREIGN KEY (sender_id) REFERENCES Users(id) ON DELETE CASCADE
);

-- Create the LoginCodes table
CREATE TABLE LoginCodes (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    code VARCHAR(6) NOT NULL, -- Short digit code
    expires_at TIMESTAMP NOT NULL, -- Timestamp for code expiration
    FOREIGN KEY (email) REFERENCES Users(email) ON DELETE CASCADE
);

-- Indexes for better performance
CREATE INDEX idx_users_email ON Users(email);
CREATE INDEX idx_chats_user1_id ON Chats(user1_id);
CREATE INDEX idx_chats_user2_id ON Chats(user2_id);
CREATE INDEX idx_messages_chat_id ON Messages(chat_id);
CREATE INDEX idx_messages_sender_id ON Messages(sender_id);
CREATE INDEX idx_logincodes_email ON LoginCodes(email);
