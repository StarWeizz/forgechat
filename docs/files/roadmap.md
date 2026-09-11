# Roadmap — ForgeChat

> Document vivant. État au démarrage du projet (Phase 0). Chaque case sera cochée et datée au fur et à mesure — pas avant.

Légende :
- ✅ Fait
- 🔶 En cours
- ⬜ Prévu, non commencé
- ❓ Pas encore décidé (dépend d'un résultat ultérieur)

## Vue d'ensemble

| Phase | Titre | Statut | Sert de prérequis à |
|---|---|---|---|
| 0 | Environnement | ⬜ | tout |
| 1 | Elixir pur (chat CLI) | ⬜ | Phase 2 |
| 2 | GenServer / OTP | ⬜ | Phase 3+ |
| 3 | Phoenix — API de base | ⬜ | Phase 4, 5 |
| 4 | PostgreSQL / Ecto | ⬜ | Phase 3+ |
| 5 | Channels / WebSockets | ⬜ | Phase 6, 13 |
| 6 | Presence | ⬜ | — |
| 7 | Background jobs | ⬜ | — |
| 8 | Tests | ⬜ (transversal, démarre dès Phase 1) | — |
| 9 | Audit d'architecture | ⬜ | Phase 10+ |
| 10 | Docker | ⬜ | Phase 11, 13, 15 |
| 11 | CI/CD | ⬜ | — |
| 12 | Observabilité | ⬜ | Phase 13, 14 |
| 13 | Load testing | ⬜ | Phase 14 |
| 14 | Comprendre les limites | ⬜ | Phase 15 |
| 15 | Scaling horizontal | ❓ (ambition, pas un engagement) | Phase 16 |
| 16 | Benchmark final + README portfolio | ⬜ | — |

**Remarque importante :** les phases 8 (tests) et la documentation ne sont pas des étapes isolées à la fin — elles sont censées courir en parallèle de toutes les autres phases dès la Phase 1. Le tableau les liste séparément uniquement parce que le cahier des charges d'origine le fait ; en pratique, "écrire un test" fera partie du "travail à réaliser" de presque chaque session.

---

## Phase 0 — Environnement
**Objectif :** avoir une base de travail fiable et vérifiée, pas supposée.
- ⬜ Installer Elixir + Erlang/OTP (versions à figer et noter dans `architecture.md`)
- ⬜ Vérifier `elixir --version`, `iex`, `mix --version`
- ⬜ Configurer le formatter (`mix format`)
- ⬜ Initialiser Git, `.gitignore` Elixir standard
- ⬜ Créer le premier projet Mix (nom de projet à trancher — voir README)
- ⬜ Premier commit

## Phase 1 — Elixir pur (chat en ligne de commande)
**Objectif :** comprendre le modèle de concurrence BEAM (processus, message passing) avant tout framework.
- ⬜ Modéliser `User process` / `Room process` avec `spawn`/`send`/`receive`
- ⬜ Plusieurs utilisateurs simulés dans une room
- ⬜ Broadcast simple room → utilisateurs
- ⬜ Premiers tests ExUnit sur cette logique

## Phase 2 — GenServer / OTP
**Objectif :** comprendre pourquoi OTP existe, pas seulement sa syntaxe.
- ⬜ Réécrire `Room` et `User` en GenServer
- ⬜ Ajouter une supervision minimale
- ⬜ Provoquer des crashs volontaires, observer le comportement ("let it crash")
- ⬜ Comparer par écrit (dans `learning.md`) l'approche "gestion d'erreurs classique" vs supervision OTP

## Phase 3 — Phoenix, API de base
**Objectif :** poser Phoenix sans complexité inutile.
- ⬜ `mix phx.new` (config à documenter : avec/sans HTML, avec/sans LiveView — pas décidé, voir `decisions.md`)
- ⬜ `POST /api/users`, `POST /api/sessions`, `GET /api/users/:id`
- ⬜ Premiers tests de contrôleur

## Phase 4 — PostgreSQL / Ecto
- ⬜ Schemas, migrations
- ⬜ Changesets (validation)
- ⬜ Queries, associations, preload
- ⬜ Transactions, contraintes, index
- ⬜ Pagination, N+1
- ⬜ Réflexion documentée : logique en context vs schema vs controller

## Phase 5 — Phoenix Channels / WebSockets
- ⬜ Premier Channel, topics, join/broadcast
- ⬜ PubSub interne
- ⬜ Authentification sur la connexion socket
- ⬜ Tests de Channel

## Phase 6 — Presence
- ⬜ Intégrer `Phoenix.Presence`
- ⬜ UI minimale ou test pour observer online/offline

## Phase 7 — Background jobs
- ⬜ Identifier un vrai besoin (notification, nettoyage...) avant de choisir un outil
- ❓ Oban — à confirmer une fois le besoin identifié, pas par défaut
- ⬜ Retries, idempotence, dead jobs

## Phase 8 — Tests (transversal + consolidation)
- ⬜ Stratégie de test documentée dans `learning.md`
- ⬜ Tests de concurrence / supervision / failure-recovery
- ❓ Property-based testing (StreamData) — à évaluer selon le temps disponible

## Phase 9 — Audit d'architecture
- ⬜ Revue critique des contexts, de la séparation des responsabilités
- ⬜ ADR si changement structurel décidé

## Phase 10 — Docker
- ⬜ Dockerfile app
- ⬜ docker-compose (app + Postgres, Redis seulement si Phase 7 l'a rendu nécessaire)

## Phase 11 — CI/CD
- ⬜ GitHub Actions : format → compile → tests → analyse statique → build

## Phase 12 — Observabilité
- ⬜ Telemetry + métriques listées dans le cahier des charges
- ❓ Stack Prometheus/Grafana vs alternative plus légère — à trancher en Phase 12, pas maintenant

## Phase 13 — Load testing
- ⬜ Outil de charge (k6 par défaut, à confirmer)
- ⬜ Scénarios A/B/C/D du cahier des charges
- ⬜ Paliers 10 → 100k, **sans objectif d'atteindre 100k** — l'objectif est de comprendre où ça casse

## Phase 14 — Comprendre les limites
- ⬜ Diagnostic du bottleneck avant toute optimisation, à chaque palier atteint

## Phase 15 — Scaling horizontal
- ❓ Ambition affichée dans le cahier des charges, mais dépend fortement du temps disponible et de ce que la Phase 14 aura révélé. Ne pas s'engager dessus tant que la Phase 14 n'est pas faite.

## Phase 16 — Benchmark final + README portfolio
- ⬜ Résultats reproductibles documentés (hardware, versions, config)
- ⬜ README réécrit pour un usage portfolio/entretien

---

## Suivi

Chaque session de travail doit se conclure par une mise à jour de ce fichier (case cochée, date, lien vers le commit ou l'ADR concerné). Si une phase est réordonnée ou fusionnée, l'expliquer ici plutôt que de réécrire l'historique silencieusement.
