-- ==================== database.sql ====================
CREATE DATABASE IF NOT EXISTS parfums_shop;
USE parfums_shop;

-- Table Administrateur
CREATE TABLE administrateur (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);
INSERT INTO administrateur (nom, password) VALUES ('admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'); -- password: admin123

-- Table Matériel (produits = parfums)
CREATE TABLE materiel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    description TEXT,
    prix DECIMAL(10,2) NOT NULL,
    prix_achat DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    image VARCHAR(255) DEFAULT 'default.jpg',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sample parfums
INSERT INTO materiel (nom, description, prix, prix_achat, stock, image) VALUES
('Armani Code', 'Élégant et sophistiqué, notes d\'agrumes et de cuir.', 89.99, 45.00, 15, 'armani.jpg'),
('Coco Mademoiselle', 'Frais et oriental, notes de fleur d\'oranger et de patchouli.', 120.00, 65.00, 8, 'coco.jpg'),
('Sauvage Dior', 'Fraîcheur audacieuse, notes de bergamote et d\'ambroxan.', 99.99, 55.00, 12, 'sauvage.jpg'),
('La Vie Est Belle', 'Doux et gourmand, iris et patchouli.', 110.00, 60.00, 5, 'lavie.jpg'),
('Acqua di Gio', 'Marin et aromatique, jasmin et romarin.', 79.99, 40.00, 20, 'acquagio.jpg');

-- Table Client
CREATE TABLE client (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    adresse TEXT,
    telephone VARCHAR(20),
    date_inscription TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table commande_client (entête)
CREATE TABLE commande_client (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    date_commande TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2) NOT NULL,
    statut ENUM('en_attente','validee','annulee') DEFAULT 'validee',
    FOREIGN KEY (client_id) REFERENCES client(id) ON DELETE CASCADE
);

-- Table commande_lignes (détails)
CREATE TABLE commande_lignes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    commande_id INT NOT NULL,
    produit_id INT NOT NULL,
    quantite INT NOT NULL,
    prix_unitaire DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (commande_id) REFERENCES commande_client(id) ON DELETE CASCADE,
    FOREIGN KEY (produit_id) REFERENCES materiel(id)
);