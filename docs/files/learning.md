# Journal d'apprentissage — ForgeChat

> Ce fichier n'est pas un cours. C'est un journal : ce que j'ai compris, mal compris, et corrigé, dans mes propres mots. Il a de la valeur en entretien précisément parce qu'il est écrit par moi, pas généré.

Format suggéré par entrée :

```text
## [Date] — [Concept]

### Ce que je pensais avant

### Ce que j'ai compris en pratique

### Erreur que j'ai faite

### Pourquoi c'était une erreur

### Analogie / façon de m'en souvenir
```

## Concepts à couvrir (à cocher au fur et à mesure, pas à l'avance)

### Elixir fondamentaux
- ⬜ Immutabilité
- ⬜ Pattern matching
- ⬜ Guards
- ⬜ Pipe operator
- ⬜ Enum vs Stream (lazy vs eager)
- ⬜ `with`
- ⬜ Structs vs Maps

### Concurrence
- ⬜ Isolation des processus (pourquoi un crash ne casse pas tout)
- ⬜ `spawn` / `send` / `receive`
- ⬜ Ce qu'un process BEAM est *réellement* (pas un thread OS)

### OTP
- ⬜ GenServer : state, callbacks
- ⬜ Supervisor : stratégies de redémarrage
- ⬜ "Let it crash" — pourquoi ce n'est pas de la négligence

### Phoenix / Ecto
- ⬜ Contexts
- ⬜ Changesets vs validations classiques
- ⬜ N+1 et preload
- ⬜ Channels : lifecycle d'une connexion WebSocket

### Distribué / performance
- ⬜ Scheduler utilization
- ⬜ PubSub distribué
- ⬜ Où se situent réellement les bottlenecks (CPU vs réseau vs DB vs sérialisation)

## Entrées

_Aucune entrée pour l'instant — la première sera écrite à la fin de la première session de code (Phase 1)._
