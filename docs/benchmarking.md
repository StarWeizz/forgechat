# Benchmarking — ForgeChat

> Protocole prévu. Aucun chiffre dans ce document n'est réel tant que la Phase 13 n'a pas commencé — ne jamais y insérer de nombres inventés ou "typiques d'Elixir" à titre d'exemple.

## Objectif

Ne pas prouver qu'Elixir/Phoenix "scale" — mesurer concrètement ce que *cette* implémentation, sur *cette* machine, avec *cette* configuration, supporte réellement, et comprendre pourquoi elle s'arrête là où elle s'arrête.

## Paliers prévus

```text
10 → 100 → 1 000 → 10 000 → 50 000 → (100 000, best-effort)
```
Chaque palier n'est tenté que si le précédent a produit des résultats exploitables. Ne pas sauter de palier pour gagner du temps — le but est la courbe, pas le dernier chiffre.

## Scénarios (repris du cahier des charges)

| Scénario | Description |
|---|---|
| A | WebSockets persistants, quasi inactifs |
| B | Utilisateurs envoyant des messages en continu |
| C | Broadcast intensif dans des rooms |
| D | Workload réaliste (majorité idle, lecture, écriture, join/leave, heartbeat, reconnexions) |

## Métriques à collecter à chaque palier

- CPU, RAM
- Nombre de processus BEAM, scheduler utilization
- Connexions actives
- Messages/sec
- Latence p50 / p95 / p99
- Taux d'erreur
- Charge PostgreSQL (et Redis, uniquement si Redis a été introduit)
- Débit réseau

## Outil de charge

Par défaut : **k6**. À confirmer en Phase 13 — si un outil plus adapté au protocole WebSocket/Phoenix Channels est identifié, il sera documenté ici avec la justification (voir `decisions.md`).

## Méthodologie de mesure

`[À VENIR — Phase 12/13]` : comment Telemetry expose les métriques, comment elles sont collectées pendant un run de charge, comment éviter que l'outil de charge lui-même ne fausse la mesure (machine partagée entre générateur de charge et serveur, etc. — point à trancher avant le premier vrai run).

## Format de restitution d'un run

```text
### Run [date] — Scénario [A/B/C/D] — palier [N connexions]

Hardware : ...
Config Phoenix/BEAM : ...
Config PostgreSQL : ...

Résultats :
- CPU : ...
- RAM : ...
- Processus BEAM : ...
- Messages/sec : ...
- p50 / p95 / p99 : ...
- Erreurs : ...

Bottleneck identifié : ...
Hypothèse pour le palier suivant : ...
```

## Runs effectués

_Aucun run effectué pour l'instant._
