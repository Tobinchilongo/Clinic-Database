CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL
);

CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    total_amount decimal not null,
    generated_at timestamp not null,
    payed_at timestamp not null,
    medical_history_id int not null
);

CREATE TABLE treatments (
    id SERIAL PRIMARY KEY,
    type VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY,
    unit_price decimal not null,
    quantity int not null,
    total_price decimal not null,
    invoice_id int not null,
    treatment_id int not null
);

CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY,
    admitted_at timestamp not null,
    patient_id int not null,
    status varchar(255) not null
);

ALTER TABLE medical_histories
    ADD CONSTRAINT patient_id_fk 
        FOREIGN KEY (patient_id) 
            REFERENCES patients(id);
ALTER TABLE invoices
    ADD CONSTRAINT medical_history_id_fk 
        FOREIGN KEY (medical_history_id) 
            REFERENCES medical_histories(id);

  ALTER TABLE invoice_items 
    ADD CONSTRAINT invoice_id_fk 
        FOREIGN KEY (invoice_id) 
            REFERENCES invoices(id);

    ALTER TABLE invoice_items
     ADD CONSTRAINT treatment_id_fk 
        FOREIGN KEY (treatment_id) 
            REFERENCES treatments(id);

      