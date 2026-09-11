# 002 — Phoenix sans LiveView ni assets HTML

## Statut
Accepté

## Contexte
`mix phx.new` génère par défaut un projet Phoenix complet incluant LiveView (pages HTML interactives côté serveur) et une chaîne d'assets front (CSS/JS à builder). ForgeChat vise une API backend (endpoints REST + Phoenix Channels/WebSockets), pas des pages web server-rendered. Il faut décider si on garde le générateur par défaut ou si on le restreint.

## Options considérées
1. **Génération complète par défaut (avec LiveView)** — plus proche de "ce que la doc Phoenix montre partout", mais génère des fichiers HTML/assets qui ne serviront jamais dans ce projet.
2. **Génération minimale (`--no-html --no-assets`)** — uniquement l'ossature API (router, endpoint, pas de vues HTML ni de pipeline front). Colle à l'objectif du projet, tout le code généré a vocation à être compris et utilisé.

## Décision
Génération minimale : `mix phx.new . --app forgechat --no-html --no-assets` (à l'intérieur du dossier existant, comme pour `mix new` en Phase 0).

## Conséquences
- Pas de `assets/`, pas de fichiers `.heex`, pas de pipeline de build front à gérer.
- Si un besoin de page HTML apparaît plus tard (ex. une petite UI de debug), il faudra l'ajouter manuellement plutôt que de compter sur un générateur — accepté comme compromis, cohérent avec le principe "ne pas sur-engineerer" du cahier des charges.
- LiveView pourra être étudié séparément, hors de ForgeChat, si l'intérêt pédagogique se présente ailleurs — ce n'est pas un renoncement définitif à apprendre LiveView, juste un hors-scope pour ce projet précis.
