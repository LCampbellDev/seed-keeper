# SeedKeeper

**Personal Seed Inventory & Planting Planner**


## Overview

SeedKeeper is a relational database project designed to help gardeners manage their seed collections, reduce waste, and make informed planting decisions throughout the year.

The project began from a simple problem:

Buying seeds, forgetting what you already have, and not knowing what can be planted right now.

SeedKeeper provides a structured system to track seeds, store growing information, and support planning based on time, space, and past results.


## Goals

* Keep a clear inventory of seeds and where they are stored
* Reduce waste by highlighting unused or abundant seeds
* Support seasonal decision-making (what to sow now)
* Record growing results to inform future planting
* Encourage seed saving and sharing

SeedKeeper is not just about tracking seeds. It’s about helping people grow with intention, reduce waste, and make gardening simpler and more joyful.

---

## Database Design

The project uses a MySQL relational database with the following tables:

* **Plants** – plant details (variety, lifecycle, size, characteristics)
* **SeedPackets** – individual seed inventory records
* **location** – where seeds are stored (e.g. tin, shelf, garden bench)
* **SowingInstructions** – planting timelines and growing guidance
* **Categories** – flexible tagging system (e.g. edible, flower, herb)
* **PlantCategories** – many-to-many relationship between plants and categories
* **GrowingResults** – optional ratings and notes from previous growing seasons
* **Images** – optional images of seed packets and plant growth

---

## Key Features

### Seed Inventory

Track:

* plant name and variety
* quantity and storage location
* source and expiry

### Planting Timeline

Store and query:

* sow indoors / outdoors windows
* plant-out timing
* estimated flowering and harvest periods

### Flexible Categories

Plants can have multiple tags such as:

* edible
* flower
* herb
* scent
* climber / bush / ground cover

### Growing Results

Record:

* germination success
* growth quality
* yield or flowering
* notes for future decisions

### Locations

Keep track of where seeds are stored:

* tin on kitchen shelf
* seed case in bench
* jars, pouches, etc.

---

## 🔍 Example Queries

* What seeds do I have?
* Where are my seeds stored?
* What can I sow this month?
* Which seeds are old or overabundant?
* Which plants performed well last year?

---

## Future Development

Planned extensions include:

* Python interface for interacting with the database
* Data visualisation (planting timelines, harvest overlap)
* Export functionality for sharing seed lists
* Personalised planting suggestions
* Optional plant library for recommending new seeds
* Friend sharing and seed swap features

---

## Project Context

* relational database design
* real-world problem solving
* user-centred thinking
* sustainability and accessibility values

---

## Tech Stack

* MySQL (schema design and querying)
* Python (planned)
* Frontend (planned)

---

## Values

SeedKeeper is designed with a focus on:

* sustainability
* reducing waste
* accessibility
* low-effort, supportive systems
* sharing and community

---

## Status

**Version 1 (in progress):**

* Database schema complete
* Initial data added
* Core queries developed and tested
