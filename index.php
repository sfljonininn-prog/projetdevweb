<?php
require_once 'config.php';
require_once 'header.php';

$featured = $conn->query("SELECT id, nom, prix, image FROM materiel LIMIT 6");
?>
<section class="home-hero">
    <div class="container">
        <h1 class="hero-title">Parfums d'exception</h1>
        <p>Découvrez l’art de la parfumerie fine, des senteurs uniques pour révéler votre élégance.</p>
        <div class="action-buttons">
            <a href="admin_login.php" class="btn">🔐 Administrateur</a>
            <a href="login.php" class="btn btn-secondary">👤 Utilisateur</a>
            <a href="mailto:contact@parfums.ma" class="btn email-btn">✉️ Nous écrire</a>
        </div>
    </div>
</section>

<div class="container">
    <h2 style="text-align:center; margin-bottom:20px;">Nos meilleures fragrances</h2>
    <div class="products-grid">
        <?php while($row = $featured->fetch_assoc()): ?>
        <div class="card">
            <a href="details.php?id=<?= $row['id'] ?>">
                <div class="product-img" style="background-image: url('images/<?= htmlspecialchars($row['image']) ?>');"></div>
            </a>
            <div class="product-info">
                <h3><?= htmlspecialchars($row['nom']) ?></h3>
                <div class="price"><?= number_format($row['prix'],2) ?> €</div>
                <a href="details.php?id=<?= $row['id'] ?>" class="btn">Détails</a>
            </div>
        </div>
        <?php endwhile; ?>
    </div>
    <div style="text-align:center; margin: 40px 0;">
        <p><strong>Parfums Shop</strong> – Leader dans la vente de parfums de luxe au Maroc.</p>
    </div>
</div>
<?php require_once 'footer.php'; ?>