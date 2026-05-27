# grahamcrispin.com

Static multi-page site for [grahamcrispin.com](https://grahamcrispin.com) hosted on Netlify.

## Local preview

```powershell
cd S:/projects/grahamcrispin.com
npm run serve
```

Open `http://localhost:3000`.

## Deploy

Linked to Netlify via GitHub (`gcrispin59/grahamcrispin.com`). Push to `main` triggers production deploy.

Manual deploy:

```powershell
netlify deploy --prod
```

## Structure

| Path | Purpose |
|------|---------|
| `/` | Home — MoE mentoring |
| `/about/*` | Background, expertise, experience |
| `/services/*` | Mentoring, consulting, development |
| `/realize/` | Realize BV (replaces HubSpot realizebv) |
| `/contact.html`, `/book.html`, `/mentoring.html` | CTAs |

## Docs

- [docs/GRAHAMCRISPIN-NETLIFY-TODO.md](docs/GRAHAMCRISPIN-NETLIFY-TODO.md) — DNS cutover checklist
- [docs/REALIZE-IMAGE-BRIEF.md](docs/REALIZE-IMAGE-BRIEF.md) — image asset descriptions

## Source artifacts

Copied from `S:/projects/AI-Agents/mvi/sites/grahamcrispin/`. Service copy from `S:/projects/MAGGie/mentoring_business_plan.md`.
