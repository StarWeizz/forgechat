# ForgeChat

> ⚠️ **Document de travail vivant.** Ce README décrit un projet en cours de démarrage, pas un projet terminé. Les sections marquées `[À VENIR]` seront remplies au fur et à mesure de l'avancement réel — rien n'est simulé ou anticipé ici.

## Statut du projet

**Phase actuelle : Phase 0 — mise en place de l'environnement et de la documentation initiale.**
Aucune ligne de code applicatif n'a encore été écrite. Ce dépôt contient pour l'instant uniquement la documentation de cadrage.

## Le nom : "ForgeChat"

Le nom **ForgeChat** est utilisé comme nom de travail par défaut dans tout le cahier des charges d'origine, donc je le reprends comme point de départ plutôt que d'en discuter avant même d'avoir commencé. Il a le mérite d'être clair : *forger* (apprendre/construire pas à pas, au marteau) une plateforme de *chat*.

Si tu veux en changer, quelques pistes pour plus tard (à trancher quand le projet aura un peu de substance, pas avant) :
- **Beamline** — clin d'œil à la BEAM (VM Erlang/Elixir)
- **Kindling** — "allumer le feu", cohérent avec l'idée d'apprentissage progressif
- **Ohm** (ou **OhmChat**) — clin d'œil à OTP/électronique
- **Cinder**

→ Pas de décision prise ici, juste des options. Le nom définitif fera l'objet de l'ADR 001 quand tu voudras trancher.

## Le problème `[À VENIR]`

Sera rédigé une fois le MVP de la Phase 3 posé : quel problème réel ForgeChat illustre-t-il, au-delà de l'exercice pédagogique.

## Fonctionnalités `[À VENIR]`

Liste tenue à jour phase par phase — voir [`docs/roadmap.md`](docs/roadmap.md) pour la liste complète prévue.

## Architecture `[À VENIR — évolutive]`

Voir [`docs/architecture.md`](docs/architecture.md), qui documente l'architecture *actuelle* du projet, pas une cible finale figée.

## Stack

Décidé pour le démarrage (Phase 0–3) :
- **Elixir** / **Erlang/OTP**
- **Phoenix**
- **Ecto** + **PostgreSQL**
- **ExUnit**

Envisagé plus tard, sous conditions (voir `docs/decisions.md` et `docs/roadmap.md` §"technologies repoussées") :
- Oban (jobs)
- Redis (si un besoin réel apparaît — pas par défaut)
- Prometheus / Grafana (observabilité)
- k6 (load testing)
- Docker / docker compose
- GitHub Actions

## Comment lancer le projet `[À VENIR]`

Sera rédigé à la fin de la Phase 0, une fois l'environnement effectivement fonctionnel sur cette machine.

## Tests `[À VENIR]`

## CI/CD `[À VENIR]`

## Observabilité `[À VENIR]`

## Benchmarks `[À VENIR]`

Sera rempli avec des chiffres réels et reproductibles, pas des estimations. Voir [`docs/benchmarking.md`](docs/benchmarking.md) pour le protocole prévu.

## Limites connues `[À VENIR]`

## Décisions d'architecture

Voir [`docs/decisions.md`](docs/decisions.md) et le dossier `docs/decisions/`.

## Lessons learned `[À VENIR]`

---

*Ce README sera réécrit plusieurs fois. Sa version finale (portfolio-ready) est un objectif de la Phase 16, pas un point de départ.*
