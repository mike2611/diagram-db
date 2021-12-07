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


CREATE TABLE medical_histories_treatments(
    id  INT GENERATED ALWAYS AS IDENTITY,
    medical_histories_id INT,
    treatments_id INT,
    UNIQUE(id)
);


CREATE TABLE medical_histories(
    id  INT GENERATED ALWAYS AS IDENTITY,
    admited_at TIMESTAMP,
    patient_id INT,
    status VARCHAR(255),
    PRIMARY KEY(id)
);

CREATE TABLE invoices(
    id  INT GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    PRIMARY KEY(id)
);

CREATE TABLE invoice_items(
    id  INT GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
    PRIMARY KEY(id)
);


ALTER TABLE invoice_items 
ADD CONSTRAINT fk_invoice_id 
FOREIGN KEY (invoice_id) 
REFERENCES invoices (id);

ALTER TABLE invoice_items 
ADD CONSTRAINT fk_treatment_id 
FOREIGN KEY (treatment_id) 
REFERENCES treatments (id);


ALTER TABLE medical_histories 
ADD CONSTRAINT fk_patient_id
FOREIGN KEY (patient_id) 
REFERENCES patients (id);


ALTER TABLE medical_histories_treatments 
ADD CONSTRAINT fk_medical_histories_id
FOREIGN KEY (medical_histories_id) 
REFERENCES medical_histories (id);


ALTER TABLE medical_histories_treatments 
ADD CONSTRAINT fk_treatments_id
FOREIGN KEY (treatments_id) 
REFERENCES treatments (id);