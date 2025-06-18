# Claude Code Instructions for Recipe Collection

## Current Project Structure (Updated 2025-06-18)
```
Food/                                    # Repository root
├── _quarto.yml                         # Quarto configuration (points to /export)
├── index.md                            # Top-level homepage
├── README.md                           # GitHub repository description
├── claude.md                           # This file (project instructions)
├── Food/                               # Obsidian vault directory
│   ├── .obsidian/                      # Obsidian configuration
│   ├── content/                        # All recipe markdown files
│   │   ├── Almond Flour Bread.md
│   │   ├── Anchovy Salad.md
│   │   ├── Artichoke Orzo.md
│   │   └── ... (all other recipe .md files)
│   └── assets/                         # Images and attachments
│       ├── recipe-photo-1.jpg
│       └── recipe-photo-2.png
├── export/                             # Obsidian export target (for Quarto)
│   ├── *.md                           # Exported recipe files
│   └── assets/                        # Exported images
└── docs/                              # Quarto build output (GitHub Pages)
```

## New Workflow (Obsidian Export + Quarto)

**Daily editing (in Obsidian):**
1. Open the `Food/` directory as Obsidian vault
2. Edit recipes in `Food/content/` with full linking/graph view
3. Add new photos to `Food/assets/`
4. Use templates for new recipes

**Publishing (when ready):**
1. In Obsidian: Export vault contents to `/export` directory
2. In terminal: Run `quarto render` to build website to `/docs`
3. Commit and push to GitHub for automatic deployment

**Repository commands:**
```bash
# Build website locally
quarto render

# Preview website
quarto preview

# Commit and publish to GitHub Pages
git add . && git commit -m "Update recipes" && git push
```

## Current State Analysis Tasks

### Inventory & Discovery
```bash
# Get overview of what we have in Obsidian vault
claude "list all .md files in Food/content/ and categorize them as recipes vs other content"

# Analyze YAML consistency  
claude "scan all recipe files in Food/content/ and show which ones have YAML frontmatter vs which don't"

# Find orphaned images
claude "list all files in Food/assets/ and check which recipes reference them"

# Extract cuisine types from filenames and content
claude "identify cuisine patterns from recipe names and content (Chinese, Mexican, etc.)"
```

### Content Analysis
```bash
# Ingredient frequency analysis
claude "scan all recipes in Food/content/ and create a ranked list of most-used ingredients"

# Cooking method inventory
claude "find mentions of cooking techniques in Food/content/: sous vide, instant pot, grill, oven, etc."

# Time estimates (where available)
claude "extract any time mentions from recipes in Food/content/ (prep time, cook time, marination time)"

# Equipment usage
claude "identify specialized equipment mentioned across recipes in Food/content/"
```

## Quick Wins - Standardization

### YAML Frontmatter (Phase 1)
```bash
# Add minimal YAML to files missing it
claude "add basic YAML frontmatter to any .md files in Food/content/ that don't have it, following this pattern:
---
categories:
- [main category]
- [secondary category]
title: [Recipe Name]
---"

# Analyze existing categories and tags
claude "review all 'categories:' and 'tags:' entries across recipes in Food/content/ and show duplicates/inconsistencies"

# Extract implicit metadata and suggest additions
claude "scan recipe content in Food/content/ and suggest additional YAML fields like prep_time, cook_time, servings that could be added"
```

### Link Cleanup
```bash
# Audit internal links
claude "find all [[wikilinks]] and [markdown links] between recipes in Food/content/ and verify they work"

# Image link audit
claude "list all image references in Food/content/ and check if files exist in Food/assets/"

# Fix broken OneDrive links
claude "find OneDrive embed URLs in Food/content/ and suggest local Food/assets/ alternatives"
```

## Content Enhancement

### Missing Elements
```bash
# Find recipes without photos
claude "identify recipes in Food/content/ that don't reference any images from Food/assets/"

# Incomplete recipes
claude "find recipe files in Food/content/ that are missing either ingredients list or instructions"

# Add cross-references
claude "suggest 'see also' connections between related recipes in Food/content/"
```

### Consistency Fixes
```bash
# Standardize ingredient formatting
claude "normalize measurement units across all recipes in Food/content/ (TBS→tablespoon, etc.)"

# Fix capitalization
claude "standardize recipe title capitalization in frontmatter and headings in Food/content/"

# Spell check ingredients
claude "check for spelling variations of common ingredients across recipes in Food/content/"
```

## Export Preparation

### Generate Indexes
```bash
# Create master ingredient index
claude "generate ingredients-index.md linking each ingredient to recipes from Food/content/"

# Build cuisine collections
claude "create chinese-recipes.md, mexican-recipes.md, etc. with recipe lists from Food/content/"

# Equipment-based groupings
claude "create instant-pot-recipes.md, sous-vide-recipes.md collections from Food/content/"
```

### Export & Publishing
```bash
# Obsidian export to /export directory
# (Done manually in Obsidian UI)

# Build website with Quarto
quarto render

# Preview locally
quarto preview

# Publish to GitHub Pages
git add . && git commit -m "Update recipes" && git push
```

## Asset Management

### Image Processing
```bash
# Audit assets directory
claude "analyze Food/assets/ folder and suggest better naming convention tied to recipes"

# Find unused assets
claude "identify image files in Food/assets/ that aren't referenced by any recipe in Food/content/"

# Optimize for web
claude "suggest image compression/resizing strategy for web publishing"
```

## Quality Control

### Content Validation
```bash
# Check recipe completeness
claude "verify each recipe in Food/content/ has ingredients, instructions, and reasonable metadata"

# Find formatting inconsistencies
claude "identify recipes in Food/content/ with non-standard section headers or formatting"

# Validate measurements
claude "check for obvious measurement errors in Food/content/ (like '100 tablespoons salt')"
```

## Updated Example Workflows

**Daily editing routine (in Obsidian):**
1. Open Food/ directory as Obsidian vault
2. Edit recipes in Food/content/ with full linking/graph view
3. Add new photos to Food/assets/
4. Use templates for new recipes

**Weekly maintenance (in terminal):**
```bash
# Quick health check
claude "summarize any new recipes added to Food/content/ and missing metadata"

# Maintain consistency  
claude "fix any new YAML frontmatter inconsistencies in Food/content/"

# Update indexes (if needed)
claude "regenerate ingredient and cuisine indexes with any new recipes from Food/content/"
```

**Publishing workflow:**
```bash
# 1. Export from Obsidian (Food/ vault) to /export directory
# 2. Build and publish website
quarto render
git add . && git commit -m "Update recipes" && git push
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
claude "give me a summary of my recipe collection in Food/content/: how many files, common patterns, missing elements"

claude "show me 3 examples of recipes from Food/content/ with good YAML frontmatter and 3 without any"

claude "what's the most and least complete recipe in Food/content/ in terms of metadata and content?"
```

## Key Directory Paths for Claude Commands

- **Recipe content**: `Food/content/` (all .md recipe files)
- **Images/assets**: `Food/assets/` (all images and attachments)  
- **Export target**: `export/` (where Obsidian exports for Quarto)
- **Website build**: `docs/` (Quarto output for GitHub Pages)
- **Configuration**: `_quarto.yml` (website structure and navigation)
