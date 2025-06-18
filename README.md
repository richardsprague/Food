# Sprague Recipe Collection

A family recipe collection built with [Quarto](https://quarto.org) and published on GitHub Pages.

## 🍽️ What's Inside

This is our working collection of **tested recipes that we actually make and recommend**. Rather than aspirational recipes, this focuses on dishes we've perfected through repeated cooking.

- **160+ Complete Recipes** - Fully tested with ingredients and instructions
- **Technique Guides** - Cooking methods and equipment mastery  
- **Ingredient References** - How to use specific ingredients effectively
- **Equipment Documentation** - Instant Pot, sous vide, bread makers, and more

## 🌐 View the Collection

**Live Website**: https://richardsprague.github.io/Food/

The website features:
- Full-text search across all recipes
- Mobile-responsive design
- Organized navigation by cooking method and ingredient
- Featured recipes and recommendations

## 📁 Project Structure

```
├── Food/                       # Obsidian vault directory
│   ├── content/               # All recipe markdown files (160+ recipes)
│   ├── assets/                # Recipe images and photos
│   └── .obsidian/             # Obsidian configuration
├── export/                     # Obsidian export target (for publishing)
├── docs/                       # Generated Quarto website (auto-built)
├── _quarto.yml                 # Quarto configuration
├── index.md                    # Homepage content
├── claude.md                   # AI assistant instructions
└── README.md                   # This file
```

## 🔧 Built With

- **[Obsidian](https://obsidian.md)** - Local editing with full linking and graph view
- **[Quarto](https://quarto.org)** - Document publishing system
- **GitHub Pages** - Hosting and deployment
- **GitHub Actions** - Automatic builds on push

## 🍳 Featured Highlights

- Extensive **sous vide documentation** with precise times and temperatures
- International cuisines: Filipino, Moroccan, Mexican, Japanese, and more
- Equipment mastery guides for pressure cooking, bread making, and traditional techniques
- Ingredient-focused guides for proteins, vegetables, and specialty items

## 🚀 Development Workflow

This collection uses a modern workflow for recipe management:

1. **Edit in Obsidian**: All recipes are maintained in the `Food/` directory using Obsidian for rich linking, graph visualization, and efficient editing
2. **Export for Publishing**: When ready to update the website, export the vault content to the `/export` directory
3. **Build with Quarto**: Run `quarto render` to generate the static website in `/docs`
4. **Auto-Deploy**: Push to GitHub triggers automatic deployment to GitHub Pages

### Local Development

```bash
# Preview the website locally
quarto preview

# Build the website
quarto render

# Publish updates
git add . && git commit -m "Update recipes" && git push
```

The Obsidian vault maintains full recipe linking and metadata while the published website provides optimized navigation and search for readers.

---

*A digital cookbook that evolves with our cooking journey* 🧑‍🍳