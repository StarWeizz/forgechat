# 001 — Nom de travail et périmètre initial du projet

## Statut
Accepté

## Contexte
Le cahier des charges d'origine laisse le nom du projet ouvert (`[ProposeUnNom]`) mais utilise `ForgeChat` de façon cohérente dans tout le reste du document. Il faut un nom de travail pour amorcer le dépôt Git, la documentation et les premiers commits, sans bloquer le démarrage sur une décision de branding.

## Options considérées
1. **ForgeChat** — déjà utilisé partout dans le document source, cohérent, disponible pour démarrer immédiatement.
2. Autres noms (Beamline, Kindling, Ohm/OhmChat, Cinder) — pistes notées dans le README, non développées ici faute d'enjeu réel à ce stade.
3. Ne pas nommer le projet et utiliser un nom générique type `chat_platform` — écarté : un nom mémorable aide dès les premiers commits et pour la lisibilité GitHub finale.

## Décision
Conserver **ForgeChat** comme nom de travail pour la durée du projet. Le nom pourra être changé plus tard sans coût technique réel (renommage de dépôt), donc ce n'est pas une décision qu'il vaut la peine de peser davantage avant d'avoir écrit une ligne de code.

## Conséquences
- Le dépôt Mix sera initialisé avec `mix new forgechat` (ou `mix phx.new forgechat` en Phase 3).
- Toute la documentation créée ici utilise ce nom.
- Un renommage éventuel devra mettre à jour : nom du dépôt, module racine Elixir, README, et ce fichier (statut → "Remplacé par ADR-XXX").
