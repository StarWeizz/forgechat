# Architecture — ForgeChat

> Document vivant décrivant l'architecture **réellement en place**, pas une cible. Tant qu'une phase n'est pas commencée, sa section reste à l'état "prévu" et ne doit pas décrire du code qui n'existe pas.

## Statut actuel

Aucun code applicatif n'existe encore (Phase 0). Ce document sera mis à jour à partir de la Phase 1.

## Versions (à figer en Phase 0)

| Composant | Version | Vérifié le |
|---|---|---|
| Erlang/OTP | `[À VENIR]` | `[À VENIR]` |
| Elixir | `[À VENIR]` | `[À VENIR]` |
| Phoenix | `[À VENIR]` | `[À VENIR]` |
| PostgreSQL | `[À VENIR]` | `[À VENIR]` |

## Architecture cible — vue d'ensemble (schéma d'intention, pas encore construite)

```text
                     Client (WebSocket / HTTP)
                              |
                        Phoenix Endpoint
                       /              \
              Router (HTTP API)   Phoenix Channels
                     |                    |
                 Contexts            PubSub / Presence
                     |                    |
                   Ecto  ────────────  PostgreSQL
```

Cette vue évoluera à partir de la Phase 15 (scaling horizontal) vers un schéma multi-nœuds — voir cahier des charges original pour l'ambition, mais ne l'ajouter ici qu'une fois construit.

## Phase 1 — modèle de concurrence (prévu)

```text
User process
     |
     | message
     v
Room process
     |
     | broadcast
     v
Other user processes
```
À documenter avec le vrai code une fois écrit : quelles décisions de conception ont été prises, pourquoi.

## Découpage des responsabilités (principe à appliquer, pas encore vérifié en pratique)

Règle de travail issue du cahier des charges, à valider phase après phase :
- **Schema** : structure des données, pas de logique métier
- **Changeset** : validation
- **Context** : logique métier, point d'entrée public d'un domaine
- **Controller / Channel** : orchestration HTTP/WebSocket, pas de logique métier
- **Module de service** : logique transverse ne rentrant pas naturellement dans un context

Cette règle sera testée concrètement en Phase 4 et auditée en Phase 9 — si elle ne tient pas, ce fichier le dira.

## Composants envisagés mais pas encore décidés

| Composant | Statut | Condition d'ajout |
|---|---|---|
| Redis | ❓ non retenu par défaut | Seulement si un vrai besoin apparaît en Phase 7 (jobs) ou Phase 15 (état distribué) |
| Oban | ❓ non retenu par défaut | Seulement si Phase 7 identifie un besoin réel de jobs asynchrones |
| Prometheus/Grafana | ❓ | À trancher en Phase 12, une alternative plus légère peut être proposée |
| Clustering BEAM (libcluster...) | ❓ | Phase 15 uniquement, si le projet en arrive là |

## Configuration, environnements, secrets `[À VENIR — Phase 10]`

## Schéma multi-nœuds `[À VENIR — Phase 15, si atteint]`

---

*Rappel : ce fichier ne doit jamais décrire une architecture "idéale" non implémentée comme si elle existait. Toute section non commencée reste explicitement marquée comme telle.*
