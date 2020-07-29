<?php
/**
 * La configuration de base de votre installation WordPress.
 *
 * Ce fichier contient les réglages de configuration suivants : réglages MySQL,
 * préfixe de table, clés secrètes, langue utilisée, et ABSPATH.
 * Vous pouvez en savoir plus �|  leur sujet en allant sur
 * {@link http://codex.wordpress.org/fr:Modifier_wp-config.php Modifier
 * wp-config.php}. C�~@~Yest votre hébergeur qui doit vous donner vos
 * codes MySQL.
 *
 * Ce fichier est utilisé par le script de création de wp-config.php pendant
 * le processus d�~@~Yinstallation. Vous n�~@~Yavez pas �|  utiliser le site web, vous
 * pouvez simplement renommer ce fichier en "wp-config.php" et remplir les
 * valeurs.
 *
 * @package WordPress
 */

// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define('DB_NAME', 'wordpress');

/** Utilisateur de la base de données MySQL. */
define('DB_USER', 'admin');

/** Mot de passe de la base de données MySQL. */
define('DB_PASSWORD', 'admin');

/** Adresse de l�~@~Yhébergement MySQL. */
define('DB_HOST', 'mysql');

/** Jeu de caractères �|  utiliser par la base de données lors de la création des tables. */
define('DB_CHARSET', 'utf8');

/** Type de collation de la base de données.
  * N�~@~Yy touchez que si vous savez ce que vous faites.
  */
define('DB_COLLATE', '');

/**#@+
 * Clés uniques d�~@~Yauthentification et salage.
 *
 * Remplacez les valeurs par défaut par des phrases uniques !
 * Vous pouvez générer des phrases aléatoires en utilisant
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clefs secrètes de WordPress.org}.
 * Vous pouvez modifier ces phrases �|  n�~@~Yimporte quel moment, afin d�~@~Yinvalider tous les cookies existants.
 * Cela forcera également tous les utilisateurs �|  se reconnecter.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '^|9ISL-);OVm)5lTa,~N^,+$,Qv1+:eP &a1f:4S.>>>v-m^a*k|9CM^QG&cc<_l');
define('SECURE_AUTH_KEY',  'RJuJ=|ondhLc,@9/WQ1;vHNDF90EpPyI4(rK3BXo(8[pTmtb@H/9M?06-+N5}sU2');
define('LOGGED_IN_KEY',    '(-h+%B07TAap?P XA)_O1CWnjt`WK@PSaG[[n`%]thng)7X]r/0f&}+w&+E&LWM)');
define('NONCE_KEY',        '8vpcPC<MI$[vfAnmwerP(MbaXyse_$*SES4sK#A:B|HuYIaG$;)~sRre-u]6hW$1');
define('AUTH_SALT',        'T{xcd2J5~pS9z<5{Z(xija$c6cQ(2S@h&RV+b?)HfUEFY:Kz*24y-)D0hO(Wh,7-');
define('SECURE_AUTH_SALT', '&eykRKJ-heV){j?Zy9Qf[{-/h+p4HW]JN`|yccHD^-#o_XO+t{-|?$9PwzR#:D]#');
define('LOGGED_IN_SALT',   '#+})iI<uq;M8D0|L<Wk(FQ-9L7mwrX7j#-m|gkS@g;f<tA~1HaZ+Po-P2/Q#,_<z');
define('NONCE_SALT',       '1}>;)sN`l<|oq3z/JN,!D=|_c][F{JuhU4|@|j7qEX7++4d+^v|wJ/+!2VFasbRJ');/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N�~@~Yutilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés�| !
 */
$table_prefix = 'wp_';

/**
 * Pour les développeurs : le mode déboguage de WordPress.
 *
 * En passant la valeur suivante �|  "true", vous activez l�~@~Yaffichage des
 * notifications d�~@~Yerreurs pendant vos essais.
 * Il est fortemment recommandé que les développeurs d�~@~Yextensions et
 * de thèmes se servent de WP_DEBUG dans leur environnement de
 * développement.
 *
 * Pour plus d�~@~Yinformation sur les autres constantes qui peuvent être utilisées
 * pour le déboguage, rendez-vous sur le Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* C�~@~Yest tout, ne touchez pas �|  ce qui suit ! Bonne publication. */

/** Chemin absolu vers le dossier de WordPress. */
if ( !defined('ABSPATH') )
        define('ABSPATH', dirname(__FILE__) . '/');

/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once(ABSPATH . 'wp-settings.php');