CREATE TABLE patients(
    id  INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    date_of_birth DATE,
    PRIMARY KEY(id)
);

CREATE TABLE treatments(
    id  INT GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(255),
    name VARCHAR(255),
    PRIMARY KEY(id)
);

CREATE TABLE treatments(
    id  INT GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(255),
    name VARCHAR(255),
    PRIMARY KEY(id)
);


CREATE TABLE medical_histories_treatments(
    id  INT GENERATED ALWAYS AS IDENTITY,
    medical_histories_id INT,
    treatments_id INT,
    UNIQUE(id)
);