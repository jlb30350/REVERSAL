const { environment } = require('@rails/webpacker');

// Assurez-vous que tous les chemins ajoutés aux points d'entrée sont des chaînes.
// Si vous devez ajouter des chemins supplémentaires, faites-le de cette manière:
environment.entry.add('pack', './app/javascript/packs/application.js');

module.exports = environment;
