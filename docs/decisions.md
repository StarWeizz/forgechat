# Décisions d'architecture (ADR) — ForgeChat

Chaque décision technique structurante fait l'objet d'un fichier dans `docs/decisions/`, numéroté et nommé `NNN-titre-court.md`, avec ce gabarit :

```markdown
# NNN — Titre de la décision

## Statut
Proposé / Accepté / Remplacé par ADR-XXX

## Contexte
Quel problème se pose, quelles contraintes.

## Options considérées
1. Option A — avantages / inconvénients
2. Option B — avantages / inconvénients

## Décision
Ce qui a été choisi et pourquoi.

## Conséquences
Ce que ce choix implique, y compris les compromis acceptés.
```

## Index

| N° | Titre | Statut |
|---|---|---|
| [001](decisions/001-nom-et-perimetre-initial.md) | Nom de travail et périmètre initial du projet | Accepté |

D'autres décisions suivront naturellement : LiveView ou non pour Phase 3, Oban ou non pour Phase 7, outil de load testing pour Phase 13, stack d'observabilité pour Phase 12, etc. — elles ne sont pas anticipées ici tant qu'elles ne se posent pas réellement.
