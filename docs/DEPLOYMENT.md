# Deployment — Netlify + GitHub

## Live URLs (Phase 2)

| Site | Netlify URL | GitHub | Netlify Admin |
|------|-------------|--------|---------------|
| grahamcrispin.com | https://grahamcrispin.netlify.app | https://github.com/gcrispin59/grahamcrispin.com | https://app.netlify.com/projects/grahamcrispin |
| www-praetorspectral | https://www-praetorspectral.netlify.app | https://github.com/gcrispin59/www-praetorspectral | https://app.netlify.com/projects/www-praetorspectral |

**Site IDs:** `a46b412b-3430-4a12-b9cf-446afab6001d` (grahamcrispin), `f74293a4-b047-4358-b34e-50f4dfcab92c` (www-praetorspectral)

## Connect GitHub for continuous deploy

If push-to-deploy is not yet active:

1. Open Netlify project → **Project configuration** → **Build & deploy** → **Continuous deployment**
2. **Link repository** → GitHub → select repo (`gcrispin59/grahamcrispin.com` or `gcrispin59/www-praetorspectral`)
3. Branch: `main`, build command: *(empty)*, publish directory: `.`
4. Save → trigger deploy

Local folders are linked via `netlify link`:

```powershell
cd S:/projects/grahamcrispin.com
netlify link --id a46b412b-3430-4a12-b9cf-446afab6001d
```

## Manual deploy

```powershell
cd S:/projects/grahamcrispin.com
netlify deploy --prod --dir .
```

## Custom domains (Phase 3+)

- **grahamcrispin.com:** Netlify → Domain management → add apex + www (external DNS at GoDaddy)
- **praetorspectral.grahamcrispin.com:** add to www-praetorspectral site; GoDaddy host `praetorspectral` CNAME → `www-praetorspectral.netlify.app`
