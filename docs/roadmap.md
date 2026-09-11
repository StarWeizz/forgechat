# Roadmap — ForgeChat

> Document vivant. Chaque case est cochée et datée au fur et à mesure — pas avant.

Légende :
- ✅ Fait
- 🔶 En cours
- ⬜ Prévu, non commencé
- ❓ Pas encore décidé (dépend d'un résultat ultérieur)

## Vue d'ensemble

| Phase | Titre | Statut | Sert de prérequis à |
|---|---|---|---|
| 0 | Environnement | ✅ | tout |
| 1 | Elixir pur (chat CLI) | ✅ | Phase 2 |
| 2 | GenServer / OTP | ✅ | Phase 3+ |
| 3 | Phoenix — API de base | 🔶 | Phase 4, 5 |
| 4 | PostgreSQL / Ecto | ⬜ | Phase 3+ |
| 5 | Channels / WebSockets | ⬜ | Phase 6, 13 |
| 6 | Presence | ⬜ | — |
| 7 | Background jobs | ⬜ | — |
| 8 | Tests | 🔶 (transversal, en continu depuis Phase 1) | — |
| 9 | Audit d'architecture | ⬜ | Phase 10+ |
| 10 | Docker | ⬜ | Phase 11, 13, 15 |
| 11 | CI/CD | ⬜ | — |
| 12 | Observabilité | ⬜ | Phase 13, 14 |
| 13 | Load testing | ⬜ | Phase 14 |
| 14 | Comprendre les limites | ⬜ | Phase 15 |
| 15 | Scaling horizontal | ❓ (ambition, pas un engagement) | Phase 16 |
| 16 | Benchmark final + README portfolio | ⬜ | — |

**Remarque importante :** les phases 8 (tests) et la documentation ne sont pas des étapes isolées à la fin — elles courent en parallèle de toutes les autres phases depuis la Phase 1, comme prévu.

---

## Phase 0 — Environnement ✅
- ✅ Elixir 1.20.4 / Erlang-OTP 29.0.6 installés via asdf (binaire officiel, pas l'ancienne méthode git-clone)
- ✅ `elixir --version`, `iex`, `mix --version` vérifiés
- ✅ Formatter configuré (`.formatter.exs` généré par Mix)
- ✅ Git initialisé, `.gitignore` Elixir standard
- ✅ Projet Mix créé (`mix new . --app forgechat --module ForgeChat`)
- ✅ Premier commit

## Phase 1 — Elixir pur (chat en ligne de commande) ✅
- ✅ `ForgeChat.Echo` : premier processus avec `spawn`/`receive`
- ✅ `ForgeChat.Room` : plusieurs membres, broadcast via `Enum.each`
- ✅ Tests ExUnit avec `assert_receive` (`room_test.exs`)
- ⚠️ Piège rencontré et documenté dans `learning.md` : une assertion `"..."` factice peut faire passer un test au vert sans rien prouver — toujours faire correspondre l'assertion au contenu réel envoyé, jamais l'inverse

## Phase 2 — GenServer / OTP ✅
- ✅ `ForgeChat.RoomServer` : réécriture de `Room` en GenServer (`init/1`, `handle_cast/2`, `handle_call/3`)
- ✅ `ForgeChat.RoomSupervisor` : supervision `:one_for_one`
- ✅ Crash volontaire observé sans supervision (la session `iex` tombe avec le processus) puis avec supervision (PID différent après redémarrage automatique, session stable) — "let it crash" rendu concret
- ✅ Test ExUnit pour `RoomServer`
- ⚠️ Limite connue, non corrigée volontairement : l'état (`members`) est perdu au redémarrage après crash — acceptable à ce stade, à revoir seulement si un besoin réel apparaît (cf. `architecture.md`)

## Phase 3 — Phoenix, API de base 🔶
- ✅ ADR 002 : génération Phoenix `--no-html --no-assets --no-ecto`
- ✅ `mix phx.new` — avec un faux départ documenté : mauvais nommage de module (`Forgechat` au lieu de `ForgeChat`) causé par l'omission du flag `--module` à la première tentative, puis fichiers de config dupliqués en régénérant par-dessus l'existant. Corrigé en supprimant `config/` et en régénérant proprement une seule fois.
- ✅ `GET /api/health` — premier endpoint, sans persistance, pour valider la chaîne routeur → controller → JSON avant d'introduire Ecto
- ✅ Test de controller (`ForgeChatWeb.ConnCase`)
- 🔶 **Écart assumé par rapport au plan initial** : `POST /api/users`, `POST /api/sessions`, `GET /api/users/:id` ne seront **pas** construits ici avec des données en dur. Décision prise en session : construire ces endpoints directement en Phase 4, une fois Ecto/PostgreSQL en place, pour éviter d'écrire des controllers jetables sans persistance réelle (cohérent avec le principe "vrai projet, pas juste un tutoriel"). La Phase 3 est donc considérée comme suffisamment couverte pour la mécanique Phoenix de base ; les endpoints "métier" migrent en Phase 4.

## Phase 4 — PostgreSQL / Ecto 🔶 (démarrage)
- ⬜ Schemas, migrations
- ⬜ Changesets (validation)
- ⬜ `POST /api/users`, `POST /api/sessions`, `GET /api/users/:id` (repris depuis la Phase 3, avec vraie persistance dès le départ)
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
- 🔶 Un test ExUnit écrit à chaque étape depuis la Phase 1 (Room, RoomServer, HealthController)
- ⬜ Stratégie de test formalisée dans `learning.md`
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