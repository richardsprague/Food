# Claude Code Instructions for Recipe Collection

## Current Project Structure
```
recipes/
├── claude.md                           # This file
├── Almond Flour Bread.md               # Individual recipe files
├── Anchovy Salad.md
├── Artichoke Orzo.md
├── Artichokes.md
├── Baked Sambal-Spiced Marinated Chicken Thighs.md
├── ... (all other recipe .md files)
└── assets/                             # Images and attachments
    ├── recipe-photo-1.jpg
    ├── recipe-photo-2.png
    └── ...
```

## Current State Analysis Tasks

### Inventory & Discovery
```bash
# Get overview of what we have
claude "list all .md files (excluding claude.md) and categorize them as recipes vs other content"

# Analyze YAML consistency  
claude "scan all recipe files and show which ones have YAML frontmatter vs which don't"

# Find orphaned images
claude "list all files in assets/ and check which recipes reference them"

# Extract cuisine types from filenames and content
claude "identify cuisine patterns from recipe names and content (Chinese, Mexican, etc.)"
```

### Content Analysis
```bash
# Ingredient frequency analysis
claude "scan all recipes and create a ranked list of most-used ingredients"

# Cooking method inventory
claude "find mentions of cooking techniques: sous vide, instant pot, grill, oven, etc."

# Time estimates (where available)
claude "extract any time mentions from recipes (prep time, cook time, marination time)"

# Equipment usage
claude "identify specialized equipment mentioned across recipes"
```

## Quick Wins - Standardization

### YAML Frontmatter (Phase 1)
```bash
# Add minimal YAML to files missing it
claude-code "add basic YAML frontmatter to any .md files that don't have it, following this pattern:
---
categories:
- [main category]
- [secondary category]
title: [Recipe Name]
---"

# Analyze existing categories and tags
claude-code "review all 'categories:' and 'tags:' entries across recipes and show duplicates/inconsistencies"

# Extract implicit metadata and suggest additions
claude-code "scan recipe content and suggest additional YAML fields like prep_time, cook_time, servings that could be added"
```

### Link Cleanup
```bash
# Audit internal links
claude "find all [[wikilinks]] and [markdown links] between recipes and verify they work"

# Image link audit
claude "list all image references and check if files exist in assets/"

# Fix broken OneDrive links
claude "find OneDrive embed URLs and suggest local asset/ alternatives"
```

## Content Enhancement

### Missing Elements
```bash
# Find recipes without photos
claude "identify recipes that don't reference any images from assets/"

# Incomplete recipes
claude "find recipe files that are missing either ingredients list or instructions"

# Add cross-references
claude "suggest 'see also' connections between related recipes"
```

### Consistency Fixes
```bash
# Standardize ingredient formatting
claude "normalize measurement units across all recipes (TBS→tablespoon, etc.)"

# Fix capitalization
claude "standardize recipe title capitalization in frontmatter and headings"

# Spell check ingredients
claude "check for spelling variations of common ingredients across recipes"
```

## Export Preparation

### Generate Indexes
```bash
# Create master ingredient index
claude "generate ingredients-index.md linking each ingredient to recipes that use it"

# Build cuisine collections
claude "create chinese-recipes.md, mexican-recipes.md, etc. with recipe lists"

# Equipment-based groupings
claude "create instant-pot-recipes.md, sous-vide-recipes.md collections"
```

### Quarto Setup
```bash
# Generate basic _quarto.yml
claude "create _quarto.yml config file organizing current recipes into logical chapters"

# Create index.qmd
claude "generate index.qmd with overview of recipe collection and navigation"

# Prepare for multi-format output
claude "suggest file organization for both web and PDF publishing"
```

## Asset Management

### Image Processing
```bash
# Audit assets directory
claude "analyze assets/ folder and suggest better naming convention tied to recipes"

# Find unused assets
claude "identify image files in assets/ that aren't referenced by any recipe"

# Optimize for web
claude "suggest image compression/resizing strategy for web publishing"
```

## Quality Control

### Content Validation
```bash
# Check recipe completeness
claude "verify each recipe has ingredients, instructions, and reasonable metadata"

# Find formatting inconsistencies
claude "identify recipes with non-standard section headers or formatting"

# Validate measurements
claude "check for obvious measurement errors (like '100 tablespoons salt')"
```

## Example Workflow

**Morning routine (in Obsidian):**
1. Edit recipes normally with full linking/graph view
2. Add new photos to assets/
3. Use templates for new recipes

**Weekly batch processing (in terminal):**
```bash
# Quick health check
claude "summarize any new recipes added and missing metadata"

# Maintain consistency  
claude "fix any new YAML frontmatter inconsistencies"

# Update indexes
claude "regenerate ingredient and cuisine indexes with any new recipes"
```

**Publishing prep (when ready):**
```bash
# Pre-flight check
claude "validate all recipes are ready for publishing (complete metadata, working links)"

# Generate build files
claude "create updated _quarto.yml and any missing index files"
```

## File Naming Patterns to Recognize

Current pattern: `Descriptive Recipe Name.md`
- Keep this! It's human-readable and works well with Obsidian
- For generated files, suggest `_filename.md` prefix to keep separate

## Common Recipe Sections to Look For
- `## Ingredients` or `### Ingredients`
- `## Instructions` or `## Directions`  
- `## Notes` or `## Insights`
- Time references: "X minutes", "X hours"
- Serving info: "serves X", "X servings"
- Equipment: "Instant Pot", "sous vide", "grill"

## Getting Started Commands

Run these to understand current state:
```bash
claude "give me a summary of my recipe collection: how many files, common patterns, missing elements"

claude "show me 3 examples of recipes with good YAML frontmatter and 3 without any"

claude "what's the most and least complete recipe in terms of metadata and content?"
```
