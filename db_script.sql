-- Database: fitness_platform

DROP DATABASE IF EXISTS fitness_platform;

CREATE DATABASE fitness_platform
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- User Credential Table
CREATE TABLE public.credentials
(
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);

ALTER TABLE IF EXISTS public.credentials
    OWNER to postgres;

-- Add admin information
INSERT INTO public.credentials
VALUES ('admin', 'password')

-- Workout Plans Table
CREATE TABLE workout_plans (
    plan_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),  
    goal VARCHAR(255),
    fitness_level VARCHAR(50),              
    equipment_required BOOLEAN DEFAULT FALSE,
    plan_name VARCHAR(100) NOT NULL,         
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Badges Table
